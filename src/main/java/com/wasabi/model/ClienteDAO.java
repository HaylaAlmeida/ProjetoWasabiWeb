package com.wasabi.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClienteDAO extends AcessoBD{
    public Cliente getCliente(String email){
        Cliente cliente = new Cliente();
        try {
            conectar();
            String query = "SELECT * FROM cliente WHERE email=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            while(rs.next()) {
                cliente.setId(rs.getInt("idCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setCpf(rs.getString("cpf"));
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return cliente;
    }
}
