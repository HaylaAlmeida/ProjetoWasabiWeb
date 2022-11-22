package com.wasabi.controller;

import com.wasabi.model.PedidoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelarPedidoServlet", value = "/CancelarPedidoServlet")
public class CancelarPedidoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id != null) {
            PedidoDAO pd = new PedidoDAO();
            pd.excluir(Integer.parseInt(id));
        }
        response.sendRedirect("meusPedidos.jsp");
    }

}
