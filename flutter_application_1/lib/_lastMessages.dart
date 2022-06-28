import '_allUsers.dart';

class LastMessage {
  late Person user;
  late String message;
  late bool readStat;
  LastMessage(this.user, this.message, this.readStat);
}

class UtilsLastMessage {
  static List getMockLastMessage() {
    return [
      LastMessage(
          Person('Ruslan Zavodchikov', 18, 'person', 'Russia', 'Spb',
              'Shool, Work, Dogs'),
          'Hi',
          true),
      LastMessage(
          Person('Ana Tchareva', 22, 'person', 'Russia', 'Spb', 'Books Memes'),
          'Sup bro',
          false)
    ];
  }
}
