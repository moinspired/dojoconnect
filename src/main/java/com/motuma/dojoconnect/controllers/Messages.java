package com.motuma.dojoconnect.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.motuma.dojoconnect.models.Message;
import com.motuma.dojoconnect.models.MessageLike;
import com.motuma.dojoconnect.models.User;
import com.motuma.dojoconnect.services.MessageLikeService;
import com.motuma.dojoconnect.services.MessageService;
import com.motuma.dojoconnect.services.UserService;


@Controller
public class Messages {
	@Autowired
	private UserService userService;
	@Autowired
	private MessageService messageService;

	@Autowired
	private MessageLikeService messageLikeService;

	protected boolean mostLiked; 


	@RequestMapping("/messages")
	public String postMessage(@RequestParam(value="message") String message, Model model, Principal principal) {

		String username = principal.getName();
		User currentUser = userService.findByUsername(username);

		Message newMessage = new Message();
		newMessage.setMessage(message);
		newMessage.setUser(currentUser);
		messageService.update(newMessage);

		userService.updateUse(currentUser);
		for(Message msg: messageService.allMessages()) {
			System.out.println(msg);
		}

		return "redirect:/";
	}


	@RequestMapping("/like/message/{id}")
	public String likeMessage(@PathVariable Long id, Model model, Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findByUsername(username);
		MessageLike currentMessage = messageLikeService.getMessageLike(id);
		
		if(messageLikeService.allMessageLikes().size() < 1) {
			MessageLike mk = new MessageLike();
			mk.setUser(currentUser);
			mk.setMessage(messageService.getMessage(id));
			messageLikeService.update(mk);
		}
		//look throught the messalike to if the message exists
		// if the message does not exist, create the like. (this will be the first like
		// if the message exist in the messagelike list, then look to see if the current user has liked the message,
		// if not 
		try {
			System.out.println(messageLikeService.getMessageLike(id));
			if(messageLikeService.getMessageLike(id) == null) { 
				MessageLike mk = new MessageLike();
				mk.setUser(currentUser);
				mk.setMessage(messageService.getMessage(id));
				messageLikeService.update(mk);

			}else {
				
				boolean hasUser = false;
		
				for(MessageLike messagelike: messageLikeService.allMessageLikes()) {
					 if(messagelike.getMessage().getId() == currentMessage.getId()) {
						 if(messagelike.getUser().getId() == currentUser.getId()) {
								hasUser = true;
								break;
							}
					 	}
					} 
			
				if(!hasUser) {
					MessageLike mk = new MessageLike();
					mk.setUser(currentUser);
					mk.setMessage(messageService.getMessage(id));
					messageLikeService.update(mk);
				}
			}
			

		}catch(NullPointerException e) {
			System.out.print("Caught the NullPointerException");
			return "redirect:/";
		}


		return "redirect:/";
	}

}
