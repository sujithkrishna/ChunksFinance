package com.finance.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinanceModelId implements Serializable {

    private String financeType;
    private String financeName;
    private String financeOwnerName;

}