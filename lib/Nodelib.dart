class Nodelib {
  String CourseID;
  String CourseName;
  String coverphoto_path;
  String Course_Description_Text;
  String BuyOnDate_;
  Nodelib(this.CourseID, this.CourseName, this.coverphoto_path, this.Course_Description_Text,this.BuyOnDate_);

  Nodelib.fromJson(String CourseID, String CourseName, String coverphoto_path,String Course_Description_Text, String  BuyOnDate_)
  {
    this.CourseID = CourseID;
    this.CourseName = CourseName;
    this.coverphoto_path = coverphoto_path;
    this.Course_Description_Text = Course_Description_Text;
    this.BuyOnDate_ = BuyOnDate_;
  }
}
