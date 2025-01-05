/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Penumpang {
    private int idPenumpang;
    private String namaPenumpang;
    private String emailPenumpang;
    private int idUser;

    // Constructor
    public Penumpang(String namaPenumpang, String emailPenumpang, int idUser) {
        this.namaPenumpang = namaPenumpang;
        this.emailPenumpang = emailPenumpang;
        this.idUser = idUser;
    }

    // Constructor with ID
    public Penumpang(int idPenumpang, String namaPenumpang, String emailPenumpang, int idUser) {
        this.idPenumpang = idPenumpang;
        this.namaPenumpang = namaPenumpang;
        this.emailPenumpang = emailPenumpang;
        this.idUser = idUser;
    }
    
      // Constructor buat list penumpang
    public Penumpang(int idPenumpang, String namaPenumpang, String emailPenumpang) {
        this.idPenumpang = idPenumpang;
        this.namaPenumpang = namaPenumpang;
        this.emailPenumpang = emailPenumpang;
    }

    // Getters and Setters
    public int getIdPenumpang() {
        return idPenumpang;
    }

    public void setIdPenumpang(int idPenumpang) {
        this.idPenumpang = idPenumpang;
    }

    public String getNamaPenumpang() {
        return namaPenumpang;
    }

    public void setNamaPenumpang(String namaPenumpang) {
        this.namaPenumpang = namaPenumpang;
    }

    public String getEmailPenumpang() {
        return emailPenumpang;
    }

    public void setEmailPenumpang(String emailPenumpang) {
        this.emailPenumpang = emailPenumpang;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
