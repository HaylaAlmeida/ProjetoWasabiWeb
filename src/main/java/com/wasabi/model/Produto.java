package com.wasabi.model;

import javax.persistence.*;

@Entity
@Table(name = "produto")
public class Produto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idProduto", nullable = false)
    private Integer id;

    @Column(name = "nome", nullable = false, length = 50)
    private String nome;

    @Column(name = "descricao", nullable = false, length = 200)
    private String descricao;

    @Column(name = "preco", nullable = false)
    private float preco;

    @Column(name = "categoria", nullable = false, length = 50)
    private String categoria;

    @Column(name = "url", length = 100)
    private String url;

    @Override
    public String toString() {
        return "Produto{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", descricao='" + descricao + '\'' +
                ", preco=" + preco +
                ", categoria='" + categoria + '\'' +
                ", url='" + url + '\'' +
                '}';
    }

    public Produto(Integer id, String nome, String descricao, float preco, String categoria) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.categoria = categoria;
    }

    public Produto(Integer id, String nome, String descricao, float preco, String categoria, String url) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.categoria = categoria;
        this.url = url;
    }

    public Produto() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}