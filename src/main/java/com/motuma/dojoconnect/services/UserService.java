package com.motuma.dojoconnect.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.motuma.dojoconnect.models.User;
import com.motuma.dojoconnect.repositories.RoleRepository;
import com.motuma.dojoconnect.repositories.UserRepository;


@Service
public class UserService {
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public UserService(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	// 1
	public void saveWithUserRole(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName("ROLE_USER"));
		userRepository.save(user);
	}

	// 2
	public void saveUserWithAdminRole(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
		userRepository.save(user);
	}

	// 3
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	public void updateUse(User user) {
		userRepository.save(user);
	}


	public List<User> getUsers() {
		ArrayList<User> users = (ArrayList<User>) userRepository.findAll();
		return users;
	}

	public User getUser(Long id) {
		return userRepository.findOne(id);
	}

	
}