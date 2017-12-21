package com.sirLiu.ttt_ssm.dao;

import com.sirLiu.ttt_ssm.model.TttGoodOrder;
import com.sirLiu.ttt_ssm.model.TttGoodOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TttGoodOrderMapper {
    int countByExample(TttGoodOrderExample example);

    int deleteByExample(TttGoodOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TttGoodOrder record);

    int insertSelective(TttGoodOrder record);

    List<TttGoodOrder> selectByExample(TttGoodOrderExample example);

    TttGoodOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TttGoodOrder record, @Param("example") TttGoodOrderExample example);

    int updateByExample(@Param("record") TttGoodOrder record, @Param("example") TttGoodOrderExample example);

    int updateByPrimaryKeySelective(TttGoodOrder record);

    int updateByPrimaryKey(TttGoodOrder record);
}