<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/enderecoPagamentoDoPedido.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Home</title>
    <script>
        if(window.history.forward(1) !=null)
            window.history.forward(1);
    </script>
</head>
<body>
<br>
<table>
    <thead>
    <%
        int total = 0, sno=0;
        try{
            Connection con = AcessoBD.getConnection();
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery("select sum(total) from carrinho where email='"+email+"' and address is NULL");
            while(rs1.next()){
                total=rs1.getInt(1);
            }

    %>

    <tr>
        <th scope="col"><a href="meuCarrinho.jsp"><i class='fas fa-arrow-circle-left'> Voltar</i></a></th>
        <th scope="col" style="background-color: yellow;">Total: R$ <%out.println(total); %> </th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th scope="col">S.No</th>
        <th scope="col">Nome do Produto</th>
        <th scope="col">Categoria</th>
        <th scope="col">R$ Preço</th>
        <th scope="col">Quantidade</th>
        <th scope="col">Sub Total</th>
    </tr>
    </thead>
    <tbody>
    <%
        ResultSet rs = st.executeQuery("select * from produto inner join carrinho on produto.id=carrinho.idProduto and carrinho.email='"+email+"' and carrinho.endereco is NULL");
        while(rs.next()){

    %>
    <tr>
        <%sno = sno+1;%>
        <td><%out.println(sno); %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td>R$ <%=rs.getString(4) %></td>
        <td> <%=rs.getString(8) %></td>
        <td>R$ <%=rs.getString(10) %></td>
    </tr>
    <%
        }
        ResultSet rs2 = st.executeQuery("select * from cliente where email='"+email+"'");
        while(rs2.next()){
    %>

    </tbody>
</table>

<hr style="width: 100%">
<form action="acaoEnderecoPagamentoDoPedido.jsp"method="post">

    <div class="left-div">
        <h3>Endereço</h3>
        <input class="input-style" type ="text" name="endereco" value="<%=rs2.getString(7) %>" placeholder="Insira o endereço" required>

    </div>

    <h3 style="color: red">*Insira um endereço</h3>
    <h3 style="color: red">*Esse endereço será atualizado no seu perfil.</h3>
    <hr style="width: 100%">
    <div class="left-div">
        <h3>Selecione a forma de pagamento</h3>
        <select class="input-style" name="metodoPagamento">
            <option value="Dinheiro">No recebimento</option>
            <option value="Pagamento online">Pagamento online</option>
        </select>

    </div>

    <div class="right-div">
        <h3>Número do Cartão</h3>
        <input class="input-style" type ="text" name="numeroCartao" placeholder="Insira o numero do Cartao" required>
        <h3 style="color: red">*Se você selecionou pagamento online, insira o número do seu cartão, caso contrário, deixe em branco.</h3>
    </div>
    <hr style="width: 100%">

    <div class="left-div">
        <h3>Celular</h3>
        <input class="input-style" type ="text" name="numeroCelular"  value="<%=rs2.getString(5)%>" placeholder="Número do celular" required>
        <h3 style="color: red">*This mobile number will also updated to your profile</h3>
    </div>
    <button classe="button" type="submit"> Continue para gerar a fatura e salvar<i class='far fa-arrow-alt-circle-right'></i> </button>
    <h3 style="color: red">*Preencha o formulário corretamente</h3>
    </div>
</form>
<%
        }
    }catch(Exception e){
        System.out.println(e);
    }%>

<br>
<br>
<br>

</body>
</html>