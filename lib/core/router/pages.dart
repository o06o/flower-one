enum PAGES {
  splash,
  intro,
  signIn,

  home,
  map,
  garden,

  flowerDetail,

  my,
  settings,

  main,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.intro:
        return "/intro";
      case PAGES.signIn:
        return "/signIn";
      case PAGES.home:
        return "/home";
      case PAGES.map:
        return "/map";
      case PAGES.garden:
        return "/garden";
      case PAGES.flowerDetail:
        return "/flower/:id";
      case PAGES.my:
        return "/my";
      case PAGES.settings:
        return "/my/settings";
      case PAGES.main:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return "SPLASH";
      case PAGES.intro:
        return "INTRO";
      case PAGES.signIn:
        return "SIGN_IN";
      case PAGES.home:
        return "HOME";
      case PAGES.map:
        return "MAP";
      case PAGES.garden:
        return "GARDEN";
      case PAGES.flowerDetail:
        return "GROUP_DETAIL";
      case PAGES.my:
        return "MY";
      case PAGES.settings:
        return "SETTINGS";
      case PAGES.main:
        return "MAIN";
    }
  }
}
