package com.ty.xmoa.model;

import org.apache.commons.lang.builder.ToStringBuilder;

public class OaPlan {

	private int plid;
	private String plName;
	private String fename;
	private String prname;
	private String rname;
	private String moname;
	private int pplid;
	private int flag;
	private String plCreateTime;
	private String plEndTime;
	private String plStartTime;
	private String plEndDate;
	private String plCreateDate;
	private String plMgr;
	private String plWorker;
	private long plDateNum;
	private String plLevel;
	private String plType;
	private String plDownTime;
	private String plHeadPlan;
	private String plStatus;
	private String plIsExceed;
	private int plExceedDate;
	private String plOther;
	private int isok;
	public int getIsok() {
		return isok;
	}
	public void setIsok(int isok) {
		this.isok = isok;
	}
	public int getPlid() {
		return plid;
	}
	public void setPlid(int plid) {
		this.plid = plid;
	}
	public String getPlName() {
		return plName;
	}
	public void setPlName(String plName) {
		this.plName = plName;
	}
	public String getFename() {
		return fename;
	}
	public void setFename(String fename) {
		this.fename = fename;
	}
	public int getPplid() {
		return pplid;
	}
	public void setPplid(int pplid) {
		this.pplid = pplid;
	}
	public String getPlWorker() {
		return plWorker;
	}
	public void setPlWorker(String plWorker) {
		this.plWorker = plWorker;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getPlCreateTime() {
		return plCreateTime;
	}
	public void setPlCreateTime(String plCreateTime) {
		this.plCreateTime = plCreateTime;
	}
	public String getPlEndTime() {
		return plEndTime;
	}
	public void setPlEndTime(String plEndTime) {
		this.plEndTime = plEndTime;
	}
	public String getPlStartTime() {
		return plStartTime;
	}
	public void setPlStartTime(String plStartTime) {
		this.plStartTime = plStartTime;
	}
	public String getPlEndDate() {
		return plEndDate;
	}
	public void setPlEndDate(String plEndDate) {
		this.plEndDate = plEndDate;
	}
	public String getPlCreateDate() {
		return plCreateDate;
	}
	public void setPlCreateDate(String plCreateDate) {
		this.plCreateDate = plCreateDate;
	}
	public String getPlMgr() {
		return plMgr;
	}
	public void setPlMgr(String plMgr) {
		this.plMgr = plMgr;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getMoname() {
		return moname;
	}
	public void setMoname(String moname) {
		this.moname = moname;
	}
	public long getPlDateNum() {
		return plDateNum;
	}
	public void setPlDateNum(long l) {
		this.plDateNum = l;
	}
	public String getPlLevel() {
		return plLevel;
	}
	public void setPlLevel(String plLevel) {
		this.plLevel = plLevel;
	}
	public String getPlType() {
		return plType;
	}
	public void setPlType(String plType) {
		this.plType = plType;
	}
	public String getPlDownTime() {
		return plDownTime;
	}
	public void setPlDownTime(String plDownTime) {
		this.plDownTime = plDownTime;
	}
	public String getPlHeadPlan() {
		return plHeadPlan;
	}
	public void setPlHeadPlan(String plHeadPlan) {
		this.plHeadPlan = plHeadPlan;
	}
	public String getPlStatus() {
		return plStatus;
	}
	public void setPlStatus(String plStatus) {
		this.plStatus = plStatus;
	}
	public String getPlIsExceed() {
		return plIsExceed;
	}
	public void setPlIsExceed(String plIsExceed) {
		this.plIsExceed = plIsExceed;
	}
	public int getPlExceedDate() {
		return plExceedDate;
	}
	public void setPlExceedDate(int plExceedDate) {
		this.plExceedDate = plExceedDate;
	}
	public String getPlOther() {
		return plOther;
	}
	public void setPlOther(String plOther) {
		this.plOther = plOther;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}
