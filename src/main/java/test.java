import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		Connection conn = null;
		Scanner sc;
		String file1 = "C:/sangu/Jsp/interest.txt";
		String interest = "";
		String sql = "";
		PreparedStatement pstmt;
		
		try {
			String url = "jdbc:mysql://localhost:3306/mooda";
			String uid = "root";
			String upw = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, uid, upw);
			sc = new Scanner(new FileInputStream(file1));
			while(sc.hasNextLine()) {
				interest = sc.nextLine();
				sql = "insert into tb_interest(i_name) values(?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, interest);
				pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
