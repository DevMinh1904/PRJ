/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.advertisingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ducmi
 */
public class advertisingDAO {

    public List<advertisingDTO> getListAds(int amount) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT TOP (?) * FROM quangcao WHERE visiable = 1 ORDER BY NEWID()";

        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, amount);

        ResultSet result = ps.executeQuery();
        ArrayList<advertisingDTO> list = new ArrayList<>();

        while (result.next()) {
            advertisingDTO ads = new advertisingDTO();
            ads.setAdsID(result.getInt("id_quangcao"));
            ads.setAdsTitle(result.getString("tieude"));
            ads.setAdsFile(result.getString("taptin"));
            ads.setAdsURL(result.getString("url"));
            ads.setAdsTarget(result.getString("target"));
            list.add(ads);
        }

        return list;
    }
}
