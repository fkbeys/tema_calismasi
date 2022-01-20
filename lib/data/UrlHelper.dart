class UrlHelper {
  static String loginUrl(String company, String username, String password) {
    String link =
        "http://45.80.175.226/Login?companyName=$company&progrmaId=1&userName=$username&pass=$password";
    return link;
  }
}
