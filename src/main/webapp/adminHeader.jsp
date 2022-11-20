<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page errorPage="/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
    header {
        margin-top: -1.5rem;
    }
    topnav sticky {
        text-align: center;
    }
    h2 {
        padding-top: 1rem;
        text-align: center;
    }
    nav {
        text-align: center;
    }
</style>
</head>
    <!--Header-->
<header>
    <div class="topnav sticky">
        <%String email = session.getAttribute("email").toString(); %>
        <h2>Restaurante Wasabi</h2>
        <nav>
                <a href="addProduto.jsp">Adicionar produto <i class='fas fa-plus-square'></i></a>
                <a href="todosProdutosEditarProdutos.jsp">Todos os produtos e editar produtos <i class='fab fa-elementor'></i></a>
                <a href="">Pedidos recebidos <i class="fas fa-archive"></i></a>
                <a href="">Cancelar pedidos <i class='fas fa-window-close'></i></a>
                <a href="">Pedidos entregues <i class='fas fa-dolly'></i></a>
                <a href="logout.jsp">Sair <i class='fas fa-share-square'></i></a>
        </nav>
    </div>
</header>
           <!--table-->
