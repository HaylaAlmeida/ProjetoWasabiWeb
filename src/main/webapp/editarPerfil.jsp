<%@ page import="com.wasabi.model.ClienteDAO" %>
<%@ page import="com.wasabi.model.Cliente" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp"%>
<%
    ClienteDAO cd = new ClienteDAO();
    Cliente cliente = cd.getCliente(request.getSession().getAttribute("email").toString());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/alterarInformacoes.css">
<title>Editar Perfil</title>
</head>
<body>
<div class="container">
    <form action="EditarPerfilServlet" method="post">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" name="nome" id="nome" value="<%=cliente.getNome()%>" required>
        </div>
        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="email" class="form-control" name="email" id="email" value="<%=cliente.getEmail()%>" required>
        </div>
        <div class="form-group">
            <label for="cpf">CPF</label>
            <input type="text" class="form-control" name="cpf" id="cpf" minlength="11" value="<%=cliente.getCpf()%>" required>
        </div>
        <div class="form-group">
            <label for="telefone">Telefone</label>
            <input type="number" class="form-control" name="telefone" id="telefone" minlength="8" value="<%=cliente.getTelefone()%>" required>
        </div>
        <div class="form-group">
            <label for="senha">Senha</label>
            <input type="password" class="form-control" name="senha" id="senha" value="<%=cliente.getSenha()%>" required>
        </div>
        <button type="submit" class="btn btn-primary">Alterar informações</button>
    </form>
</div>
</body>
</html>