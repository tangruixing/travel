package cn.model;


public class Page {

	// 传递的参数或配置的值
	private int page; // 当前页
	private int rows; // 每页显示多少条记录
	
	private String sort;
	private String order;

	
	public Page() {
		super();
	}

	public Page(int page, int rows) {
		super();
		this.page = page;
		this.rows = rows;
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
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	
	
}
