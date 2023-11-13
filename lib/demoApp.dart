import 'package:flutter/material.dart';
import 'package:flutter_course/GoogleSwitch.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  bool wifiStatus = false;
  bool dataStatus = false;
  bool darkStatus = false;
  bool banglaStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32,),
              Text("Google Switch And...",style:GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 32,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 32,),
                    Text("Wifi Connection",style:GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),),
                    const Spacer(),
                    GoogleSwitch(onToggle: (value){
                      setState(() {
                        value = wifiStatus;
                        wifiStatus=!wifiStatus;
                      });
                    }, status: wifiStatus),
                    const SizedBox(width: 32,),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 32,),
                    Text("Data Connection",style:GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),),
                    const Spacer(),
                    GoogleSwitch(onToggle: (value){
                      setState(() {
                        value = dataStatus;
                        dataStatus=!dataStatus;
                      });
                    }, status: dataStatus),
                    const SizedBox(width: 32,),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 32,),
                    Text("Dark Theme",style:GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),),
                    const Spacer(),
                    GoogleSwitch(onToggle: (value){
                      setState(() {
                        value = darkStatus;
                        darkStatus=!darkStatus;
                      });
                    }, status: darkStatus),
                    const SizedBox(width: 32,),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 32,),
                    Text("Bangla",style:GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),),
                    const Spacer(),
                    GoogleSwitch(onToggle: (value){
                      setState(() {
                        value = banglaStatus;
                        banglaStatus=!banglaStatus;
                      });
                    }, status: banglaStatus),
                    const SizedBox(width: 32,),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
