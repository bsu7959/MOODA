package com.koreait.mooda.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class nogadaReply {

	public static void main(String[] args) {
		String file = "C:/Users/bsu79/Desktop/nogadatxt/reply.txt";
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
                    sql = "insert into tb_reply (r_useridx, r_cidx, r_text) values (?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    for(int i=1; i<4; i++) {
                    	pstmt.setString(i, reader[i]);
                    }
                    pstmt.executeUpdate();
                }
            }
            System.out.println("성공");
        } catch (Exception e) {
           e.printStackTrace();
        }
	}

}
