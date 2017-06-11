package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

public class OaProject {

	private int prid;
	private String prName;
	private String prClient;
	private String prMgr;
	private int prNum;
	private float prMoney;
	private String prStatus;
	private float prCost;
	private String prStartTime;//date
	private String prEndTime;//date
	private String prStart;//date
	private String prEnd;//date
	private String prSetup;//date
	private String prLevel;
	private String prChangTime;//date  yyyy-MM-dd hh24:mi:ss
	private String prExceed;
	private int prExceedTime;
	private String prOther;
	public int getPrid() {
		return prid;
	}
	public void setPrid(int prid) {
		this.prid = prid;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
	public String getPrClient() {
		return prClient;
	}
	public void setPrClient(String prClient) {
		this.prClient = prClient;
	}
	public String getPrMgr() {
		return prMgr;
	}
	public void setPrMgr(String prMgr) {
		this.prMgr = prMgr;
	}
	public int getPrNum() {
		return prNum;
	}
	public void setPrNum(int prNum) {
		this.prNum = prNum;
	}
	public float getPrMoney() {
		return prMoney;
	}
	public void setPrMoney(float prMoney) {
		this.prMoney = prMoney;
	}
	public String getPrStatus() {
		return prStatus;
	}
	public void setPrStatus(String prStatus) {
		this.prStatus = prStatus;
	}
	public float getPrCost() {
		return prCost;
	}
	public void setPrCost(float prCost) {
		this.prCost = prCost;
	}
	public String getPrStartTime() {
		return prStartTime;
	}
	public void setPrStartTime(String prStartTime) {
		this.prStartTime = prStartTime;
	}
	public String getPrEndTime() {
		return prEndTime;
	}
	public void setPrEndTime(String prEndTime) {
		this.prEndTime = prEndTime;
	}
	public String getPrStart() {
		return prStart;
	}
	public void setPrStart(String prStart) {
		this.prStart = prStart;
	}
	public String getPrEnd() {
		return prEnd;
	}
	public void setPrEnd(String prEnd) {
		this.prEnd = prEnd;
	}
	public String getPrSetup() {
		return prSetup;
	}
	public void setPrSetup(String prSetup) {
		this.prSetup = prSetup;
	}
	public String getPrLevel() {
		return prLevel;
	}
	public void setPrLevel(String prLevel) {
		this.prLevel = prLevel;
	}
	public String getPrChangTime() {
		return prChangTime;
	}
	public void setPrChangTime(String prChangTime) {
		this.prChangTime = prChangTime;
	}
	public String getPrExceed() {
		return prExceed;
	}
	public void setPrExceed(String prExceed) {
		this.prExceed = prExceed;
	}
	public int getPrExceedTime() {
		return prExceedTime;
	}
	public void setPrExceedTime(int prExceedTime) {
		this.prExceedTime = prExceedTime;
	}
	public String getPrOther() {
		return prOther;
	}
	public void setPrOther(String prOther) {
		this.prOther = prOther;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
