import 'package:flutter/material.dart';
import 'package:flutter_course/QuizApp/Question.dart';
import 'package:google_fonts/google_fonts.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> questions = [
    Question(
      questionNo: 1,
      question: "বাংলাদেশের রাজধানী কোনটি?",
      options: ["ঢাকা", "চট্টগ্রাম", "রাজশাহী", "খুলনা"],
      correntAnswerindex: 0,
    ),
    Question(
      questionNo: 2,
      question: "মুঘল সাম্রাজ্যের প্রথম সত্তর সাল কে ছিলেন?",
      options: ["বাবর", "হুমায়ুন", "আকবর", "জাহাঙ্গীর"],
      correntAnswerindex: 3,
    ),
    Question(
      questionNo: 3,
      question: "পৃথিবীর সর্ববৃহৎ নদী কোনটি?",
      options: ["গঙ্গা", "আমাজন", "নীল", "মিসিসিপি"],
      correntAnswerindex: 2,
    ),
    Question(
      questionNo: 4,
      question: "বাংলাদেশের জাতীয় ফুল কোনটি?",
      options: [ "গোলাপ","শাপলা", "সুজন্গা", "কৃষ্ণচূড়া"],
      correntAnswerindex: 1,
    ),
    Question(
      questionNo:5,
      question: "সূরা আল ফাতিহার অন্তরগত কোন দু'টি নাম?",
      options: ["রহমান ও রহিম", "রহমান ও মালিক", "রহিম ও মালিক", "রহমান ও মুজিব"],
      correntAnswerindex: 0,
    ),
  ];

  int _questionIndex = 0;
  int currentIndex = 0;
  bool isSelected = false;

  void pickAnswer(int value){
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[_questionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade50,
        centerTitle: true,
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "প্রশ্ন : ${question.questionNo}",
                        style: GoogleFonts.hindSiliguri(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        question.question,
                        style: GoogleFonts.hindSiliguri(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 8,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: question.options.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                currentIndex = index;
                                isSelected = !isSelected;
                                pickAnswer(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4.0),
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:isSelected ? Colors.green : Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16,),
                                    CircleAvatar(
                                      child: Text(
                                        "${index +1}",
                                        style: GoogleFonts.hindSiliguri(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16,),
                                    Text(
                                      question.options[index],
                                      style: GoogleFonts.hindSiliguri(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_questionIndex == questions.length - 1) {
                      _questionIndex =0;
                    } else {
                      _questionIndex++;
                    }
                  });
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple.shade400,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "সামনে যাই",
                      style: GoogleFonts.hindSiliguri(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int currentIndex;
  final int selectedAnswerIndex;
  final int correctAnswerIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: isWrongAnswer
              ? Colors.red.shade200
              : isCorrectAnswer
                  ? Colors.green.shade200
                  : Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const SizedBox(width: 16,),
          CircleAvatar(
            child: Text(
              "${currentIndex + 1}",
              style: GoogleFonts.hindSiliguri(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16,),
          Text(
            question,
            style: GoogleFonts.hindSiliguri(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
