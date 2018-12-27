package com.sirLiu.ttt_ssm.model;

public class TttGoodsinfo {
    private Integer id;

    private String name;

    private Integer categoryId;

    private Integer price;

    private Boolean isNew;

    private Boolean isCommend;

    private Boolean isDiscount;

    private Integer stock;

    private String description;

    public TttGoodsinfo(Integer id, String name, Integer categoryId, Integer price, Boolean isNew, Boolean isCommend, Boolean isDiscount, Integer stock, String description) {
        this.id = id;
        this.name = name;
        this.categoryId = categoryId;
        this.price = price;
        this.isNew = isNew;
        this.isCommend = isCommend;
        this.isDiscount = isDiscount;
        this.stock = stock;
        this.description = description;
    }

    public TttGoodsinfo(String name, Integer categoryId, Integer price, Boolean isNew, Boolean isCommend, Boolean isDiscount, Integer stock, String description) {
        this.name = name;
        this.categoryId = categoryId;
        this.price = price;
        this.isNew = isNew;
        this.isCommend = isCommend;
        this.isDiscount = isDiscount;
        this.stock = stock;
        this.description = description;
    }

    public TttGoodsinfo() {
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

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getIsNew() {
        return isNew;
    }

    public void setIsNew(Boolean isNew) {
        this.isNew = isNew;
    }

    public Boolean getIsCommend() {
        return isCommend;
    }

    public void setIsCommend(Boolean isCommend) {
        this.isCommend = isCommend;
    }

    public Boolean getIsDiscount() {
        return isDiscount;
    }

    public void setIsDiscount(Boolean isDiscount) {
        this.isDiscount = isDiscount;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}