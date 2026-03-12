package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.PhongHoc;

public class PhongHocDAO extends DBContext {

    public List<PhongHoc> getAll() {
        List<PhongHoc> list = new ArrayList<>();
        String sql = "SELECT * FROM PhongHoc WHERE da_xoa = 0";
        try (PreparedStatement st = connection.prepareStatement(sql);
                ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                PhongHoc p = new PhongHoc();
                p.setId(rs.getInt("id"));
                p.setMaPhong(rs.getString("ma_phong"));
                p.setTenPhong(rs.getString("ten_phong"));
                p.setTang(rs.getInt("tang"));
                p.setLoaiPhongId(rs.getInt("loai_phong_id"));
                p.setSucChua(rs.getInt("suc_chua"));
                p.setMoTa(rs.getString("mo_ta"));
                p.setDaXoa(rs.getBoolean("da_xoa"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public PhongHoc getById(int id) {
        String sql = "SELECT * FROM PhongHoc WHERE id = ? AND da_xoa = 0";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    PhongHoc p = new PhongHoc();
                    p.setId(rs.getInt("id"));
                    p.setMaPhong(rs.getString("ma_phong"));
                    p.setTenPhong(rs.getString("ten_phong"));
                    p.setTang(rs.getInt("tang"));
                    p.setLoaiPhongId(rs.getInt("loai_phong_id"));
                    p.setSucChua(rs.getInt("suc_chua"));
                    p.setMoTa(rs.getString("mo_ta"));
                    p.setDaXoa(rs.getBoolean("da_xoa"));
                    return p;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(PhongHoc p) {
        String sql = "INSERT INTO PhongHoc(ma_phong, ten_phong, tang, loai_phong_id, suc_chua, mo_ta, da_xoa) VALUES(?, ?, ?, ?, ?, ?, 0)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, p.getMaPhong());
            st.setString(2, p.getTenPhong());
            st.setInt(3, p.getTang());
            st.setInt(4, p.getLoaiPhongId());
            st.setInt(5, p.getSucChua());
            st.setString(6, p.getMoTa());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(PhongHoc p) {
        String sql = "UPDATE PhongHoc SET ma_phong=?, ten_phong=?, tang=?, loai_phong_id=?, suc_chua=?, mo_ta=? WHERE id=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, p.getMaPhong());
            st.setString(2, p.getTenPhong());
            st.setInt(3, p.getTang());
            st.setInt(4, p.getLoaiPhongId());
            st.setInt(5, p.getSucChua());
            st.setString(6, p.getMoTa());
            st.setInt(7, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "UPDATE PhongHoc SET da_xoa = 1 WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
