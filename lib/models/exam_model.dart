// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExamModel {
  final String examName;
  final String examType;
  final String tcLine;
  final String classLine;
  final String branchLine;
  final String studentNumberLine;
  final String examGroupLine;
  final String studentNameLastNameLine;
  final String studentBookLine;
  final String genderLine;
  final String enteredLine;
  final String? turkishLine;
  final String? answerTurkish;
  final String? historyLine;
  final String? answerHistoryLine;
  final String? geographyLine;
  final String? answerGeographyLine;
  final String? history2Line;
  final String? answerHistory2Line;
  final String? geography2Line;
  final String? answerGeography2Line;
  final String? philosophyLine;
  final String? answerPhilosophyLine;
  final String? religion2Line;
  final String? answerReligion2Line;
  final String? mathLine;
  final String? answerMathLine;
  final String? physicsLine;
  final String? answerPhysicsLine;
  final String? chemistryLine;
  final String? answerChemistryLine;
  final String? biologyLine;
  final String? answerBiologyLine;
  final String? languageLine;
  final String? answerLanguageLine;
  final String? frenchLine;
  final String? answerFrenchLine;
  final String? germanyLine;
  final String? answerGermanyLine;
  ExamModel({
    required this.examName,
    required this.examType,
    required this.tcLine,
    required this.classLine,
    required this.branchLine,
    required this.studentNumberLine,
    required this.examGroupLine,
    required this.studentNameLastNameLine,
    required this.studentBookLine,
    required this.genderLine,
    required this.enteredLine,
    this.turkishLine,
    this.answerTurkish,
    this.historyLine,
    this.answerHistoryLine,
    this.geographyLine,
    this.answerGeographyLine,
    this.history2Line,
    this.answerHistory2Line,
    this.geography2Line,
    this.answerGeography2Line,
    this.philosophyLine,
    this.answerPhilosophyLine,
    this.religion2Line,
    this.answerReligion2Line,
    this.mathLine,
    this.answerMathLine,
    this.physicsLine,
    this.answerPhysicsLine,
    this.chemistryLine,
    this.answerChemistryLine,
    this.biologyLine,
    this.answerBiologyLine,
    this.languageLine,
    this.answerLanguageLine,
    this.frenchLine,
    this.answerFrenchLine,
    this.germanyLine,
    this.answerGermanyLine,
  });

  ExamModel copyWith({
    String? examName,
    String? examType,
    String? tcLine,
    String? classLine,
    String? branchLine,
    String? studentNumberLine,
    String? examGroupLine,
    String? studentNameLastNameLine,
    String? studentBookLine,
    String? genderLine,
    String? enteredLine,
    String? turkishLine,
    String? answerTurkish,
    String? historyLine,
    String? answerHistoryLine,
    String? geographyLine,
    String? answerGeographyLine,
    String? history2Line,
    String? answerHistory2Line,
    String? geography2Line,
    String? answerGeography2Line,
    String? philosophyLine,
    String? answerPhilosophyLine,
    String? religion2Line,
    String? answerReligion2Line,
    String? mathLine,
    String? answerMathLine,
    String? physicsLine,
    String? answerPhysicsLine,
    String? chemistryLine,
    String? answerChemistryLine,
    String? biologyLine,
    String? answerBiologyLine,
    String? languageLine,
    String? answerLanguageLine,
    String? frenchLine,
    String? answerFrenchLine,
    String? germanyLine,
    String? answerGermanyLine,
  }) {
    return ExamModel(
      examName: examName ?? this.examName,
      examType: examType ?? this.examType,
      tcLine: tcLine ?? this.tcLine,
      classLine: classLine ?? this.classLine,
      branchLine: branchLine ?? this.branchLine,
      studentNumberLine: studentNumberLine ?? this.studentNumberLine,
      examGroupLine: examGroupLine ?? this.examGroupLine,
      studentNameLastNameLine:
          studentNameLastNameLine ?? this.studentNameLastNameLine,
      studentBookLine: studentBookLine ?? this.studentBookLine,
      genderLine: genderLine ?? this.genderLine,
      enteredLine: enteredLine ?? this.enteredLine,
      turkishLine: turkishLine ?? this.turkishLine,
      answerTurkish: answerTurkish ?? this.answerTurkish,
      historyLine: historyLine ?? this.historyLine,
      answerHistoryLine: answerHistoryLine ?? this.answerHistoryLine,
      geographyLine: geographyLine ?? this.geographyLine,
      answerGeographyLine: answerGeographyLine ?? this.answerGeographyLine,
      history2Line: history2Line ?? this.history2Line,
      answerHistory2Line: answerHistory2Line ?? this.answerHistory2Line,
      geography2Line: geography2Line ?? this.geography2Line,
      answerGeography2Line: answerGeography2Line ?? this.answerGeography2Line,
      philosophyLine: philosophyLine ?? this.philosophyLine,
      answerPhilosophyLine: answerPhilosophyLine ?? this.answerPhilosophyLine,
      religion2Line: religion2Line ?? this.religion2Line,
      answerReligion2Line: answerReligion2Line ?? this.answerReligion2Line,
      mathLine: mathLine ?? this.mathLine,
      answerMathLine: answerMathLine ?? this.answerMathLine,
      physicsLine: physicsLine ?? this.physicsLine,
      answerPhysicsLine: answerPhysicsLine ?? this.answerPhysicsLine,
      chemistryLine: chemistryLine ?? this.chemistryLine,
      answerChemistryLine: answerChemistryLine ?? this.answerChemistryLine,
      biologyLine: biologyLine ?? this.biologyLine,
      answerBiologyLine: answerBiologyLine ?? this.answerBiologyLine,
      languageLine: languageLine ?? this.languageLine,
      answerLanguageLine: answerLanguageLine ?? this.answerLanguageLine,
      frenchLine: frenchLine ?? this.frenchLine,
      answerFrenchLine: answerFrenchLine ?? this.answerFrenchLine,
      germanyLine: germanyLine ?? this.germanyLine,
      answerGermanyLine: answerGermanyLine ?? this.answerGermanyLine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'examName': examName,
      'examType': examType,
      'tcLine': tcLine,
      'classLine': classLine,
      'branchLine': branchLine,
      'studentNumberLine': studentNumberLine,
      'examGroupLine': examGroupLine,
      'studentNameLastNameLine': studentNameLastNameLine,
      'studentBookLine': studentBookLine,
      'genderLine': genderLine,
      'enteredLine': enteredLine,
      'turkishLine': turkishLine,
      'answerTurkish': answerTurkish,
      'historyLine': historyLine,
      'answerHistoryLine': answerHistoryLine,
      'geographyLine': geographyLine,
      'answerGeographyLine': answerGeographyLine,
      'history2Line': history2Line,
      'answerHistory2Line': answerHistory2Line,
      'geography2Line': geography2Line,
      'answerGeography2Line': answerGeography2Line,
      'philosophyLine': philosophyLine,
      'answerPhilosophyLine': answerPhilosophyLine,
      'religion2Line': religion2Line,
      'answerReligion2Line': answerReligion2Line,
      'mathLine': mathLine,
      'answerMathLine': answerMathLine,
      'physicsLine': physicsLine,
      'answerPhysicsLine': answerPhysicsLine,
      'chemistryLine': chemistryLine,
      'answerChemistryLine': answerChemistryLine,
      'biologyLine': biologyLine,
      'answerBiologyLine': answerBiologyLine,
      'languageLine': languageLine,
      'answerLanguageLine': answerLanguageLine,
      'frenchLine': frenchLine,
      'answerFrenchLine': answerFrenchLine,
      'germanyLine': germanyLine,
      'answerGermanyLine': answerGermanyLine,
    };
  }

  factory ExamModel.fromMap(Map<String, dynamic> map) {
    return ExamModel(
      examName: map['examName'] as String,
      examType: map['examType'] as String,
      tcLine: map['tcLine'] as String,
      classLine: map['classLine'] as String,
      branchLine: map['branchLine'] as String,
      studentNumberLine: map['studentNumberLine'] as String,
      examGroupLine: map['examGroupLine'] as String,
      studentNameLastNameLine: map['studentNameLastNameLine'] as String,
      studentBookLine: map['studentBookLine'] as String,
      genderLine: map['genderLine'] as String,
      enteredLine: map['enteredLine'] as String,
      turkishLine:
          map['turkishLine'] != null ? map['turkishLine'] as String : null,
      answerTurkish:
          map['answerTurkish'] != null ? map['answerTurkish'] as String : null,
      historyLine:
          map['historyLine'] != null ? map['historyLine'] as String : null,
      answerHistoryLine: map['answerHistoryLine'] != null
          ? map['answerHistoryLine'] as String
          : null,
      geographyLine:
          map['geographyLine'] != null ? map['geographyLine'] as String : null,
      answerGeographyLine: map['answerGeographyLine'] != null
          ? map['answerGeographyLine'] as String
          : null,
      history2Line:
          map['history2Line'] != null ? map['history2Line'] as String : null,
      answerHistory2Line: map['answerHistory2Line'] != null
          ? map['answerHistory2Line'] as String
          : null,
      geography2Line: map['geography2Line'] != null
          ? map['geography2Line'] as String
          : null,
      answerGeography2Line: map['answerGeography2Line'] != null
          ? map['answerGeography2Line'] as String
          : null,
      philosophyLine: map['philosophyLine'] != null
          ? map['philosophyLine'] as String
          : null,
      answerPhilosophyLine: map['answerPhilosophyLine'] != null
          ? map['answerPhilosophyLine'] as String
          : null,
      religion2Line:
          map['religion2Line'] != null ? map['religion2Line'] as String : null,
      answerReligion2Line: map['answerReligion2Line'] != null
          ? map['answerReligion2Line'] as String
          : null,
      mathLine: map['mathLine'] != null ? map['mathLine'] as String : null,
      answerMathLine: map['answerMathLine'] != null
          ? map['answerMathLine'] as String
          : null,
      physicsLine:
          map['physicsLine'] != null ? map['physicsLine'] as String : null,
      answerPhysicsLine: map['answerPhysicsLine'] != null
          ? map['answerPhysicsLine'] as String
          : null,
      chemistryLine:
          map['chemistryLine'] != null ? map['chemistryLine'] as String : null,
      answerChemistryLine: map['answerChemistryLine'] != null
          ? map['answerChemistryLine'] as String
          : null,
      biologyLine:
          map['biologyLine'] != null ? map['biologyLine'] as String : null,
      answerBiologyLine: map['answerBiologyLine'] != null
          ? map['answerBiologyLine'] as String
          : null,
      languageLine:
          map['languageLine'] != null ? map['languageLine'] as String : null,
      answerLanguageLine: map['answerLanguageLine'] != null
          ? map['answerLanguageLine'] as String
          : null,
      frenchLine:
          map['frenchLine'] != null ? map['frenchLine'] as String : null,
      answerFrenchLine: map['answerFrenchLine'] != null
          ? map['answerFrenchLine'] as String
          : null,
      germanyLine:
          map['germanyLine'] != null ? map['germanyLine'] as String : null,
      answerGermanyLine: map['answerGermanyLine'] != null
          ? map['answerGermanyLine'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamModel.fromJson(String source) =>
      ExamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExamModel(examName: $examName, examType: $examType, tcLine: $tcLine, classLine: $classLine, branchLine: $branchLine, studentNumberLine: $studentNumberLine, examGroupLine: $examGroupLine, studentNameLastNameLine: $studentNameLastNameLine, studentBookLine: $studentBookLine, genderLine: $genderLine, enteredLine: $enteredLine, turkishLine: $turkishLine, answerTurkish: $answerTurkish, historyLine: $historyLine, answerHistoryLine: $answerHistoryLine, geographyLine: $geographyLine, answerGeographyLine: $answerGeographyLine, history2Line: $history2Line, answerHistory2Line: $answerHistory2Line, geography2Line: $geography2Line, answerGeography2Line: $answerGeography2Line, philosophyLine: $philosophyLine, answerPhilosophyLine: $answerPhilosophyLine, religion2Line: $religion2Line, answerReligion2Line: $answerReligion2Line, mathLine: $mathLine, answerMathLine: $answerMathLine, physicsLine: $physicsLine, answerPhysicsLine: $answerPhysicsLine, chemistryLine: $chemistryLine, answerChemistryLine: $answerChemistryLine, biologyLine: $biologyLine, answerBiologyLine: $answerBiologyLine, languageLine: $languageLine, answerLanguageLine: $answerLanguageLine, frenchLine: $frenchLine, answerFrenchLine: $answerFrenchLine, germanyLine: $germanyLine, answerGermanyLine: $answerGermanyLine)';
  }

  @override
  bool operator ==(covariant ExamModel other) {
    if (identical(this, other)) return true;

    return other.examName == examName &&
        other.examType == examType &&
        other.tcLine == tcLine &&
        other.classLine == classLine &&
        other.branchLine == branchLine &&
        other.studentNumberLine == studentNumberLine &&
        other.examGroupLine == examGroupLine &&
        other.studentNameLastNameLine == studentNameLastNameLine &&
        other.studentBookLine == studentBookLine &&
        other.genderLine == genderLine &&
        other.enteredLine == enteredLine &&
        other.turkishLine == turkishLine &&
        other.answerTurkish == answerTurkish &&
        other.historyLine == historyLine &&
        other.answerHistoryLine == answerHistoryLine &&
        other.geographyLine == geographyLine &&
        other.answerGeographyLine == answerGeographyLine &&
        other.history2Line == history2Line &&
        other.answerHistory2Line == answerHistory2Line &&
        other.geography2Line == geography2Line &&
        other.answerGeography2Line == answerGeography2Line &&
        other.philosophyLine == philosophyLine &&
        other.answerPhilosophyLine == answerPhilosophyLine &&
        other.religion2Line == religion2Line &&
        other.answerReligion2Line == answerReligion2Line &&
        other.mathLine == mathLine &&
        other.answerMathLine == answerMathLine &&
        other.physicsLine == physicsLine &&
        other.answerPhysicsLine == answerPhysicsLine &&
        other.chemistryLine == chemistryLine &&
        other.answerChemistryLine == answerChemistryLine &&
        other.biologyLine == biologyLine &&
        other.answerBiologyLine == answerBiologyLine &&
        other.languageLine == languageLine &&
        other.answerLanguageLine == answerLanguageLine &&
        other.frenchLine == frenchLine &&
        other.answerFrenchLine == answerFrenchLine &&
        other.germanyLine == germanyLine &&
        other.answerGermanyLine == answerGermanyLine;
  }

  @override
  int get hashCode {
    return examName.hashCode ^
        examType.hashCode ^
        tcLine.hashCode ^
        classLine.hashCode ^
        branchLine.hashCode ^
        studentNumberLine.hashCode ^
        examGroupLine.hashCode ^
        studentNameLastNameLine.hashCode ^
        studentBookLine.hashCode ^
        genderLine.hashCode ^
        enteredLine.hashCode ^
        turkishLine.hashCode ^
        answerTurkish.hashCode ^
        historyLine.hashCode ^
        answerHistoryLine.hashCode ^
        geographyLine.hashCode ^
        answerGeographyLine.hashCode ^
        history2Line.hashCode ^
        answerHistory2Line.hashCode ^
        geography2Line.hashCode ^
        answerGeography2Line.hashCode ^
        philosophyLine.hashCode ^
        answerPhilosophyLine.hashCode ^
        religion2Line.hashCode ^
        answerReligion2Line.hashCode ^
        mathLine.hashCode ^
        answerMathLine.hashCode ^
        physicsLine.hashCode ^
        answerPhysicsLine.hashCode ^
        chemistryLine.hashCode ^
        answerChemistryLine.hashCode ^
        biologyLine.hashCode ^
        answerBiologyLine.hashCode ^
        languageLine.hashCode ^
        answerLanguageLine.hashCode ^
        frenchLine.hashCode ^
        answerFrenchLine.hashCode ^
        germanyLine.hashCode ^
        answerGermanyLine.hashCode;
  }
}
