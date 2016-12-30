package ren.ayane.core.action;

import ren.ayane.core.page.PageResult;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	protected String[] selectedRow;
	protected PageResult pageResult;
	private int page;
	private int rows;
	
	// 默认页大小
	public static int DEFAULT_ROWS = 2;
	
	public String[] getSelectedRow() {
		return selectedRow;
	}
	public void setSelectedRow(String[] selectedRow) {
		this.selectedRow = selectedRow;
	}
	public PageResult getPageResult() {
		return pageResult;
	}
	public void setPageResult(PageResult pageResult) {
		this.pageResult = pageResult;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

}
