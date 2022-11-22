<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.wasabi.controller.AcessoBD" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.wasabi.model.Produto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Home</title>
  <style>
    h3
    {
      color: yellow;
      text-align: center;
    }
  </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Todos produtos e editar produtos <i class='fab fa-elementor'></i></div>
<%
  String msg = request.getParameter("msg");
  if("done".equals(msg))
  {
%>
<h3 class="alert">Produto atualizado com sucesso.</h3>
<%}%>
<%
  if("wrong".equals(msg))
  {%>
<h3 class="alert">Algo deu errado, tente novamente.</h3>
<%}%>
<table>
  <thead>
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Nome</th>
    <th scope="col">Categoria</th>
    <th scope="col"> R$ Preço</th>
    <th scope="col">Descrição</th>
    <th scope="col">Editar <i class='fas fa-pen-fancy'></i></th>
  </tr>
  </thead>
  <tbody>
  <%
    int i = 1;
    List<Produto> produtos = (List) request.getAttribute("produtos");
  %>
  <%
    for (Produto produto : produtos){
  %>
  <tr>
    <td><%=i++%></td>
    <td><%=produto.getNome()%></td>
    <td><%=produto.getCategoria()%></td>
    <td>R$ <%=produto.getPreco()%></td>
    <td><%=produto.getDescricao()%></td>
    <td><a href="editarProdutos.jsp?id=<%=i%>">Editar <i class='fas fa-pen-fancy'></i></a></td>
  </tr>
  <% } %>
  </tbody>
</table>
<br>
<br>
<br>

</body>
</html>