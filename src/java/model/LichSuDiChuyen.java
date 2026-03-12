package model;

import java.sql.Timestamp;

public class LichSuDiChuyen {
    private int id;
    private int taiSanId;
    private String tenTaiSan; // Join logic
    private String moTaDiChuyen;
    private Timestamp ngayThayDoi;

    public LichSuDiChuyen() {
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

    public String getMoTaDiChuyen() {
        return moTaDiChuyen;
    }

    public void setMoTaDiChuyen(String moTaDiChuyen) {
        this.moTaDiChuyen = moTaDiChuyen;
    }

    public Timestamp getNgayThayDoi() {
        return ngayThayDoi;
    }

    public void setNgayThayDoi(Timestamp ngayThayDoi) {
        this.ngayThayDoi = ngayThayDoi;
    }
}
