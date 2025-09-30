class ApiEndpoints {
  static const String baseUrl =
      'https://mutqin-springboot-backend-1.onrender.com/api';

  //Authentication
  static const String signUp = '/auth/signup';
  static const String login = '/auth/login';

  //Notification
  static const String notificationAll = '/notifications/{id}';
  static const String notificationUnread = '/notifications/unread/{id}';
  static const String readNotification = '/notifications/{notiId}/read';

  //Profile
  static const String userProfileToken = '/profile/user';
  static const String userProfile = '/profile/search';
  static const String updateProfile = '/profile';

  static const String loginGoogle = '/auth/oauth2/google/login';
}
