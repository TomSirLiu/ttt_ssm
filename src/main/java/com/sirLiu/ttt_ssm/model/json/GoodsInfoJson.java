package com.sirLiu.ttt_ssm.model.json;

import com.sirLiu.ttt_ssm.model.TttGoodCategory;

/**
 * @Author sirLiu
 * @Date 2017/12/22 11:33
 */
public class GoodsInfoJson {

    private Integer id;

    private String name;

    private TttGoodCategory category;

    private Integer price;

    private Boolean ifNew;

    private Boolean ifCommend;

    private Boolean ifDiscount;

    private Integer stock;

    private String description;

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
        this.name = name;
    }

    public TttGoodCategory getCategory() {
        return category;
    }

    public void setCategory(TttGoodCategory category) {
        this.category = category;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getIfNew() {
        return ifNew;
    }

    public void setIfNew(Boolean ifNew) {
        this.ifNew = ifNew;
    }

    public Boolean getIfCommend() {
        return ifCommend;
    }

    public void setIfCommend(Boolean ifCommend) {
        this.ifCommend = ifCommend;
    }

    public Boolean getIfDiscount() {
        return ifDiscount;
    }

    public void setIfDiscount(Boolean ifDiscount) {
        this.ifDiscount = ifDiscount;
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
        this.description = description;
    }
}
