List<Language> languageList = [
  Language(),
  Khmer(),
];

class Language {
  String get home => "Home";
  String get contact => "Contact";
  String get theme => "Theme";
  String get changeToDark => "Change To Dark";
  String get changeToLight => "Change To Light";
  String get changeToSystem => "Change To System";
  String get homePageName => "State Home Page";
  String get detailPageName => "State Detail Page";
  String get language => "Language";
  String get changeToEnglish => "Change To English";
  String get changeToKhmer => "Change To Khmer";
}

class Khmer implements Language {
  String get home => "ទំព័រដើម";
  String get contact => "ទំនាក់ទំនង";
  String get theme => "ពន្លឺ";
  String get changeToDark => "ប្តូរទៅងងឹត";
  String get changeToLight => "ប្តូរទៅភ្លឺ";
  String get changeToSystem => "ប្តូរតាមប្រព័ន្ធ";
  String get homePageName => "កម្មវិធីដើម";
  String get detailPageName => "ទំព័រលម្អិត";
  String get language => "ភាសា";
  String get changeToEnglish => "ប្តូរទៅអង់គ្លេស";
  String get changeToKhmer => "ប្តូរទៅខ្មែរ";
}
