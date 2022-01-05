package com.koreait.mooda.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class nogadaMember {

	public static void main(String[] args) {
		String file = "C:/Users/bsu79/Desktop/nogadatxt/member.txt";
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
                    sql = "insert into tb_member (m_userid, m_userpw, m_name, m_email, m_hp, m_nickname, m_birth, m_interest, m_open) " +
                            "values (?,?,?,?,?,?,?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    for (int i=0; i<9; i++) {
                        pstmt.setString(i+1, reader[i]);
                    }
                    pstmt.executeUpdate();
                }
            }
            System.out.println("성공");
        } catch (Exception e) {
            System.out.println("실패");
        }
	}

}

