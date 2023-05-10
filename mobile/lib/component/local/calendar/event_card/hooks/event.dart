class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvent = [
  const Event('Today\'s Event 1'),
  const Event('Today\'s Event 2'),
];
