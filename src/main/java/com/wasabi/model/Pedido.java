package com.wasabi.model;

import javax.persistence.*;

@Entity
@Table(name = "pedido")
public class Pedido extends Produto{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPedido", nullable = false)
    private Integer id;

    @Column(name = "idProduto", nullable = false)
    private int idProduto;

    @Column(name = "idCliente", nullable = false)
    private int idCliente;

    @Column(name = "idPagamento", nullable = false)
    private int idPagamento;

    @Column(name = "quantidade", nullable = false)
    private int quantidade;

    @Column(name = "total", nullable = false)
    private float total;

    @Column(name = "data", nullable = false, length = 45)
    private String data;

    @Column(name = "endereco", nullable = false, length = 400)
    private String endereco;
    public Pedido(){
    }

    @Override
    public String toString() {
        return "Pedido{" +
                "id=" + id +
                ", idProduto=" + idProduto +
                ", idCliente=" + idCliente +
                ", quantidade=" + quantidade +
                ", total=" + total +
                ", data='" + data + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public int getIdPagamento() {
        return idPagamento;
    }

    public void setIdPagamento(int idPagamento) {
        this.idPagamento = idPagamento;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}