package com.wasabi.controller;

import com.wasabi.model.Produto;

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
    String page="homeTeste.jsp";
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
        Connection conn = null;
        HttpSession session = request.getSession();
        response.setContentType("text/html");
        List<Produto> produtos = new ArrayList<>();
        try {
            conn = bd.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM produto");
            while(rs.next()) {
                Produto produto = new Produto(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getFloat(4), rs.getString(5));
                produtos.add(produto);
            }
            request.setAttribute("produtos", produtos);
            RequestDispatcher dispatcher = request.getRequestDispatcher(page);

            if (dispatcher != null){
                dispatcher.forward(request, response);
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
