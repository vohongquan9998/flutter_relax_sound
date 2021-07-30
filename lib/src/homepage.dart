import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relaxsound_app/widget/soundcard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static AudioPlayer fixedPlayer1 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer2 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer3 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer4 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer5 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer6 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer7 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer8 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  static AudioPlayer fixedPlayer9 = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  static AudioCache audioCache1 = AudioCache(fixedPlayer: fixedPlayer1);
  static AudioCache audioCache2 = AudioCache(fixedPlayer: fixedPlayer2);
  static AudioCache audioCache3 = AudioCache(fixedPlayer: fixedPlayer3);
  static AudioCache audioCache4 = AudioCache(fixedPlayer: fixedPlayer4);
  static AudioCache audioCache5 = AudioCache(fixedPlayer: fixedPlayer5);
  static AudioCache audioCache6 = AudioCache(fixedPlayer: fixedPlayer6);
  static AudioCache audioCache7 = AudioCache(fixedPlayer: fixedPlayer7);
  static AudioCache audioCache8 = AudioCache(fixedPlayer: fixedPlayer8);
  static AudioCache audioCache9 = AudioCache(fixedPlayer: fixedPlayer9);

  List<Widget> listCard = [
    SoundCard(
      assetName: 'rain',
      audioCache: audioCache1,
      fixedPlayer: fixedPlayer1,
    ),
    SoundCard(
      assetName: 'summernight',
      audioCache: audioCache2,
      fixedPlayer: fixedPlayer2,
    ),
    SoundCard(
      assetName: 'water',
      audioCache: audioCache3,
      fixedPlayer: fixedPlayer3,
    ),
    SoundCard(
      assetName: 'forest',
      audioCache: audioCache6,
      fixedPlayer: fixedPlayer6,
    ),
    SoundCard(
      assetName: 'waterstream',
      audioCache: audioCache9,
      fixedPlayer: fixedPlayer9,
    ),
    SoundCard(
      assetName: 'seaside',
      audioCache: audioCache8,
      fixedPlayer: fixedPlayer8,
    ),
    SoundCard(
      assetName: 'wind',
      audioCache: audioCache4,
      fixedPlayer: fixedPlayer4,
    ),
    SoundCard(
      assetName: 'thunderstorm',
      audioCache: audioCache5,
      fixedPlayer: fixedPlayer5,
    ),
    SoundCard(
      assetName: 'leaves',
      audioCache: audioCache7,
      fixedPlayer: fixedPlayer7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: listCard.length,
              itemBuilder: (context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: listCard[index]);
              }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
