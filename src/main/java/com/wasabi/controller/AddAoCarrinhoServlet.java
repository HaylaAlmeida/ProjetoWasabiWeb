package com.wasabi.controller;

import com.wasabi.model.Carrinho;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddAoCarrinhoServlet", value = "/AddAoCarrinhoServlet")
public class AddAoCarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()){
            List<Carrinho> carrinhoItens = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            Carrinho carrinho = new Carrinho();
            carrinho.setId(id);
            carrinho.setQuantidade(1);
            HttpSession session = request.getSession();
            List<Carrinho> carrinho_lista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
            if(carrinho_lista == null) {
                carrinhoItens.add(carrinho);
                session.setAttribute("carrinhoItens", carrinhoItens);
                response.sendRedirect("home.jsp");
            } else {
                carrinhoItens = carrinho_lista;
                boolean existe = false;

                for(Carrinho c: carrinho_lista){
                    if(c.getId() == id){
                        existe = true;
                        response.sendRedirect("meuCarrinho.jsp");
                    }
                }
                if (!existe) {
                    carrinhoItens.add(carrinho);
                    response.sendRedirect("home.jsp");
                }
            }
        }
    }

}
