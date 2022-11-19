<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminHeader.jsp"%>
<%@page import="com.wasabi.projetowasabiweb.AcessoBD" %>
<%@ page import="java.sql.*" %>
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
            <th scope="col">Editar <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
           try {
               Connection conn = AcessoBD.getConnection();
               Statement st = conn.createStatement();
               ResultSet rs = st.executeQuery("SELECT * from produto");
               while(rs.next())
               {
       %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td>R$ <%=rs.getFloat(4)%></td>
            <td><a href="editarProdutos.jsp?id=<%=rs.getString(1)%>">Editar <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
          <%
                }
              }
           catch(Exception e){
               e.printStackTrace();
              }
          %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>