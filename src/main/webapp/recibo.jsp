<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>

<html>
<head>
  <link rel="stylesheet" href="css/recibo.css">
  <title>Recibo</title>
</head>
<body>
<%
  String email=session.getAttribute("email").toString();
  try{
    int total=0;
    int sno=0;
    Connection con = AcessoBD.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select sum(total) from carrinho where email='"+email+"'");
    while(rs.next()){
      total = rs.getInt(1);
    }
    ResultSet rs2 = st.executeQuery("select * from cliente inner join carrinho where carrinho.email='"+email+"'");
    while(rs2.next()){

%>

<h3>Restaurante Wasabi</h3>
<hr>
<div class="left-div"><h3>Nome: <%=rs2.getString(1) %> </h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email); %> </h3></div>
<div class="right-div"><h3>Telefone: <%=rs2.getString(8) %> </h3></div>

<div class="left-div"><h3>Data do pedido: <%=rs2.getString(9) %> </h3></div>
<div class="right-div-right"><h3>Método de Pagamento: <%=rs.getString(10) %> </h3></div>

<div class="right-div"><h3>Endereço: <%=rs2.getString(7) %> </h3></div>

<hr>
<%break;} %>
<br>

<table id="customers">
  <h3>Detalhamento do Produto</h3>
  <tr>
    <th>S.No</th>
    <th>Nome do produto</th>
    <th>Categoria</th>
    <th>Preço</th>
    <th>Quantidade</th>
    <th>Subtotal</th>
  </tr>
  <%
    ResultSet rs1 = st.executeQuery("select * from carrinho inner join produto where carrinho.idProduto and carrinho.email='"+email+"'");
    while(rs1.next()){
      sno=sno+1;
  %>

  <tr>
    <td><%=out.println(sno)%></td>
    <td><%=rs1.getString(8)%></td>
    <td><%=rs1.getString(9)%></td>
    <td><%=rs1.getString(5)%></td>
    <td><%=rs1.getString(4)%></td>
    <td><%=rs1.getString(6)%></td>
  </tr>
  <tr>
      <%} %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueComprando.jsp"><button class="button left-button">Continue Comprando</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
  }catch(Exception e){
    System.out.println(e);
  }
%>

</body>
</html>