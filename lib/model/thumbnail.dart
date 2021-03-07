class Thumbnail{
  String path;
  String extension;
  String fullPath;

  Thumbnail({this.extension, this.path}){
    fullPath = this.path + '.' + this.extension;
  }
}