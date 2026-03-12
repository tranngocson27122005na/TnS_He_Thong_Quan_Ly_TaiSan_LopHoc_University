package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import model.PhongTaiSan;
import model.LichSuDiChuyen;
import model.PhongHoc;

public class PhongTaiSanDAO extends DBContext {

    public List<PhongTaiSan> getAllWithInfo() {
        List<PhongTaiSan> list = new ArrayList<>();
        String sql = "SELECT pts.*, p.ten_phong, t.ten_tai_san, n.ho_ten as ten_nguoi_gan " +
                     "FROM PhongTaiSan pts " +
                     "JOIN PhongHoc p ON pts.phong_id = p.id " +
                     "JOIN TaiSan t ON pts.tai_san_id = t.id " +
                     "JOIN NguoiDung n ON pts.nguoi_gan = n.id";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                PhongTaiSan pts = new PhongTaiSan();
                pts.setId(rs.getInt("id"));
                pts.setPhongId(rs.getInt("phong_id"));
                pts.setTenPhong(rs.getString("ten_phong"));
                pts.setTaiSanId(rs.getInt("tai_san_id"));
                pts.setTenTaiSan(rs.getString("ten_tai_san"));
                pts.setSoLuong(rs.getInt("so_luong"));
                pts.setGhiChu(rs.getString("ghi_chu"));
                pts.setTenNguoiGan(rs.getString("ten_nguoi_gan"));
                pts.setNgayGan(rs.getTimestamp("ngay_gan"));
                list.add(pts);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void assignAsset(PhongTaiSan pts) {
        String sql = "INSERT INTO PhongTaiSan(phong_id, tai_san_id, so_luong, ghi_chu, nguoi_gan, ngay_gan) VALUES(?, ?, ?, ?, ?, GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, pts.getPhongId());
            st.setInt(2, pts.getTaiSanId());
            st.setInt(3, pts.getSoLuong());
            st.setString(4, pts.getGhiChu());
            st.setInt(5, pts.getNguoiGan());
            st.executeUpdate();
            
            // Log history
            logMovement(pts.getTaiSanId(), "Gán vào phòng id: " + pts.getPhongId() + " số lượng: " + pts.getSoLuong());
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void logMovement(int taiSanId, String moTa) {
        String sql = "INSERT INTO LichSuDiChuyen(tai_san_id, mo_ta_di_chuyen, ngay_thay_doi) VALUES(?, ?, GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, taiSanId);
            st.setString(2, moTa);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteAssignment(int id) {
        String sql = "DELETE FROM PhongTaiSan WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<LichSuDiChuyen> getAllMovementHistory() {
        List<LichSuDiChuyen> list = new ArrayList<>();
        String sql = "SELECT ls.*, t.ten_tai_san FROM LichSuDiChuyen ls JOIN TaiSan t ON ls.tai_san_id = t.id ORDER BY ls.ngay_thay_doi DESC";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                LichSuDiChuyen ls = new LichSuDiChuyen();
                ls.setId(rs.getInt("id"));
                ls.setTaiSanId(rs.getInt("tai_san_id"));
                ls.setTenTaiSan(rs.getString("ten_tai_san"));
                ls.setMoTaDiChuyen(rs.getString("mo_ta_di_chuyen"));
                ls.setNgayThayDoi(rs.getTimestamp("ngay_thay_doi"));
                list.add(ls);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Map<Integer, Integer> getAssetStatistics() {
        Map<Integer, Integer> map = new HashMap<>();
        String sql = "SELECT phong_id, SUM(so_luong) as total FROM PhongTaiSan GROUP BY phong_id";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                map.put(rs.getInt("phong_id"), rs.getInt("total"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return map;
    }
}
