class Nodeclass {
  String topicname;
  String shortdescription;
  String topicduration;
  String PDF_attechment_path;
  String Video_attechment_path;

  Nodeclass(this.topicname, this.shortdescription, this.topicduration, this.PDF_attechment_path,this.Video_attechment_path);

  Nodeclass.fromJson(String topicname, String shortdescription, String topicduration,String PDF_attechment_path, String  Video_attechment_path)
  {
    this.topicname = topicname;
    this.shortdescription = shortdescription;
    this.topicduration = topicduration;
    this.PDF_attechment_path = PDF_attechment_path;
    this.Video_attechment_path = Video_attechment_path;
  }
}
