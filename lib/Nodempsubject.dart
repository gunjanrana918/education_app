class Nodempsubject {
  String Subjectid;
  String boardname;
  String classname;
  String sujectname;
  String description;
  String duration;
  String fees;
  String pdflink;
  String videolink;


  Nodempsubject(this.Subjectid,this.boardname, this.classname, this.sujectname, this.description,
      this.duration, this.fees,this.pdflink,this.videolink);

  Nodempsubject.fromJson(String Subjectid,String boardname, String classname, String sujectname, String description,
      String duration, String fees, String pdflink,String videolink)
  {
    this.Subjectid=Subjectid;
    this.boardname = boardname;
    this.classname = classname;
    this.sujectname = sujectname;
    this.description = description;
    this.duration = duration;
    this.fees = fees;
    this.pdflink = pdflink;
    this.videolink = videolink;
  }
}
