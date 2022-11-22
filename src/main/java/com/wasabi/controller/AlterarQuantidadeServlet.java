package com.wasabi.controller;

import com.wasabi.model.Carrinho;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AlterarQuantidadeServlet", value = "/AlterarQuantidadeServlet")
public class AlterarQuantidadeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            List<Carrinho> carrinhoList = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
            if (action != null && id >= 1) {
                if (action.equals("inc")) {
                    for (Carrinho c: carrinhoList){
                        if(c.getId() == id){
                            int quantidade = c.getQuantidade();
                            quantidade++;
                            c.setQuantidade(quantidade);
                            response.sendRedirect("meuCarrinho.jsp");
                        }
                    }
                }
                if (action.equals("dec")) {
                    for (Carrinho c: carrinhoList){
                        if(c.getId() == id && c.getQuantidade() > 1){
                            int quantidade = c.getQuantidade();
                            quantidade--;
                            c.setQuantidade(quantidade);
                            break;
                        }
                    }
                    response.sendRedirect("meuCarrinho.jsp");
                }
            } else {
                response.sendRedirect("meuCarrinho.jsp");
            }
        }
    }

}
