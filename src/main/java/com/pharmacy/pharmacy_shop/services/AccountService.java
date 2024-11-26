package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.Account;
import org.springframework.stereotype.Service;

@Service
public interface AccountService {
    public Account findByUsernameAndPassword(String username, String password);
}
