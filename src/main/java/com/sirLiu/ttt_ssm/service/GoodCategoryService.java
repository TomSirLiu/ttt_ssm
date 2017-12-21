package com.sirLiu.ttt_ssm.service;

import com.sirLiu.ttt_ssm.dao.TttGoodCategoryMapper;
import com.sirLiu.ttt_ssm.model.TttGoodCategory;
import com.sirLiu.ttt_ssm.model.TttGoodCategoryExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/15 9:49
 */
@Service
public class GoodCategoryService {

    @Autowired
    private TttGoodCategoryMapper goodCategoryMapper;

    public List<TttGoodCategory> getAllGoodCategories(){
        return goodCategoryMapper.selectByExample(new TttGoodCategoryExample());
    }

}
