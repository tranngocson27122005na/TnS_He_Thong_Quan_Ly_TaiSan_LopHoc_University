package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.NguoiDung;
import model.SinhVien;

public class NguoiDungDAO extends DBContext {

    public NguoiDung login(String username, String password) {
        if (connection == null)
            return null;

        String sql = "SELECT n.*, v.ten_vai_tro, s.ma_sinh_vien, s.lop, s.khoa " +
                "FROM NguoiDung n " +
                "JOIN VaiTro v ON n.vai_tro_id = v.id " +
                "LEFT JOIN SinhVien s ON n.id = s.nguoi_dung_id " +
                "WHERE n.ten_dang_nhap = ? AND n.mat_khau = ? AND n.trang_thai = 1";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int vaiTroId = rs.getInt("vai_tro_id");
                    NguoiDung n;

                    if (vaiTroId == 4) {
                        SinhVien sv = new SinhVien();
                        sv.setMaSinhVien(rs.getString("ma_sinh_vien"));
                        sv.setLop(rs.getString("lop"));
                        sv.setKhoa(rs.getString("khoa"));
                        n = sv;
                    } else {
                        n = new NguoiDung();
                    }

                    n.setId(rs.getInt("id"));
                    n.setTenDangNhap(rs.getString("ten_dang_nhap"));
                    n.setHoTen(rs.getString("ho_ten"));
                    n.setEmail(rs.getString("email"));
                    n.setVaiTroId(vaiTroId);
                    n.setTenVaiTro(rs.getString("ten_vai_tro"));

                    return n;
                }
            }
        } catch (SQLException e) {
            System.err.println("Login Error: " + e.getMessage());
        }
        return null;
    }

    public NguoiDung checkEmailExists(String email) {
        if (connection == null)
            return null;

        String sql = "SELECT * FROM NguoiDung WHERE email = ? AND trang_thai = 1";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    NguoiDung n = new NguoiDung();
                    n.setId(rs.getInt("id"));
                    n.setTenDangNhap(rs.getString("ten_dang_nhap"));
                    n.setMatKhau(rs.getString("mat_khau"));
                    n.setHoTen(rs.getString("ho_ten"));
                    n.setEmail(rs.getString("email"));
                    n.setVaiTroId(rs.getInt("vai_tro_id"));
                    n.setTrangThai(rs.getBoolean("trang_thai"));
                    n.setNgayTao(rs.getTimestamp("ngay_tao"));
                    return n;
                }
            }
        } catch (SQLException e) {
            System.err.println("checkEmailExists Error: " + e.getMessage());
        }
        return null;
    }

    public boolean updatePassword(String email, String newPassword) {
        if (connection == null)
            return false;

        String sql = "UPDATE NguoiDung SET mat_khau = ? WHERE email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newPassword);
            st.setString(2, email);

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("updatePassword Error: " + e.getMessage());
        }
        return false;
    }
}
