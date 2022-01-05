package com.koreait.mooda.following;

public class FollowingDTO {
	
	private int f_idx;
	private int f_useridx;
	private int f_targetidx;
	private String f_regdate;
	
	
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public int getF_useridx() {
		return f_useridx;
	}
	public void setF_useridx(int f_useridx) {
		this.f_useridx = f_useridx;
	}
	public int getF_targetidx() {
		return f_targetidx;
	}
	public void setF_targetidx(int f_targetidx) {
		this.f_targetidx = f_targetidx;
	}
	public String getF_regdate() {
		return f_regdate;
	}
	public void setF_regdate(String f_regdate) {
		this.f_regdate = f_regdate;
	}
	@Override
	public String toString() {
		return "FollowingDTO [f_idx=" + f_idx + ", f_useridx=" + f_useridx + ", f_targetidx=" + f_targetidx
				+ ", f_regdate=" + f_regdate + "]";
	}
	
	
}
