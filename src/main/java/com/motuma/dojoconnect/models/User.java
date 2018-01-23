package com.motuma.dojoconnect.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue
    private Long id;
    @Size(min=3)
    private String firstName;
    @Size(min=3)
    private String lastName;
    @Email
    private String username; //email
    @Size(min=5)
    private String password;
    @Transient
    private String passwordConfirmation;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "friendships", 
    joinColumns = @JoinColumn(name = "user_id"), 
    inverseJoinColumns = @JoinColumn(name = "friend_id")
    )
    private List<User> friends;
    
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "friendships", 
    joinColumns = @JoinColumn(name = "friend_id"), 
    inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userFriends;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "friend_invitations", 
    joinColumns = @JoinColumn(name = "user_id"), 
    inverseJoinColumns = @JoinColumn(name = "inviter_id")
    )
    private List<User> invitation;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "friend_invitations", 
    joinColumns = @JoinColumn(name = "inviter_id"), 
    inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userInvites;
    
    
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Message> messages;
    
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Comment> comments;
    
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<MessageLike> messagelikes;
    
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<CommentLike> commentLikes;    
    
    @OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private Profile profile;
    
    public User() {
    	
    }
    
    
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}


	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
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


	public List<Role> getRoles() {
		return roles;
	}


	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}


	public List<User> getFriends() {
		return friends;
	}


	public void setFriends(List<User> friends) {
		this.friends = friends;
	}


	public List<User> getUserFriends() {
		return userFriends;
	}


	public void setUserFriends(List<User> userFriends) {
		this.userFriends = userFriends;
	}


	public List<User> getInvitation() {
		return invitation;
	}


	public void setInvitation(List<User> invitation) {
		this.invitation = invitation;
	}


	public List<User> getUserInvites() {
		return userInvites;
	}


	public void setUserInvites(List<User> userInvites) {
		this.userInvites = userInvites;
	}


	public List<Message> getMessages() {
		return messages;
	}


	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public List<MessageLike> getMessagelikes() {
		return messagelikes;
	}


	public void setMessagelikes(List<MessageLike> messagelikes) {
		this.messagelikes = messagelikes;
	}


	public List<CommentLike> getCommentLikes() {
		return commentLikes;
	}


	public void setCommentLikes(List<CommentLike> commentLikes) {
		this.commentLikes = commentLikes;
	}


	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        //this.updatedAt = new Date();
    }
   
}