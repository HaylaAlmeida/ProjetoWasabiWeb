<%@page import="java.sql.*" %>
<%@ page import="com.wasabi.controller.AcessoBD" %>
<%
  String email= session.getAttribute("email").toString();
  String id=request.getParameter("id");
  String incdec=request.getParameter("quantidade");
  float preco = Float.parseFloat(request.getParameter("preco"));

  float total=0;
  int quantidade=0;

  try{
    Connection con = AcessoBD.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from carrinho where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
    while(rs.next()){
      quantidade = rs.getInt(3);
    }
    if(quantidade == 1 && incdec.equals("dec"))
      response.sendRedirect("meuCarrinho.jsp?msg=notPossible");
    else if(quantidade != 1 && incdec.equals("dec")){
      total = preco * quantidade;
      st.executeUpdate("update carrinho set total='"+total+"',quantidade='"+quantidade+"' where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
      response.sendRedirect("meuCarrinho.jsp?msg=dec");
    }
    else{
      quantidade=quantidade+1;
      total = preco * quantidade;
      st.executeUpdate("update carrinho set total='"+total+"',quantidade='"+quantidade+"' where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
      response.sendRedirect("meuCarrinho.jsp?msg=inc");
    }
  }catch(Exception e){
    System.out.println(e);
  }
%>
