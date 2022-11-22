package com.wasabi.controller;

import com.wasabi.model.Carrinho;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RemoverCarrinhoServlet", value = "/RemoverCarrinhoServlet")
public class RemoverCarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try{
            String id = request.getParameter("id");
            if (id != null) {
                List<Carrinho> carrinho_lista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
                if(carrinho_lista != null){
                    for(Carrinho c: carrinho_lista){
                        if(c.getId() == Integer.parseInt(id)){
                            carrinho_lista.remove(carrinho_lista.indexOf(c));
                            break;
                        }
                    }
                    response.sendRedirect("meuCarrinho.jsp");
                }
            } else {
                response.sendRedirect("meuCarrinho.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
