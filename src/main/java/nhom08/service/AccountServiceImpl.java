package nhom08.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.AccountDAO;
import nhom08.entity.Account;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private AccountDAO accountDAO;

	@Override
	@Transactional
	public Account getAccount(String phone) {
		// TODO Auto-generated method stub
		return accountDAO.getAccount(phone);
	}

	@Override
	@Transactional
	public void saveAccount(Account account) {
		accountDAO.saveAccount(account);
	}

	@Override
	@Transactional
	public void deleteAccount(Account account) {
		accountDAO.deleteAccount(account);
	}

	@Override
	@Transactional
	public int lastID() {
		// TODO Auto-generated method stub
		return accountDAO.lastID();
	}

	@Override
	public List<Account> getAccountByRoleID(int roleID) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountByRoleID(roleID);
	}

}
