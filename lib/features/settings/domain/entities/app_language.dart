enum AppLanguage {
  english('en'),
  greek('el');

  new(this.code);

  final String code;

  static AppLanguage fromCode(String? code) => values.firstWhere(
    (language) => language.code == code,
    orElse: () => english,
  );
}
