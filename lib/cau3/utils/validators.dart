class Validators {
  static String? validateTitle(String? value){
    if (value == null || value.isEmpty){
      return 'Vui long nhap tieu de.';
    }
    return null;
  }
  static String? validateBody(String? value){
    if (value == null || value.isEmpty){
      return 'Vui long nhap noi dung.';
    }
    return null;
  }
}