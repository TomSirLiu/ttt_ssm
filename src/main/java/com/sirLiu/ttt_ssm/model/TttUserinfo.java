package com.sirLiu.ttt_ssm.model;

public class TttUserinfo {
    private Integer id;

    private String name;

    private String password;

    private String address;

    private String mobile;

    private String email;

    private Boolean status;

    public TttUserinfo(Integer id, String name, String password, String address, String mobile, String email, Boolean status) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.address = address;
        this.mobile = mobile;
        this.email = email;
        this.status = status;
    }

    public TttUserinfo() {
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}