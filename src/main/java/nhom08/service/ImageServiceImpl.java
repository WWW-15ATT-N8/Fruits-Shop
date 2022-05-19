package nhom08.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nhom08.dao.ImageDAO;
import nhom08.entity.Image;

@Service
public class ImageServiceImpl implements ImageService{
	
	@Autowired
	private ImageDAO imageDAO;

	@Override
	@Transactional
	public List<Image> getImages() {
		// TODO Auto-generated method stub
		return imageDAO.getImages();
	}

	@Override
	@Transactional
	public Image getImage(int imageID) {
		// TODO Auto-generated method stub
		return imageDAO.getImage(imageID);
	}

	@Override
	@Transactional
	public void saveImage(Image image) {
		// TODO Auto-generated method stub
		imageDAO.saveImage(image);
	}

	@Override
	@Transactional
	public void updateImage(Image image) {
		// TODO Auto-generated method stub
		imageDAO.updateImage(image);
	}

	@Override
	@Transactional
	public void deleteImage(Image image) {
		// TODO Auto-generated method stub
		imageDAO.deleteImage(image);
	}

	@Override
	@Transactional
	public List<Image> getImagesByProductID(int productID) {
		// TODO Auto-generated method stub
		return imageDAO.getImagesByProductID(productID);
	}

}
