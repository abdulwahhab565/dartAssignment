import 'dart:io';

// Function to get valid score input from the user
double getValidScore(String prompt, double maxScore) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    double? score = double.tryParse(input ?? '');

    if (score != null && score >= 0 && score <= maxScore) {
      return score;
    } else {
      print('Invalid input. Please enter a number between 0 and $maxScore.');
    }
  }
}

void main() {
  print('\n=== UENR Student Grade Calculator ===\n');

  // Get student's name
  stdout.write('Enter student name: ');
  String? name = stdin.readLineSync();
  name = name?.trim();
  if (name == null || name.isEmpty) {
    print('❌ Name cannot be empty. Please restart the program.');
    return;
  }

  // Get scores with validation
  double caScore =
      getValidScore('Enter Continuous Assessment Score (out of 20): ', 20);
  double examScore = getValidScore('Enter Exam Score (out of 60): ', 60);
  double projectScore = getValidScore('Enter Project Score (out of 20): ', 20);

  // Calculate total score
  double totalScore = caScore + examScore + projectScore;

  // Assign grade based on total score
  String grade;
  if (totalScore >= 80 && totalScore <= 100) {
    grade = 'A';
  } else if (totalScore >= 75) {
    grade = 'B+';
  } else if (totalScore >= 70) {
    grade = 'B';
  } else if (totalScore >= 65) {
    grade = 'C+';
  } else if (totalScore >= 60) {
    grade = 'C';
  } else if (totalScore >= 55) {
    grade = 'D+';
  } else if (totalScore >= 50) {
    grade = 'D';
  } else if (totalScore >= 45) {
    grade = 'E';
  } else {
    grade = 'F';
  }

  // Print the student report
  print('\n--- STUDENT REPORT ---');
  print('Name: $name');
  print('CA Score: $caScore / 30');
  print('Exam Score: $examScore / 50');
  print('Project Score: $projectScore / 20');
  print('Total Score: ${totalScore.toStringAsFixed(2)} / 100');
  print('Final Grade: $grade');
}
