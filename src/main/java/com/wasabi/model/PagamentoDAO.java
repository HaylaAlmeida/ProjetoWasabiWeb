package com.wasabi.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PagamentoDAO extends AcessoBD{
    static Pagamento pagamento;
    public void create(Pagamento pagamento) {
        try {
            conectar();
            String query = "INSERT INTO pagamento (nome, numeroDoCartao, cvv, mesExp, anoExp, cpf) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, pagamento.getNome());
            pst.setString(2, pagamento.getNumeroDoCartao());
            pst.setInt(3, pagamento.getCvv());
            pst.setInt(4, pagamento.getMesExp());
            pst.setInt(5, pagamento.getAnoExp());
            pst.setString(6, pagamento.getCpf());
            pst.executeUpdate();
            conn.commit();
            desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean existe(String numero){
        boolean existe = false;
        try {
            conectar();
            String query = "SELECT * FROM pagamento WHERE numeroDoCartao=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, numero);
            ResultSet rs = pst.executeQuery();
            if (rs.next() == false) {
                existe = false;
            } else {
                existe = true;
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return existe;
    }

    public Pagamento read(String numero){
        try {
            conectar();
            String query = "SELECT * FROM pagamento WHERE numeroDoCartao=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, numero);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                String foundType = rs.getString(1);
                Pagamento pagamento = new Pagamento();
                pagamento.setId(rs.getInt("idPagamento"));
                pagamento.setNome(rs.getString("nome"));
                pagamento.setNumeroDoCartao(rs.getString("numeroDoCartao"));
                pagamento.setCpf(rs.getString("cpf"));
                pagamento.setMesExp(rs.getInt("mesExp"));
                pagamento.setAnoExp(rs.getInt("anoExp"));
                pagamento.setCvv(rs.getInt("cvv"));
                this.pagamento = pagamento;
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return this.pagamento;
    }
}


