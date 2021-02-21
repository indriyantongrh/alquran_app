import 'package:alquran_app/model/modelsurah.dart';
import 'package:alquran_app/model/modelsurat.dart';
import 'package:alquran_app/model/suratmodel.dart';
import 'package:alquran_app/page/detailalquran.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:alquran_app/bloc/suratbloc.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:alquran_app/resource/apiprovider.dart';

class AlQuran extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    bloc.fetchListSurat();
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
        title: Text(" Al-Quran",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      body:
      StreamBuilder(
              stream: bloc.listSuratObject,
              builder: (context, AsyncSnapshot <List<Suratmodel>> snapshot) {
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

Widget buildList(AsyncSnapshot<List<Suratmodel>> snapshot) {
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
          ApiProvider.nomorsurat = snapshot.data[index].nomor;
          ApiProvider.namasurat = snapshot.data[index].nama;
          ApiProvider.arti = snapshot.data[index].arti;
          ApiProvider.type = snapshot.data[index].type;
          ApiProvider.audio = snapshot.data[index].audio;
          ApiProvider.keterangan = snapshot.data[index].keterangan;
          ApiProvider.ayat = snapshot.data[index].ayat;
          print(snapshot.data[index].nomor,);
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => DetailAlquran()));
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
                        snapshot.data[index].nama,
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
                          snapshot.data[index].type,
                          style: GoogleFonts.poppins(
                              fontSize: 12
                          ),
                        ),

                          SizedBox(
                            width: 20,
                          ),

                          Text(
                            snapshot.data[index].ayat.toString() +" ayat",
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
                      snapshot.data[index].asma,
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
