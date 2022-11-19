<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
     <link rel="stylesheet" href="css/addProduto.css">
     <title>Adicionar produto - Wasabi</title>
</head>
<body>
      <%
      String msg = request.getParameter("msg");
      if ("done".equals(msg))
      {
      %>
      <h3 class="alert">Produto adicionado com sucesso.</h3>
      <%}%>
      <%
       if ("wrong".equals(msg))
       {
      %>
      <h3 class="alert">Algo deu errado, tente novamente.</h3>
      <%}%>
      <form action="../addProdutoServlet" method="post">
      <div class="left-div">
       <h3>Insira o nome do produto</h3>
       <input class="input-style" type="text" name="nome" placeholder="Nome do produto" required>
       <hr>
      </div>

      <div class="right-div">
       <h3>Insira categoria</h3>
       <input class="input-style" type="text" name="categoria" placeholder="Categoria do produto" required>
       <hr>
      </div>

      <div class="left-div">
       <h3>Insira o preço</h3>
       <input class="input-style" type="number" name="preco" min="0"  oninput="validity.valid||(value='');" step="any" placeholder="Preço do produto" required>
       <hr>
      </div>

      <div class="right-div">
       <h3>Insira a descrição</h3>
       <input class="input-style" type="text" name="descricao" placeholder="Descrição do produto" required>
       <hr>
      </div>
      <button class="button"> Salvar <i class='far fa-arrow-alt-circle-right'></i></button>

  </form>
</body>
</html>