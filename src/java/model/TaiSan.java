package model;

import java.sql.Timestamp;

public class TaiSan {
    private int id;
    private String maTaiSan;
    private String tenTaiSan;
    private int loaiTaiSanId;
    private String tenLoaiTaiSan; // Join property
    private String hangSanXuat;
    private int namMua;
    private int trangThaiId;
    private String tenTrangThai; // Join property
    private String moTa;
    private boolean daXoa;
    private Timestamp ngayTao;

    public TaiSan() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaTaiSan() {
        return maTaiSan;
    }

    public void setMaTaiSan(String maTaiSan) {
        this.maTaiSan = maTaiSan;
    }

    public String getTenTaiSan() {
        return tenTaiSan;
    }

    public void setTenTaiSan(String tenTaiSan) {
        this.tenTaiSan = tenTaiSan;
    }

    public int getLoaiTaiSanId() {
        return loaiTaiSanId;
    }

    public void setLoaiTaiSanId(int loaiTaiSanId) {
        this.loaiTaiSanId = loaiTaiSanId;
    }

    public String getTenLoaiTaiSan() {
        return tenLoaiTaiSan;
    }

    public void setTenLoaiTaiSan(String tenLoaiTaiSan) {
        this.tenLoaiTaiSan = tenLoaiTaiSan;
    }

    public String getHangSanXuat() {
        return hangSanXuat;
    }

    public void setHangSanXuat(String hangSanXuat) {
        this.hangSanXuat = hangSanXuat;
    }

    public int getNamMua() {
        return namMua;
    }

    public void setNamMua(int namMua) {
        this.namMua = namMua;
    }

    public int getTrangThaiId() {
        return trangThaiId;
    }

    public void setTrangThaiId(int trangThaiId) {
        this.trangThaiId = trangThaiId;
    }

    public String getTenTrangThai() {
        return tenTrangThai;
    }

    public void setTenTrangThai(String tenTrangThai) {
        this.tenTrangThai = tenTrangThai;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public boolean isDaXoa() {
        return daXoa;
    }

    public void setDaXoa(boolean daXoa) {
        this.daXoa = daXoa;
    }

    public Timestamp getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Timestamp ngayTao) {
        this.ngayTao = ngayTao;
    }
}
