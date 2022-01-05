package com.koreait.mooda.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class nogadaFollow {

	public static void main(String[] args) {
		String file = "C:/Users/bsu79/Desktop/nogadatxt/follow.txt";
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
                    sql = "insert into tb_following (f_useridx, f_targetidx) values (?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, reader[1]);
                    pstmt.setString(2, reader[2]);
                    pstmt.executeUpdate();
                }
            }
            System.out.println("성공");
        } catch (Exception e) {
           e.printStackTrace();
        }

	}

}
