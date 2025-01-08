<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Booking" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    ArrayList<Booking> bookings = (ArrayList<Booking>) request.getAttribute("bookingList");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <title>Daftar Booking</title>
        <style>
            body {
                background-color: #f8f9fa;
                padding-top: 60px;
                margin: 0;
            }
            .container {
                max-width: 1200px;
                padding: 0 20px;
            }
            .header-section {
                background: linear-gradient(135deg, #1a73e8 0%, #0d47a1 100%);
                padding: 2rem 0;
                margin-top: -60px;
                margin-bottom: 2rem;
                color: white;
            }
            .header-title {
                font-size: 2.5rem;
                font-weight: 600;
                text-align: center;
                margin: 0;
                padding-top: 60px;
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            /* Rest of the styles remain the same */
            .card {
                margin-bottom: 20px;
                border: none;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                transition: transform 0.2s, box-shadow 0.2s;
                background: white;
                border-radius: 12px;
            }
            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            }
            .card-body {
                padding: 1.5rem;
            }
            .status-badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 0.85rem;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 6px;
            }
            .status-active {
                background-color: #e8f5e9;
                color: #2e7d32;
            }
            .status-expired {
                background-color: #ffebee;
                color: #c62828;
            }
            .dates-section {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 10px;
                margin: 15px 0;
            }
            .book-title {
                color: #1a73e8;
                font-weight: 600;
                font-size: 1.2rem;
                margin-bottom: 0.75rem;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .member-name {
                font-size: 0.95rem;
                color: #5f6368;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .date-label {
                font-size: 0.8rem;
                color: #80868b;
                margin-bottom: 4px;
            }
            .date-value {
                font-size: 0.95rem;
                color: #202124;
                display: flex;
                align-items: center;
                gap: 8px;
            }
            .empty-state {
                text-align: center;
                padding: 3rem;
                color: #5f6368;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../includes/navbar.jsp" />

        <div class="header-section">
            <div class="container">
                <h1 class="header-title">Daftar Booking</h1>
            </div>
        </div>

        <div class="container">
            <% if (bookings != null && !bookings.isEmpty()) { %>
                <div class="row">
                    <% for (Booking booking : bookings) { 
                        boolean isExpired = booking.getExpired_date().isBefore(java.time.LocalDate.now());
                    %>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="book-title">
                                    <i class="fas fa-book"></i>
                                    <%= booking.getBukuDetail().getBuku().getnama_buku() %>
                                </h5>
                                
                                <p class="member-name">
                                    <i class="fas fa-user"></i>
                                    <%= booking.getMember().getNama_depan() %> <%= booking.getMember().getNama_belakang() %>
                                </p>
                                
                                <div class="dates-section">
                                    <div class="mb-3">
                                        <div class="date-label">Tanggal Booking</div>
                                        <div class="date-value">
                                            <i class="far fa-calendar-alt"></i>
                                            <%= booking.getBooking_date().format(formatter) %>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="date-label">Tanggal Expired</div>
                                        <div class="date-value">
                                            <i class="far fa-calendar-times"></i>
                                            <%= booking.getExpired_date().format(formatter) %>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="text-end">
                                    <span class="status-badge <%= isExpired ? "status-expired" : "status-active" %>">
                                        <i class="fas <%= isExpired ? "fa-exclamation-circle" : "fa-check-circle" %>"></i>
                                        <%= isExpired ? "Expired" : "Active" %>
                                    </span>
                                </div>                         
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } else { %>
                <div class="empty-state">
                    <i class="fas fa-book-open fa-3x mb-3"></i>
                    <h3>Tidak ada booking yang ditemukan</h3>
                    <p>Saat ini tidak ada buku yang sedang dipinjam.</p>
                </div>
            <% } %>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>