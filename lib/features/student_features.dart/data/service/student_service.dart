class StudentService {
  static Future<void> fetchStudentData() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));
    print("Student data fetched");
  }
}