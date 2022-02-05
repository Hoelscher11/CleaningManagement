/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Model;

/**
 *
 * @author ASUSVIVO
 */
public class Job {
    private int id;
    private String customerName;
    private String customerHpNo;
    private String address;
    private String buildingType;
    private String date;
    private String addNote;

    public Job(){}
    
    public Job(String customerName, String customerHpNo,
            String address, String buildingType,String date, String addNote){
        this.customerName = customerName;
        this.customerHpNo = customerHpNo;
        this.address = address;
        this.buildingType = buildingType;
        this.date = date;
        this.addNote = addNote;
    }
    
    public Job(int id, String customerName, String customerHpNo,
            String address, String buildingType,String date, String addNote){
        this.id = id;
        this.customerName = customerName;
        this.customerHpNo = customerHpNo;
        this.address = address;
        this.buildingType = buildingType;
        this.date = date;
        this.addNote = addNote;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerHpNo() {
        return customerHpNo;
    }

    public void setCustomerHpNo(String customerHpNo) {
        this.customerHpNo = customerHpNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBuildingType() {
        return buildingType;
    }

    public void setBuildingType(String jobType) {
        this.buildingType = jobType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddNote() {
        return addNote;
    }

    public void setAddNote(String addNote) {
        this.addNote = addNote;
    }
    
    
}
