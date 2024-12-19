/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Stasiun {
    private int idStasiun;
    private String nama;

    public Stasiun(int idStasiun, String nama) {
        this.idStasiun = idStasiun;
        this.nama = nama;
    }

    public int getIdStasiun() {
        return idStasiun;
    }

    public void setIdStasiun(int idStasiun) {
        this.idStasiun = idStasiun;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }
    
    
}
