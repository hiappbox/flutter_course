import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AyBayHishabApp extends StatefulWidget {
  const AyBayHishabApp({super.key});

  @override
  State<AyBayHishabApp> createState() => _AyBayHishabAppState();
}

class _AyBayHishabAppState extends State<AyBayHishabApp> {
  TextEditingController _ayTEController = TextEditingController();
  TextEditingController _bayTEController = TextEditingController();

  List<hishab> hishabList = [];

  @override
  void initState() {
    // _ayTEController.addListener(() {
    //   _ayTEController.selection = TextSelection.collapsed(offset: -1);
    // });
    // _bayTEController.addListener(() {
    //   _bayTEController.selection = const TextSelection.collapsed(offset: -1);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var time =DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text("Hishab App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right:16,top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _ayTEController,
                            decoration: const InputDecoration(
                              hintText: "Ay",
                              isDense: true
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: TextField(
                            controller: _bayTEController,
                            decoration: const InputDecoration(
                              hintText: "Bay",
                              isDense: true
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      width: double.infinity,
                        height: 50,
                        child: ElevatedButton(onPressed: (){
                          if(_ayTEController.text.trim().isNotEmpty && _bayTEController.text.trim().isNotEmpty){
                            hishabList.add(hishab(_ayTEController.text, _bayTEController.text,DateFormat("yMd").format(time)));
                            _bayTEController.clear();
                            _ayTEController.clear();
                            setState(() {});
                          }
                        }, child: const Text("Add",style: TextStyle(fontSize: 16),))),
                    const SizedBox(height: 32,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child:const Center(child: Text("Ay",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),
                        ),
                        Container(
                          height: 30,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child:const Center(child: Text("tarikh",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),
                        ),
                        Container(
                          height: 30,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child:const Center(child: Text("bay",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),
                        ),
                        Container(
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.brown,
                          ),
                          child:const Center(child: Text("more",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w700),)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ListView.separated(
                  primary: false,
                    shrinkWrap: true,
                    itemCount: hishabList.length,
                    itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple.shade100
                    ),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30),
                        Text(hishabList[index].Ay,style: const TextStyle(fontSize: 16,color: Colors.deepPurple,fontWeight: FontWeight.w700),),
                        const Spacer(),
                        Container(
                          height: 26,
                          width: 76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple,
                          ),
                          child:Center(child: Text(hishabList[index].date,style: const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w300),)),
                        ),
                        const SizedBox(width: 50),
                        Text(hishabList[index].Bay,style: const TextStyle(fontSize: 16,color: Colors.deepPurple,fontWeight: FontWeight.w700),),
                       const Spacer(),
                        IconButton(onPressed: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: IconButton(onPressed: (){
                                hishabList.removeAt(index);
                                setState(() {});
                                Navigator.pop(context);
                              },icon: const Icon(Icons.delete_forever),),
                            );
                          });
                        }, icon: const Icon(Icons.more_vert_rounded)),
                        const SizedBox(width: 8),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 6,);
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class hishab {
  final String Ay,Bay,date;
  hishab(this.Ay,this.Bay, this.date);
}