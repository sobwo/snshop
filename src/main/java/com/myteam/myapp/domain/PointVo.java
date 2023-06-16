package com.myteam.myapp.domain;

public class PointVo {
	private int pointNo, memberNo, point;


	private String expiration, pointInfo,useStatus,useHistory,useDetail,useDate;
	
	/*포인트 적립부분 임시*/
    public int getFinishPoint() {
        return point; // 또는 해당 필드에 맞는 반환값을 설정하세요.
    }
    public String getOrderNum() {
        return useDetail; // 또는 해당 필드에 맞는 반환값을 설정하세요.
    }

	/* 포인트 적립부분 임시 */
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getExpiration() {
		return expiration;
	}
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	public String getPointInfo() {
		return pointInfo;
	}
	public void setPointInfo(String pointInfo) {
		this.pointInfo = pointInfo;
	}
	public String getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}
	public String getUseHistory() {
		return useHistory;
	}
	public void setUseHistory(String useHistory) {
		this.useHistory = useHistory;
	}
	public String getUseDetail() {
		return useDetail;
	}
	public void setUseDetail(String useDetail) {
		this.useDetail = useDetail;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
}
