<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wasabi.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ClienteDAO cd = new ClienteDAO();
  Cliente cliente = cd.getCliente(request.getSession().getAttribute("email").toString());
  List<Carrinho> carrinhoLista = (ArrayList<Carrinho>) session.getAttribute("carrinhoItens");
  List<Carrinho> carrinhoProdutos = null;
  if(carrinhoLista != null){
    ProdutoDAO pd = new ProdutoDAO();
    carrinhoProdutos = pd.getProdutosCarrinho(carrinhoLista);
    float total = pd.getTotalCarrinho(carrinhoLista);
    request.setAttribute("carrinhoLista", carrinhoLista);
    request.setAttribute("total", total);
  }
%>
<html>
<head>
    <title>Informações de pagamento</title>
  <link rel="stylesheet" href="css/confirmarPedido.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="row">
  <div class="col-25">
    <div class="container">
      <h4>Carrinho</h4>
      <%
        for (Carrinho c: carrinhoProdutos) { %>
          <p> <%=c.getNome()%> <span class="price">R$ <%=c.getPreco()%></span></p>
      <%}
      %>
      <hr>
      <p>Total <span class="price" style="color:black"><b>R$ ${total}</b></span></p>
    </div>
  </div>
  <div class="col-75">
    <div class="container">
      <form action="FazerPedidoServlet" method="post">

        <div class="row">
          <div class="col-50">
            <h3>Informações do cliente</h3>
            <label for="nome"><i class="fa fa-user"></i> Nome</label>
            <input type="text" id="nome" name="nome" value="<%=cliente.getNome()%>" readonly>
            <label for="email"><i class="fa fa-envelope"></i> E-mail</label>
            <input type="text" id="email" name="email" value="<%=cliente.getEmail()%>" readonly>
            <label for="cpf">CPF</label>
            <input type="text" id="cpf" name="cpf" value="<%=cliente.getCpf()%>" readonly>
            <label for="adr"><i class="fa fa-address-card-o"></i> Endereço de entrega e cobrança</label>
            <input type="text" id="adr" name="address" maxlength="400" required>
          </div>

          <div class="col-50">
            <h3>Pagamento</h3>
            <label for="cname">Nome no cartão</label>
            <input type="text" id="cname" name="cardname" maxlength="45" required>
            <label for="ccnum">Número do cartão</label>
            <input type="number" id="ccnum" name="cardnumber" maxlength="20" placeholder="1111-2222-3333-4444" required>
            <label for="ccpf">CPF</label>
            <input type="text" id="ccpf" name="ccpf" maxlength="25" required>
            <label for="expmonth">Mês de expiração</label>
            <input type="number" id="expmonth" name="expmonth" maxlength="2" placeholder="11" required>
            <div class="row">
              <div class="col-50">
                <label for="expyear">Ano de expiração</label>
                <input type="number" id="expyear" name="expyear" maxlength="2" placeholder="26" required>
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="number" id="cvv" name="cvv" maxlength="3" placeholder="352" required>
              </div>
            </div>
          </div>

        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Endereço de entrega mesmo endereço de cobrança
        </label>
        <input type="submit" value="Finalizar o pedido" class="btn">
      </form>
    </div>
  </div>

</div>
</body>
</html>
