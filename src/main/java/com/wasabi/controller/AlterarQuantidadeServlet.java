package com.wasabi.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "AlterarQuantidadeServlet", value = "/AlterarQuantidadeServlet")
public class AlterarQuantidadeServlet extends HttpServlet {
    static AcessoBD bd;
    @Override
    public void init() throws ServletException {
        super.init();
        bd = new AcessoBD();
        try {
            bd.conectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email= session.getAttribute("email").toString();
        String id=request.getParameter("id");
        String incdec=request.getParameter("quantidade");

        float preco=0, total=0, final_total=0;
        int quantidade=0;

        try{
            Connection con = bd.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from carrinho where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
            while(rs.next()){
                preco = rs.getFloat(4);
                total = rs.getFloat(5);
                quantidade = rs.getInt(3);
            }
            if(quantidade == 1 && incdec.equals("dec"))
                response.sendRedirect("meuCarrinho.jsp?msg=notPossible");
            else if(quantidade != 1 && incdec.equals("dec")){
                total=total-preco;
                quantidade=quantidade-1;
                st.executeUpdate("update carrinho set total='"+total+"',quantidade='"+quantidade+"' where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
                response.sendRedirect("meuCarrinho.jsp?msg=dec");
            }
            else{
                total=total+preco;
                quantidade=quantidade+1;
                st.executeUpdate("update carrinho set total='"+total+"',quantidade='"+quantidade+"' where email='"+email+"' and idProduto='"+id+"' and endereco is NULL");
                response.sendRedirect("meuCarrinho.jsp?msg=inc");
            }
        }catch(Exception e){
            System.out.println(e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            bd.desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
