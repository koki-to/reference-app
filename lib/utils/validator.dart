Validator get v => Validator();

class Validator {
  static final _emailRegExp = RegExp(r'^[^@]*@[^@]*$');

  String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    if (!_emailRegExp.hasMatch(value)) {
      return '正しいメールアドレスを入力してください';
    }
    return null;
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 8) {
      return '8桁以上入力してください';
    }
    return null;
  }

  String? requiredString(String? value) {
    if (value == null || value.isEmpty) {
      return '文字を入力してください';
    }
    return null;
  }
}

extension ValidatorExt on Validator {
  String? required(String value) {
    if (value.isEmpty) {
      return '入力してください';
    }
    return null;
  }
}
