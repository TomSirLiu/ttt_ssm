package com.sirLiu.ttt_ssm.service;

import com.sirLiu.ttt_ssm.dao.TttGoodsinfoMapper;
import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.TttGoodsinfoExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/14 10:25
 */
@Service
public class GoodManagementService {

    @Autowired
    private TttGoodsinfoMapper goodsinfoMapper;

    public List<TttGoodsinfo> getAllGoods(){
        return goodsinfoMapper.selectByExampleWithBLOBs(new TttGoodsinfoExample());
    }

    public TttGoodsinfo selectGoodByGoodId(Integer goodId){
        return goodsinfoMapper.selectByPrimaryKey(goodId);
    }

}
