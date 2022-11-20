<%@ page import="java.sql.Connection" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
    String msg = request.getParameter("msg");
    if("added".equals(msg))
    {
%>
<h3 class="alert">Produto adicionado com sucesso</h3>
<%
    }
%>
<%
    if("exist".equals(msg))
    {
%>
<h3 class="alert">Produto já existe em seu carrinho, quantidade aumentada.</h3>
<%
    }
%>
<%
    if("invalid".equals(msg))
    {
%>
<h3 class="alert">Algo deu errado, tente novamente.</h3>
<%
    }
%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col">R$</i> Preço</th>
            <th scope="col">Descrição</th>
            <th scope="col">Adicionar ao carrinho <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
    try {
        Connection conn = AcessoBD.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM produto");
        while(rs.next()){
%>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getFloat(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><a href="addAoCarrinho.jsp?id=<%=rs.getString(1)%>">Adicionar ao carrinho <i class='fas fa-cart-plus'></i></a></td>
          </tr>

        </tbody>
      </table>
    <%}
    }
    catch (Exception e) {
    e.printStackTrace();
    }%>
      <br>
      <br>
      <br>

</body>
</html>