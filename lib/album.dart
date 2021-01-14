class Album {
  final String title;
  final String artist;
  final int year;
  final String coverUrl;
  String tag;

  Album(this.title, this.artist, this.year, this.coverUrl) {
    this.tag = "$title:$artist:$year:$coverUrl";
  }
}
