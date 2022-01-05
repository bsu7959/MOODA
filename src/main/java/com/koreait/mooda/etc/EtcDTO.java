package com.koreait.mooda.etc;

public class EtcDTO {

	private int e_fontsize;
	private String e_fontstyle;
	private String e_background;
	private String e_notice;
	
	
public int getE_fontsize() {
		return e_fontsize;
	}
	public void setE_fontsize(int e_fontsize) {
		this.e_fontsize = e_fontsize;
	}
	public String getE_fontstyle() {
		return e_fontstyle;
	}
	public void setE_fontstyle(String e_fontstyle) {
		this.e_fontstyle = e_fontstyle;
	}
	public String getE_background() {
		return e_background;
	}
	public void setE_background(String e_background) {
		this.e_background = e_background;
	}
	public String getE_notice() {
		return e_notice;
	}
	public void setE_notice(String e_notice) {
		this.e_notice = e_notice;
	}
	
	
@Override
	public String toString() {
		return "EtcDTO [e_fontsize=" + e_fontsize + ", e_fontstyle=" + e_fontstyle + ", e_background=" + e_background
				+ ", e_notice=" + e_notice + "]";
	}


}