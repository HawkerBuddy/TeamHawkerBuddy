class IDdetails {
  //Default Constructor

  static DateTime time = DateTime.now();

  static String timeStamp() {
    return time.year.toString() +
        '/' +
        time.month.toString() +
        '/' +
        time.day.toString() +
        ' ' +
        time.hour.toString() +
        ":" +
        time.minute.toString() +
        ":" +
        time.second.toString();
  }

  static String orderNumberID() {
    return time.year.toString() +
        time.month.toString() +
        time.day.toString() +
        time.hour.toString() +
        time.minute.toString() +
        time.second.toString();
  }
}
