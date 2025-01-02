/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class ListKereta {

    private String namaKereta;
    private int nomorKereta;
    private String stasiunAsal;
    private String stasiunTujuan;
    private String departureTime;
    private String arrivalTime;
    private int availableCapacity;
    private String tanggalKeberangkatan;
    private int totalDistance; // Jarak total
    private int harga; // Harga total

    private int idKereta; // ID unik kereta
    private int idStasiunAsal; // ID stasiun asal
    private int idStasiunTujuan; // ID stasiun tujuan

    public ListKereta(String namaKereta, int nomorKereta, String stasiunAsal, String stasiunTujuan, String departureTime, String arrivalTime, int availableCapacity, String tanggalKeberangkatan, int totalDistance, int harga) {
        this.namaKereta = namaKereta;
        this.nomorKereta = nomorKereta;
        this.stasiunAsal = stasiunAsal;
        this.stasiunTujuan = stasiunTujuan;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.availableCapacity = availableCapacity;
        this.tanggalKeberangkatan = tanggalKeberangkatan;
        this.totalDistance = totalDistance;
        this.harga = harga;
    }

    public String getNamaKereta() {
        return namaKereta;
    }

    public void setNamaKereta(String namaKereta) {
        this.namaKereta = namaKereta;
    }

    public int getNomorKereta() {
        return nomorKereta;
    }

    public void setNomorKereta(int nomorKereta) {
        this.nomorKereta = nomorKereta;
    }

    public String getStasiunAsal() {
        return stasiunAsal;
    }

    public void setStasiunAsal(String stasiunAsal) {
        this.stasiunAsal = stasiunAsal;
    }

    public String getStasiunTujuan() {
        return stasiunTujuan;
    }

    public void setStasiunTujuan(String stasiunTujuan) {
        this.stasiunTujuan = stasiunTujuan;
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

    public int getAvailableCapacity() {
        return availableCapacity;
    }

    public void setAvailableCapacity(int availableCapacity) {
        this.availableCapacity = availableCapacity;
    }

    public String getTanggalKeberangkatan() {
        return tanggalKeberangkatan;
    }

    public void setTanggalKeberangkatan(String tanggalKeberangkatan) {
        this.tanggalKeberangkatan = tanggalKeberangkatan;
    }

    public int getTotalDistance() {
        return totalDistance;
    }

    public void setTotalDistance(int totalDistance) {
        this.totalDistance = totalDistance;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public void setIdKereta(int idKereta) {
        this.idKereta = idKereta;
    }

    public int getIdKereta() {
        return idKereta;
    }

    public void setIdStasiunAsal(int idStasiunAsal) {
        this.idStasiunAsal = idStasiunAsal;
    }

    public int getIdStasiunAsal() {
        return idStasiunAsal;
    }

    public void setIdStasiunTujuan(int idStasiunTujuan) {
        this.idStasiunTujuan = idStasiunTujuan;
    }

    public int getIdStasiunTujuan() {
        return idStasiunTujuan;
    }

}
