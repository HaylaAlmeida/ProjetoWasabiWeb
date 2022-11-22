package com.wasabi.model;

import javax.persistence.*;

@Entity
@Table(name = "pagamento")
public class Pagamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPagamento", nullable = false)
    private Integer id;

    @Column(name = "nome", nullable = false, length = 45)
    private String nome;

    @Column(name = "numeroDoCartao", nullable = false, length = 45)
    private String numeroDoCartao;

    @Column(name = "cvv", nullable = false)
    private int cvv;

    @Column(name = "mesExp", nullable = false)
    private int mesExp;

    @Column(name = "anoExp", nullable = false)
    private int anoExp;

    @Column(name = "cpf", nullable = false, length = 45)
    private String cpf;

    public Pagamento() {
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

    public String getNumeroDoCartao() {
        return numeroDoCartao;
    }

    public void setNumeroDoCartao(String numeroDoCartao) {
        this.numeroDoCartao = numeroDoCartao;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public int getMesExp() {
        return mesExp;
    }

    public void setMesExp(int mesExp) {
        this.mesExp = mesExp;
    }

    public int getAnoExp() {
        return anoExp;
    }

    public void setAnoExp(int anoExp) {
        this.anoExp = anoExp;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

}