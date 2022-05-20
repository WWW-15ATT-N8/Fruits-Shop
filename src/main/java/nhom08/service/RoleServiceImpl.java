package nhom08.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.RoleDAO;
import nhom08.entity.Role;



@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleDAO roleDAO;
	
	@Override
	@Transactional
	public List<Role> getRoles() {
		// TODO Auto-generated method stub
		return roleDAO.getRoles();
	}

	@Override
	@Transactional
	public void saveRole(Role role) {
		roleDAO.saveRole(role);
		
	}

	@Override
	@Transactional
	public Role getRole(int id) {
		// TODO Auto-generated method stub
		return roleDAO.getRole(id);
	}

	@Override
	@Transactional
	public void deleteRole(Role role) {
		roleDAO.deleteRole(role);
		
	}

	@Override
	public List<Role> getUserRoles(String phone) {
		// TODO Auto-generated method stub
		return roleDAO.getUserRoles(phone);
	}

}
