package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.reposities.AccountRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AccountImpl implements AccountService {

    @Autowired
    private AccountRepo accountRepository;

    public Account findByUsernameAndPassword(String username, String password) {
        return accountRepository.findByUsernameAndPassword(username, password);
    }

    @Override
    public Account findByUsername(String username) {
        return accountRepository.findByUsername(username);
    }

    @Override
    public void save(Account account) {
        accountRepository.save(account);
    }

}
