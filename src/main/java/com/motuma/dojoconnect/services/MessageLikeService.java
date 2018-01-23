package com.motuma.dojoconnect.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.motuma.dojoconnect.models.MessageLike;
import com.motuma.dojoconnect.repositories.MessageLikeRepository;



@Service
public class MessageLikeService {
	private MessageLikeRepository messageLikeRepo;
	
	public MessageLikeService(MessageLikeRepository messageLike) {
		this.messageLikeRepo = messageLike;
	}
	
	public List<MessageLike> allMessageLikes(){
		return messageLikeRepo.findAll();
	}
	

	public MessageLike getMessageLike(long id) {
		return (MessageLike) messageLikeRepo.findOne(id);
	}
	public void update(MessageLike messageLike) {
		messageLikeRepo.save(messageLike);
	}

}
