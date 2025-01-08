/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import db.JDBC;
import java.io.*;
import java.sql.PreparedStatement;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author farre
 */
@WebServlet("/deleteRak")
public class deleteRakController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("rakId");

        if (id != null && id.matches("\\d+")) { 
            JDBC db = new JDBC();
            if (db.isConnected) {
                try {
                    // First delete or update referencing books
                    String updateBooksSQL = "UPDATE buku SET rakbuku_id_fk = NULL WHERE rakbuku_id_fk = ?";
                    PreparedStatement updateStmt = db.getConnection().prepareStatement(updateBooksSQL);
                    updateStmt.setInt(1, Integer.parseInt(id));
                    updateStmt.executeUpdate();
                    updateStmt.close();

                    // Then delete the rack
                    String deleteRakSQL = "DELETE FROM rakbuku WHERE rakbuku_id = ?";
                    PreparedStatement deleteStmt = db.getConnection().prepareStatement(deleteRakSQL);
                    deleteStmt.setInt(1, Integer.parseInt(id));
                    int rowsDeleted = deleteStmt.executeUpdate();
                    deleteStmt.close();

                    if (rowsDeleted > 0) {
                        System.out.println("Rak berhasil dihapus: ID " + id);
                    } else {
                        System.out.println("Tidak ada rak yang dihapus: ID " + id);
                    }

                    response.sendRedirect("dashboard");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                } finally {
                    db.disconnect();
                }
            } else {
                response.sendRedirect("dashboard?error=db_connection");
            }
        } else {
            System.out.println("Invalid ID: " + id);
            response.sendRedirect("dashboard?error=invalid_id");
        }
    }
}


