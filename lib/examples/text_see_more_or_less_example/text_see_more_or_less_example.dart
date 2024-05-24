import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Read More Example'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ReadMoreText(
            text: 'This is a long text that should be truncated initially. '
                'Clicking on "read more" should expand this text to show the full content. '
                'This is a common pattern used in apps to avoid displaying too much text at once. '
                'Here is some additional content to make the text long enough for the example.',
            trimLines: 3,
          ),
        ),
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ReadMoreText({
    Key? key,
    required this.text,
    this.trimLines = 2,
  }) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(widget.text)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(flag ? ("$firstHalf...") : (firstHalf + secondHalf)),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "read more" : "show less",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
