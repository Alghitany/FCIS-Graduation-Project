bool isValidEmail(String email) {
  String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return "Password can't be empty";
  } else if (value.length < 8) {
    return "Password must be at least 8 characters long";
  }
  return null;
}

String? confirmPasswordValidator(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return 'Please confirm your password';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateName(String value) {
  if (value.isEmpty) {
    return "First name is required";
  } else if (value.length < 2) {
    return "First name must be at least 2 characters";
  } else if (value.length > 30) {
    return "First name must be less than 30 characters";
  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
    return "First name should only contain letters";
  }
  return null; // Valid input
}