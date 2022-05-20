package nhom08.dao;

import java.util.List;

import nhom08.entity.Account;

public interface AccountDAO {
	public Account getAccount(String phone);
	public void saveAccount(Account account);
	public void deleteAccount(Account account);
	public int lastID();
	public List<Account> getAccountByRoleID(int roleID);
}
