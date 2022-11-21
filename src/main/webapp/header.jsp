<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String email=session.getAttribute("email").toString(); %>
    
            <center><h2>Restaurante Wasabi</h2></center>
            <h2><a href=""><%out.println(email); %><i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="meuCarrinho.jsp">Meu carrinho<i class='fas fa-cart-arrow-down'></i></a>
            <a href="">Meus pedidos<i class='fab fa-elementor'></i></a>
            <a href="">Editar Informações<i class="fa fa-edit"></i></a>
            <a href="">Sobre <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Sair <i class='fas fa-share-square'></i></a>
            <div class="search-container">
             <form action="buscaHome.jsp" method="post">
                 <input type="text" placeholder="Pesquisar" name="pesquisar">
                 <button type="submit"><i class="fa fa-search"></i> </button>
             </form>
            </div>
          </div>
           <br>
           <!--table-->
