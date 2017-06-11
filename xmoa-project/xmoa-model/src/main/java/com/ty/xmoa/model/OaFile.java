package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

public class OaFile {

	private int flid;
	private String flName;
	private long flSize;
	private String flType;
	private String prName;
	private String flupdate;
	private String fluper;
	public int getFlid() {
		return flid;
	}
	public void setFlid(int flid) {
		this.flid = flid;
	}
	public String getFluper() {
		return fluper;
	}
	public void setFluper(String fluper) {
		this.fluper = fluper;
	}
	public String getFlName() {
		return flName;
	}
	public void setFlName(String flName) {
		this.flName = flName;
	}

	public long getFlSize() {
		return flSize;
	}
	public void setFlSize(long flSize) {
		this.flSize = flSize;
	}
	public String getFlType() {
		return flType;
	}
	public void setFlType(String flType) {
		this.flType = flType;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
	public String getFlupdate() {
		return flupdate;
	}
	public void setFlupdate(String flupdate) {
		this.flupdate = flupdate;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}
