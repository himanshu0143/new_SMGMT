package com.servletStore.fees.assignStdWiseFees.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dbconnect.DBConnection;

public class AssignStdWiseFeesImpl implements AssignStdWiseFeesDao {

	PreparedStatement ps;
	
	@Override
	public HashMap<Integer, String> getStandards(String schoolId) {
		
		DBConnection dbconnect = new DBConnection();
		Connection connection = dbconnect.getConnection();
		
		HashMap<Integer, String> stdList = new HashMap<>();
		
		String getstandardList = "SELECT fk_class_master.id, std_master.name FROM std_master, fk_class_master, fk_school_section_details WHERE fk_class_master.std_id=std_master.id AND fk_class_master.fk_school_sec_id=fk_school_section_details.id AND fk_school_section_details.school_id=? ORDER BY `std_master`.`name`  ASC";
		try {

			ps = connection.prepareStatement(getstandardList);
			ps.setInt(1, Integer.parseInt(schoolId));
			ResultSet rs = ps.executeQuery();
			AssignStdWiseFeesPojo pojo = new AssignStdWiseFeesPojo();
			
			while(rs.next())
			{
				
				stdList.put(rs.getInt(1), rs.getString(2));
			}
			
			connection.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return stdList;
	}

	@Override 
	public List<AssignStdWiseFeesPojo> getFeestypeList() {
		
		DBConnection dbConnect = new DBConnection();
		Connection connection = dbConnect.getConnection();
		
		List<AssignStdWiseFeesPojo> FeesTypeList = new ArrayList<>();
		
		String getQuery = "SELECT `fees_type`, `fees`, `term_1`, `term_2` FROM `fee_type`  WHERE caste=0";
		
		try{
			
			ps = connection.prepareStatement(getQuery);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				AssignStdWiseFeesPojo pojo = new AssignStdWiseFeesPojo();
				
				String feesType = rs.getString(1);
				String fees = rs.getString(2);
				String termOne = rs.getString(3);
				String termTwo = rs.getString(4);
				
				String termOneFees = "0";
				String termTwoFees = "0";
				
				
				if(termOne.equals("1")){
					termOneFees = fees;
				}
				
				if(termTwo.equals("1")){
					termTwoFees = fees;
				}
				
				pojo.setFeesType(feesType);
				pojo.setTermOneFees(Integer.parseInt(termOneFees));
				pojo.setTermTwoFees(Integer.parseInt(termTwoFees));	
				
				FeesTypeList.add(pojo);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return FeesTypeList;
	}

	
}
