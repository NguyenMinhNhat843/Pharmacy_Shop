package dao.impl;

import dao.AccountDao;
import entity.Account;
import jakarta.persistence.EntityManager;

import java.util.List;

public class AccountDaoImpl implements AccountDao {

    private EntityManager entityManager;

    public AccountDaoImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public Account getAccount(String username) {
        return null;
    }

    @Override
    public Account saveAccount(Account account) {
        return null;
    }

    @Override
    public Account updateAccount(String username, Account account) {
        return null;
    }

    @Override
    public void deleteAccount(String username) {

    }

    @Override
    public List<Account> getAllAccounts() {
        return null;
    }
}
