import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relaxsound_app/widget/const.dart';

import 'package:audioplayers/audioplayers.dart';

class SoundCard extends StatefulWidget {
  AudioPlayer fixedPlayer;
  final AudioCache audioCache;
  final String assetName;

  SoundCard({Key key, this.fixedPlayer, this.audioCache, this.assetName})
      : super(key: key);
  @override
  _SoundCardState createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard>
    with AutomaticKeepAliveClientMixin {
  double volumeValue = 100.0;
  bool _sliderVisible = false;
  bool selectedStatus = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            _sliderVisible = !_sliderVisible;
            selectedStatus = !selectedStatus;
            if (selectedStatus == true) {
              widget.fixedPlayer.state == PlayerState.PLAYING
                  ? pauseLocal()
                  : playLocal('${widget.assetName}');
            } else {
              pauseLocal();
            }
          });
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      'assets/images/${widget.assetName}.png',
                      height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 200,
                child: Visibility(
                  visible: _sliderVisible,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5.0,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white,
                      thumbColor: Colors.red[400],
                      overlayColor: Color(0x29001E3D),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Slider(
                        value: volumeValue,
                        min: 0,
                        max: 100,
                        onChanged: (double value) {
                          setState(() {
                            volumeValue = value;
                          });
                          widget.fixedPlayer.setVolume(value / 100);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .15,
                        height: MediaQuery.of(context).size.width * .15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedStatus ? Colors.green : Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '${widget.assetName}'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.red[700],
                  Colors.red[300],
                ]),
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
        ),
      ),
    );
  }

  Future playLocal(String assetName) async {
    if (widget.fixedPlayer.state == PlayerState.PAUSED) {
      widget.fixedPlayer.resume();
    } else {
      widget.fixedPlayer = await widget.audioCache
          .loop('audio/$assetName.m4a', volume: 0.7, stayAwake: true);
    }
  }

  Future pauseLocal() async {
    widget.fixedPlayer.pause();
  }

  @override
  bool get wantKeepAlive => true;
}
