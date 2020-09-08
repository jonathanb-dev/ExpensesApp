extension CompareDate on DateTime {
  bool isDateEqualTo(DateTime date) {
    return this.year == date.year && this.month == date.month && this.day == date.day;
  }
}