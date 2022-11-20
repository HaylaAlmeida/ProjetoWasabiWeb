<%@ page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
            int z = 0;
            try {
                String pesquisar = request.getParameter("pesquisar");
                Connection conn = AcessoBD.getConnection();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM produto WHERE nome like'%"+pesquisar+"%' OR " +
                        "categoria like '%"+pesquisar+"%'");
                while(rs.next())
                {
                    z=1;

        %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getFloat(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><a href="addAoCarrinho.jsp?id=<%=rs.getString(1)%>">Adicionar ao carrinho <i class='fas fa-cart-plus'></i></a></td>
        </tr>
        <%}
        }
        catch (Exception e) {
            e.printStackTrace();
        }%>
        </tbody>
      </table>
      	<%
        if (z == 0)
        {%>
	<h1 style="color:white; text-align: center;">Nada para mostrar</h1>
	<%
        }
	%>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>