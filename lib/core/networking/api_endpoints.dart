class ApiEndpoints {
  static const String baseUrl =
      'https://mutqin-springboot-backend-1.onrender.com/api';
  static const String signUp = '/auth/signup';

  static const String login = '/auth/login';
  static const String userProfile = '/profile/search';
  static const String notificationAll = '/notifications/{id}'; 
    static const String notificationUnread = '/notifications/unread/{id}'; 
    static const String readNotification = '/notifications/{notiId}/read'; 

  static const String loginGoogle = '/auth/oauth2/google/login';
}
