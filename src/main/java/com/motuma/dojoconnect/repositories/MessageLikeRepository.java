package com.motuma.dojoconnect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.motuma.dojoconnect.models.MessageLike;


@Repository	
public interface MessageLikeRepository extends CrudRepository<MessageLike, Long>{
	List<MessageLike> findAll();
}
