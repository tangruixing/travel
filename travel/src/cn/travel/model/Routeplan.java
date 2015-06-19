
package cn.travel.model;

import java.io.Serializable;

import com.alibaba.fastjson.annotation.JSONField;

public class Routeplan implements Serializable{
	
	//columns START
	private java.lang.Integer id;		/*线路计划ID*/
	private java.lang.Integer sceId;		/*风景ID*/
	private java.lang.Integer rouId;		/*线路ID*/
	private java.lang.Integer step;		/*步骤*/
	private java.lang.Integer day;		/*停留天数*/
	private java.lang.String description;		/*描述*/
	//columns END

	@JSONField(serialize=false)
	private Scenery scenery;
	@JSONField(serialize=false)
	private Route route;
	
	public Routeplan(){
	}

	public Routeplan(
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
				this.scenery=new Scenery();
				this.getScenery().setId(value);				
			}
			this.sceId = value;
		}
		
		public java.lang.Integer getSceId() {
			return this.sceId;
		}
	
		public void setRouId(java.lang.Integer value) {
			if(value!=null){
				this.route=new Route();
				this.getRoute().setId(value);				
			}
			this.rouId = value;
		}
		
		public java.lang.Integer getRouId() {
			
			return this.rouId;
		}
	
		public void setStep(java.lang.Integer value) {
			this.step = value;
		}
		
		public java.lang.Integer getStep() {
			return this.step;
		}
	
		
		public java.lang.Integer getDay() {
			return day;
		}

		public void setDay(java.lang.Integer day) {
			this.day = day;
		}

		public void setDescription(java.lang.String value) {
			this.description = value;
		}
		
		public java.lang.String getDescription() {
			return this.description;
		}

		public Scenery getScenery() {
			return scenery;
		}

		public void setScenery(Scenery scenery) {
			this.scenery = scenery;
		}

		public Route getRoute() {
			return route;
		}

		public void setRoute(Route route) {
			this.route = route;
		}

	
}

