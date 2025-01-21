class Constants {
  static String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=485e003049dd4c5cb73dd39af593b019';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&from=2025-01-20&to=2025-01-20&sortBy=popularity&apiKey=485e003049dd4c5cb73dd39af593b019';
  }
}
