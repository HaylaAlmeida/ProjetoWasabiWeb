package com.wasabi.controller;

import com.wasabi.model.Produto;
import com.wasabi.model.ProdutoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListaProdutosServlet", value = "/ListaProdutosServlet")
public class ListaProdutosServlet extends HttpServlet {
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
        String action = request.getParameter("action");
        response.setContentType("text/html");
        try {
            Connection conn = bd.getConnection();
            if (action.equals("produtos")) {
                List<Produto> produtos = ProdutoDAO.getProdutos(conn);
                String msg = "Sem dados";
                if (produtos.size() > 0){
                    msg = produtos.size() + (produtos.size() > 1 ? "registros" : "registro");
                }
                request.setAttribute("MSG", msg);
                request.setAttribute("produtos", produtos);
                request.getRequestDispatcher("todosProdutos.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            //response.sendRedirect("addProduto.jsp?msg=wrong");
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
