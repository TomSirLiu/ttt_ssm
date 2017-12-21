package com.sirLiu.ttt_ssm.service;

import com.sirLiu.ttt_ssm.dao.TttUserinfoMapper;
import com.sirLiu.ttt_ssm.model.TttUserinfo;
import com.sirLiu.ttt_ssm.model.TttUserinfoExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author sirLiu
 * @Date 2017/12/3 16:42
 */
@Service
public class UserManagementService {

    @Autowired
    private TttUserinfoMapper tttUserinfoMapper;

    public List<TttUserinfo> listAllUsers() {
        return tttUserinfoMapper.selectByExample(new TttUserinfoExample());
    }

    public TttUserinfo selectByName(String name) {
        TttUserinfoExample userinfoExample = new TttUserinfoExample();
        userinfoExample.createCriteria().andNameEqualTo(name);
        List<TttUserinfo> users = tttUserinfoMapper.selectByExample(userinfoExample);
        if (users != null && users.size() > 0) {
            return tttUserinfoMapper.selectByExample(userinfoExample).get(0);
        } else {
            return null;
        }
    }

    public int addUser(TttUserinfo userinfo) {
        return tttUserinfoMapper.insertSelective(userinfo);
    }

    public int updateUser(TttUserinfo userinfo) {
        return tttUserinfoMapper.updateByPrimaryKeySelective(userinfo);
    }

}
