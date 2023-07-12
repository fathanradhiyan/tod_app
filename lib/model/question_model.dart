final String tableQuestions = 'questions';

class QuestionFields {
  static final List<String> values = [
    questionId, question, isTruth
  ];

  static final String questionId = 'QuestionId';
  static final String question = 'Question';
  static final String isTruth = 'isTruth';
}

class Question {
  final int? questionId;
  final String? question;
  final int? isTruth;

  const Question({
    this.questionId,
    this.question,
    this.isTruth,
  });

  Question copy({
  int? questionId,
    String? question,
    int? isTruth,
}) =>
  Question(
    questionId: questionId ?? this.questionId,
    question: question ?? this.question,
    isTruth: isTruth ?? this.isTruth,
  );

  static Question fromJson(Map<String, Object?> json) => Question(
    questionId: json[QuestionFields.questionId] as int?,
    question: json[QuestionFields.question] as String?,
    isTruth: json[QuestionFields.isTruth] as int?,
  );

  Map<String, Object?> toJson() => {
    QuestionFields.questionId: questionId,
    QuestionFields.question: question,
    QuestionFields.isTruth: isTruth,
  };
}
