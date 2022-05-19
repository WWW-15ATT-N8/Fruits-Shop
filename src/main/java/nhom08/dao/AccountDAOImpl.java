package nhom08.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Account;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Account getAccount(String phone) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Account> query= currentSession.createQuery(" from Accounts where phone=:p", Account.class);
		query.setParameter("p", phone);
		Account  account = null;
		try {
			account = query.getSingleResult();
		} catch (Exception e) {
			
		}
		return account ;
	}

	@Override
	public void saveAccount(Account account) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(account);
	}

	@Override
	public void deleteAccount(Account account) {
		// TODO Auto-generated method stub
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(account);
	}

	@Override
	public int lastID() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Integer> query = currentSession.createQuery(" select max(accountID) from Accounts");
		int max = query.getSingleResult();
		return max;
	}

}
