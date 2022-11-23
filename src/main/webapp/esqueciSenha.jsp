<%@include file="firstHeader.html"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/recuperarSenha.css">
<title>Esqueci a senha</title>
</head>
<body>
<div user-form>
    <div class="container">
          <div class='registro'>
             <form action="EsqueciSenhaServlet" method="post">
                 <input type="email" name="email" placeholder="E-mail" required>
                 <input type="text" name="cpf" placeholder="CPF" required>
                 <input type="number" name="telefone" placeholder="Telefone" required>
                 <input type="password" name="novaSenha" placeholder="Nova senha" required>
                 <input type="submit" value="Salvar">
             </form>
              <br/>
              <h2><a href="login.jsp">Login</a></h2>
          </div>
          <div class='whysignLogin'>
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
            <p>Recupere sua senha fornecendo o CPF e o Telefone cadastrado.</p>
          </div>
    </div>
</div>
</body>
</html>