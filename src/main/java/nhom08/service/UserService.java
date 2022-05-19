package nhom08.service;

import java.util.List;

import nhom08.entity.User;

public interface UserService {
	public List<User> getUsers();
	public void saveUser(User user);
	public User getUser(int id);
	public void deleteUser(User user);
	public User getUserbyPhone(String phone);
}
