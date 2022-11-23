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
                cliente.setSenha(rs.getString("senha"));
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return cliente;
    }

    public boolean update(Cliente cliente){
        boolean sucesso = false;
        try {
            conectar();
            String update = "UPDATE cliente SET email = ?, nome = ?, cpf = ?, telefone = ?, senha = ? WHERE email = ?";
            System.out.println(cliente);
            PreparedStatement pst = conn.prepareStatement(update);
            pst.setString(1, cliente.getEmail());
            pst.setString(2, cliente.getNome());
            pst.setString(3, cliente.getCpf());
            pst.setString(4, cliente.getTelefone());
            pst.setString(5, cliente.getSenha());
            pst.setString(6, cliente.getEmail());
            pst.executeUpdate();
            conn.commit();
            sucesso = true;
            desconectar();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sucesso;
    }
}
