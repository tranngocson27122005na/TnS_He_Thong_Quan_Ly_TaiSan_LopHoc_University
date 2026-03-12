package model;

import java.sql.Timestamp;

public class PhongTaiSan {
    private int id;
    private int phongId;
    private String tenPhong; // Join property
    private int taiSanId;
    private String tenTaiSan; // Join property
    private int soLuong;
    private String ghiChu;
    private int nguoiGan;
    private String tenNguoiGan; // Join property
    private Timestamp ngayGan;

    public PhongTaiSan() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPhongId() {
        return phongId;
    }

    public void setPhongId(int phongId) {
        this.phongId = phongId;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public int getTaiSanId() {
        return taiSanId;
    }

    public void setTaiSanId(int taiSanId) {
        this.taiSanId = taiSanId;
    }

    public String getTenTaiSan() {
        return tenTaiSan;
    }

    public void setTenTaiSan(String tenTaiSan) {
        this.tenTaiSan = tenTaiSan;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public int getNguoiGan() {
        return nguoiGan;
    }

    public void setNguoiGan(int nguoiGan) {
        this.nguoiGan = nguoiGan;
    }

    public String getTenNguoiGan() {
        return tenNguoiGan;
    }

    public void setTenNguoiGan(String tenNguoiGan) {
        this.tenNguoiGan = tenNguoiGan;
    }

    public Timestamp getNgayGan() {
        return ngayGan;
    }

    public void setNgayGan(Timestamp ngayGan) {
        this.ngayGan = ngayGan;
    }
}
