package com.motuma.dojoconnect.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.motuma.dojoconnect.models.Message;
import com.motuma.dojoconnect.repositories.MessageRepository;


@Service
public class MessageService {
	private MessageRepository messageRepository;
	
	public MessageService(MessageRepository messageRepository) {
		this.messageRepository = messageRepository;
	}
	
	public List<Message> allMessages(){
		return messageRepository.findAll();
	}
	
	
	public void create(Message message) {
		messageRepository.save(message);
	}

	public Message getMessage(long id) {
		return (Message) messageRepository.findOne(id);
	}
	public void update(Message message) {
		messageRepository.save(message);
	}
	public void destroy(long id) {
		messageRepository.delete(id);
	}
}
