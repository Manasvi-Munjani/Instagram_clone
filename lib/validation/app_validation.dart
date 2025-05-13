String? emptyValidation(String? value, String errMessage) {
  if (value == null || value.isEmpty) {
    return errMessage;
  }
  return null;
}

String? emailValidation(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email)) {
    return 'Enter valid email address';
  }
  return null;
}

String? passwordValidation(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  }
  if (password.length < 8) {
    return 'Enter valid password';
  }
  return null;
}
