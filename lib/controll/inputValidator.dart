class inputValidator{
  static validateEmail(String ? value){

    if (value!.isEmpty) {
      return 'An E-mail is required to Login.';
    }
    if (!RegExp("^[a-z,A-Z,0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'Please a valid E-mail';
    }

    return null;
  }

  static validatePassword(String ? value){
    if (value!.isEmpty) {
      return 'Please re-enter password';
    }
    return null;

  }


}