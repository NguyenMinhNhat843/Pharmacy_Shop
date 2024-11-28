package com.pharmacy.pharmacy_shop.services;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
    public boolean sendEmail(String to, String subject, String body);
}
