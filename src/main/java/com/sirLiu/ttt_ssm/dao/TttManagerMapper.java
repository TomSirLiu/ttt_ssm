package com.sirLiu.ttt_ssm.dao;

import com.sirLiu.ttt_ssm.model.TttManager;
import com.sirLiu.ttt_ssm.model.TttManagerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TttManagerMapper {
    int countByExample(TttManagerExample example);

    int deleteByExample(TttManagerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TttManager record);

    int insertSelective(TttManager record);

    List<TttManager> selectByExample(TttManagerExample example);

    TttManager selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TttManager record, @Param("example") TttManagerExample example);

    int updateByExample(@Param("record") TttManager record, @Param("example") TttManagerExample example);

    int updateByPrimaryKeySelective(TttManager record);

    int updateByPrimaryKey(TttManager record);
}