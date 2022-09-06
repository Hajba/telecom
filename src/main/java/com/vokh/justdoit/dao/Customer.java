package com.vokh.justdoit.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name="customer")
public class Customer {

    @Id
    @Column(name="id")
    @GeneratedValue
    public long id;

    @Column(name="name")
    public String name;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
