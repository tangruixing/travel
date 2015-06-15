package cn.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * EasyUI DataGrid模型
 * 
 * @author 孙宇
 * 
 */
public class Grid implements java.io.Serializable {

	private Long total = 0L;
	private List rows = Collections.emptyList();

	
	
	
	public Grid() {
		super();
	}

	public Grid(Long total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}
	
	

}
