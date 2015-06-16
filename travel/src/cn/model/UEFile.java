package cn.model;

public class UEFile {

	private String state;
	private String original;
	private long size;
	private String title;
	private String type;
	private String url;
	
	
	
	
	
	public UEFile() {
		super();
	}
	public UEFile(String state, String original, long size, String title,
			String type, String url) {
		super();
		this.state = state;
		this.original = original;
		this.size = size;
		this.title = title;
		this.type = type;
		this.url = url;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getOriginal() {
		return original;
	}
	public void setOriginal(String original) {
		this.original = original;
	}
	
	
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
