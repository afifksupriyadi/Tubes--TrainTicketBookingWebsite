/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author LENOVO
 */
public class Ticket {

    private int idBooked;
    private int idUser;
    private int idPenumpang;
    private int idKereta; // ID kereta
    private int idStasiunAsal; // ID stasiun asal
    private int idStasiunTujuan; // ID stasiun tujuan
    private String namaPenumpang; 
    private String namaKereta;
    private String namaStasiunAsal;
    private String namaStasiunTujuan;
    private String departureTime;
    private String arrivalTime;
    private String tanggalKeberangkatan;
    private int harga;
    private LocalDateTime waktuBooking;

    // DIgunakan untuk insert ticket
    public Ticket(int idUser, int idPenumpang, int idKereta, int idStasiunAsal, int idStasiunTujuan,
            String departureTime, String arrivalTime, String tanggalKeberangkatan, int harga,
            LocalDateTime waktuBooking) {
        this.idUser = idUser;
        this.idPenumpang = idPenumpang;
        this.idKereta = idKereta;
        this.idStasiunAsal = idStasiunAsal;
        this.idStasiunTujuan = idStasiunTujuan;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.tanggalKeberangkatan = tanggalKeberangkatan;
        this.harga = harga;
        this.waktuBooking = waktuBooking;
    }
    
    //Dipakai untuk My Ticket
    public Ticket(int idBooked, int idUser, String namaPenumpang, String namaKereta, String namaStasiunAsal, String namaStasiunTujuan, String departureTime, String arrivalTime, String tanggalKeberangkatan, int harga, LocalDateTime waktuBooking) {
        this.idBooked = idBooked;
        this.idUser = idUser;
        this.namaPenumpang = namaPenumpang;
        this.namaKereta = namaKereta;
        this.namaStasiunAsal = namaStasiunAsal;
        this.namaStasiunTujuan = namaStasiunTujuan;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.tanggalKeberangkatan = tanggalKeberangkatan;
        this.harga = harga;
        this.waktuBooking = waktuBooking;
    }
    
    public int getIdBooked() {
        return idBooked;
    }

    public void setIdBooked(int idBooked) {
        this.idBooked = idBooked;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdPenumpang() {
        return idPenumpang;
    }

    public void setIdPenumpang(int idPenumpang) {
        this.idPenumpang = idPenumpang;
    }

    public int getIdKereta() {
        return idKereta;
    }

    public void setIdKereta(int idKereta) {
        this.idKereta = idKereta;
    }

    public int getIdStasiunAsal() {
        return idStasiunAsal;
    }

    public void setIdStasiunAsal(int idStasiunAsal) {
        this.idStasiunAsal = idStasiunAsal;
    }

    public int getIdStasiunTujuan() {
        return idStasiunTujuan;
    }

    public void setIdStasiunTujuan(int idStasiunTujuan) {
        this.idStasiunTujuan = idStasiunTujuan;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getTanggalKeberangkatan() {
        return tanggalKeberangkatan;
    }

    public void setTanggalKeberangkatan(String tanggalKeberangkatan) {
        this.tanggalKeberangkatan = tanggalKeberangkatan;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public LocalDateTime getWaktuBooking() {
        return waktuBooking;
    }

    public void setWaktuBooking(LocalDateTime waktuBooking) {
        this.waktuBooking = waktuBooking;
    }
    
     public String getNamaPenumpang() {
        return namaPenumpang;
    }

    public void setNamaPenumpang(String namaPenumpang) {
        this.namaPenumpang = namaPenumpang;
    }

    public String getNamaKereta() {
        return namaKereta;
    }

    public void setNamaKereta(String namaKereta) {
        this.namaKereta = namaKereta;
    }

    public String getNamaStasiunAsal() {
        return namaStasiunAsal;
    }

    public void setNamaStasiunAsal(String namaStasiunAsal) {
        this.namaStasiunAsal = namaStasiunAsal;
    }

    public String getNamaStasiunTujuan() {
        return namaStasiunTujuan;
    }

    public void setNamaStasiunTujuan(String namaStasiunTujuan) {
        this.namaStasiunTujuan = namaStasiunTujuan;
    }

}
