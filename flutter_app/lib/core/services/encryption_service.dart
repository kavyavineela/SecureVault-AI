import 'package:encrypt/encrypt.dart';

class EncryptionService {
  // 32-byte AES key
  static final Key _key =
      Key.fromUtf8('12345678901234567890123456789012');

  // 16-byte Initialization Vector
  static final IV _iv = IV.fromLength(16);

  static final Encrypter _encrypter = Encrypter(AES(_key));

  /// Encrypt Text
  static String encryptText(String text) {
    return _encrypter.encrypt(text, iv: _iv).base64;
  }

  /// Decrypt Text
  static String decryptText(String encryptedText) {
    return _encrypter.decrypt64(encryptedText, iv: _iv);
  }
}