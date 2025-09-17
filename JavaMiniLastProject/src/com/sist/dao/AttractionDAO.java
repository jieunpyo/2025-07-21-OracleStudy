package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.vo.AttractionVO;

public class AttractionDAO {
    private Connection conn;
    private PreparedStatement ps;
    private static AttractionDAO dao;

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

    public AttractionDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public static AttractionDAO newInstance() {
        if(dao == null)
            dao = new AttractionDAO();
        return dao;
    }

    public void getConnection() {
        try {
            conn = DriverManager.getConnection(URL, "hr", "happy");
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    public void disConnection() {
        try {
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        } catch(Exception ex) {}
    }

    // 데이터 저장
    public void insertAttraction(AttractionVO vo) {
        try {
            getConnection();
            String sql = "INSERT INTO seoul_attraction "
                       + "(no, name, image, description, tel, website, language, "
                       + "use_time, holiday, baby_carriage, disabled_facility, "
                       + "fee, address, traffic, detail_url) "
                       + "VALUES(attraction_no_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, vo.getName());
            ps.setString(2, vo.getImage());
            ps.setString(3, vo.getDescription());
            ps.setString(4, vo.getTel());
            ps.setString(5, vo.getWebsite());
            ps.setString(6, vo.getLanguage());
            ps.setString(7, vo.getUseTime());
            ps.setString(8, vo.getHoliday());
            ps.setString(9, vo.getBabyCarriage());
            ps.setString(10, vo.getDisabledFacility());
            ps.setString(11, vo.getFee());
            ps.setString(12, vo.getAddress());
            ps.setString(13, vo.getTraffic());
            ps.setString(14, vo.getDetailUrl());

            ps.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            disConnection();
        }
    }

    // 전체 목록
    public List<AttractionVO> attractionListData() {
        List<AttractionVO> list = new ArrayList<>();
        try {
            getConnection();
            String sql = "SELECT no, name, image, address, tel, website FROM seoul_attraction ORDER BY no ASC";
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                AttractionVO vo = new AttractionVO();
                vo.setNo(rs.getInt(1));
                vo.setName(rs.getString(2));
                vo.setImage(rs.getString(3));
                vo.setAddress(rs.getString(4));
                vo.setTel(rs.getString(5));
                vo.setWebsite(rs.getString(6));
                list.add(vo);
            }
            rs.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            disConnection();
        }
        return list;
    }

    // 상세보기
    public AttractionVO attractionDetailData(int no) {
        AttractionVO vo = new AttractionVO();
        try {
            getConnection();
            String sql = "SELECT * FROM seoul_attraction WHERE no=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                vo.setNo(rs.getInt("no"));
                vo.setName(rs.getString("name"));
                vo.setImage(rs.getString("image"));
                vo.setDescription(rs.getString("description"));
                vo.setTel(rs.getString("tel"));
                vo.setWebsite(rs.getString("website"));
                vo.setLanguage(rs.getString("language"));
                vo.setUseTime(rs.getString("use_time"));
                vo.setHoliday(rs.getString("holiday"));
                vo.setBabyCarriage(rs.getString("baby_carriage"));
                vo.setDisabledFacility(rs.getString("disabled_facility"));
                vo.setFee(rs.getString("fee"));
                vo.setAddress(rs.getString("address"));
                vo.setTraffic(rs.getString("traffic"));
                vo.setDetailUrl(rs.getString("detail_url"));
            }
            rs.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            disConnection();
        }
        return vo;
    }
}