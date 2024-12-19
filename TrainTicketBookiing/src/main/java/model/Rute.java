/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Rute {
    private int idRute;
    private int idKereta;
    private int idStasiunAsal;
    private int idStasiunTujuan;
    private String departureTime;
    private String arrivalTime;
    private int kapasitas;
    private String date;

    public Rute(int idRute, int idKereta, int idStasiunAsal, int idStasiunTujuan, String departureTime, String arrivalTime, int kapasitas, String date) {
        this.idRute = idRute;
        this.idKereta = idKereta;
        this.idStasiunAsal = idStasiunAsal;
        this.idStasiunTujuan = idStasiunTujuan;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.kapasitas = kapasitas;
        this.date = date;
    }

    public int getIdRute() {
        return idRute;
    }

    public void setIdRute(int idRute) {
        this.idRute = idRute;
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

    public int getKapasitas() {
        return kapasitas;
    }

    public void setKapasitas(int kapasitas) {
        this.kapasitas = kapasitas;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
}
