class ApiEndpoints {
  static const String baseUrl =
      'https://mutqin-springboot-backend-1.onrender.com/api';
  static const String signUp = '/auth/signup';
  static const String signUpGoogle = '/auth/oauth2/google/signup';

  static const String login = '/auth/login';
  static const String userProfile = '/profile/search';
  static const String loginGoogle = '/auth/oauth2/google/login';
  static const String getUserProfile = 'user/profile';
  static const String updateUserProfile = 'user/profile/update';
  static const String getItems = 'items';
}
