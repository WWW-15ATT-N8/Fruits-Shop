package nhom08.entity;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ListImage implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<MultipartFile> imgFiles;

	public List<MultipartFile> getImgFiles() {
		return imgFiles;
	}

	public ListImage() {
		super();
	}



	public void setImgFiles(List<MultipartFile> imgFiles) {
		this.imgFiles = imgFiles;
	}

	public ListImage(List<MultipartFile> imgFiles) {
		super();
		this.imgFiles = imgFiles;
	}
	
	
}
