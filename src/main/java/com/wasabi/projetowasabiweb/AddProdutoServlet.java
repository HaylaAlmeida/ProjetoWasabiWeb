package com.wasabi.projetowasabiweb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "addProdutoServlet", value = "/addProdutoServlet")
public class AddProdutoServlet extends HttpServlet {
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
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        Float preco = Float.valueOf(request.getParameter("preco"));
        String descricao = request.getParameter("descricao");
        System.out.println("Funcionando");
        try {
            Connection conn = bd.getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO produto (nome, categoria, preco, descricao) VALUES (?, ?, ?, ?)");
            ps.setString(1, nome);
            ps.setString(2, categoria);
            ps.setFloat(3, preco);
            ps.setString(4, descricao);
            ps.executeUpdate();
            conn.commit();
            response.sendRedirect("addProduto.jsp?msg=done");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addProduto.jsp?msg=wrong");
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

