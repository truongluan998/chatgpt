class Validator {
  String? validateName(String? value) {
    if (value != null) {
      return 'Họ và tên không được để trống';
    } else {
      return null;
    }
  }
}