import 'package:flutter/material.dart';
import 'package:sh_flutter_code/examples/time_line_example/roadmap_model.dart';

class HomeRoadmapView extends StatelessWidget {

  final List<RoadmapModel> list = _Constants.homeRoadmapList();

  HomeRoadmapView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HomeRoadmapView Example"),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _HomeRoadmapItemView(list[0], true, 0, true, false),
              _HomeRoadmapItemView(list[1], false, 27, false, false),

              _HomeRoadmapItemView(list[2], true, 36, false, false),
              _HomeRoadmapItemView(list[3], false, 27, false, true),
              // _HomeRoadmapItemView(list[4], false, 27),

              // _HomeRoadmapItemView(list[5], true, 36),
              // _HomeRoadmapItemView(list[6], false, 27),
              // _HomeRoadmapItemView(list[7], false, 27),
              // _HomeRoadmapItemView(list[8], false, 27),
              // _HomeRoadmapItemView(list[9], false, 27),
              //
              // _HomeRoadmapItemView(list[10], true, 36),
              // _HomeRoadmapItemView(list[11], false, 27),
              // _HomeRoadmapItemView(list[12], false, 27),
              // _HomeRoadmapItemView(list[13], false, 27),
            ],
          ),
        ),
      ),
    );

  }
}

class _HomeRoadmapItemView extends StatelessWidget {

  final RoadmapModel roadmapModel;
  final bool showYear;
  final double marginTop;
  final bool first;
  final bool last;

  const _HomeRoadmapItemView(this.roadmapModel, this.showYear, this.marginTop, this.first, this.last);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showYear)
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Text(
                              roadmapModel.year,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  // color: Theme.of(context).colorScheme.textColor,
                                  // fontFamily: WebConstants.notoSansKR,
                                  fontWeight: FontWeight.w700
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                ),

              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 55,
                          height: 55,
                          // color: Theme.of(context).colorScheme.homeRoadmapSeasonBackground,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                                roadmapModel.season,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    // color: Theme.of(context).colorScheme.homeRoadmapSeasonText,
                                    // fontFamily: WebConstants.notoSansKR
                                    color: Colors.white
                                )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48,),
                      Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            width: double.infinity,
                            constraints: const BoxConstraints(
                                minHeight: 55
                            ),
                            decoration: BoxDecoration(
                              // color: Theme.of(context).colorScheme.basicBackground,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                // color: Theme.of(context).colorScheme.borderColor,
                                  color: Colors.black,
                                  width: 1.6
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  // color: Theme.of(context).colorScheme.shadowBackground,
                                    color:Colors.black,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 8.0,
                                    blurStyle: BlurStyle.solid
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                                child: Text(
                                    roadmapModel.content,
                                    textDirection: TextDirection.ltr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: Theme.of(context).colorScheme.textColor,
                                      // fontFamily: WebConstants.notoSansKR
                                      color: Colors.black,
                                    )
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          if (!last)
            Positioned(
              top: first ? 60 : 0,
              left: 26.5,
              bottom: 0,
              child: Container(
                color: Colors.black,
                width: 2,
              )
            )
        ],
      ),
    );
  }
}

class _Constants {

  static List<RoadmapModel> homeRoadmapList() {

    List<RoadmapModel> list = [];
    list.add(
        RoadmapModel(
          "2022",
          "Q4",
          "1st STHC NFT character minting",
          "Minting our first STHC NFT characters, 2,000 NFT of each of the five characters, a total of 10,000. These NFT will allow you to participate in the World NFT Treasure Hunter competition.",
        )
    );

    list.add(
        RoadmapModel(
          "2022",
          "Q4",
          "STHC character commercialization",
          "Emoticons, Webtoons, animation etc. related to our STHC characters.",
        )
    );

    list.add(
        RoadmapModel(
          "2023",
          "Q2",
          "Laon Coin release",
          "Release of Laon Coin, that can be used in the “World NFT Treasure Hunting Contest”, the AR based NFT P2E game “ETBGO” and the “STHC Metaverse”.",
        )
    );

    list.add(
        RoadmapModel(
          "2023",
          "Q4",
          "1st World NFT Treasure Hunting Contest",
          "With 100,000 participants and a total prize money of 1.9 million Dollars split amongst the participants as follows: 1st place \$380,000, 2nd Place \$75,000, 3rd Place \$35,000, the contest will last a week and you will have to solve missions to earn prize money and catch NFT. It’s the world’s first offline NFT mining contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2023",
          "Q4",
          "Development of AR based NFT P2E game “ETBGO”",
          "Development of the world’s first offline NFT AR game “ETBGO”, in which you can use NFT characters mined during the World NFT Treasure Hunting Contest and catch new NFT characters, breed them and use them in battle.",
        )
    );

    list.add(
        RoadmapModel(
          "2024",
          "Q2",
          "Adding Laon Coin to the cryptocurrency market",
          "After the World NFT Treasure Hunting Contest Laon Coin will be available for use in the digital market.",
        )
    );

    list.add(
        RoadmapModel(
          "2024",
          "Q2",
          "Building STHC Metaverse",
          "Building the ecosystem STHC metaverse for participants of the World NFT Treasure Hunting Contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2024",
          "Q3",
          "STHC NFT character 2nd minting",
          "Minting of three additional STHC NFT characters with a total volume of 5,000. These characters will bring benefits to their holders during and outside of the World NFT Treasure Hunting Contest, such as the exemption of participation fees.",
        )
    );

    list.add(
        RoadmapModel(
          "2024",
          "Q4",
          "2nd World NFT Treasure Hunting Contest",
          "With 300,000 participants and a total prize money of 3.8 million Dollars split amongst the participants as follows: 1st place \$760,000, 2nd Place \$380,000, 3rd Place \$150,000, the contest will last a week and you will have to solve missions to earn prize money and catch NFT. It’s the world’s first offline NFT mining contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2024",
          "Q4",
          "Launch of AR based NFT P2E game “ETBGO”",
          "Launch of the AR based NFT P2R game “ETBGO”, in which you can use the NFT characters you gathered during the 1st and 2nd World NFT Treasure Hunting Contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2025",
          "Q2",
          "Development of Laon Mainnet",
          "Development of a Mainnet to provide a more secure environment for the World NFT Treasure Hunting Contest, the AR based NFT P2E game “ETBGO” and the STHC Metaverse.",
        )
    );

    list.add(
        RoadmapModel(
          "2025",
          "Q3",
          "STHC NFT character 3rd minting",
          "Minting of two additional STHC NFT characters with a total volume of 2,500. These characters will bring benefits to their holders during and outside of the World NFT Treasure Hunting Contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2025",
          "Q4",
          "3rd World NFT Treasure Hunting Contest",
          "With 300,000 participants and a total prize money of 4.5 million Dollars split amongst the participants as follows: 1st place \$1,140,000, 2nd Place \$760,000, 3rd Place \$380,000, the contest will last a week and you will have to solve missions to earn prize money and catch NFT. It’s the world’s first offline NFT mining contest.",
        )
    );

    list.add(
        RoadmapModel(
          "2025",
          "Q4",
          "STHC DAO",
          "STHC holders will be able to take part in important decisions such as where the next World NFT Treasure Hunting Contest will take place and other decisions concerning ETBGO and the STHC Metaverse.",
        )
    );

    return list;
  }

}