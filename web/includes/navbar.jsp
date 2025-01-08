<%-- 
    Document   : navbar
    Created on : Jan 5, 2025, 7:40:43 PM
    Author     : maxeef
--%>
<%
    Integer sessUser = (Integer) session.getAttribute("userId");
    String role = (String) session.getAttribute("role");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg fixed-top" style="background-color: #212529;">
 <div class="container-fluid">
   <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/home">Perpustakaan</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/home">Beranda</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/listBooks">Daftar Buku</a>
        </li>
        <% if (role != null && role.equals("admin")) { %>
            <li class="nav-item">
                <a class="nav-link text-warning" href="${pageContext.request.contextPath}/dashboard">Dashboard Admin</a>
            </li>
        <% } else { %>
            <li class="nav-item">
                <a class="nav-link text-white" href="${pageContext.request.contextPath}/profileController">Profile</a>
            </li>
        <% } %>
      </ul>
      <div class="btn-group">
        <a href="${pageContext.request.contextPath}/logoutController" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</nav>