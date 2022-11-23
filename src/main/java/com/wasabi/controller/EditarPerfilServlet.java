package com.wasabi.controller;

import com.wasabi.model.Cliente;
import com.wasabi.model.ClienteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditarPerfilServlet", value = "/EditarPerfilServlet")
public class EditarPerfilServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ClienteDAO cd = new ClienteDAO();
        Cliente cliente = cd.getCliente(session.getAttribute("email").toString());
        cliente.setEmail(request.getParameter("email"));
        cliente.setNome(request.getParameter("nome"));
        cliente.setCpf(request.getParameter("cpf"));
        cliente.setTelefone(request.getParameter("telefone"));
        cliente.setSenha(request.getParameter("senha"));
        boolean sucesso = cd.update(cliente);
        if (sucesso == true) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
