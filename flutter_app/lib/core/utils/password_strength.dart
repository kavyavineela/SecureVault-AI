enum PasswordStrength {
  weak,
  medium,
  strong,
}

class PasswordStrengthChecker {
  static PasswordStrength check(String password) {
    int score = 0;

    // Length
    if (password.length >= 8) score++;
    if (password.length >= 12) score++;

    // Uppercase
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;

    // Lowercase
    if (RegExp(r'[a-z]').hasMatch(password)) score++;

    // Number
    if (RegExp(r'[0-9]').hasMatch(password)) score++;

    // Special Character
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

    if (score >= 6) {
      return PasswordStrength.strong;
    } else if (score >= 4) {
      return PasswordStrength.medium;
    } else {
      return PasswordStrength.weak;
    }
  }
}