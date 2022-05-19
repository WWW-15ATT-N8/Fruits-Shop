package nhom08.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom08.entity.Category;
import nhom08.entity.Image;

@Repository
public class ImageDAOImpl  implements ImageDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Image> getImages() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Image> query = currentSession.createQuery("From Images", Image.class);
		List<Image> list = query.getResultList();
		return list;
	}

	@Override
	public Image getImage(int imageID) {
		Session currentSession = sessionFactory.getCurrentSession();
		Image image= currentSession.get(Image.class,imageID);
		return image;
	}

	@Override
	public void saveImage(Image image) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(image);
	}

	@Override
	public void updateImage(Image image) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(image);
		
	}

	@Override
	public void deleteImage(Image image) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(image);	
	}

	@Override
	@Transactional
	public List<Image> getImagesByProductID(int productID) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Image> query = currentSession.createQuery("From Images where productID=:productID", Image.class);
		query.setParameter("productID", productID);
		List<Image> list = query.getResultList();
		return list;
	}

}
