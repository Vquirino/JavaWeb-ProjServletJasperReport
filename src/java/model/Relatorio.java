package model;

import java.util.Date;

public class Relatorio {
    
    private Integer idturma;
    private String turma;
    private Date datainico;
    private String curso;
    private String descricao;
    private String professor;
    private String email;

    public Relatorio() {
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public Date getDatainico() {
        return datainico;
    }

    public void setDatainico(Date datainico) {
        this.datainico = datainico;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getIdturma() {
        return idturma;
    }

    public void setIdturma(Integer idturma) {
        this.idturma = idturma;
    }

    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
    }

    public String getTurma() {
        return turma;
    }

    public void setTurma(String turma) {
        this.turma = turma;
    }
    
    
    
}
