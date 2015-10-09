package com.itjoin.user.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.itjoin.user.model.User;

public interface UserRepository extends MongoRepository<User,String>{
	Page<User> findByCreateTimeBetween(Date start,Date end,Pageable pageable);
	int countByCreateTimeBetween(Date start,Date end);
	Page<User> findByCreateTimeLessThan(Date end,Pageable pageable);
	int countByCreateTimeLessThan(Date end);
	Page<User> findByCreateTimeGreaterThan(Date start,Pageable pageable);
	int countByCreateTimeGreaterThan(Date start);
	List<User> findByEmail(String email);
}
