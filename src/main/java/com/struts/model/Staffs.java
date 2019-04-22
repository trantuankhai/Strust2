package com.struts.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "STAFFS")
public  class  Staffs  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_STAFFS" , nullable = false)
	private int id_staffs;
	@ManyToOne()
	@JoinColumn(name = "DEPARTS_ID_DEPARTS",nullable = false)
	private Departs departs;
	@Column(name = "NAME",nullable= false)
	private String name;
	@Column(name = "GENDER",nullable= false)
	private int gender;
	@Column(name = "BIRTHDAY",nullable = false)
	private java.lang.String birthday;
	@Column(name = "EMAIL",nullable= false)
	private String email;
	@Column(name = "PHONE",nullable= false)
	private String phone;
	@Column(name = "NOTE")
	private String note;
	public Staffs(Departs departs, String name, int gender, String birthday, String email, String phone, String note) {
		super();
		this.departs = departs;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.note = note;
	}
	public Staffs() {
		// TODO Auto-generated constructor stub
	}
	public int getId_staffs() {
		return id_staffs;
	}
	public void setId_staffs(int id_staffs) {
		this.id_staffs = id_staffs;
	}
	public Departs getDeparts() {
		return departs;
	}
	public void setDeparts(Departs departs) {
		this.departs = departs;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public java.lang.String getBirthday() {
		return birthday;
	}
	public void setBirthday(java.lang.String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
 
}
