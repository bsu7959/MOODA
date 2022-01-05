package com.koreait.mooda.manager.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	// SqlSessionFactory sqlsession을 static으로 메모리에 올려준다.
	private static SqlSessionFactory sqlsession;
	// singleton? 으로 클래스 실행시 한번만 메모리에 올려주기 위해서 선언해줌
	static {
		try {
			// resource = (db연결정보)
			String resource = "com/koreait/mooda/manager/db/config.xml";
			// config.xml에 저장된 경로로 접근하여 정보를 읽어옴
			Reader reader = Resources.getResourceAsReader(resource);
			
			// SqlSessionFactoryBuilder를통하여 저장된 정보를 읽어온 세션객체 생성
			sqlsession = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// getSqlMapInstance()함수를 사용하면 이제 mapperclass에 접근해서 설정해준 sql문들을
	// 접근해서 처리하고 읽은 결과값을 map형식으로 리턴해주는 sqlsession객체가 반환된다.
	public static SqlSessionFactory getSqlMapInstance() {
		return sqlsession;
	}
}

