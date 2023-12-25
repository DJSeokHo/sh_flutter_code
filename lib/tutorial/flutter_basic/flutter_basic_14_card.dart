
import 'package:flutter/material.dart';

class FlutterBasicCardExample extends StatelessWidget {
  const FlutterBasicCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Card Example"),
        ),
        body: _ListView(),
      ),
    );
  }

}


class _ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // _ListItemView("Seok Ho", "Android", "010-1234-4321", "Seoul"),
        // _ListItemView("Seok Ho", "iOS", "010-1234-4321", "Seoul"),
        // _ListItemView("Seok Ho", "Flutter", "010-1234-4321", "Seoul"),
        // _ListItemView("Seok Ho", "Python", "010-1234-4321", "Seoul"),

        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/Landscape%20Product%20image-CHT_2560x1440-e263d461e84ff35235be426313a9aea3",
          "images/coding_with_cat_icon.jpeg",
          "xxxxxx",
          "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/Landscape%20Product%20image-CHT_2560x1440-e263d461e84ff35235be426313a9aea3",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/Landscape%20Product%20image-CHT_2560x1440-e263d461e84ff35235be426313a9aea3",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
        _ListItemViewWithImage(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            "images/coding_with_cat_icon.jpeg",
            "xxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxx"
        ),
      ],
    );
  }
}

class _ListItemViewWithImage extends StatelessWidget {

  final String url;
  final String profileUrl;
  final String nickname;
  final String message;

  const _ListItemViewWithImage(this.url, this.profileUrl, this.nickname, this.message);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: Image.network(url),
          ),
          ListTile(
            leading: ClipOval(
              child: Image.asset(profileUrl, fit: BoxFit.cover, width: 60, height: 60,),
            ),
            title: Text(nickname),
            subtitle: Text(message),
          )
        ],
      ),
    );
  }

}

class _ListItemView extends StatelessWidget {

  final String name;
  final String language;
  final String phone;
  final String address;

  const _ListItemView(this.name, this.language, this.phone, this.address);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(name, style: const TextStyle(fontSize: 20),),
            subtitle: Text(language),
          ),
          ListTile(
            title: Text(phone),
          ),
          ListTile(
            title: Text("Address: $address"),
          ),
        ],
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicCardExample());
}