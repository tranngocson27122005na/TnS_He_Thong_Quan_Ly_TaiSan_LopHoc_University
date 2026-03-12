package model;

import java.sql.Timestamp;

public class YeuCauMuon {
    private int id;
    private int taiSanId;
    private String tenTaiSan;
    private int nguoiYeuCau;
    private String tenNguoiYeuCau;
    private int soLuong;
    private String lyDo;
    private String trangThai; // Cho phe duyet, Da duyet, Tu choi
    private Timestamp ngayYeuCau;

    public YeuCauMuon() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getNguoiYeuCau() {
        return nguoiYeuCau;
    }

    public void setNguoiYeuCau(int nguoiYeuCau) {
        this.nguoiYeuCau = nguoiYeuCau;
    }

    public String getTenNguoiYeuCau() {
        return tenNguoiYeuCau;
    }

    public void setTenNguoiYeuCau(String tenNguoiYeuCau) {
        this.tenNguoiYeuCau = tenNguoiYeuCau;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getLyDo() {
        return lyDo;
    }

    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public Timestamp getNgayYeuCau() {
        return ngayYeuCau;
    }

    public void setNgayYeuCau(Timestamp ngayYeuCau) {
        this.ngayYeuCau = ngayYeuCau;
    }
}
