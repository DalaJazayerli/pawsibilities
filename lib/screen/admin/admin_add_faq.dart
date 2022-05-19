import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawsibilities/widgets/widgets.dart';

class AdminAddFAQ extends StatefulWidget {
  const AdminAddFAQ({Key? key}) : super(key: key);

  @override
  State<AdminAddFAQ> createState() => _AdminAddFAQState();
}

class _AdminAddFAQState extends State<AdminAddFAQ> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xffff914d),
          elevation: 0,
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(32),
            children: [
              const SizedBox(height: 10),
              TextFieldCustom(
                label: 'Question',
                controller: _questionController,
                validator: _requiredValidator,
              ),
              const SizedBox(height: 10),
              TextFieldCustom(
                label: 'Answer',
                controller: _answerController,
                validator: _requiredValidator,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  final faq = FAQ(
                    question: _questionController.text,
                    answer: _answerController.text,
                  );
                  createFAQ(faq);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Upload',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: const Color((0xffff914d)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 17,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future createFAQ(FAQ faq) async {
    final docFaq = FirebaseFirestore.instance.collection('faq').doc();
    faq.id = docFaq.id;
    final json = faq.toJson();
    await docFaq.set(json);
  }
}

class FAQ {
  String id;
  final String question;
  final String answer;

  FAQ({this.id = '', required this.question, required this.answer});

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'answer': answer,
      };

  static FAQ fromJson(Map<String, dynamic> json) => FAQ(
        id: json['id'],
        question: json['question'],
        answer: json['answer'],
      );
}
