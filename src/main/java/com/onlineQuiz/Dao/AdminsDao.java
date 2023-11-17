package com.onlineQuiz.Dao;

//Lib import
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.onlineQuiz.dbUtil.DbUtil;
import com.onlineQuiz.pojo.Admins;

public class AdminsDao {
	public static boolean doValidate(Admins ad) {

		boolean status = false;
		try {
			Connection con = DbUtil.getConnection();
			String sql = "select * from admintable where userid=? and password=?"; // SQL
																					// Query
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, ad.getUsername());
			pst.setString(2, ad.getPassword());
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				status = true;
			} else {
				status = false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
