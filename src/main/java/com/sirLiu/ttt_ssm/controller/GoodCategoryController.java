package com.sirLiu.ttt_ssm.controller;

import com.sirLiu.ttt_ssm.model.TttGoodCategory;
import com.sirLiu.ttt_ssm.model.commen.Msg;
import com.sirLiu.ttt_ssm.service.GoodCategoryService;
import com.sirLiu.ttt_ssm.service.GoodManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/15 9:48
 */
@Controller
@RequestMapping("/goodCategory")
public class GoodCategoryController {

    @Autowired
    private GoodCategoryService goodCategoryService;

    @RequestMapping("/getAllGoodCategories")
    @ResponseBody
    public String getAllGoodCategories(HttpServletRequest request){
        List<TttGoodCategory> goodCategories=goodCategoryService.getAllGoodCategories();
        request.getSession().setAttribute("goodCategories",goodCategories);
        return Msg.success().toString();
    }

}
