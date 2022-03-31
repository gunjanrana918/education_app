class Nodeboard {
  String SubjectID;
  String BoardName;
  String classname;
  String SubjectName;
  String Description;
  String Date_;
  Nodeboard(this.SubjectID, this.BoardName, this.classname, this.SubjectName,this.Description,this.Date_);
  Nodeboard.fromJson(String SubjectID, String BoardName, String classname,String SubjectName, String Description,String Date_)
  {
    this.SubjectID = SubjectID;
    this.BoardName = BoardName;
    this.classname = classname;
    this.SubjectName = SubjectName;
    this.Description = Description;
    this.Date_ = Date_;
  }
}
