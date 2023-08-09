import 'package:firebase_auth/firebase_auth.dart';

//TODO: 状況に応じて後で整理する
String handleFirebaseAuthError(FirebaseAuthException error) {
  if (error.code == 'invalid-email') {
    return 'メールアドレスのフォーマットが正しくありません';
  } else if (error.code == 'user-disabled') {
    return '現在指定したメールアドレスは使用できません';
  } else if (error.code == 'user-not-found') {
    return '指定したメールアドレスは登録されていません';
  } else if (error.code == 'wrong-password') {
    return 'パスワードが間違っています';
  } else if (error.code == 'operation-not-allowed') {
    return '指定したメールアドレス・パスワードは現在使用できません';
  } else if (error.code == 'weak-password') {
    'パスワードは６文字以上にしてください';
  } else if (error.code == 'email-already-in-use') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'invalid-credential') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'account-exists-with-different-credential') {
    return '指定したメールアドレスは登録済みです';
  }
//電話番号ログイン
  else if (error.code == 'invalid-verification-code') {
    return '認証コードが間違っています';
  } else if (error.code == 'invalid-verification-id') {
    return '認証コードが間違っています';
  } else if (error.code == 'invalid-phone-number') {
    return '電話番号のフォーマットが正しくありません';
  } else if (error.code == 'missing-phone-number') {
    return '電話番号を入力してください';
  } else if (error.code == 'quota-exceeded')

  //サーバー
  {
    return 'サーバーの負荷が高いため、しばらく時間をおいてから再度お試しください';
  } else if (error.code == 'popup-closed-by-user') {
    return '認証がキャンセルされました';
  } else if (error.code == 'provider-already-linked') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'credential-already-in-use') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'email-already-in-use') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'requires-recent-login') {
    return '認証がタイムアウトしました';
  } else if (error.code == 'user-mismatch') {
    return '指定したメールアドレスは登録済みです';
  } else if (error.code == 'user-not-found') {
    return '指定したメールアドレスは登録されていません';
  }
  // ハンドリングされていないエラーの場合、デフォルトメッセージを返す
  return 'エラーが発生しました';
}
