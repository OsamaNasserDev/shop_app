class InputValidator {

  static String? isEmailValid(String? email) {
    if (email!.trim().isEmpty) {
      return "email must not be empty";
    } else if (!email.endsWith("@gmail.com")) {
      return "email must end with  @gmail.com ";
    } else
      return null;
  }

  static String? isPasswordValid(String? password) {
    if (password!.trim().isEmpty) {
      return "password must not be empty";
    } else if (password.length < 6) {
      return "week password";
    } else
      return null;
  }

  static String? isPhoneValid(String? phone) {
    if (phone!.trim().isEmpty) {
      return "password must not be empty";
    } else if (phone.length < 11) {
      return "phone must be at least 11 number";
    } else if (!phone.startsWith("01")) {
      return "phone must start with 01(-----)";
    }
    else
      return null;
  }


}