package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.services.EmailService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailSrviceImpl implements EmailService {

    @Autowired
    private  JavaMailSender mailSender;

    public boolean sendEmail(String to, String subject, String body) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("your-email@example.com");  // Địa chỉ email gửi
            message.setTo(to);
            message.setSubject(subject);
            message.setText(body);
            mailSender.send(message);
            return true;  // Nếu gửi email thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false;  // Nếu có lỗi khi gửi email
        }
    }
}
