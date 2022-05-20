package nhom08.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Role;



@Repository
public class RoleImpl implements RoleDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Role> getRoles() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Role> query = currentSession.createQuery("from Roles", Role.class);
		List<Role> roles = query.getResultList();
		return roles;
	}

	@Override
	public void saveRole(Role role) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(role);
		
	}

	@Override
	public Role getRole(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Role role = currentSession.get(Role.class, id);
		return role;
	}

	@Override
	public void deleteRole(Role role) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(role);	
		
	}

	@Override
	public List<Role> getUserRoles(String phone) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Role> query = currentSession.createQuery("from Roles where phone = :phone", Role.class);
		query.setParameter("phone", phone);
		List<Role> roles = query.getResultList();
		return roles;
	}
	
}
