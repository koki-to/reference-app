import 'package:firebase_auth/firebase_auth.dart';

String convertErrorMesseage(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'メールアドレスが不正です。';
    case 'wrong-password':
      return 'パスワードが違います。';
    case 'user-disabled':
      return '指定されたユーザーは無効です。';
    case 'user-not-found':
      return '指定されたユーザーは存在しません。';
    case 'operation-not-allowed':
      return '指定されたユーザーはこの操作を許可していません。';
    case 'too-many-requests':
      return '指定されたユーザーはこの操作を許可していません。';
    case 'email-already-exists':
      return '指定されたメールアドレスは既に使用されています。';
    default:
      return '不明なエラーが発生しました';
  }
}
