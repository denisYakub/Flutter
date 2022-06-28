enum AuthStat {
  notlogged,
  logged,
}

class CurUser {
  late String name;
  late int age;
  late String image;
  late String country;
  late String city;
  late String mail;
  late String password;
  AuthStat stat = AuthStat.notlogged;

  CurUser(this.name, this.age, this.image, this.country, this.city, this.mail,
      this.password);
}

class UtilCurUser {
  static CurUser getuser() {
    return CurUser('Denis Yakubov', 21, 'person', 'Russia', 'Spb',
        'denisyakubov321@gmail.com', 'd89218840117D');
  }
}
