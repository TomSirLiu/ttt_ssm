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
        for (TttGoodsinfo goodsinfo : goods){
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
            return Msg.success().add("good",goodManagementService.convertGoodInfoToJson(goodsinfo)).toString();
        } else {
            return Msg.fail().add("error", "没有对应goodId的商品").toString();
        }
    }

    @RequestMapping(value = "/getGoodsFilterByGoodCategories")
    @ResponseBody
    public String getGoodsFilterByGoodCategories(@RequestParam(value = "goodCategories")String goodCategoriyNamesAsString){
        String[] goodCategoriyNames = goodCategoriyNamesAsString.split(",");
        List<TttGoodsinfo> selectedGoods = goodManagementService.getGoodsFilterByGoodCategories(goodCategoriyNames);
        return Msg.success().add("selectedGoods",selectedGoods).toString();
    }

}
