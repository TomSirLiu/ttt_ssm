package com.sirLiu.ttt_ssm.model;

public class TttGoodOrder {
    private Integer id;

    private Integer goodId;

    private Integer userId;

    private String discription;

    public TttGoodOrder(Integer id, Integer goodId, Integer userId, String discription) {
        this.id = id;
        this.goodId = goodId;
        this.userId = userId;
        this.discription = discription;
    }

    public TttGoodOrder() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription == null ? null : discription.trim();
    }
}