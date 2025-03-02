package com.finance.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 3 Mar 2025
 *
 */
public class ChunksCustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());

            if (statusCode == HttpStatus.FORBIDDEN.value()) {  // 403 Forbidden
                model.addAttribute("errorCode", "403");
                model.addAttribute("errorMessage", "You do not have permission to access this page.");
                return "error"; // Maps to `error.html`
            } else if (statusCode == HttpStatus.NOT_FOUND.value()) {  // 404 Not Found
                model.addAttribute("errorCode", "404");
                model.addAttribute("errorMessage", "Oops! The page you are looking for does not exist.");
                return "error";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {  // 500 Internal Server Error
                model.addAttribute("errorCode", "500");
                model.addAttribute("errorMessage", "Something went wrong on our end. Please try again later.");
                return "error";
            }
        }

        model.addAttribute("errorCode", "Unknown");
        model.addAttribute("errorMessage", "An unexpected error occurred.");
        return "error";
    }
}