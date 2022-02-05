/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Model;

/**
 *
 * @author NAD
 */
public class Tools {

    protected int id;
    protected String tool;
    protected int quantity;
    protected int jobid;

    public Tools() {
    }

    public Tools(String tool, int quantity, int jobid) {
        this.tool = tool;
        this.quantity = quantity;
        this.jobid = jobid;
    }

    public Tools(int id, String tool, int quantity, int jobid) {
        this.id = id;
        this.tool = tool;
        this.quantity = quantity;
        this.jobid = jobid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTool() {
        return tool;
    }

    public void setTool(String tool) {
        this.tool = tool;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

}
