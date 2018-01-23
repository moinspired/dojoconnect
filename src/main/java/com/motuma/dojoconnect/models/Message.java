package com.motuma.dojoconnect.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="Messages")
public class Message {
	 @Id
	    @GeneratedValue
	    private Long id;
	    @Size(min=3)
	    private String message;

	    @Column(updatable=false)
	    private Date createdAt;
	    private Date updatedAt;
	    	    
	    @OneToMany(mappedBy="message", fetch = FetchType.LAZY)
	    private List<Comment> comments;
	    
	    @OneToMany(mappedBy="message", fetch = FetchType.LAZY)
	    private List<MessageLike> messageLikes;
	    
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User user;

	    public Message() {
	    	
	    }
	    
		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}

		public List<Comment> getComments() {
			return comments;
		}

		public void setComments(List<Comment> comments) {
			this.comments = comments;
		}

		public List<MessageLike> getMessageLikes() {
			return messageLikes;
		}

		public void setMessageLikes(List<MessageLike> messageLikes) {
			this.messageLikes = messageLikes;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	    @PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }
	   
}
