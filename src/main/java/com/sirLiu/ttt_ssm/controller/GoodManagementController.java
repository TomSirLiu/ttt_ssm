package com.sirLiu.ttt_ssm.controller;

import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.commen.Msg;
import com.sirLiu.ttt_ssm.model.json.GoodsInfoJson;
import com.sirLiu.ttt_ssm.service.GoodManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @Author sirLiu
 * @Date 2017/12/14 10:22
 */
@Controller
@RequestMapping("/good")
public class GoodManagementController {

    @Autowired
    private GoodManagementService goodManagementService;

    @RequestMapping(value = "/getAllGoods")
    @ResponseBody
    public String getAllGoods(HttpServletRequest request) {
        List<TttGoodsinfo> goods = goodManagementService.getAllGoods();
        List<GoodsInfoJson> goodsInfoJsons = new ArrayList<>();
        for (TttGoodsinfo goodsinfo : goods) {
            goodsInfoJsons.add(goodManagementService.convertGoodInfoToJson(goodsinfo));
        }
        request.getSession().setAttribute("goods", goodsInfoJsons);
        return Msg.success().add("goods", goodsInfoJsons).toString();
    }

    @RequestMapping(value = "/selectGoodByGoodId")
    @ResponseBody
    public String selectGoodByGoodId(@RequestParam(value = "goodId") Integer goodId, HttpServletRequest request) {
        TttGoodsinfo goodsinfo = goodManagementService.selectGoodByGoodId(goodId);
        if (goodsinfo != null) {
            request.setAttribute("good", goodManagementService.convertGoodInfoToJson(goodsinfo));
            return Msg.success().add("good", goodManagementService.convertGoodInfoToJson(goodsinfo)).toString();
        } else {
            return Msg.fail().add("error", "没有对应goodId的商品").toString();
        }
    }

    @RequestMapping(value = "/getGoodsWithFilter")
    @ResponseBody
    public String getGoodsWithFilter(@RequestParam(value = "goodCategories", required = false) String goodCategoriyNamesAsString,
                                     @RequestParam(value = "goodPriceRange", required = false) String goodPriceRangeAsString,
                                     @RequestParam(value = "goodIfNew", required = false) Boolean goodIfNew,
                                     @RequestParam(value = "goodIfDiscount", required = false) Boolean goodIfDiscount,
                                     @RequestParam(value = "goodStockDivisionWith100 ", required = false) Boolean goodStockOver100) {
        List<TttGoodsinfo> selectedGoods = goodManagementService.getAllGoods();
        List<GoodsInfoJson> selectedGoodsInfoJsons = new CopyOnWriteArrayList<>();
        for (TttGoodsinfo goodsinfo : selectedGoods) {
            selectedGoodsInfoJsons.add(goodManagementService.convertGoodInfoToJson(goodsinfo));
        }
        if (goodCategoriyNamesAsString != null) {
            String[] goodCategoriyNames = goodCategoriyNamesAsString.split(",");
            if (goodCategoriyNames.length != 0) {
                tabForGoodCategoryNames:
                for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                    for (String selectedCategoryName : goodCategoriyNames) {
                        if (goodsInfoJson.getCategory().getName().equals(selectedCategoryName)) {
                            continue tabForGoodCategoryNames;
                        }
                    }
                    selectedGoodsInfoJsons.remove(goodsInfoJson);
                }
            }
        }
        if (goodPriceRangeAsString != null) {
            String[] goodPriceRanges = goodPriceRangeAsString.split(",");
            if (goodPriceRanges.length != 0) {
                for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                    if (goodsInfoJson.getPrice() < Integer.parseInt(goodPriceRanges[0]) || goodsInfoJson.getPrice() > Integer.parseInt(goodPriceRanges[1])) {
                        selectedGoodsInfoJsons.remove(goodsInfoJson);
                    }
                }
            }
        }
        if (goodIfNew != null) {
            for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                if (goodsInfoJson.getIfNew() != goodIfNew) {
                    selectedGoodsInfoJsons.remove(goodsInfoJson);
                }
            }
        }
        if (goodIfDiscount != null) {
            for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                if (goodsInfoJson.getIfDiscount() != goodIfDiscount) {
                    selectedGoodsInfoJsons.remove(goodsInfoJson);
                }
            }
        }
        if (goodStockOver100 != null) {
            if (goodStockOver100) {
                for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                    if (goodsInfoJson.getStock() < 100) {
                        selectedGoodsInfoJsons.remove(goodsInfoJson);
                    }
                }
            } else {
                for (GoodsInfoJson goodsInfoJson : selectedGoodsInfoJsons) {
                    if (goodsInfoJson.getStock() > 100) {
                        selectedGoodsInfoJsons.remove(goodsInfoJson);
                    }
                }
            }
        }
        return Msg.success().add("selectedGoods", selectedGoodsInfoJsons).toString();
    }

    @RequestMapping(value = "/fuzzyQueryOfGoodsWithGoodName")
    @ResponseBody
    public String fuzzyQueryOfGoodsWithGoodName(@RequestParam(value = "fuzzyGoodName") String fuzzyGoodName) {
        List<TttGoodsinfo> goodsWithFuzzyGoodName = goodManagementService.fuzzyQueryOfGoodsWithGoodName(fuzzyGoodName);
        List<GoodsInfoJson> goodsJsonWithFuzzyGoodName = new ArrayList<>();
        for (TttGoodsinfo goodsinfo : goodsWithFuzzyGoodName) {
            goodsJsonWithFuzzyGoodName.add(goodManagementService.convertGoodInfoToJson(goodsinfo));
        }
        return Msg.success().add("goodsWithFuzzyGoodName", goodsJsonWithFuzzyGoodName).toString();
    }

    @RequestMapping(value = "/addGood")
    @ResponseBody
    public String addGood(@RequestParam(value = "addName") String name,
                          @RequestParam("addCategory") String category,
                          @RequestParam(value = "addPrice",defaultValue = "0") Integer price,
                          @RequestParam(value = "addStock", defaultValue = "0") Integer stock,
                          @RequestParam(value = "isNew", required = false) String isNew,
                          @RequestParam(value = "isCommend", required = false) String isCommend,
                          @RequestParam(value = "isLowPrice", required = false) String isLowPrice,
                          @RequestParam(value = "addGoodDescribe", required = false) String goodDescribe,
                          @RequestParam("addGoodImage") MultipartFile file) throws IllegalStateException, IOException {

        try {
            if (!file.isEmpty()) {
                //Images will be stored under "src/main/webapp/resources/img/singlepro/${category.name}/${goodI.count}.jpg"
                List<TttGoodsinfo> goods = goodManagementService.getAllGoods();
                int goodsId = goods.get(goods.size() - 1).getId() + 1;

                BufferedImage image = new BufferedImage(290, 370, BufferedImage.TYPE_INT_RGB);
                image.getGraphics().drawImage(ImageIO.read(file.getInputStream()), 0, 0, 290, 370, null);
                File destination = new File("C:/Users/Dc_Pro/ttt_ssm/src/main/webapp/resources/img/singlepro/" + category + "/" + goodsId + ".jpg");
                ImageIO.write(image, "jpg", destination);
                File destination1 = new File("C:/Users/Dc_Pro/ttt_ssm/src/main/webapp/resources/img/singlepro/" + category + "/" + goodsId + "1.jpg");
                ImageIO.write(image, "jpg", destination1);
                File destination2 = new File("C:/Users/Dc_Pro/ttt_ssm/src/main/webapp/resources/img/singlepro/" + category + "/" + goodsId + "2.jpg");
                ImageIO.write(image, "jpg", destination2);
                File destination3 = new File("C:/Users/Dc_Pro/ttt_ssm/src/main/webapp/resources/img/singlepro/" + category + "/" + goodsId + "3.jpg");
                ImageIO.write(image, "jpg", destination3);
            }
            boolean bool_isNew = !(isNew == null);
            boolean bool_isCommend = !(isCommend == null);
            boolean bool_isLowPrice = !(isLowPrice == null);
            goodManagementService.addGood(name, category, price, bool_isNew, bool_isCommend, bool_isLowPrice, stock, goodDescribe);
        } catch (Exception e) {
            System.out.println("Exception occured" + e.getMessage());
            return Msg.fail().toString();
        }
        return Msg.success().toString();
    }

}
