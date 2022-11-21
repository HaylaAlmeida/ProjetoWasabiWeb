<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%
String email = session.getAttribute("email").toString();
int idProduto = Integer.parseInt(request.getParameter("id"));
int quantidade = 1;
float preco = 0;
float produtoTotal = 0;
float total = 0;
int z = 0;
try {
  Connection conn = AcessoBD.getConnection();
  Statement st = conn.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM produto WHERE idProduto='"+idProduto+"'");
  while (rs.next()){
    preco = rs.getFloat(4);
    produtoTotal = preco;
  }
  ResultSet rs1 = st.executeQuery("SELECT * FROM carrinho WHERE idProduto='"+idProduto+"' AND email='"+email+"' AND endereco IS NULL");
  while (rs1.next()){
    total = rs1.getFloat(5);
    total = total + produtoTotal;
    quantidade = rs1.getInt(4);
    quantidade = quantidade + 1;
    z=1;
  }
if (z == 1){
  st.executeUpdate("UPDATE carrinho SET total='"+total+"', quantidade ='"+ quantidade+ "' WHERE idProduto="+ idProduto+" AND " +
  "email ='"+email+"' AND endereco IS NULL");
  conn.commit();
  response.sendRedirect("home.jsp?msg=exist");
}
if (z==0) {
  PreparedStatement ps = conn.prepareStatement("INSERT INTO carrinho(email, idProduto, quantidade, preco, total) VALUES " +
  "(?, ?, ?, ?, ?)");
  ps.setString(1, email);
  ps.setInt(2, idProduto);
  ps.setInt(3, quantidade);
  ps.setFloat(4, preco);
  ps.setFloat(5, preco);
  ps.executeUpdate();
  conn.commit();
  response.sendRedirect("home.jsp?msg=added");
}
} catch (Exception e) {
  e.printStackTrace();
  response.sendRedirect("home.jsp?msg=invalid");
}
%>
