package nhom08.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Status;
import nhom08.entity.User;

@Repository
public class StatusDAOImpl implements StatusDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Status> getStatuses() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Status> query = currentSession.createQuery("from Statuses", Status.class);
		List<Status> status= query.getResultList();
		return status;
	}

	@Override
	public Status getStatus(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Status status = currentSession.get(Status.class, id);
		return status;
	}

}
