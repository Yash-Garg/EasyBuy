bool isValidEmail(String e) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(e);
}

bool isValidNumber(String n) {
  return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(n);
}

bool isValidPassword(String p) {
  if (p.length < 8) {
    return false;
  } else {
    return true;
  }
}

bool isValidName(String n) {
  if (n.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
