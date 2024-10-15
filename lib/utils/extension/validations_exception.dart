extension EmailValidatorExtension on String {
  bool emailValidator() {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);
    return emailValid;
  }
  bool pinValidator() {
    bool pinValidator = RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(this);
    return pinValidator;
  }
}