package com.finance.model;

import java.time.LocalDateTime;
import java.util.Map;

import com.finance.config.MapToJsonConverter;

import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

/**
 * @author Sujith Krishna
 *
 * 3 Mar 2025
 *
 */
@Data
@Entity
@Table(name = "settings")
public class SettingsModel {
	
	@Id
	@Column(nullable = false)
	private Integer no;
	  
	@ManyToOne
	@JoinColumn(name = "last_updated_member_no", referencedColumnName = "no")
	private MemberModel lastUpdatedBy;
	  
	@Column(name = "last_updated_date")
	private LocalDateTime lastUpdatedDate;
	
	@Column(name = "settings", columnDefinition = "TEXT") // Store as JSON in a TEXT column
	@Convert(converter = MapToJsonConverter.class)
	private Map<String,String> settings;

}
