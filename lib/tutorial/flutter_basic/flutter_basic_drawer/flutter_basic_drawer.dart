import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterBasicDrawer());
}

class FlutterBasicDrawer extends StatelessWidget {
  const FlutterBasicDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return _ContentView();
  }
}

class _ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Drawer Example"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "123123123"
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: UserAccountsDrawerHeader(
                      accountName: const Text("Seok Ho"),
                      accountEmail: const Text("djseokho@gmail.com"),
                      currentAccountPicture: const CircleAvatar(
                        backgroundImage: NetworkImage("https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820"),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange
                      ),
                      otherAccountsPictures: [
                        Image.network("https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820", fit: BoxFit.cover,),
                        Image.network("https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820", fit: BoxFit.cover,),
                        Image.network("https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820", fit: BoxFit.cover,)
                      ],
                    ),

                      // child: DrawerHeader(
                      //   decoration: BoxDecoration(
                      //     color: Colors.yellow,
                      //     image: DecorationImage(
                      //       image: NetworkImage( "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820"),
                      //       fit: BoxFit.cover
                      //     ),
                      //   ),
                      //   child: Text(
                      //     "Hello, flutter",
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 30
                      //     ),
                      //   ),
                      // ),
                  )
                ],
              ),
              const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: Text("Home"),
              ),
              const Divider(),
              const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Profile"),
              ),
              const Divider(),
              const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings),
                ),
                title: Text("Settings"),
              )
            ],
          ),
        ),
        endDrawer: const Drawer(
          child: Text("Drawer"),
        ),
      ),
    );
  }

}