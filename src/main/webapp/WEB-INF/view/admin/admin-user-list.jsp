<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Insert title here</title>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
      <link rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css"
         href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
      <link rel="stylesheet" type="text/css"
         href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css">
      <link rel="stylesheet" type="text/css"
         href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">
   </head>
   <body class="font-sans antialiased hold-transition sidebar-mini">
      <div class="wrapper">
         <jsp:include page="partial/navbar.jsp"></jsp:include>
         <jsp:include page="partial/asidebar.jsp"></jsp:include>
         <div class="content-wrapper">
            <div class="content-header">
               <div class="container-fluid">
                  <div class="row mb-2">
                     <div class="col-sm-6">
                        <jsp:include page="partial/header.jsp">
                           <jsp:param name="name" value="User" />
                        </jsp:include>
                     </div>
                     <div class="col-sm-6">
                        <jsp:include page="partial/breadcrumb.jsp">
                           <jsp:param name="item_sub" value="Home" />
                           <jsp:param name="item_main" value="User" />
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
                           <div class="card-header" aria-expanded="true" data-target=".collapse" data-card-widget="collapse" style="cursor: pointer;">
                              <div class="card-title">
                                 <i class="fa-solid fa-magnifying-glass"></i>
                                 Search 
                              </div>
                              <div class="card-tools">
                                 <button data-card-widget="collapse" type="button" class="btn btn-tool">
                                 <i class="fas fa-minus"></i>
                                 </button>
                              </div>
                           </div>
                           <div class="card-body collapse show" >
                              <form modelAttribute="user">
                                 <div class="row">
                                    <div class="col-6">
                                       <div class="form-group">
                                          <label>Full Name:</label>
                                          <input name="fullName" value="<%= request.getParameter("fullName") == null ? "" : request.getParameter("fullName") %>" class="form-control" placeholder="Full Name"/>
                                       </div>
                                       <div class="form-group">
                                          <label>Role:</label> 
                                          <select modelAttribute="roleID" name="roleID" class="form-control" style="width: 100%;">
                                             <option value="-1" ${ roleID == role.roleID ? 'selected="selected"' : '' }>~~ All ~~</option>
                                             <c:forEach items="${roles}" var="role">
                                                <option
                                                	${ roleID == role.roleID ? 'selected="selected"' : '' } 
                                                	value="${ role.roleID }" >${ role.title }</option>
                                             </c:forEach>
                                          </select>
                                       </div>
                                       <div class="form-group">
                                          <label>Email:</label> 
                                          <input value="<%= request.getParameter("email") == null ? "" : request.getParameter("email") %>" name="email" class="form-control"
                                             style="width: 100%;" placeholder="Email"/>
                                       </div>
                                    </div>
                                    <div class="col-6">
                                    <div class="form-group">
                                       <label>Address:</label> 
                                       <input value="<%= request.getParameter("address") == null ? "" : request.getParameter("fullNaaddressme") %>" name="address" class="form-control"
                                          style="width: 100%;" placeholder="Address"/>
                                    </div>
                                    <div class="form-group">
                                       <label>Phone:</label> 
                                       <input value="<%= request.getParameter("phone") == null ? "" : request.getParameter("phone") %>" name="phone" class="form-control"
                                          style="width: 100%;" placeholder="Phone"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-12 text-center">
                                       <button type="submit" class="btn btn-primary btn-search"> 
                                       		<i class="fa-solid fa-magnifying-glass"></i>
                                       		Search
                                       </button>
                                    </div>
                                 </div>
                           	 </div>
                          	  </form>
                        </div>
                     </div>
                     <div class="card">
                        <div class="card-header">
                           <div class="card-title">Table</div>
                           <div class="card-tools">
                              <button class="btn btn-danger mr-2">Delete Selected</button>
                              <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/user/create" style="color:white;">Add</a>
                           </div>
                        </div>
                        <div class="card-body">
                           <div>
                              <label>
                                 Show 
                                 <select name="example_length" aria-controls="example" class="">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                 </select>
                                 entries
                              </label>
                           </div>
                           <table class="table table-bordered table-hover data-table-form">
                              <thead>
                                 <tr>
                                    <th style="width: 70px;" class="text-center"><input type="checkbox"> </th>
                                    <th class="text-capitalize">
                                       Full Name
                                    </th>
                                    <th class="text-capitalize">
                                       Email
                                    </th>
                                    <th class="text-capitalize">
                                       Phone
                                    </th>
                                    <th class="text-capitalize">
                                       Address
                                    </th>
                                    <th class="text-capitalize">
                                       Role
                                    </th>
                                    <th style="width: 80px;" class="text-capitalize text-right">Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach items="${users.pageList}" var="user">
                                    <c:url var="deleteUser" value="/admin/user/delete">
                                       <c:param name="userID" value="${user.userID}" />
                                    </c:url>
                                    <c:url var="updateUser" value="/admin/user/update">
                                       <c:param name="userID" value="${user.userID}" />
                                    </c:url>
                                    <tr>
                                       <td class="text-center check-item" >
                                          <input type="checkbox">
                                       </td>
                                       <td>${ user.fullName }</td>
                                       <td>${ user.email }</td>
                                       <td>${ user.phone }</td>
                                       <td>${ user.address }</td>
                                       <td style="margin: auto;">
										<form action="${pageContext.request.contextPath}/admin/user/updateUserRole/" method="get">
												<input type="hidden" name="userID" value="${user.userID}">
												<select class="form-control" name="roleID" style="width: 100%; margin-bottom:2%;">
													
													<c:forEach items="${roles}" var="role">
														<option ${ user.account.role.roleID == role.roleID ? 'selected="selected"' : '' } value="${ role.roleID }">${ role.title }</option>
													</c:forEach>
													
												</select>
												<input type="submit" value="Cập nhật" class="btn btn-primary" style="width: 100%; margin-top:2%;">
										</form>
										</td>
                                       <td class="text-right">
                                          <a id="deleteCaterory" href="${ deleteUser }" class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                        <div class="card-footer">
                           <div class="row">
                              <div class="col-6">
                                 Pagination
                              </div>
                              <div class="col-6">
                                 <jsp:include page="partial/pagination.jsp">
                                    <jsp:param name="pageCount" value="${ pageCount }" />
                                    <jsp:param name="pageCurrent" value="${ pageCurrent }" />
                                    <jsp:param name="url" value="${ url }" />
                                 </jsp:include>
                              </div>
                           </div>
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
</div>
      
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
      <script type="text/javascript"
         src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
      <script type="text/javascript"></script>
   </body>
</html>