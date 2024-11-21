package dao;

import entity.Account;

import java.util.List;

public interface AccountDao {
    public Account getAccount(String username);

    public Account saveAccount(Account account);

    public Account updateAccount(String username, Account account);

    public void deleteAccount(String username);

    public List<Account> getAllAccounts();
}
