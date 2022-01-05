package com.koreait.mooda.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class nogadaDiary {

	public static void main(String[] args) {
		String file = "C:/Users/bsu79/Desktop/김동영/src/main/java/com/koreait/mooda/nogada/diary.txt";
        Scanner sc;
        Connection conn;
        PreparedStatement pstmt;
        String sql = "";
        try {
            sc = new Scanner(new FileInputStream(file));
            while (sc.hasNextLine()) {            	
                String[] reader = sc.nextLine().split(",");
                conn = Dbconn.getConnection();
                if(conn != null){
                    sql = "insert into tb_diary (d_useridx, d_mood, d_content, d_open, d_sticker, d_latitude, d_longitude, d_regdate, d_title) " +
                            "values (?,?,?,?,?,?,?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    for(int i=1; i<10; i++) {
                    	pstmt.setString(i, reader[i]);
                    }
//                    pstmt.setLong(1, Long.parseLong((String)reader[0]));
//                    pstmt.setInt(2, Integer.parseInt(reader[1]));
//                    pstmt.setString(3, reader[2]);
//                    pstmt.setInt(4, Integer.parseInt(reader[3]));
//                    pstmt.setInt(5, Integer.parseInt(reader[4]));
//                    pstmt.setString(6, reader[5]);
//                    pstmt.setDouble(7, Double.parseDouble(reader[6]));
//                    pstmt.setDouble(8, Double.parseDouble(reader[7]));
                    pstmt.executeUpdate();
                }
            }
            System.out.println("성공");
        } catch (Exception e) {
           e.printStackTrace();
        }
	}

}
