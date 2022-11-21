<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminHeader.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.wasabi.controller.AcessoBD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="../css/pedidosRecebidos.css">
    <title>Pedidos Recebidos</title>
    <style>
        .th-style
        { width: 25%;}
    </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Pedidos Recebidos <i class="fas fa-archive"></i></div>
<%
    String m = request.getParameter("m");
    if("cancelado".equals(m))
    { %>
<h3 class="alert">Pedido cancelado com sucesso!!</h3>
<% }%>
<%
    if("err".equals(m)){
%>
<h3 class="alert">Algo de erro não está certo! Tente novamente!</h3>
<% } %>

<table id="customers">
    <th scope="col">Ordem do Pedido<i class='fas fa-window-close'></i></th>
    <th>Numero de Telefone</th>
    <th>Endereço</th>
    <th scope="col">Item</th>
    <th scope="col">Quantidade</th>
    <th scope="col"><i class="fa fa-inr"></i>Preço</th>
    <th scope="col"><i class="fa fa-inr"></i>Total</th>
    <th scope="col">Data</th>
    <th scope="col">Forma de Pagamento</th>

    </tr>
    <%
        int sno=0;
        try{
            Connection con = AcessoBD.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from carrinho");
            while(rs.next()){
    %>
    <tr>
        <td><% rs.getInt(1); %></td>
        <td><% rs.getString(8); %></td>
        <td><% rs.getString(7); %></td>
        <td><i class="fa fa-inr"></i> <% rs.getInt(3); %></td>
        <td><% rs.getInt(4); %></td>
        <td><% rs.getDouble(5); %></td>
        <td><% rs.getDouble(6); %></td>
        <td><% rs.getString(9); %></td>
        <td><% rs.getString(10); %></td>


    </tr>
    <% }
    }catch(Exception ex){
        System.out.println("Erro "+ex.getMessage());
    }

    %>

</table>
<br>
<br>
<br>

</body>
</html>