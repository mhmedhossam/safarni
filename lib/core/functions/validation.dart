String? validEmail(String? email) {
  if (email == null || email.isEmpty) return "please enter your email";

  // General email pattern
  final pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?"
      r"(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)*$";
  final regExp = RegExp(pattern);

  // Check general email format
  if (!regExp.hasMatch(email.trim()) ||
      !email.trim().toLowerCase().endsWith('@gmail.com')) {
    return "please enter a valid email";
  }
  return null;
}

//---------------validation date -----------//
String? dateValidator(String? value) {
  if (value == null || value.isEmpty) return 'Required';

  final parts = value.split('-');
  if (parts.length != 3) return 'Invalid date';

  final day = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final year = int.tryParse(parts[2]);

  if (day == null || month == null || year == null) {
    return 'Invalid date';
  }

  if (month < 1 || month > 12) {
    return 'Month from 1 to 12';
  }

  if (day < 1 || day > 31) {
    return 'Invalid day';
  }

  return null;
}
//-----------------password--------------------//

String? validatePassword(String? password) {
  final regex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

  if (password == null || password.isEmpty) {
    return 'Password cannot be empty';
  } else if (!regex.hasMatch(password)) {
    return 'Password must be at least 8 characters and contain at least one special character';
  }

  return null;
}

//----------------name-------------------------//

String? validName(String? name) {
  if (name == null || name.isEmpty) return "please enter your name ";

  // Must be 3 characters or more and only letters + spaces
  final regex = RegExp(r"^[a-zA-Z\s]{3,}$");
  if (!regex.hasMatch(name.trim())) {
    return "enter your full name ";
  }
  return null;
}

//========================phone number=====================//

String? validatePhone({required String? value}) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  // Only digits
  final RegExp phoneRegExp = RegExp(r'^[0-9]+$');
  if (!phoneRegExp.hasMatch(value)) {
    return 'Phone number must contain only digits';
  }

  // Check length (example: 10 digits)
  if (value.length != 11) {
    return 'Phone number must be 11 digits';
  }

  // Optional: check prefix for Egypt
  if (!value.startsWith('01')) {
    return 'Phone number must start with 01';
  }

  return null; // valid
}

//------validcvv-------//

String? validCvv(String? value) {
  if (value == null || value.isEmpty) {
    return "Required";
  }

  if (value.length < 3) {
    return "required 3 numbers";
  }
  return null;
}
