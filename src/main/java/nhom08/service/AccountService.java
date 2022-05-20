package nhom08.service;

import nhom08.entity.Account;

public interface AccountService {

	public Account getAccount(String phone);
	public void saveAccount(Account account);
	public void deleteAccount(Account account);
	public int lastID();
}