class Nodetopic {
  String topicname;
  String shortdescription;
  String topicduration;
  String PDF_attechment_path;
  String Video_attechment_path;
  String liveclass_link;

  Nodetopic(this.topicname, this.shortdescription, this.topicduration, this.PDF_attechment_path,this.Video_attechment_path,this.liveclass_link);

  Nodetopic.fromJson(String topicname, String shortdescription, String topicduration,String PDF_attechment_path, String  Video_attechment_path,String liveclass_link)
  {
    this.topicname = topicname;
    this.shortdescription = shortdescription;
    this.topicduration = topicduration;
    this.PDF_attechment_path = PDF_attechment_path;
    this.Video_attechment_path = Video_attechment_path;
    this.liveclass_link = liveclass_link;
  }
}
