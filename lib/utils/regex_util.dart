class RegexUtil {
  const RegexUtil._();

  static final emailRangeRegex = RegExp('[a-zA-Z0-9\\+\\._%\\-\\+@]');

  static final passwordRangeRegex = RegExp('[0-9a-zA-Z~!@#\$%^&*()_\\-+=\\[\\]\\{}|;\':\\"<>?,./\\\\\\s]');

  static final cardNumberRangeRegex = RegExp('[0-9\\s]');

  static final cardHolderRangeRegex = RegExp('[a-zA-Z\\-]');

  static final expiredDateRangeRegex = RegExp(r'[0-9/]');

  static final emailFormatRegex =
      RegExp('[a-zA-Z0-9\\+\\._%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+');

  static final passwordFormatRegex =
      RegExp('^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[~!@#\$%^&*()_\\-+=\\[\\]\\{}|;\':\\"<>?,./\\\\\\s]).{8,63}\$');

  static final cardBNumberFormatRegex = RegExp(r'^(\d{4})\s(\d{4})\s(\d{4})\s(\d{4})$');

  static final expiredDateFormatRegex = RegExp(r'^(0[1-9]|1[0-2])\/(\d{2})$');

  static bool isValidEmail(String value) => emailFormatRegex.hasMatch(value);

  static bool isValidPassword(String value) => passwordFormatRegex.hasMatch(value);

  static bool isValidCardNumber(String value) => cardBNumberFormatRegex.hasMatch(value);

  static bool isValidCardHolder(String value) => value.length <= 20 && value.length >= 2;

  static bool isValidExpiredDate(String value) => expiredDateFormatRegex.hasMatch(value);

  static bool isValidCvv(String value) => value.length == 3;
}
