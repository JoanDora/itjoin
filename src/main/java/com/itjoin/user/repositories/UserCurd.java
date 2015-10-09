package com.itjoin.user.repositories;

import org.springframework.stereotype.Service;

import com.itjoin.base.MongodbBaseDao;
import com.itjoin.user.model.User;

@Service
public class UserCurd extends MongodbBaseDao<User>{

}
