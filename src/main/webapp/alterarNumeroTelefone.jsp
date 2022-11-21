<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp"%>
<html>
<head>
 <link rel="stylesheet" href="css/alterarInformacoes.css">
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <title>Alterar Número de Telefone</title>
</head>
<body>
<%
 String msg= request.getParameter("msg");
 if("valid".equals("msg")){
%>
<h3 class="alert">Número de telefone alterado com sucesso!</h3>
<%} %>
<%if("invalid".equals("msg")){ %>
<h3 class="alert">Senha incorreta!</h3>
<%} %>
<form action="/AlterarTelefoneServlet" method="post">
 <h3>Altere o número do seu telefone</h3>
 <input class="input-style" type="number" name="telefone" placeholder="Novo número" required>
 <hr>
 <h3>Senha</h3>
 <input class="input-style" type="password" name="senha" placeholder="Senha" required>

 <hr>
 <button class="button" type="submit">Salvar <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>