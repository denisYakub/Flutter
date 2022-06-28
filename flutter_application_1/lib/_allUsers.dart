class Person {
  late String name;
  late int age;
  late String image;
  late String country;
  late String city;
  late String aboutMe;

  Person(
      this.name, this.age, this.image, this.country, this.city, this.aboutMe);
}

class UtilsPersons {
  static List getMockPersons() {
    return [
      Person('Denis Yakubov', 21, 'person', 'Russia', 'Spb',
          'Sport, Marvel, Parties'),
      Person('Ruslan Zavodchikov', 18, 'person', 'Russia', 'Spb',
          'Shool, Work, Dogs'),
      Person('Nikita Pojivin', 20, 'person', 'Russia', 'Moscow', 'Box, Clubs'),
      Person('Ana Tchareva', 22, 'person', 'Russia', 'Spb', 'Books Memes'),
      Person('Nick Volcov', 30, 'person', 'Russia', 'Kazani',
          'Work and more work'),
      Person('Dick Anderson', 69, 'person', 'USA', 'Boston', 'Sex'),
    ];
  }
}
