
package cn.travel.model;

import java.io.Serializable;

public class Images implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*图片编号*/
	private java.lang.Integer sceId;		/*风景ID*/
	private String name;
	private java.lang.String caption;		/*图片描述*/
	private java.lang.String image;		/*图片路径*/
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

		public java.lang.String getCaption() {
			return caption;
		}

		public void setCaption(java.lang.String caption) {
			this.caption = caption;
		}

		public java.lang.String getImage() {
			return image;
		}

		public void setImage(java.lang.String image) {
			this.image = image;
		}

		
		
		
		
		
}

