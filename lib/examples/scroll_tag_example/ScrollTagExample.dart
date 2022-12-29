

import 'package:flutter/material.dart';

class ScrollTagExample extends StatelessWidget {
  const ScrollTagExample({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ScrollTag Example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  children: const <Widget>[
                    _TagItemView("#More benefits"),
                    _TagItemView("#World's first offline NFT mining Contest"),
                    _TagItemView("#Anti-war"),
                    _TagItemView("#Justice"),
                  ]
              ),
              Row(
                children: const <Widget>[
                  _TagItemView("#World NFT Treasure Hunting Contest"),
                  _TagItemView("#NFT P2E GAME"),
                  _TagItemView("#Well rounded Ecosystem and story"),
                ],
              ),
              Row(
                children: const <Widget>[
                  _TagItemView("#Airdrop of 3D Metaverse Avatars"),
                  _TagItemView("#Continuous benefits"),
                  _TagItemView("#Environment"),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class _TagItemView extends StatelessWidget {

  final String tag;

  const _TagItemView(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 6, 7, 6),
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          // color: Theme.of(context).colorScheme.borderColor,
            color: Colors.black,
            width: 1
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        boxShadow: const [
          BoxShadow(
            // color: Theme.of(context).colorScheme.shadowBackground,
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: 4.0,
              blurStyle: BlurStyle.solid
          )
        ],
      ),
      child: Text(
        tag,
        style: const TextStyle(
          // color: Theme.of(context).colorScheme.shadowBackground,
          color: Colors.black,
          fontSize: 20
        ),
      ),
    );
  }

}
