class ApiEndpoints {
  static const String baseUrl =
      'https://mutqin-springboot-backend-1.onrender.com';

  //General

  static const String getByRole = '/api/profile/roles?role={role}';

  //Authentication
  static const String signUp = '/api/auth/signup';
  static const String login = '/api/auth/login';

  //Notification
  static const String notificationAll = '/api/notifications/{id}';
  static const String notificationUnread = '/api/notifications/unread/{id}';
  static const String readNotification = '/api/notifications/{notiId}/read';

  //Profile
  static const String userProfileToken = '/api/profile/user';
  static const String userProfile = '/api/profile/search';
  static const String updateProfile = '/api/profile';

  //Student
  static const String bookSession = '/students/sessions/book';

  static const String getSessions = '/students/student/{username}';
  static const String revision =
      'https://mahmoudgomaa8545-tasmee3-mutqin.hf.space/';
  static const String getProgress = '/api/tutor/progress/{username}';
}
