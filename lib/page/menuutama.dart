import 'package:alquran_app/page/alquran.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuUtama extends StatefulWidget {
  @override
  _MenuUtamaState createState() => _MenuUtamaState();

}

class _MenuUtamaState extends State<MenuUtama> {
  static GlobalKey<ScaffoldState> scaffold_state =
  new GlobalKey<ScaffoldState>();

  void showSnackbar(context) {
    scaffold_state.currentState.showSnackBar(SnackBar(
      content: Text(
        "Fitur segera hadir",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 13)
      ),
      duration: Duration(seconds: 2),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_state,
      body: Container(
        child:
        SingleChildScrollView(
          child:     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logotop.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Assalamualaikum ",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Indriyanto Nugroho",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Parent(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed('/second');
                            },
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        //Color(0xFF2193B0),
                                        Color(0xFF4E436A),
                                        ///Color(0xFF6DD5ED)
                                        Color(0xFF634B83)
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.black.withOpacity(0.5))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      scale: 7,
                                      alignment: Alignment.bottomRight,
                                      image: AssetImage("assets/doa.png"),

                                      fit: BoxFit.scaleDown)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "My Al-Quran",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),


                    Row(
                      children: [
                        //===Btn al quran
                        GestureDetector(
                          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AlQuran())); },
                          child:   Container(
                            height: 170,
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      //Color(0xFF2193B0),
                                      Color(0xFFC45773),
                                      ///Color(0xFF6DD5ED)
                                      Color(0xFFA45584)
                                    ]
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0,10),
                                      blurRadius: 20,
                                      color: Color(0xFFA45584)
                                  )
                                ]
                            ),
                            child: Column(
                              children: [

                                Image.asset("assets/logoquran.png", height: 120 , width: 120,),
                                Text("Al Quran",style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15))
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 35,
                        ),
                        //===Btn jadwal solat
                       GestureDetector(
                         onTap: (){showSnackbar(context);},
                         child:  Container(
                           height: 170,
                           width: 150,
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               gradient: LinearGradient(
                                   begin: Alignment.centerLeft,
                                   end: Alignment.centerRight,
                                   colors: [
                                     //Color(0xFF2193B0),
                                     Color(0xFF698AD6),
                                     ///Color(0xFF6DD5ED)
                                     Color(0xFF00ADEE)
                                   ]
                               ),
                               boxShadow: [
                                 BoxShadow(
                                     offset: Offset(0,10),
                                     blurRadius: 15,
                                     color: Color(0xFF698AD6)
                                 )
                               ]
                           ),
                           child: Column(
                             children: [
                               Image.asset("assets/logomasjid.png", height: 120 , width: 120,),
                               Text("Jadwal Salat",style: GoogleFonts.poppins(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w400,
                                   fontSize: 15))
                             ],
                           ),
                         ),
                       )

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        //===Btn Bookmark
                      GestureDetector(
                        onTap: (){showSnackbar(context);},
                        child:   Container(
                          height: 170,
                          width: 150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    //Color(0xFF2193B0),
                                    Color(0xFF008574),
                                    ///Color(0xFF6DD5ED)
                                    Color(0xFF006775)
                                  ]
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 10,
                                    color: Color(0xFF008574)
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/bookmark.png", height: 120 , width: 120 ,),
                              Text("Bookmarks",style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15))
                            ],
                          ),
                        ),
                      ),
                        SizedBox(
                          width: 35,
                        ),
                        //===Btn Tajwid list
                        GestureDetector(
                          onTap: (){showSnackbar(context);},
                          child: Container(
                            height: 170,
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      //Color(0xFF2193B0),
                                      Color(0xFF5EC192),
                                      ///Color(0xFF6DD5ED)
                                      Color(0xFF218B5F)
                                    ]
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0,10),
                                      blurRadius: 15,
                                      color: Color(0xFF98DDCB)
                                  )
                                ]
                            ),
                            child: Column(
                              children: [
                                Image.asset("assets/logoquran.png", height: 120 , width: 120,),
                                Text("Tajwid List",style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

