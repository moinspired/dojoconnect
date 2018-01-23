package com.motuma.dojoconnect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.motuma.dojoconnect.models.CommentLike;



@Repository
public interface CommentLikeRepository extends CrudRepository<CommentLike, Long>{
	List<CommentLike> findAll();
}

