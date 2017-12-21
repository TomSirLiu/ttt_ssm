package com.sirLiu.ttt_ssm.dao;

import com.sirLiu.ttt_ssm.model.TttGoodsinfo;
import com.sirLiu.ttt_ssm.model.TttGoodsinfoExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TttGoodsinfoMapper {
    int countByExample(TttGoodsinfoExample example);

    int deleteByExample(TttGoodsinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TttGoodsinfo record);

    int insertSelective(TttGoodsinfo record);

    List<TttGoodsinfo> selectByExampleWithBLOBs(TttGoodsinfoExample example);

    List<TttGoodsinfo> selectByExample(TttGoodsinfoExample example);

    TttGoodsinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TttGoodsinfo record, @Param("example") TttGoodsinfoExample example);

    int updateByExampleWithBLOBs(@Param("record") TttGoodsinfo record, @Param("example") TttGoodsinfoExample example);

    int updateByExample(@Param("record") TttGoodsinfo record, @Param("example") TttGoodsinfoExample example);

    int updateByPrimaryKeySelective(TttGoodsinfo record);

    int updateByPrimaryKeyWithBLOBs(TttGoodsinfo record);

    int updateByPrimaryKey(TttGoodsinfo record);
}