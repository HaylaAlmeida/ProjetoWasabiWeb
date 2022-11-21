package com.wasabi.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "RemoverCarrinhoServlet", value = "/RemoverCarrinhoServlet")
public class RemoverCarrinhoServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String idProduto=request.getParameter("id");
        try{
            Connection conn = bd.getConnection();
            Statement st = conn.createStatement();
            st.executeUpdate("DELETE FROM carrinho WHERE email='"+email+"' AND idProduto='"+idProduto+"' AND endereco IS NULL");
            conn.commit();
            response.sendRedirect("meuCarrinho.jsp?msg=removed");
        }catch(Exception e){
            System.out.println(e);
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
