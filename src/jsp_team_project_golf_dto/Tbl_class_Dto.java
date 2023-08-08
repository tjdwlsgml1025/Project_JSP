package jsp_team_project_golf_dto;

/*REGIST_MONTH
C_NO
CLASS_AREA
TUITION
TEACHER_CODE*/

public class Tbl_class_Dto {
 private int c_no;
 private String class_area;
 private int tuition;
 private int teacher_code;
 
 
 public Tbl_class_Dto() {}


public Tbl_class_Dto(int c_no, String class_area, int tuition, int teacher_code) {
	super();
	this.c_no = c_no;
	this.class_area = class_area;
	this.tuition = tuition;
	this.teacher_code = teacher_code;
}


public int getC_no() {
	return c_no;
}


public void setC_no(int c_no) {
	this.c_no = c_no;
}


public String getClass_area() {
	return class_area;
}


public void setClass_area(String class_area) {
	this.class_area = class_area;
}


public int getTuition() {
	return tuition;
}


public void setTuition(int tuition) {
	this.tuition = tuition;
}


public int getTeacher_code() {
	return teacher_code;
}


public void setTeacher_code(int teacher_code) {
	this.teacher_code = teacher_code;
}

 
 
 
 
 
}

