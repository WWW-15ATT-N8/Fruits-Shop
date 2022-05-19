package nhom08.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nhom08.entity.Category;


public interface CategoryService {
	public List<Category> getCategories();
	public List<Category> getCategoriesFilter(String name);
	public void saveCategory(Category category);
	public Category getCategory(int id);
	public void deleteCategory(int id);
}
