/// アプリ内でerror関連で実装するクラス
class AppException implements Exception {
  const AppException({this.code, this.message = '不明なエラーが発生しました。'});

  // ステータスコード等
  final String? code;
  // 例外処理の内容
  final String? message;
}
