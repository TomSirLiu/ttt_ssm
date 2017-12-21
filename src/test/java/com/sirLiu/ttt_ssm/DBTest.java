package com.sirLiu.ttt_ssm;

import com.sirLiu.ttt_ssm.dao.TttUserinfoMapper;
import com.sirLiu.ttt_ssm.model.TttUserinfo;
import com.sirLiu.ttt_ssm.model.TttUserinfoExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author sirLiu
 * @Date 2017/12/3 14:17
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class DBTest {

    @Autowired
    private TttUserinfoMapper tttUserinfoMapper;

    @Test
    public void test() throws Exception{
        TttUserinfo tttUserinfo = tttUserinfoMapper.selectByPrimaryKey(2);
        System.out.println(tttUserinfo.getName());

        System.out.println(tttUserinfoMapper.selectByExample(new TttUserinfoExample()));
    }

    public static void main(String[] args) {
//        new DBTest().test();
    }

}
