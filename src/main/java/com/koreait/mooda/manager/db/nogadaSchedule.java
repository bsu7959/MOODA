package com.koreait.mooda.manager.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class nogadaSchedule {
	public static void main(String[] args) {
		String file = "C:/Users/tongy/Programming/BigDataUI/Jsp/Mooda/src/main/java/com/koreait/mooda/nogada/schedule.txt";
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
                    sql = "insert into tb_schedule (s_useridx, s_alarm, s_date, s_time, s_content) values (?,?,?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    for(int i=1; i<6; i++) {
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
