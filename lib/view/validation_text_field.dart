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
    return "Name is required";
  } else if (value.length < 2) {
    return "name must be at least 2 characters";
  } else if (value.length > 30) {
    return "Name must be less than 30 characters";
  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
    return "Name should only contain letters";
  }
  return null; // Valid input
}

bool validateURL(String url) {
  const urlPattern =
      r'^(https?|ftp)://[^\s/$.?#].[^\s]*$'; // RegEx pattern for URL validation
  final regExp = RegExp(urlPattern);
  return regExp.hasMatch(url);
}

bool isValidPositiveInteger(String input) {
  final RegExp regex = RegExp(r'^[1-9]\d*$');
  return regex.hasMatch(input);
}

String? validateDescription(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Description cannot be empty";
  }
  if (value.length < 10) {
    return "Description must be at least 10 characters long";
  }
  if (value.length > 500) {
    return "Description cannot exceed 500 characters";
  }
  return null;
}