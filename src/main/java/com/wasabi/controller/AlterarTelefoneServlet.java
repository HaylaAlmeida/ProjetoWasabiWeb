package com.wasabi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "AlterarTelefoneServlet", value = "/AlterarTelefoneServlet")
public class AlterarTelefoneServlet extends HttpServlet {

    static AcessoBD bd;
    @Override
    public void init() throws ServletException {
        super.init();
        bd = new AcessoBD();
        try {
            bd.conectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");

        try {
            Connection conn = bd.getConnection();
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE cliente SET telefone='"+telefone+"' where email='"+email+"' and senha='"+senha+"'");
            conn.commit();
            response.sendRedirect("alterarNumeroTelefone.jsp?msg=valid");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("alterarNumeroTelefone.jsp?msg=invalid");
        }

    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            bd.desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

