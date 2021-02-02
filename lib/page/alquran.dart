import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:alquran_app/bloc/surahbloc.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class AlQuran extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    bloc.fetchAllSurah();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.home_outlined , color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(" Al-Quran",),
        centerTitle: true,

      ),
      body: StreamBuilder(
              stream: bloc.allSurah,
              builder: (context, AsyncSnapshot <Modelsurat> snapshot) {
                if (snapshot.hasData) {
                  return buildList(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),



      );
  }
}

Widget buildList(AsyncSnapshot<Modelsurat> snapshot) {
  return ListView.separated(
    itemCount: snapshot.data.data.length,
    separatorBuilder: (context, index) {
      return Divider(
        color: Colors.grey,
      );
    },
    itemBuilder: (context, index) {
      double c_width = MediaQuery.of(context).size.width*0.8;
      return GestureDetector(
        onTap: () {
          print("Kliked");
        },
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data.data[0].name.transliteration.id,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'AirBnB'),
                      ),

                      SizedBox(
                        height: 7,
                      ),

                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    },
  );

}
