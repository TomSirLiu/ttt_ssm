package com.sirLiu.ttt_ssm.controller;

import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.commen.Msg;
import com.sirLiu.ttt_ssm.model.json.GoodsInfoJson;
import com.sirLiu.ttt_ssm.service.GoodManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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

}
