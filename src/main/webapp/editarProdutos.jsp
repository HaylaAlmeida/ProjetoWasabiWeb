<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminHeader.jsp"%>
<%@page import="com.wasabi.projetowasabiweb.AcessoBD" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="../css/addProduto.css">
<title>Alterar produto - Wasabi</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="todosProdutosEditarProdutos.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
 String id=request.getParameter("id");
 try
 {
  Connection conn = AcessoBD.getConnection();
  Statement st= conn.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM produto WHERE idProduto='"+id+"'");
  while(rs.next())
  {
%>
 <form action="AlterarProdutoServlet" method="post">
<div class="left-div">
 <h3>Insira o nome do produto</h3>
<input class="input-style" type="text" name="nome" value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Insira a categoria</h3>
 <input class="input-style" type="text" name="categoria" value="<%=rs.getString(3)%>" required>
 <hr>
</div>

<div class="left-div">
<h3>Insira o preço</h3>
 <input class="input-style" type="number" name="preco" value="<%=rs.getFloat(4)%>" required>

 <hr>
</div>

<div class="right-div">
<h3>Insira a descrição</h3>
 <input class="input-style" type="text" name="descricao" value="<%=rs.getString(5)%>" required>

 <hr>
</div>
 <button class="button"> Salvar <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%
   }
 } catch(Exception e){
    e.printStackTrace();
 }
%>

</body>
<br><br><br>
</body>
</html>