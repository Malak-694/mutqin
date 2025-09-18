class ApiEndpoints {
  // Base
  static const String baseUrl = "http://localhost:8080/api";

  // ---------------------------
  // 🔹 AUTHENTICATION
  // ---------------------------
  static const String login = "/auth/login";
  static const String signup = "/auth/signup";
  static const String googleLogin = "/auth/google/login";
  static const String googleSignup = "/auth/google/signup";

  // ---------------------------
  // 🔹 STUDENT FEATURES
  // ---------------------------
  static const String bookSession = "/students/sessions/book";
  static const String attendSession = "/students/sessions/attend";
  static const String listSessions = "/students/sessions";
  static const String updateProfile = "/students/profile";
  static const String deleteProfile = "/students/profile";
  static String getProfile(String username) => "/students/profile/$username";
  static const String searchUsers = "/students/search";
  static const String progress = "/students/progress";
  static const String progressAll = "/students/progress/all";
  static const String cancelSession = "/students/sessions/cancel";

  // ---------------------------
  // 🔹 SHEIKH FEATURES
  // ---------------------------
  static const String createSession = "/sheikhs/sessions";
  static String getSession(String sessionId) => "/sheikhs/sessions/$sessionId";
  static String getSheikhStudents(String sheikhId) => "/sheikhs/students/$sheikhId";
  static const String assignBadge = "/sheikhs/badges/assign";
  static String getBadge(String badgeId) => "/sheikhs/badges/$badgeId";
  static const String listBadges = "/sheikhs/badges";
  static const String createBadge = "/sheikhs/badges";
  static String listSheikhSessions(String sheikhId) => "/sheikhs/sessions/$sheikhId";
  static String studentProgress(String studentId) => "/sheikhs/students/$studentId/progress";
  static const String sendReport = "/sheikhs/reports";
  static String assignPoints(String studentId) => "/sheikhs/students/$studentId/points";
  static String updatePoints(String studentId) => "/sheikhs/students/$studentId/points";
  static String recordPages(String studentId) => "/sheikhs/students/$studentId/pages";

  // ---------------------------
  // 🔹 ADMIN FEATURES
  // ---------------------------
  static String adminGetProfile(String userId) => "/admin/profiles/$userId";
  static const String adminStudents = "/admin/students";
  static const String adminSheikhs = "/admin/sheikhs";
  static const String adminParents = "/admin/parents";

  // ---------------------------
  // 🔹 PARENT FEATURES
  // ---------------------------
  static const String parentReports = "/parents/reports";
  static String parentReport(String reportId) => "/parents/reports/$reportId";
  static const String pairStudent = "/parents/students/pair";

  // ---------------------------
  // 🔹 AUTOMATIC FEATURES
  // ---------------------------
  static const String autoReports = "/auto/reports";
  static const String autoNotifications = "/auto/notifications";
  static String autoBadge(String badgeId) => "/auto/badges/$badgeId";
  static const String autoGetNotifications = "/auto/notifications";
}
 