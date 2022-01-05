package com.koreait.mooda.manager.notice;

public class NoticeDTO {
	
	private int n_idx;
	private String n_title;
	private String n_writer;
	private String n_date;
	private int n_hit;
	private String n_content;
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	@Override
	public String toString() {
		return "NoticeDTO [n_idx=" + n_idx + ", n_title=" + n_title + ", n_writer=" + n_writer + ", n_date=" + n_date
				+ ", n_hit=" + n_hit + ", n_content=" + n_content + "]";
	}
	
	
	
}
