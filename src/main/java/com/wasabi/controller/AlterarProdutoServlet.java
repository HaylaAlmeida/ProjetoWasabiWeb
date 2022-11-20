package com.wasabi.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "AlterarProdutoServlet", value = "/AlterarProdutoServlet")
public class AlterarProdutoServlet extends HttpServlet {
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
        String idProduto = request.getParameter("id");
        String nome = request.getParameter("nome");
        String categoria = request.getParameter("categoria");
        Float preco = Float.valueOf(request.getParameter("preco"));
        String descricao = request.getParameter("descricao");
        try {
            Connection conn = bd.getConnection();
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE produto SET nome='"+nome+"', categoria='"+categoria+"', preco='"+preco+"'," +
                    "descricao='"+descricao+"' WHERE idProduto='"+idProduto+"'");
            conn.commit();
            response.sendRedirect("todosProdutosEditarProdutos.jsp?msg=done");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("todosProdutosEditarProdutos.jsp?msg=wrong");
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
