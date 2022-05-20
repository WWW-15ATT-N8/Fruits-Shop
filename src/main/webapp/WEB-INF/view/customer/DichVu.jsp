<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dịch vụ doanh nghiệp - Vinfruts</title>
        <meta name=”viewport” content=” width=device-width, initial-scale=1″>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/DichVu.css" type="text/css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
       <!--  <script src="../js/data.js"></script>
        <script src="../js/functionsHandle.js"></script>
        <script src="../js/regex.js"></script>
        <script src="../js/search.js"></script> -->

    </head>
    <body>
        <div class= "wrapper">

           <jsp:include page="./Navbar.jsp"></jsp:include>

            <div class="container-fluid">
                <img src="${pageContext.request.contextPath}/resources/img/banner/banner_05.png" alt="picture" style=" width:100%;">
                <div class="dich-vu-doanh-nghiep">
                    <div class="inf-01">
                        <p>Bất kể khi nào bạn muốn truyền lửa hoặc thưởng cho nhân viên, hoặc thắt chặt mối quan hệ kinh doanh cùng với khách hàng, đối tác, nhà cung cấp.</p>
                        <p><b>VinFruits</b> ở đây để cung cấp dịch vụ quà tặng doanh nghiệp theo yêu cầu.</p>
                        <p>Từ chọn lọc nguyên vật liệu, thiết kế, đóng gói theo nhu cầu, chúng tôi hoàn toàn tự tin cung cấp dịch vụ trọn gói theo yêu cầu và ngân sách riêng của quý khách.</p>
                    </div>
                    <h1>MỘT SỐ HÌNH ẢNH DỊCH VỤ<br>QUÀ TẶNG DOANH NGHIỆP</h1>
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_06.png" alt="picture" style=" width:100%;">
                    <p>Dịch vụ trọn gói về quà tặng doanh nghiệp để reward nhân viên và xây dựng hình ảnh doanh nghiệp</p>
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_07.png " alt="picture" style=" width:100%;">
                    <p>Được sản xuất từ nguyên liệu bọc da, gỗ, vải cao cấp áp dụng kĩ thuật in nhiệt, ép nổi, đóng gói từ VinFruits</p>
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_08.png " alt="picture" style=" width:100%;">
                    <p>Công nghệ đặc biệt, hiện đại: công nghệ sản xuất thủ công, tiên tiến nhất như in nhiệt với logo công ty, khắc lazer trên gỗ, công nghệ thêu thủ công.</p>
                    <h1>HÃY THIẾT KẾ SẢN PHẨM THEO Ý BẠN</h1>
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_09.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_10.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_11.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_12.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_13.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/banner_14.png" alt="picture" style=" width:100%;" class="dich-vu-doanh-nghiep-img">
                </div>                
            </div>

            <jsp:include page="./Footer.jsp"></jsp:include>
            
        </div>    
    </body>
</html>