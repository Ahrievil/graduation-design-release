package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * �û����Ӧ��po
 * @author Ahri6
 *
 */
public class OaUser {

	
	private int usid;
	private String uname;
	private String upwd;
	private String usex;
	private String ubirthdate;
	private String uidNum;
	private String uemail;
	private String utell;
	private String uadd;
	private String ustatus;
	private String urole;
	private String ubankName;
	private String ubankAcc;
	private float upay;
	private float ureward;
	private float upaje;
	private String uhiredate;
	private String upost;
	private String uother;
	private int uage;
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUbirthdate() {
		return ubirthdate;
	}
	public void setUbirthdate(String ubirthdate) {
		this.ubirthdate = ubirthdate;
	}
	public String getUidNum() {
		return uidNum;
	}
	public void setUidNum(String uidNum) {
		this.uidNum = uidNum;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtell() {
		return utell;
	}
	public void setUtell(String utell) {
		this.utell = utell;
	}
	public String getUadd() {
		return uadd;
	}
	public void setUadd(String uadd) {
		this.uadd = uadd;
	}
	public String getUstatus() {
		return ustatus;
	}
	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}
	public String getUrole() {
		return urole;
	}
	public void setUrole(String urole) {
		this.urole = urole;
	}
	public String getUbankName() {
		return ubankName;
	}
	public void setUbankName(String ubankName) {
		this.ubankName = ubankName;
	}
	public String getUbankAcc() {
		return ubankAcc;
	}
	public void setUbankAcc(String ubankAcc) {
		this.ubankAcc = ubankAcc;
	}
	public float getUpay() {
		return upay;
	}
	public void setUpay(float upay) {
		this.upay = upay;
	}
	public String getUpost() {
		return upost;
	}
	public void setUpost(String upost) {
		this.upost = upost;
	}
	public float getUreward() {
		return ureward;
	}
	public void setUreward(float ureward) {
		this.ureward = ureward;
	}
	public float getUpaje() {
		return upaje;
	}
	public void setUpaje(float upaje) {
		this.upaje = upaje;
	}
	public String getUhiredate() {
		return uhiredate;
	}
	public void setUhiredate(String uhiredate) {
		this.uhiredate = uhiredate;
	}
	public String getUother() {
		return uother;
	}
	public void setUother(String uother) {
		this.uother = uother;
	}
	
	public int getUage() {
		return uage;
	}
	public void setUage(int uage) {
		this.uage = uage;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
