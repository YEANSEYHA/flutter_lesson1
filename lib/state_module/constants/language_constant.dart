List<Language> languageList = [
  Language(),
  Khmer(),
  Chinese(),
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
  String get changeToChinese => "Change To Chinese";
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
  String get changeToChinese => "ប្តូរទៅចិន";
}

class Chinese implements Language {
  String get home => "家";
  String get contact => "接触";
  String get theme => "主题";
  String get changeToDark => "变暗";
  String get changeToLight => "变亮";
  String get changeToSystem => "更改为系统";
  String get homePageName => "主页";
  String get detailPageName => "详情页";
  String get language => "语言";
  String get changeToEnglish => "改成英语";
  String get changeToKhmer => "换成高棉语";
  String get changeToChinese => "改成中文";
}
