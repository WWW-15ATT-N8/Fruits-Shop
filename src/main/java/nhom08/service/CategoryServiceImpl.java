package nhom08.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;

import nhom08.dao.CategoryDao;
import nhom08.entity.Category;


@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	@Transactional
	public List<Category> getCategories() {
		
		return categoryDao.getCategories();
	}

	@Override
	@Transactional
	public void saveCategory(Category category) {
		categoryDao.saveCategory(category);
	}

	@Override
	@Transactional
	public Category getCategory(int id) {
		return categoryDao.getCategory(id);
	}

	@Override
	@Transactional
	public void deleteCategory(int id) {
		categoryDao.deleteCategory(id);
	}

	@Override
	@Transactional
	public List<Category> getCategoriesFilter(String name) {
		
		return categoryDao.getCategoriesFilter(name);
	}

}
