package com.wasabi.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "EsqueciSenhaServlet", value = "/EsqueciSenhaServlet")
public class EsqueciSenhaServlet extends HttpServlet {
    static AcessoBD bd;
    @Override
    public void init() throws ServletException {
        try {
            bd.conectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String novaSenha = request.getParameter("novaSenha");

        int check = 0;
        try {
            Connection conn = bd.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * from cliente WHERE email='"+email+"' AND cpf = '" + cpf + "'" +
                    "AND telefone = '"+telefone+"'");
            while(rs.next()){
                check=1;
                st.executeUpdate("UPDATE cliente SET senha='"+novaSenha+"' WHERE email = '"+email+"'");
                conn.commit();
                response.sendRedirect("esqueciSenha.jsp?msg=done");
            }
            if (check == 0){
                response.sendRedirect("esqueciSenha.jsp?msg=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            bd.desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
