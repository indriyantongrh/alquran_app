import 'package:alquran_app/model/suratdetailmodel.dart';
import 'package:alquran_app/resource/apiprovider.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alquran_app/bloc/suratdetailbloc.dart';
import 'package:flutter/src/cupertino/slider.dart';

class DetailAlquran extends StatefulWidget {
  @override
  _DetailAlquranState createState() => _DetailAlquranState();
}

class _DetailAlquranState extends State<DetailAlquran> {

  Duration duration = new Duration();
  Duration posision = new Duration();
 /// bool playing = false;

  AudioPlayer audioPlayer;
  AudioPlayerState playerState;




  @override
  void initState() {
    bloc.fetchDetailSurat();
    audioPlayer = AudioPlayer();
    playerState = null;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initAudio(){
    var url = ApiProvider.audio.replaceAll("http", "https");
    audioPlayer.play(url);
    audioPlayer.onAudioPositionChanged.listen((event) { });
    print("kliked");
    print(url);
  }

  Future<void> play() async{
    var url = ApiProvider.audio.replaceAll("http", "https");
    await audioPlayer.play(url);
    setState(() {
      playerState = AudioPlayerState.PLAYING;
      if (audioPlayer.state == AudioPlayerState.COMPLETED){
        playerState = AudioPlayerState.COMPLETED;
      }
    });
  }

  Future<void> pause() async{
    await audioPlayer.pause();
    setState(() => playerState = AudioPlayerState.PAUSED);
  }
  Future<void> stop() async{
    await audioPlayer.stop();
    setState(() => playerState = AudioPlayerState.STOPPED);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ApiProvider.namasurat,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Parent(
                child:
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                  child:   Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed('/second');
                        },
                        child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFC45773),
                                    Color(0xFFA45584)
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.5))
                              ],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage("assets/starwhite.png"),
                                    backgroundColor: Colors.transparent,
                                    child:
                                    Text(
                                      ApiProvider.nomorsurat,
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),

                                    )
                                ),
                                Text(
                                  ApiProvider.namasurat,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Text(
                                  ApiProvider.arti,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ApiProvider.type+", ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      ApiProvider.ayat.toString()+" ayat",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.transparent,
                                      tooltip: 'Play',
                                        child: Icon(Icons.play_circle_outline),
                                        onPressed: playerState == null ||
                                            playerState == AudioPlayerState.PAUSED ||
                                            playerState == AudioPlayerState.STOPPED ||
                                            playerState == AudioPlayerState.COMPLETED ? play : null),
                                    Container(width: 10,),
                                    FloatingActionButton(
                                        backgroundColor: Colors.transparent,
                                        tooltip: 'Pause',
                                        child: Icon(Icons.pause_circle_outline),onPressed: playerState == AudioPlayerState.PLAYING ? pause : null),
                                    Container(width: 10,),
                                    FloatingActionButton(
                                        backgroundColor: Colors.transparent,
                                        tooltip: 'Pause',
                                        child: Icon(Icons.stop_circle_outlined),onPressed: playerState == AudioPlayerState.PLAYING ? pause : null)
                                  ],
                                )
                              ],

                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),



                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )

              ),



            ],
          ),
        ),

      ),
    );
  }



}



Widget buildList(AsyncSnapshot<List<Detailsuratmodel>> snapshot) {
  return ListView.separated(
    padding: EdgeInsets.only(right: 5, left: 5),
    itemCount: snapshot.data.length,
    separatorBuilder: (context, index) {
      return Divider(
        color: Color(0xFF6AB8C9),
      );
    },
    itemBuilder: (context, index) {

      double c_width = MediaQuery.of(context).size.width*0.8;
      return GestureDetector(
        onTap: () {

        },
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets/starts.png"),
                        backgroundColor: Colors.white,
                        child:
                        Text(
                          snapshot.data[index].nomor,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),

                        )
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "snapshot.data[index].nama,",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "snapshot.data[index].type",
                            style: GoogleFonts.poppins(
                                fontSize: 12
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),

                          Text(
                            "snapshot.data[index].ayat.toString()" +" ayat",
                            style: GoogleFonts.poppins(
                                fontSize: 12
                            ),
                          )

                        ],
                      )

                    ],
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  alignment: Alignment.centerRight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child:   Text(
                      "snapshot.data[index].asma",
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFF218B5F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),

            ],
          ),
        ),
      );
    },
  );

}