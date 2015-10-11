package com.itjoin.course.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.itjoin.course.model.Course;

public interface CourseRepository extends MongoRepository<Course, String>{

}
