package com.sirLiu.ttt_ssm.service;

import com.sirLiu.ttt_ssm.dao.TttGoodCategoryMapper;
import com.sirLiu.ttt_ssm.dao.TttGoodsinfoMapper;
import com.sirLiu.ttt_ssm.model.TttGoodCategory;
import com.sirLiu.ttt_ssm.model.TttGoodCategoryExample;
import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.TttGoodsinfoExample;
import com.sirLiu.ttt_ssm.model.json.GoodsInfoJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/14 10:25
 */
@Service
public class GoodManagementService {

    @Autowired
    private TttGoodsinfoMapper goodsinfoMapper;

    @Autowired
    private TttGoodCategoryMapper goodCategoryMapper;

    public List<TttGoodsinfo> getAllGoods() {
        return goodsinfoMapper.selectByExampleWithBLOBs(new TttGoodsinfoExample());
    }

    public TttGoodsinfo selectGoodByGoodId(Integer goodId) {
        return goodsinfoMapper.selectByPrimaryKey(goodId);
    }

    public GoodsInfoJson convertGoodInfoToJson(TttGoodsinfo goodsinfo) {
        GoodsInfoJson goodInfoJson = new GoodsInfoJson();
        goodInfoJson.setCategory(goodCategoryMapper.selectByPrimaryKey(goodsinfo.getCategoryId()));
        goodInfoJson.setId(goodsinfo.getId());
        goodInfoJson.setName(goodsinfo.getName());
        goodInfoJson.setDescription(goodsinfo.getDescription());
        goodInfoJson.setIfCommend(goodsinfo.getIsCommend());
        goodInfoJson.setIfNew(goodsinfo.getIsNew());
        goodInfoJson.setPrice(goodsinfo.getPrice());
        goodInfoJson.setIfDiscount(goodsinfo.getIsDiscount());
        goodInfoJson.setStock(goodsinfo.getStock());
        return goodInfoJson;
    }

    public List<TttGoodsinfo> getGoodsFilterByGoodCategories(String[] goodCategoriyNames) {
        TttGoodsinfoExample goodsinfoExample = new TttGoodsinfoExample();
        List<Integer> goodCategoryIds = new ArrayList<>();
        for (String goodCategoryName : goodCategoriyNames) {
            TttGoodCategoryExample goodCategoryExample = new TttGoodCategoryExample();
            goodCategoryExample.createCriteria().andNameEqualTo(goodCategoryName);
            TttGoodCategory goodCategory = goodCategoryMapper.selectByExample(goodCategoryExample).get(0);
            goodCategoryIds.add(goodCategory.getId());
        }
        goodsinfoExample.createCriteria().andCategoryIdIn(goodCategoryIds);
        return goodsinfoMapper.selectByExampleWithBLOBs(goodsinfoExample);
    }

}
