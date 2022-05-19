package nhom08.dao;

import java.util.List;

import nhom08.entity.Status;

public interface StatusDAO {
	public List<Status> getStatuses();
	public Status getStatus(int id) ;
}
