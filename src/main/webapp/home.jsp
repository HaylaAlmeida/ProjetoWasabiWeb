<%@ page import="com.wasabi.model.ProdutoDAO" %>
<%@ page import="com.wasabi.model.Produto" %>
<%@ page import="java.util.List" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    ProdutoDAO pd = new ProdutoDAO();
    List<Produto> produtos = pd.getAllProdutos();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bem-vindo ao restaurante Wasabi!</title>
    <style>
        .card-img-top {
            width: 100%;
            height: 15vw;
            object-fit: cover;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card-header my-3">Todos os produtos</div>
    <div class="row">
    <%
        if(!produtos.isEmpty()) {
            for(Produto p : produtos) {%>
                <div class="col-md-5 my-3 mx-auto">
                    <div class="card w-100 h-100" style="width: 18rem;">
                        <img class="card-img-top" src="produtos/<%=p.getUrl()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getNome()%></h5>
                            <h6 class="price">Preço: R$ <%= p.getPreco()%></h6>
                            <h6 class="category">Categoria: <%= p.getCategoria()%></h6>
                            <p class="description"><%=p.getDescricao()%></p>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="/AddAoCarrinhoServlet?id=<%=p.getId()%>" class="btn btn-dark">Adicionar ao carrinho</a>
                            </div>
                        </div>
                    </div>
                </div>
            <%}
        }
    %>
    </div>
</div>
</body>
</html>