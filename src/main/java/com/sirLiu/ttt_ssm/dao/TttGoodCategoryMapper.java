package com.sirLiu.ttt_ssm.dao;

import com.sirLiu.ttt_ssm.model.TttGoodCategory;
import com.sirLiu.ttt_ssm.model.TttGoodCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TttGoodCategoryMapper {
    int countByExample(TttGoodCategoryExample example);

    int deleteByExample(TttGoodCategoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TttGoodCategory record);

    int insertSelective(TttGoodCategory record);

    List<TttGoodCategory> selectByExample(TttGoodCategoryExample example);

    TttGoodCategory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TttGoodCategory record, @Param("example") TttGoodCategoryExample example);

    int updateByExample(@Param("record") TttGoodCategory record, @Param("example") TttGoodCategoryExample example);

    int updateByPrimaryKeySelective(TttGoodCategory record);

    int updateByPrimaryKey(TttGoodCategory record);
}