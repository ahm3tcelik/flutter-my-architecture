abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'tr_TR': Locales.tr_TR,
    'en_US': Locales.en_US,
  };
}

abstract class LocaleKeys {
  static const hello_world = 'hello_world';
  static const login = 'login';
  static const logout = 'logout';
  static const user = 'user';
}

abstract class Locales {
  static const tr_TR = {
    'hello_world': 'Merhaba Dünya!',
    'login': 'Giriş yap',
    'logout': 'Çıkış yap',
    'user': 'Kullanıcı'
  };

  static const en_US = {
    'hello_world': 'Hello World!',
    'login': 'Login',
    'logout': 'Logout',
    'user': 'User'
  };
}
