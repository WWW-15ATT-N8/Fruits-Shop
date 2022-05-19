package nhom08.service;

import java.util.List;

import nhom08.entity.Status;

public interface StatusService {

	public List<Status> getStatuses();
	public Status getStatus(int id) ;
}
