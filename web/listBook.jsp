<%@ page import="controller.listBookController, java.util.List" %>
<%@ page import="model.Buku" %>

<%
    String search = request.getParameter("search");
    listBookController controller = new listBookController();
    List<Buku> books = controller.getBooks(search);
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Buku</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 80px;
        }
        .container {
            max-width: 1200px;
        }
        .card {
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1, h3 {
            color: #007bff;
        }
        .btn {
            border-radius: 5px;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
        }
        .table td, .table th {
            padding: 15px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
        <jsp:include page="includes/navbar.jsp" />
    <div class="container">
        <div class="text-center mb-4">
            <h1>Daftar Buku</h1>
            <p class="lead text-secondary">Kelola daftar buku perpustakaan</p>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <form action="listBook.jsp" method="get" class="d-flex w-50">
                <input type="text" name="search" class="form-control me-2" placeholder="Cari buku berdasarkan nama, tipe, jenis, atau author..." value="<%= search != null ? search : "" %>">
                <button type="submit" class="btn btn-primary">Cari</button>
            </form>
        </div>

        <div class="card mb-4">
            <div class="table-responsive">
                <table class="table table-striped table-bordered mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nama Buku</th>
                            <th>Tipe Buku</th>
                            <th>Jenis Buku</th>
                            <th>Tanggal Terbit</th>
                            <th>Author</th>
                            <th>Jenis Rak</th>
                            <th>Status Buku</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if (books != null && !books.isEmpty()) {
                                for (Buku book : books) { 
                        %>
                        <tr>
                            <td><%= book.getbuku_id() %></td>
                            <td><%= book.getnama_buku() %></td>
                            <td><%= book.gettipe_buku() %></td>
                            <td><%= book.getjenis_buku() %></td>
                            <td><%= book.gettgl_terbit() %></td>
                            <td><%= book.getAuthor() %></td>
                            <td><%= book.getJenisRak() %></td>
                            <td class="text-center">
                                <% if (book.getstatus_booking()) { %>
                                    <span class="badge bg-danger">Tidak Tersedia</span>
                                <% } else { %>
                                    <form action="Booking" method="POST">
                                        <input type="hidden" name="return" value="false">
                                        <input type="hidden" name="book_id" value="<%= book.getbuku_id() %>">
                                        <button class="btn btn-primary btn-sm">Booking</button>
                                    </form>
                                <% } %>
                            </td>
                        </tr>
                        <% 
                                }
                            } else { 
                        %>
                        <tr>
                            <td colspan="8" class="text-center">Tidak ada buku ditemukan.</td>
                        </tr>
                        <% 
                            } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>