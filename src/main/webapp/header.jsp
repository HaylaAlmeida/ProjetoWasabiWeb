<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
 <% String email = session.getAttribute("email").toString(); %>
<header>
<div class="hero">
    <nav>
        <img src="img/1.png" class="logo">
        <ul style="margin-bottom: 0px;" >
            <li><a href="home.jsp">Home  <i class='fas fa-plus-square'></i></a></li>
            <li><a href="meuCarrinho.jsp">Meu Carrinho  <i class='fab fa-elementor'></i></a></li>
            <li><a href="meusPedidos.jsp">Meus pedidos  <i class="fas fa-archive"></i></a></li>
        </ul>
        <div class="busca">
            <form action="buscaHome.jsp" method="post" accept-charset="utf-8">
                <input type="text" placeholder="Pesquisar" name="pesquisa">
                <button type="submit"><i class="fa fa-search"></i> </button>
            </form>
        </div>
        <img src="/img/userbranco.png" class="user-pic" onclick="toggleMenu()">

        <div class="sub-menu-wrap" id="subMenu">
            <div class="sub-menu">
                <div class="user-info">
                    <h3 style="color: black"> <%=email%> </h3>
                </div>
                <hr>
                <a href="#" class="sub-menu-link">
                    <img src="/img/user.png" alt="">
                    <p>Editar perfil</p>
                    <span>></span>
                </a>
                <a href="logout.jsp" class="sub-menu-link">
                    <img src="/img/logout.png" alt="">
                    <p>Sair</p>
                    <span>></span>
                </a>
            </div>
        </div>
    </nav>
    <script>
        let subMenu = document.getElementById("subMenu");
        function toggleMenu() {
            subMenu.classList.toggle("open-menu");
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</div>
</header>
</html>
           <br>
           <!--table-->
