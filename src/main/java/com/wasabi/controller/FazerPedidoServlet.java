package com.wasabi.controller;

import com.wasabi.model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "FazerPedidoServlet", value = "/FazerPedidoServlet")
public class FazerPedidoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SimpleDateFormat formatted = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        ClienteDAO cd = new ClienteDAO();
        String email = (String) session.getAttribute("email");
        Cliente cliente = cd.getCliente(email);
        ProdutoDAO ptd = new ProdutoDAO();
        PagamentoDAO pgtdao = new PagamentoDAO();
        String numeroCartao = request.getParameter("cardnumber");
        String endereco = request.getParameter("address");
        List<Carrinho> carrinho_lista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
        float total = ptd.getTotalCarrinho(carrinho_lista);
        boolean existe = pgtdao.existe(request.getParameter("cardnumber"));
        if (!existe) {
            Pagamento pagamento = new Pagamento();
            pagamento.setNome(request.getParameter("cardname"));
            pagamento.setNumeroDoCartao(request.getParameter("cardnumber"));
            pagamento.setCpf(request.getParameter("ccpf"));
            pagamento.setMesExp(Integer.parseInt(request.getParameter("expmonth")));
            pagamento.setAnoExp(Integer.parseInt(request.getParameter("expyear")));
            pagamento.setCvv(Integer.parseInt(request.getParameter("cvv")));
            pgtdao.create(pagamento);
        }
        Pagamento pagamento = pgtdao.read(numeroCartao);

        if (carrinho_lista != null) {
            for (Carrinho c: carrinho_lista) {
                Pedido pedido = new Pedido();
                pedido.setIdProduto(c.getId());
                pedido.setIdCliente(cliente.getId());
                pedido.setQuantidade(c.getQuantidade());
                pedido.setTotal(total);
                pedido.setEndereco(endereco);
                pedido.setIdPagamento(pagamento.getId());
                pedido.setData(formatted.format(date));
                PedidoDAO pd = new PedidoDAO();
                boolean result = pd.create(pedido);
                if (!result) {
                    break;
                }
            }
            carrinho_lista.clear();
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
