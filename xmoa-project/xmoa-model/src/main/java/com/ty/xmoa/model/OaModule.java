package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

public class OaModule {

	private int moid;
	private String moName;
	private String moMark;
	private String prname;
	private String rname;
	private String reLevel;
	private String moCreateTime;
	private String moChangTime;
	private String moOther;
	private String reOther;
	public int getMoid() {
		return moid;
	}
	public void setMoid(int moid) {
		this.moid = moid;
	}
	public String getMoName() {
		return moName;
	}
	public void setMoName(String moName) {
		this.moName = moName;
	}
	public String getMoMark() {
		return moMark;
	}
	public void setMoMark(String moMark) {
		this.moMark = moMark;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getReLevel() {
		return reLevel;
	}
	public void setReLevel(String reLevel) {
		this.reLevel = reLevel;
	}
	public String getMoCreateTime() {
		return moCreateTime;
	}
	public void setMoCreateTime(String moCreateTime) {
		this.moCreateTime = moCreateTime;
	}
	public String getMoChangTime() {
		return moChangTime;
	}
	public void setMoChangTime(String moChangTime) {
		this.moChangTime = moChangTime;
	}
	public String getMoOther() {
		return moOther;
	}
	public void setMoOther(String moOther) {
		this.moOther = moOther;
	}
	public String getReOther() {
		return reOther;
	}
	public void setReOther(String reOther) {
		this.reOther = reOther;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
