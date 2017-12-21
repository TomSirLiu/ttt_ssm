package com.sirLiu.ttt_ssm.test;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sirLiu.ttt_ssm.controller.GoodManagementController;
import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.commen.Msg;
import com.sirLiu.ttt_ssm.service.GoodManagementService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/14 21:58
 */
public class AllTest {


    @Test
    public void testMsgToString(){
        List<TttGoodsinfo> list = new ArrayList<>();
        TttGoodsinfo tttGoodsinfo = new TttGoodsinfo();
        tttGoodsinfo.setDescription("gagragjajg");
        tttGoodsinfo.setIsCommend(true);
        tttGoodsinfo.setIsNew(false);
        tttGoodsinfo.setName("testTestTest");
        list.add(tttGoodsinfo);
//        System.out.println(Msg.fail().add("key01","val").add("key02","val").add("good",tttGoodsinfo).add("list",list).toString());
        System.out.println(Msg.success().add("good",tttGoodsinfo).toString());
        JSONObject jsonObject  = new JSONObject();
        jsonObject.put("key01","val");
        jsonObject.put("key02","val");
        jsonObject.put("good",tttGoodsinfo);
        System.out.println(jsonObject);

        System.out.println("--------------------");
        System.out.println(Msg.success());
    }

}
