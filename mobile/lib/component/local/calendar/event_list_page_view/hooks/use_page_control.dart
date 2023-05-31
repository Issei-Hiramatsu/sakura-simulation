void goFrontPage(DateTime focusedDay) {
  focusedDay = DateTime(
    focusedDay.year,
    focusedDay.month,
    focusedDay.day + 1,
  );
}

void goBackPage(DateTime focusedDay) {
  focusedDay = DateTime(
    focusedDay.year,
    focusedDay.month,
    focusedDay.day - 1,
  );
}
