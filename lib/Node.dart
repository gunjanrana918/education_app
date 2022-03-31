class Node {
  String CourseName;
  String duration;
  String coverphoto_path;
  String charges;
  String Course_Description_Text;
  String Course_Description_Pdf_path;
  String Course_Description_Video;

  Node(this.CourseName, this.duration, this.coverphoto_path, this.charges,
      this.Course_Description_Text, this.Course_Description_Pdf_path,
      this.Course_Description_Video);

  Node.fromJson(String CourseName, String duration, String coverphoto_path,
      String charges, String Course_Description_Text,
      String Course_Description_Pdf_path, String Course_Description_Video){
    this.CourseName = CourseName;
    this.duration = duration;
    this.coverphoto_path = coverphoto_path;
    this.charges = charges;
    this.Course_Description_Text = Course_Description_Text;
    this.Course_Description_Pdf_path = Course_Description_Pdf_path;
    this.Course_Description_Video = Course_Description_Video;
  }
}
