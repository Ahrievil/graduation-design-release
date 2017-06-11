package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

public class OaFeature {

	private int feid;
	private String feName;
	private String prname;
	private String rname;
	private String moName;
	private int feNum;
	private String feLevel;
	private String feCreateTime;
	private String feother;
	private String reother;
	public int getFeid() {
		return feid;
	}
	public void setFeid(int feid) {
		this.feid = feid;
	}
	public String getFeName() {
		return feName;
	}
	public void setFeName(String feName) {
		this.feName = feName;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getFeLevel() {
		return feLevel;
	}
	public void setFeLevel(String feLevel) {
		this.feLevel = feLevel;
	}
	public String getMoName() {
		return moName;
	}
	public void setMoName(String moName) {
		this.moName = moName;
	}
	public int getFeNum() {
		return feNum;
	}
	public void setFeNum(int feNum) {
		this.feNum = feNum;
	}
	public String getFeCreateTime() {
		return feCreateTime;
	}
	public void setFeCreateTime(String feCreateTime) {
		this.feCreateTime = feCreateTime;
	}

	public String getFeother() {
		return feother;
	}
	public void setFeother(String feother) {
		this.feother = feother;
	}
	public String getReother() {
		return reother;
	}
	public void setReother(String reother) {
		this.reother = reother;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
