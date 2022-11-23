<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="firstHeader.html"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/registro.css">
    <title>Registro - Restaurante Wasabi</title>
</head>
<body>
<div class="user-form">
    <div id='container'>
        <div class='registro'>
            <form action="RegistroServlet" method="post">
                <input id="nome" type="text" name="nome" placeholder="Nome completo" minlength="5" maxlength="80" required> <br/>
                <input id="email" type="email" name="email" placeholder="E-mail" maxlength="100" required> <br/>
                <input id="cpf" type="text" name="cpf" placeholder="CPF" minlength="11" maxlength="25" required> <br/>
                <input id="telefone" type="number" name="telefone" placeholder="Telefone" minlength="8" maxlength="25" required> <br/>
                <input id="senha" type="password" name="senha" placeholder="Senha" minlength="3" maxlength="50" required> <br/>
                <label class="user-login"> Já possui conta? <a href="login.jsp">Entre aqui</a></label> <br>
                <input id="submit" type="submit" value="Registrar">
            </form>
        </div>
        <div class='whysign'>
        <%
            String msg = request.getParameter("msg");
            if("valid".equals(msg))
            {%>
            <h1>Cliente cadastrado com sucesso.</h1>
            <%} %>
            <%
            if("invalid".equals(msg))
            {%>
                <h1>Algo deu errado. Tente novamente.</h1>
            <%} %>
            <h2>Restaurante Wasabi</h2>
            <p>Registre-se para visualizar os nossos pratos</p>
            
        </div>
    </div>
</div>
</body>
</html>
