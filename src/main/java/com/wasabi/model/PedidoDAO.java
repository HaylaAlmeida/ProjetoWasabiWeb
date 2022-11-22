package com.wasabi.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO extends AcessoBD{
    public boolean create(Pedido pedido){
        boolean result = false;
        try {
            conectar();
            String query = "INSERT INTO pedido (idCliente, idProduto, idPagamento, quantidade, total, endereco, data) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, pedido.getIdCliente());
            pst.setInt(2, pedido.getIdProduto());
            pst.setInt(3, pedido.getIdPagamento());
            pst.setInt(4, pedido.getQuantidade());
            pst.setFloat(5, pedido.getTotal());
            pst.setString(6, pedido.getEndereco());
            pst.setString(7, pedido.getData());
            pst.executeUpdate();
            conn.commit();
            result = true;
            desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public List<Pedido> getAllPedidosDoUsuario(int id){
        List<Pedido> pedidos = new ArrayList<>();
        try {
            conectar();
            String query = "SELECT * FROM pedido WHERE idCliente=? ORDER BY pedido.idPedido DESC";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                ProdutoDAO pd = new ProdutoDAO();
                int idProduto = rs.getInt("idProduto");
                Produto produto = pd.getProduto(idProduto);
                pedido.setId(rs.getInt("idPedido"));
                pedido.setIdProduto(idProduto);
                pedido.setNome(produto.getNome());
                pedido.setCategoria(produto.getCategoria());
                pedido.setPreco(produto.getPreco()*rs.getInt("quantidade"));
                pedido.setQuantidade(rs.getInt("quantidade"));
                pedido.setData(rs.getString("data"));
                pedidos.add(pedido);
            }
            desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return pedidos;
    }
    public void excluir(int id) {
        try {
            conectar();
            String query = "DELETE FROM pedido WHERE idPedido=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            conn.commit();
            desconectar();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }
}
