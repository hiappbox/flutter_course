import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddArticleForm extends StatefulWidget {
  const AddArticleForm({super.key});

  @override
  State<AddArticleForm> createState() => _AddArticleFormState();
}

class _AddArticleFormState extends State<AddArticleForm> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _desTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('flutter-Article');
    return Scaffold(
     appBar: AppBar(
        elevation: 1,
        title: const Text("Add Article Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  maxLines: null,
                  style: GoogleFonts.roboto(),
                  decoration: const InputDecoration(
                    labelText: "title",
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _desTEController,
                  maxLines: null,
                  style: GoogleFonts.roboto(),
                  decoration: const InputDecoration(
                    labelText: "description",
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: Text("Publish",style: GoogleFonts.roboto(fontWeight: FontWeight.w700),)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
