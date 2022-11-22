package com.wasabi.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO extends AcessoBD{
    public static List<Produto> getAllProdutos() throws SQLException, ClassNotFoundException {
        conectar();
        Connection conn = getConnection();
        List<Produto> produtos = new ArrayList<>();
        String query = "SELECT * FROM produto";
        PreparedStatement pst = conn.prepareStatement(query);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Produto row = new Produto();
            row.setId(rs.getInt("idProduto"));
            row.setNome(rs.getString("nome"));
            row.setDescricao(rs.getString("descricao"));
            row.setCategoria(rs.getString("categoria"));
            row.setPreco(rs.getFloat("preco"));
            row.setUrl(rs.getString("url"));
            produtos.add(row);
        }
        desconectar();
        return produtos;
    }

    public List<Produto> getSpecificProdutos(String pesquisa) {
        List<Produto> produtos = new ArrayList<>();
        try {
            conectar();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM produto WHERE nome like'%"+pesquisa+"%' OR " +
                    "categoria like '%"+pesquisa+"%'");
            while(rs.next())
            {
                Produto produto = new Produto();
                produto.setId(rs.getInt("idProduto"));
                produto.setNome(rs.getString("nome"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setUrl(rs.getString("url"));
                produtos.add(produto);
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return produtos;
    }
    public Produto getProduto(int id){
        Produto produto = new Produto();
        try {
            conectar();
            String query = "SELECT * FROM produto WHERE idProduto=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while(rs.next()) {
                produto.setId(rs.getInt("idProduto"));
                produto.setNome(rs.getString("nome"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setUrl(rs.getString("url"));
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return produto;
    }
    public List<Carrinho> getProdutosCarrinho(List<Carrinho> carrinhoLista){
        List<Carrinho> produtos = new ArrayList<Carrinho>();
        try {
            conectar();
            if(carrinhoLista.size()>0){
                for(Carrinho item: carrinhoLista){
                    String query = "SELECT * FROM produto WHERE idProduto=?";
                    PreparedStatement pst = conn.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    ResultSet rs = pst.executeQuery();

                    while(rs.next()) {
                        Carrinho row = new Carrinho();
                        row.setId(rs.getInt("idProduto"));
                        row.setNome(rs.getString("nome"));
                        row.setCategoria(rs.getString("categoria"));
                        row.setPreco(rs.getFloat("preco")* item.getQuantidade());
                        row.setQuantidade(item.getQuantidade());
                        produtos.add(row);
                    }
                }
            }
            desconectar();
        } catch (Exception e){
            e.printStackTrace();
        }
        return produtos;
    }
    public float getTotalCarrinho(List<Carrinho> carrinhoLista){
        float soma = 0;
        try {
            conectar();
            if(carrinhoLista.size() > 0){
                for(Carrinho item: carrinhoLista){
                    String query = "SELECT preco FROM produto WHERE idProduto=?";
                    PreparedStatement pst = conn.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    ResultSet rs = pst.executeQuery();
                    while(rs.next()) {
                        soma += rs.getFloat("preco")*item.getQuantidade();
                    }
                }
            }
            desconectar();
        } catch (Exception e) {

        }
        return soma;
    }
}
