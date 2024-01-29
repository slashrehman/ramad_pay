class FormValidator {
  static bool validateEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }


  static bool passwordValidation(String password) {
    return RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&.])[A-Za-z\d@$!%*#?&.]{8,}$")
        .hasMatch(password);
  }

  static String emptyValidator({String? text, String? fieldName}){
    if(text!.isEmpty){
      return "Please Enter $fieldName";
    }else{
      return '';
    }
  }

  static bool phoneValidation(String phone){
   return RegExp(r'^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$').hasMatch(phone);
  }
}