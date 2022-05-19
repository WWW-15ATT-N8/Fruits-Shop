package nhom08.dao;

import java.util.List;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import nhom08.entity.Category;

public interface CategoryDao {
	public List<Category> getCategories();
	public List<Category> getCategoriesFilter(String name);
	public void saveCategory(Category category);
	public Category getCategory(int id);
	public void deleteCategory(int id);

}
