package com.motuma.dojoconnect.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.motuma.dojoconnect.models.CommentLike;
import com.motuma.dojoconnect.repositories.CommentLikeRepository;



@Service
public class CommentLikeService {
	private CommentLikeRepository commentLikeRepo;
	
	public CommentLikeService(CommentLikeRepository commentLike) {
		this.commentLikeRepo = commentLike;
	}
	
	public List<CommentLike> allCommentLikes(){
		return commentLikeRepo.findAll();
	}
	

	public CommentLike getCommentLike(long id) {
		return (CommentLike) commentLikeRepo.findOne(id);
	}
	public void update(CommentLike commentLike) {
		commentLikeRepo.save(commentLike);
	}
}
