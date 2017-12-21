package com.sirLiu.ttt_ssm.model;

public class TttGoodCategory {
    private Integer id;

    private String name;

    public TttGoodCategory(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public TttGoodCategory() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}