<<<<<<< HEAD
  <%@page import="nhom08.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.request.contextPath}/" class="brand-link">
      <span class="brand-text font-weight-light">Fruits Shop</span>
    </a>

    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
       <%User u = (User)session.getAttribute("USER");%>
       <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <p>
				<%= u.getFullName()%>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/user/doi-mat-khau" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đổi mật khẩu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đăng xuất</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
       
       
      </div>
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item menu-open">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Catalog
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/category/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/product/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Product</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa-solid fa-chart-bar"></i>
              <p>
               	Sale
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/order/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Order</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/status/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Status</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fa-solid fa-users"></i>
              <p>
               	User
              </p>
              <i class="fas fa-angle-left right"></i>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/user/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/role/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Role</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
=======

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${pageContext.request.contextPath}/" class="brand-link"> <span
		class="brand-text font-weight-light">Shop VINFruit</span>
	</a>

	<div class="sidebar">
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="info">
				<!--          <a href="#" class="text-uppercase">Nguyễn Nhật Quang</a> -->

				<a class=text-uppercase data-toggle="collapse" href="#collapse"
					role="button" aria-expanded="false" aria-controls="collapseExample">
					Nguyễn Nhật Quang </a>
				<div class="collapse" id="collapse">

					<ul class="nav nav-pills nav-sidebar flex-column menu-open">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}\logout"> <i
								class="fa-solid fa-right-from-bracket"></i> Đăng xuất
						</a></li>
						<li class="nav-item"><a class="nav-link"> <i
								class="fa-solid fa-unlock"></i> Đổi mật khẩu
						</a></li>
					</ul>

				</div>

			</div>
		</div>
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item menu-open"><a
					href="${pageContext.request.contextPath}/admin/dashboard"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-th"></i>
						<p>
							Catalog <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/category/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Category</p>
						</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/product/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Product</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fa-solid fa-chart-bar"></i>
						<p>
							Sale <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/order/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Order</p>
						</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/status/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Status</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fa-solid fa-users"></i>
						<p>User</p> <i class="fas fa-angle-left right"></i>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/user/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>User</p>
						</a></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath}/admin/role/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Role</p>
						</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>
</aside>
>>>>>>> 563ff034ddead2d64a1316926f3617e2a24c0001
