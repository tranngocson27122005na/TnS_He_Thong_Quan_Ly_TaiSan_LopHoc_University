/*
SELECT * FROM VaiTro;
SELECT * FROM NguoiDung;
SELECT * FROM PhongHoc;
SELECT * FROM TaiSan;
*/

package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.TaiSan;

public class TaiSanDAO extends DBContext {

    public List<TaiSan> getAll() {
        List<TaiSan> list = new ArrayList<>();
        String sql = "SELECT t.*, lt.ten_loai, tt.ten_trang_thai " +
                "FROM TaiSan t " +
                "JOIN LoaiTaiSan lt ON t.loai_tai_san_id = lt.id " +
                "JOIN TrangThaiTaiSan tt ON t.trang_thai_id = tt.id " +
                "WHERE t.da_xoa = 0";
        try (PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                TaiSan ts = new TaiSan();
                ts.setId(rs.getInt("id"));
                ts.setMaTaiSan(rs.getString("ma_tai_san"));
                ts.setTenTaiSan(rs.getString("ten_tai_san"));
                ts.setLoaiTaiSanId(rs.getInt("loai_tai_san_id"));
                ts.setTenLoaiTaiSan(rs.getString("ten_loai"));
                ts.setHangSanXuat(rs.getString("hang_san_xuat"));
                ts.setNamMua(rs.getInt("nam_mua"));
                ts.setTrangThaiId(rs.getInt("trang_thai_id"));
                ts.setTenTrangThai(rs.getString("ten_trang_thai"));
                ts.setMoTa(rs.getString("mo_ta"));
                ts.setDaXoa(rs.getBoolean("da_xoa"));
                ts.setNgayTao(rs.getTimestamp("ngay_tao"));
                list.add(ts);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public TaiSan getById(int id) {
        String sql = "SELECT t.*, lt.ten_loai, tt.ten_trang_thai " +
                "FROM TaiSan t " +
                "JOIN LoaiTaiSan lt ON t.loai_tai_san_id = lt.id " +
                "JOIN TrangThaiTaiSan tt ON t.trang_thai_id = tt.id " +
                "WHERE t.id = ? AND t.da_xoa = 0";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    TaiSan ts = new TaiSan();
                    ts.setId(rs.getInt("id"));
                    ts.setMaTaiSan(rs.getString("ma_tai_san"));
                    ts.setTenTaiSan(rs.getString("ten_tai_san"));
                    ts.setLoaiTaiSanId(rs.getInt("loai_tai_san_id"));
                    ts.setTenLoaiTaiSan(rs.getString("ten_loai"));
                    ts.setHangSanXuat(rs.getString("hang_san_xuat"));
                    ts.setNamMua(rs.getInt("nam_mua"));
                    ts.setTrangThaiId(rs.getInt("trang_thai_id"));
                    ts.setTenTrangThai(rs.getString("ten_trang_thai"));
                    ts.setMoTa(rs.getString("mo_ta"));
                    ts.setDaXoa(rs.getBoolean("da_xoa"));
                    ts.setNgayTao(rs.getTimestamp("ngay_tao"));
                    return ts;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(TaiSan ts) {
        String sql = "INSERT INTO TaiSan(ma_tai_san, ten_tai_san, loai_tai_san_id, hang_san_xuat, nam_mua, trang_thai_id, mo_ta) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, ts.getMaTaiSan());
            st.setString(2, ts.getTenTaiSan());
            st.setInt(3, ts.getLoaiTaiSanId());
            st.setString(4, ts.getHangSanXuat());
            st.setInt(5, ts.getNamMua());
            st.setInt(6, ts.getTrangThaiId());
            st.setString(7, ts.getMoTa());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(TaiSan ts) {
        String sql = "UPDATE TaiSan SET ma_tai_san=?, ten_tai_san=?, loai_tai_san_id=?, hang_san_xuat=?, nam_mua=?, trang_thai_id=?, mo_ta=? WHERE id=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, ts.getMaTaiSan());
            st.setString(2, ts.getTenTaiSan());
            st.setInt(3, ts.getLoaiTaiSanId());
            st.setString(4, ts.getHangSanXuat());
            st.setInt(5, ts.getNamMua());
            st.setInt(6, ts.getTrangThaiId());
            st.setString(7, ts.getMoTa());
            st.setInt(8, ts.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "UPDATE TaiSan SET da_xoa = 1 WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<TaiSan> searchByName(String keyword) {
        List<TaiSan> list = new ArrayList<>();
        String sql = "SELECT t.*, lt.ten_loai, tt.ten_trang_thai " +
                "FROM TaiSan t " +
                "JOIN LoaiTaiSan lt ON t.loai_tai_san_id = lt.id " +
                "JOIN TrangThaiTaiSan tt ON t.trang_thai_id = tt.id " +
                "WHERE t.da_xoa = 0 AND t.ten_tai_san LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + keyword + "%");
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    TaiSan ts = new TaiSan();
                    ts.setId(rs.getInt("id"));
                    ts.setMaTaiSan(rs.getString("ma_tai_san"));
                    ts.setTenTaiSan(rs.getString("ten_tai_san"));
                    ts.setLoaiTaiSanId(rs.getInt("loai_tai_san_id"));
                    ts.setTenLoaiTaiSan(rs.getString("ten_loai"));
                    ts.setHangSanXuat(rs.getString("hang_san_xuat"));
                    ts.setNamMua(rs.getInt("nam_mua"));
                    ts.setTrangThaiId(rs.getInt("trang_thai_id"));
                    ts.setTenTrangThai(rs.getString("ten_trang_thai"));
                    ts.setMoTa(rs.getString("mo_ta"));
                    ts.setDaXoa(rs.getBoolean("da_xoa"));
                    ts.setNgayTao(rs.getTimestamp("ngay_tao"));
                    list.add(ts);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
