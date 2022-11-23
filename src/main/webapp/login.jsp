<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="firstHeader.html"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/registro.css">
<title>Login</title>
</head>
<body>
<div class="user-form">
    <div id='container'>
      <div class='registro'>
         <form action="LoginServlet" method="post">
         <input type="email" name="email" placeholder="E-mail" maxlength="100" required>
         <input type="password" name="senha" placeholder="Senha" maxlength="50" required>
         <input type="submit" value="Entrar">
         </form>
          <br/>
          <h2><a href="registro.jsp">Registrar</a></h2><br/>
           <h2><a href="esqueciSenha.jsp">Esqueceu a senha?</a></h2>
      </div>
      <div class='whysignLogin'>
          <%
          String msg = request.getParameter("msg");
          if("user_not_found".equals(msg))
          {
          %>
          <h1 style="font-size: 24px; color: red;">E-mail ou senha incorreto(a)!</h1>
            </br>
          <%} %>
          <%if("invalid".equals(msg))
          {
          %>
          <h1 style="font-size: 24px; color: red;">Algo deu errado, tente novamente!</h1>
          </br>
          <%} %>
        <h2>Restaurante Wasabi</h2>
        <p>Faça login para acessar nosso site.</p>
      </div>
    </div>
</div>
</body>
</html>