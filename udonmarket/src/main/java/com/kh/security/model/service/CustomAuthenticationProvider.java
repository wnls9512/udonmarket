package com.kh.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
    private UserDetailsService userDeSer;
	
	@Autowired
	BCryptPasswordEncoder pwEncoding;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userId = (String) authentication.getPrincipal();

		String password = (String) authentication.getCredentials();
		
		SecurityService user = (SecurityService) userDeSer.loadUserByUsername(userId);
		
		if (user == null || !userId.equals(((UserDetails) user).getUsername())
				|| !pwEncoding.matches(password, ((UserDetails) user).getPassword())) {

			throw new BadCredentialsException(userId);
		}

		Authentication newAuth = new UsernamePasswordAuthenticationToken(userId, password, ((Authentication) user).getAuthorities());
		
		return newAuth;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }
}
