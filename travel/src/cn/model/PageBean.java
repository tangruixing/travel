package cn.model;

import java.util.List;
 
public class PageBean {
 
	//传递的参数或配置的值
	private long 	currentPage 	;  //当前页
	public static  int pageSize= 8		;  //每页显示多少条记录
	private String  urlPrix;

	//查询数据库
	private List 	recordList		;  //本页数据列表
	private long 	recordCount		;  //总记录数
	
	//计算（由变量固定）
	private long 	pageCount		;  //总页数
	private long 	beginPageIndex	;  //页码列表的开始索引
	private long 	endPageIndex	;  //页码列表的结束索引
	
 
	
	public PageBean(int currentPage,  long recordCount,
			List recordList,Integer pageSize) {
		super();
		this.currentPage = currentPage;
		this.recordList = recordList;
		this.recordCount = recordCount;
		
		//根据传入size参数判断是否使用默认长度
 
		 int intRows =( pageSize == null || pageSize == 0) ? PageBean.pageSize
				 : pageSize;
		pageMeg(currentPage,recordList,recordCount,intRows);
		
	}
	public void pageMeg(int currentPage,  List recordList,
			long recordCount,int size){
		//计算pageCount
				this.pageCount=(recordCount+size-1)/size;
				
				//计算beginPageIndex与endPageIndex
				//总页码小于10
				if(pageCount<=10){
					//全部显示
					beginPageIndex=1;
					endPageIndex=pageCount;
				}
				//总页码大于10
				else{
					//显示当前页面附近10个页码（前4+当前+后5）
					beginPageIndex=currentPage-4;
					endPageIndex=currentPage+5;
					//算完后，当前页前小于4个，显示10个页码
					if(beginPageIndex<1){
						beginPageIndex=1;
						endPageIndex=10;
					}
					//当前页后不足5个，显示后10个页码
					else if(endPageIndex>pageCount){
						endPageIndex=pageCount;
						beginPageIndex=pageCount-9;
					}
				}
	}
	
	public List getRecordList() {
		return recordList;
	}
	public void setRecordList(List recordList) {
		this.recordList = recordList;
	}
	public long getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(long currentPage) {
		this.currentPage = currentPage;
	}
 
	public long getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(long recordCount) {
		this.recordCount = recordCount;
	}
	public long getPageCount() {
		return pageCount;
	}
	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}
	public long getBeginPageIndex() {
		return beginPageIndex;
	}
	public void setBeginPageIndex(long beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}
	public long getEndPageIndex() {
		return endPageIndex;
	}
	public void setEndPageIndex(long endPageIndex) {
		this.endPageIndex = endPageIndex;
	}
	public String getUrlPrix() {
		return urlPrix;
	}
	public void setUrlPrix(String urlPrix) {
		this.urlPrix = urlPrix;
	}
	
	
	
	
}
