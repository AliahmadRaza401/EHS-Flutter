class Language {
  final int id;
  final String flag;
  final String languageCode;

  Language(this.id, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "assets/english.png", "en"),
      Language(2, "assets/urdu.png", "ur"),
      Language(3, "assets/french.png", "fr"),
      Language(4, "assets/chinese.png", "zh"),
    ];
  }
}
