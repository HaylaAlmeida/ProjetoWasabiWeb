<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%
  String email = (String) session.getAttribute("email");
  String idProduto=request.getParameter("id");
  try{
    Connection conn = AcessoBD.getConnection();
    Statement st = conn.createStatement();
    st.executeUpdate("DELETE FROM carrinho WHERE email='"+email+"' AND idProduto='"+idProduto+"' AND endereco IS NULL");
    conn.commit();
    response.sendRedirect("meuCarrinho.jsp?msg=removed");
  }catch(Exception e){
    System.out.println(e);
  }
%>
