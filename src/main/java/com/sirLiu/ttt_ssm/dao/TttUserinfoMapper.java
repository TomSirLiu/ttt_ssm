package com.sirLiu.ttt_ssm.dao;

import com.sirLiu.ttt_ssm.model.TttUserinfo;
import com.sirLiu.ttt_ssm.model.TttUserinfoExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TttUserinfoMapper {
    int countByExample(TttUserinfoExample example);

    int deleteByExample(TttUserinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TttUserinfo record);

    int insertSelective(TttUserinfo record);

    List<TttUserinfo> selectByExample(TttUserinfoExample example);

    TttUserinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TttUserinfo record, @Param("example") TttUserinfoExample example);

    int updateByExample(@Param("record") TttUserinfo record, @Param("example") TttUserinfoExample example);

    int updateByPrimaryKeySelective(TttUserinfo record);

    int updateByPrimaryKey(TttUserinfo record);
}