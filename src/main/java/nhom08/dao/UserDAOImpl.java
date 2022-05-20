package nhom08.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Category;
import nhom08.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> getUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> query = currentSession.createQuery("from Users", User.class);
		List<User> users = query.getResultList();
		return users;
	}

	@Override
	public void saveUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(user);
	}

	@Override
	public User getUser(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = currentSession.get(User.class, id);
		return user;
	}

	@Override
	public void deleteUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(user);		
	}

	@Override
	public User getUserbyPhone(String phone) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> query = currentSession.createQuery("from Users where phone=:Phone");
		query.setParameter("Phone",phone);
		User u = null;
		try {
			u = query.getSingleResult();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return u;
	}

	@Override
	public List<User> getUsersFilter(String fullName, String address, String phone, String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> query = currentSession.createQuery("from Users where "
				+ "fullName like :fullName and "
				+ "address like :address and "
				+ "phone like :phone and "
				+ "email like :email", User.class);
		query.setParameter("fullName", "%"+fullName+"%");
		query.setParameter("address", "%"+address+"%");
		query.setParameter("phone", "%"+phone+"%");
		query.setParameter("email", "%"+email+"%");
		List<User> users = query.getResultList();
		return users;
	}

}
