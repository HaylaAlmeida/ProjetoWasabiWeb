<%@page import="com.wasabi.controller.AcessoBD" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Meu Carrinho</title>
    <style>
        h3
        {
            color: yellow;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Meu carrinho <i class='fas fa-cart-arrow-down'></i></div>
<%
    String msg=request.getParameter("msg");
    if("notPossible".equals(msg))
    {
%>
<h3 class="alert">Existe apenas uma unidade! Então clique em remover!</h3>
<%}%>
<%
    if("inc".equals(msg))
    {
%>
<h3 class="alert">Quantidade aumentada com sucesso!</h3>
<%} %>
<%
    if("dec".equals(msg))
    {
%>
<h3 class="alert">Quantidade reduzida com sucesso!</h3>
<%} %>
<%
    if("removed".equals(msg))
    {
%>
<h3 class="alert">Produto removido com sucesso!</h3>
<%} %>
<table>
    <thead>
    <%
        float total = 0;
        int id = 0;
        try{
            Connection con = AcessoBD.getConnection();
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery("SELECT sum(total) FROM carrinho WHERE email='"+email+"' AND endereco IS NULL");
            while(rs1.next()){
                System.out.println(rs1.getFloat(1));
                total=rs1.getFloat(1);
            }
    %>

    <tr>
        <th scope="col" style="background-color: yellow;">Total: R$ <%out.println(total);%> </th>
        <%if(total>0){ %><th scope="col"><a href="enderecoPagamentoDoPedido.jsp">Proceed to order</a></th><%} %>
    </tr>
    </thead>
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Nome do Produto</th>
        <th scope="col">Categoria</th>
        <th scope="col">Preço</th>
        <th scope="col">Quantidade</th>
        <th scope="col">Subtotal</th>
        <th scope="col">Remover <i class='fas fa-trash-alt'></i></th>
    </tr>
    </thead>
    <tbody>
    <%
        ResultSet rs = st.executeQuery("select * from produto inner join carrinho on produto.idProduto=carrinho.idProduto and carrinho.email='"+email+"' and carrinho.endereco is NULL");
        while(rs.next()){

    %>
    <tr>
        <%id = id+1;%>
        <td><%out.println(id); %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td>R$ <%=rs.getString(4) %></td>
        <td>
            <a href="alterarQuantidade.jsp?id=<%=rs.getString(1)%>&quantidade=inc&preco=<%=rs.getString(4)%>"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(9) %>
            <a href="alterarQuantidade.jsp?id=<%=rs.getString(1)%>&quantidade=dec&preco=<%=rs.getString(4)%>"><i class='fas fa-minus-circle'></i></a>
        </td>
        <td>R$ <%=rs.getFloat(11) %></td>
        <td><a href="removerCarrinho.jsp?id=<%=rs.getString(1)%>">Remover <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    <%
            }
        }catch(Exception e){
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