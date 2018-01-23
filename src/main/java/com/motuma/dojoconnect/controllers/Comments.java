package com.motuma.dojoconnect.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.motuma.dojoconnect.models.Comment;
import com.motuma.dojoconnect.models.CommentLike;
import com.motuma.dojoconnect.models.Message;
import com.motuma.dojoconnect.models.User;
import com.motuma.dojoconnect.services.CommentLikeService;
import com.motuma.dojoconnect.services.CommentService;
import com.motuma.dojoconnect.services.MessageService;
import com.motuma.dojoconnect.services.UserService;


@Controller
public class Comments {
	@Autowired
	private UserService userService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CommentLikeService commentLikeService;

	@RequestMapping("/comments/{id}")
	public String postMessage(@PathVariable Long id, @RequestParam(value="comment") String comment, Model model, Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findByUsername(username);



		Comment newComment = new Comment();
		newComment.setComment(comment);
		newComment.setUser(currentUser);


		Message currentMessage = messageService.getMessage(id);
		newComment.setMessage(currentMessage);
		commentService.update(newComment);     

		return "redirect:/";

	}

	@RequestMapping("/like/comment/{id}")
	public String likeMessage(@PathVariable Long id, Model model, Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findByUsername(username);
		CommentLike currentComment = commentLikeService.getCommentLike(id);

		if(commentLikeService.allCommentLikes().size() < 1) {
			CommentLike cl = new CommentLike();
			cl.setUser(currentUser);
			cl.setComment(commentService.getComment(id));
			commentLikeService.update(cl);
		}
		try {
			System.out.println(commentLikeService.getCommentLike(id));
			if(commentLikeService.getCommentLike(id) == null) { 
				CommentLike cl = new CommentLike();
				cl.setUser(currentUser);
				cl.setComment(commentService.getComment(id));
				commentLikeService.update(cl);

			}else {

				boolean hasUser = false;

				for(CommentLike commentlike: commentLikeService.allCommentLikes()) {
					if(commentlike.getComment().getId() == currentComment.getId()) {
						if(commentlike.getUser().getId() == currentUser.getId()) {
							hasUser = true;
							break;
						}
					}
				} 

				if(!hasUser) {
					CommentLike cl = new CommentLike();
					cl.setUser(currentUser);
					cl.setComment(commentService.getComment(id));
					commentLikeService.update(cl);
				}
			}

		}catch(NullPointerException e) {
			System.out.print("Caught the NullPointerException");
			return "redirect:/";
		}


		return "redirect:/";
	}

}
