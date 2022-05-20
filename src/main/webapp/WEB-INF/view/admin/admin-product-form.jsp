
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="nhom08.entity.Image"%>
<%@page import="nhom08.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Lưu sản phẩm</title>
<style type="text/css">
	.error{
color: red !important;
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	%>
<div class="wrapper">

		<jsp:include page="partial/navbar.jsp"></jsp:include>
		<jsp:include page="partial/asidebar.jsp"></jsp:include>

		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Lưu sản phẩm" />
							</jsp:include>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Sản phẩm" />
								<jsp:param
									value="${pageContext.request.contextPath}/admin/product/list"
									name="item_sub_src" />
								<jsp:param name="item_main" value="Lưu sản phẩm" />
							</jsp:include>
						</div>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="content-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header bg-info" aria-expanded="true"
									data-target=".collapse" data-card-widget="collapse"
									style="cursor: pointer;">
									<div class="card-title">Thông tin sản phẩm</div>
									<div class="card-tools">
										<button data-card-widget="collapse" type="button"
											class="btn btn-tool">
											<i class="fas fa-minus"></i>
										</button>
									</div>
								</div>

								<div class="card-body collapse show">
									<form:form modelAttribute="product" method="POST"
										action="${pageContext.request.contextPath}/admin/product/save">
										<form:hidden path="productID" />
										<div class="row">
											<div class="col-6">
												<div class="form-group">
													<label>Tên sản phẩm:</label>
													<form:input path="name" name="name" value="${ name }"
														class="form-control" placeholder="Nhập tên Sản phẩm" />
													<br>
													<form:errors cssClass="error" class="form-text note"
														path="name" />

												</div>
												<div class="form-group">
													<label>Loại sản phẩm:</label> <select
														modelAttribute="categoryID" name="categoryID"
														class="form-control" style="width: 100%;">
														<c:forEach items="${categories}" var="category">
															<option value="${ category.categoryID }"
																${category.categoryID == categoryID ? 'selected="selected"' : ''}>${ category.name }</option>
														</c:forEach>
													</select> <br>
												</div>
												<div class="form-group">
													<label>Giảm giá (%):</label>
													<form:input path="discount" class="form-control" value="${ discount == 0 ? '' : discount  }"
														style="width: 100%;" placeholder="Nhập giảm giá (%)" />
													<br>
													<form:errors cssClass="error" class="form-text note"
														path="discount" />

												</div>
												<div class="row">
													<div class="col-6">
														<div class="form-group mt-4">
															<label>Có phải mặt hàng mới: </label> <input
																type="checkbox" name="newProduct"
																${ product.newProduct == true ? 'checked' : '' }
																data-toggle="toggle" data-on="Yes" data-off="No"
																data-onstyle="primary" data-size="sm">
														</div>
													</div>
													<div class="col-6">
														<div class="form-group mt-4">
															<label>Có phải sản phẩm đang hot:</label> <input
																type="checkbox" name="bestSaler"
																${ product.bestSaler == true ? 'checked' : '' }
																data-toggle="toggle" data-on="Yes" data-off="No"
																data-onstyle="primary" data-size="sm">
														</div>
													</div>
												</div>

											</div>
											<div class="col-6">
												<div class="form-group">
													<label>Giá sản phẩm:</label>
													<form:input path="price" class="form-control"
														style="width: 100%;" value=""
														placeholder="Nhập giá sản phẩm" />
													<br>
													<form:errors cssClass="error" class="form-text note"
														path="price" />

												</div>
												<div class="form-group">
													<label>Giá sản phẩm cũ:</label>
													<form:input path="oldPrice" class="form-control"
														style="width: 100%;" value=""
														placeholder="Nhập giá sản phẩm" />
													<br>
													<form:errors cssClass="error" class="form-text note"
														path="oldPrice" />

												</div>
												<div class="form-group">
													<label>Số lượng tồn kho:</label>
													<form:input path="stock" class="form-control"
														style="width: 100%;" placeholder="Nhập số lượng tồn" />
													<br>
													<form:errors cssClass="error" class="form-text note"
														path="stock" />
												</div>
												
											</div>
										</div>
										<div class="row">
											<div class=col-12>
												<div class="form-group">
													<label>Chi tiết sản phẩm:</label>
													<form:textarea path="detail" class="form-control" rows="4"
														style="width: 100%;" placeholder="Nhập chi tiết sản phẩm"/>
													<form:errors cssClass="error" class="form-text note"
														path="detail" />
												</div>
												<div class="form-group">
													<label>Mô tả sản phẩm:</label>
													<form:textarea path="description" class="form-control" rows="4"
														style="width: 100%;" placeholder="Nhập mô tả sản phẩm"/>
													<form:errors cssClass="error" class="form-text note"
														path="description" />
												</div>
											</div>
										</div>
										<form:button class="btn btn-primary float-right">Save</form:button>
									</form:form>
								</div>


							</div>
							<div class="card">
								<div class="card-header bg-info" aria-expanded="true"
									data-target=".collapse" data-card-widget="collapse"
									style="cursor: pointer;">
									<div class="card-title">Gán hình ảnh cho sản phẩm</div>
									<div class="card-tools">
										<button data-card-widget="collapse" type="button"
											class="btn btn-tool">
											<i class="fas fa-minus"></i>
										</button>
									</div>
								</div>
								<div class="card-body collapse show">
									<form
										action="${pageContext.request.contextPath}/admin/image/save?${_csrf.parameterName}=${_csrf.token}"
										method="Post" enctype="multipart/form-data">
										<%
										if (request.getParameter("productID") != null) {
										%>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <input type="hidden"
											name="productID"
											value="<%=request.getParameter("productID")%>">
										<div class="col-12">
											<input type="file" name="files" multiple="multiple"
												id="imageFile" accept=".jpg, .jpeg, .png" >
											<div class="row border mt-3 mb-3 thumbnail-list"
												style="min-height: 160px;">
												
											</div>
										</div>
										<%if(request.getAttribute("images") != null) {%>
										<div class="row">
		
											<% List<Image> images = (List<Image>) request.getAttribute("images"); 
												for(Image image : images) {
											%>
											
												<div class="col-2">
													<div class="card">
														<div class="card-body">
															<img src="${pageContext.request.contextPath}<%= image.getSrc() %>"
														class="mr-3" width="150" height="150">
														</div>
														
														
														<div class="card-footer text-center">
															<a href="${pageContext.request.contextPath}\admin\image\delete?productID=${product.productID }&categoryID=${categoryID}&imageID=<%=image.getImageId() %>" class="btn btn-danger">Xóa</a>
														</div>
												
													</div>
													</div>
													<%}%>
										</div>
										<%}%>
												
												
										
										
										<input type="submit" class="btn btn-primary float-right" 
											value="Save">
									</form>
								
							<%
								} else {
								%>
								<div>Bạn cần phải lưu Sản phẩm trước</div>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
<jsp:include page="partial/footer.jsp"></jsp:include>
		<jsp:include page="partial/control-sidebar.jsp"></jsp:include>
	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/6.0.0-beta.2/dropzone-min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
							$("#imageFile").change(function() {
								$(".thumbnail-list").empty();
								showThumbnail(this);

							});

							function showThumbnail(fileImage) {
								for (var i = 0; i < fileImage.files.length; i++) {
									file = fileImage.files[i];
									reader = new FileReader();
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										$(".thumbnail-list")
												.append(
														'<img src='+ e.target.result +' class="thumbnail mr-3" width="150" height="150">');
									}
								}
								
								
							}
						});
	</script>
</body>
</html>