<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wasabi.model.*" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    ClienteDAO cd = new ClienteDAO();
    Cliente cliente = cd.getCliente(request.getSession().getAttribute("email").toString());
    PedidoDAO pd = new PedidoDAO();
    List<Pedido> pedidos = null;
    pedidos = pd.getAllPedidosDoUsuario(cliente.getId());
    List<Carrinho> carrinhoLista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
    if(carrinhoLista != null){
        request.setAttribute("carrinhoLista", carrinhoLista);
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Meus pedidos</title>
</head>
<body>
<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Data</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Preço</th>
            <th scope="col">Total</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(pedidos != null){
                for(Pedido p:pedidos){%>
        <tr>
            <td><%=p.getData() %></td>
            <td><%=p.getNome() %></td>
            <td><%=p.getCategoria() %></td>
            <td><%=p.getQuantidade() %></td>
            <td><%=dcf.format(p.getPreco()) %></td>
            <td><%=dcf.format(p.getTotal()) %></td>
        </tr>
        <%}
        }
        %>

        </tbody>
    </table>
</div>
</body>
</html>