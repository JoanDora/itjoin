package com.itjoin.util;

public class Pagination {
	   /**
     * 一页数据默认20条
     */
    private int pageSize = 10;
    /**
     * 当前页码
     */
    private int pageNo;

    /**
     * 上一页
     */
    private int upPage;

    /**
     * 下一页
     */
    private int nextPage;
    /**
     * 一共有多少条数据
     */
    private long totalCount;

    /**
     * 一共有多少页
     */
    private int totalPage;
    /**
     * 数据集合
     */
    private Object content;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getUpPage() {
		return upPage;
	}
	public void setUpPage(int upPage) {
		this.upPage = upPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		if(totalCount%pageSize!=0){
			totalPage = (int) (totalCount/pageSize +1);
		}else{
			totalPage = (int) (totalCount/pageSize);
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public Object getContent() {
		return content;
	}
	public void setContent(Object content) {
		this.content = content;
	}

	
    
    
}
