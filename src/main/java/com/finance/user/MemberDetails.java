package com.finance.user;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.finance.model.MemberModel;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
public class MemberDetails implements UserDetails {
	private static final long serialVersionUID = 1L;
	private final MemberModel member;

    public MemberDetails(MemberModel member) {
        this.member = member;
    }

    public MemberModel getMember() {
        return member;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Convert user roles into Spring Security GrantedAuthorities
        return List.of(new SimpleGrantedAuthority("ROLE_" + member.getRole()));
    }

    @Override
    public String getPassword() {
        return member.getPassword();
    }

    @Override
    public String getUsername() {
        return member.getEmailId();
    }

    // Implement other UserDetails methods as needed (return true for simplicity)
    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }

}
