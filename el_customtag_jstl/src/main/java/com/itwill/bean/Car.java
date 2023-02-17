package com.itwill.bean;

public class Car {
	private int no;			//property
	private String model;	//property
	private String color;	//property
	public Car() {
		// TODO Auto-generated constructor stub
	}
	public Car(int no, String model, String color) {
		super();
		this.no = no;
		this.model = model;
		this.color = color;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
}
