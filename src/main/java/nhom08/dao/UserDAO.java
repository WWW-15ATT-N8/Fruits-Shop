package nhom08.dao;

import java.util.List;

import nhom08.entity.User;


public interface UserDAO {
	public List<User> getUsers();
	public void saveUser(User user);
	public User getUser(int id);
	public void deleteUser(User user);
	public User getUserbyPhone(String phone);
	public List<User> getUsersFilter(String fullName, String address, String phone, String email);
}
