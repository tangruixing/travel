
package cn.travel.model;

import java.io.Serializable;

public class Images implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*图片编号*/
	private java.lang.Integer sceId;		/*风景ID*/
	private String name;
	private java.lang.String description;		/*图片描述*/
	private java.lang.String url;		/*图片路径*/
	//columns END
	
	private Scenery scenery;
	private User user;

	public Images(){
	}

	public Images(
		java.lang.Integer id
	){
		this.id = id;
	}

	
		public void setId(java.lang.Integer value) {
			this.id = value;
		}
		
		public java.lang.Integer getId() {
			return this.id;
		}
	
		public void setSceId(java.lang.Integer value) {
			
			if(value!=null){
				scenery=new Scenery();
				scenery.setId(value);
			}
			this.sceId = value;
		}
		
		public java.lang.Integer getSceId() {
			return this.sceId;
		}
	
		public void setDescription(java.lang.String value) {
			this.description = value;
		}
		
		public java.lang.String getDescription() {
			return this.description;
		}
	
		public void setUrl(java.lang.String value) {
			this.url = value;
		}
		
		public java.lang.String getUrl() {
			return this.url;
		}

		public Scenery getScenery() {
			return scenery;
		}

		public void setScenery(Scenery scenery) {
			this.scenery = scenery;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		
		
		
		
		
}

