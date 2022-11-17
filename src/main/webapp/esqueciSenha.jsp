<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/registro.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="EsqueciSenhaServlet" method="post">
         <input type="email" name="email" placeholder="E-mail" required>
         <input type="text" name="cpf" placeholder="CPF" required>
         <input type="number" name="telefone" placeholder="Telefone" required>
         <input type="password" name="novaSenha" placeholder="Nova senha" required>
         <input type="submit" value="Salvar">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
      <%
          String msg = request.getParameter("msg");
          if("done".equals(msg))
          {
      %>
      <h1>Senha trocada com sucesso</h1>
      <%} %>
      <%if("invalid".equals(msg))
      {
      %>
      <h1>Algo deu errado, tente novamente!</h1>
      <%} %>

    <h2>Restaurante Wasabi</h2>
    <p>Restaurante Wasabi</p>
  </div>
</div>
</body>
</html>