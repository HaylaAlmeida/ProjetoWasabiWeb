<%@page import="com.wasabi.controller.AcessoBD" %>
<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.model.Carrinho" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wasabi.model.ProdutoDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    List<Carrinho> carrinhoLista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
    List<Carrinho> carrinhoProdutos = null;
    if(carrinhoLista != null){
        ProdutoDAO pd = new ProdutoDAO();
        carrinhoProdutos = pd.getProdutosCarrinho(carrinhoLista);
        float total = pd.getTotalCarrinho(carrinhoLista);
        request.setAttribute("carrinhoLista", carrinhoLista);
        request.setAttribute("total", total);
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Meu Carrinho</title>
</head>
<style>
    .table tbody td {
        vertical-align: middle;
    }
    .btn-incre, .btn-decre {
        box-shadow: none;
        font-size: 25px;
    }
</style>
<body>
<div class="container">
    <div class="d-flex py-3">
        <h3>Preço total: R$ ${(total>0) ? dcf.format(total) : 0}</h3>
        <a class="mx-3 btn btn-primary" href="confirmarPedido.jsp">Finalizar</a>
    </div>
    <table class="table table-loght">
        <thead>
        <tr>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col">Preço</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Cancelar</th>
        </tr>
        </thead>
        <tbody>
        <%
            if(carrinhoLista != null) {
                for (Carrinho c: carrinhoProdutos) { %>
                    <tr>
                        <td><%= c.getNome()%></td>
                        <td><%= c.getCategoria()%></td>
                        <td><%= dcf.format(c.getPreco())%></td>
                        <td>
                            <form action="" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between w-50">
                                    <a class="btn btn-sm btn-incre" href="AlterarQuantidadeServlet?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i> </a>
                                    <input type="text" name="quantidade" class="form-control w-50" value="<%= c.getQuantidade() %>" readonly>
                                    <a class="btn btn-sm btn-decre" href="AlterarQuantidadeServlet?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i> </a>
                                </div>
                            </form>
                        </td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="RemoverCarrinhoServlet?id=<%=c.getId()%>">Remover</a>
                        </td>
                    </tr>
               <% }
            }
        %>
        </tbody>
    </table>

</div>
</body>
</html>