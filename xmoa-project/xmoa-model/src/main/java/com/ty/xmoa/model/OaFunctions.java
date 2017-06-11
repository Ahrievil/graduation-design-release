package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * ���ܲ˵����po
 * @author Ahri6
 *
 */
public class OaFunctions {

	private int fid;
	private String fname;
	private String fhref;
	private int pid;//�����Ķ�Ӧ��fuid
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFhref() {
		return fhref;
	}
	public void setFhref(String fhref) {
		this.fhref = fhref;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	
}
