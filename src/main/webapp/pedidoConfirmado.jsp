<%@ page import="com.wasabi.model.ClienteDAO" %>
<%@ page import="com.wasabi.model.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ClienteDAO cd = new ClienteDAO();
    Cliente cliente = cd.getCliente(session.getAttribute("email").toString());
    session.invalidate();
%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <title>Pedido confirmado</title>
</head>
<body>
<div class="alert alert-danger" role="alert">
    Pedido para <%=cliente.getNome()%> foi feito com sucesso e chegará em 50 minutos. Aperte <a href="logout.jsp" class="alert-link">aqui </a>para ser redirecionado.
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
