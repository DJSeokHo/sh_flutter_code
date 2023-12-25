import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDialogExample());
}

class CustomDialogExample extends StatelessWidget {
  const CustomDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Dialog Example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: _ContentView(),
        ),
      ),
    );
  }

}

class _ContentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.deepOrange,
              elevation: 20,
              fixedSize: const Size(200, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          onPressed: () {
            customDialog(context);
          },
          child: const Text("Dialog")
      ),
    );
  }

  static Future<bool?> customDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const FlutterLogo(size: 150,),
                const SizedBox(height: 20,),
                const Text("This is a Custom Dialog",style:TextStyle(fontSize: 20),),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text("Close")
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        );
      },
    );
  }
}