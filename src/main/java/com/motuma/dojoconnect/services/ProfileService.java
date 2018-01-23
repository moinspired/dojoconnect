package com.motuma.dojoconnect.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.motuma.dojoconnect.models.Profile;
import com.motuma.dojoconnect.repositories.ProfileRepository;


@Service
public class ProfileService {
	private ProfileRepository profileRepo;
	
	public ProfileService(ProfileRepository profileRepo) {
		this.profileRepo = profileRepo;
	}
	
	public List<Profile> allProfile(){
		return profileRepo.findAll();
	}
	
	
	public void create(Profile profile) {
		profileRepo.save(profile);
	}

	public Profile getProfile(long id) {
		return (Profile) profileRepo.findOne(id);
	}
	public void update(Profile profile) {
		profileRepo.save(profile);
	}
	public void destroy(long id) {
		profileRepo.delete(id);
	}
}
