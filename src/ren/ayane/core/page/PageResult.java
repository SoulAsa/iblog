package ren.ayane.core.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页对象
 * @author SoulAsa
 *
 */
public class PageResult {

	// 总记录数
	private long totalCount;
	// 当前页号
	private int pageNo;
	// 总页数
	private int totalPageCount;
	// 页大小
	private int pageSize;
	// 列表记录
	private List items;
	
	public PageResult() {
		
	}
	
	// 构造分页对象
	public PageResult(long totalCount, int pageNo, int pageSize, List items) {
		this.totalCount = totalCount;
		this.items = items==null?new ArrayList():items;
		if (totalCount > 0) {
			this.pageNo = pageNo;
			int tem = (int)totalCount/pageSize;
			totalPageCount = totalCount%pageSize==0?tem:(tem+1);
		} else {
			this.pageNo = 0;
			this.totalPageCount = 0;
		}
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getItems() {
		return items;
	}
	public void setItems(List items) {
		this.items = items;
	}
	
}
