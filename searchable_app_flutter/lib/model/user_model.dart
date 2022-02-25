class Users {
  final String name;
  final String userName;
  final String imageAd;
  bool isFollowed;

  Users(this.name, this.userName, this.imageAd, this.isFollowed);
}

List<Users> listOfUsers = [
  Users("Wentworth Miller", "@Miller", "assets/images/wentworth.jpg", false),
  Users("Dominic Purcellr", "@Purcellr", "assets/images/Dominic.png", false),
  Users("Amaury Nolasco", "@Nolasco", "assets/images/Nolasco.jpg", false),
  Users("Sarah Wayne Callies", "@Callies", "assets/images/sara.jpg", false),
  Users("Robert Knepper", "@Knepper", "assets/images/robert.jpg", false),
  Users("Paul Adelstein", "@Adelstein", "assets/images/adel.jpg", false),
  Users("Rockmond Dunbar", "@Dunbar", "assets/images/Rockmond.png", false),
  Users("Wade Williams", "@Williams", "assets/images/wade.jpg", false),
  Users("Jodi Lyn O'Keefe", "@OKeefe", "assets/images/jody.jpg", false),
  Users("William Fichtner", "@Fichtner", "assets/images/wiliam.jpg", false),
];
