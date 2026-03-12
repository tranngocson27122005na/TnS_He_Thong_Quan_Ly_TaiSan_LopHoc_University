package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.YeuCauMuon;

public class YeuCauMuonDAO extends DBContext {

    public List<YeuCauMuon> getAll() {
        List<YeuCauMuon> list = new ArrayList<>();
        String sql = "SELECT y.*, t.ten_tai_san, n.ho_ten as ten_nguoi_yeu_cau " +
                     "FROM YeuCauMuon y " +
                     "JOIN TaiSan t ON y.tai_san_id = t.id " +
                     "JOIN NguoiDung n ON y.nguoi_yeu_cau = n.id " +
                     "ORDER BY y.ngay_yeu_cau DESC";
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                YeuCauMuon y = new YeuCauMuon();
                y.setId(rs.getInt("id"));
                y.setTaiSanId(rs.getInt("tai_san_id"));
                y.setTenTaiSan(rs.getString("ten_tai_san"));
                y.setNguoiYeuCau(rs.getInt("nguoi_yeu_cau"));
                y.setTenNguoiYeuCau(rs.getString("ten_nguoi_yeu_cau"));
                y.setSoLuong(rs.getInt("so_luong"));
                y.setLyDo(rs.getString("ly_do"));
                y.setTrangThai(rs.getString("trang_thai"));
                y.setNgayYeuCau(rs.getTimestamp("ngay_yeu_cau"));
                list.add(y);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE YeuCauMuon SET trang_thai = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
