
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ludo_game/EndScreen.dart';
import 'package:ludo_game/TrangleClass.dart';
import 'package:ludo_game/main.dart';

class MyHome extends StatefulWidget {
  final Shiva1;
  final Doreamon1;
  final BenTen1;
  final Patlu1;
  final CurrentPlayer;
  const MyHome({super.key,this.BenTen1,this.Doreamon1,this.Patlu1,this.Shiva1,this.CurrentPlayer});

  @override
  State<MyHome> createState() => _MyHomeState();
}
int r=1;
var DiskImage="assets/images/D1.jpg";
List<dynamic> Player=["",0,0,0,0];
int index=1;
List<dynamic> Shiva=["Shiva",0,0,0,0];
List<dynamic>Doreamon= ["Doremon",0,0,0,0];
List<dynamic> BenTen=["BenTen",0,0,0,0];
List<dynamic> Patlu=["Patlu",0,0,0,0];
var CurrentPlayer="Doreamon";
var CurrentPlayerIndex=0;

class _MyHomeState extends State<MyHome> {
@override
  void initState() {
    // TODO: implement initState
  // CurrentPlayer = "Doremon";
  if(GamePlayer==2) {
    BenTen = widget.BenTen1;
    Doreamon = widget.Doreamon1;
  }else if(GamePlayer==4)
    {
      Shiva = widget.Shiva1;
      BenTen = widget.BenTen1;
      Doreamon = widget.Doreamon1;
      Patlu = widget.Patlu1;
    }else{
    Shiva = widget.Shiva1;
    BenTen = widget.BenTen1;
    Doreamon = widget.Doreamon1;
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(

        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ludobackPic)),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("LUDO CARTOON",style: TextStyle(color: Colors.black),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GamePlayer!=2?( Shiva[0]==CurrentPlayer &&played==false?InkWell(
                  onTap:dc==true?(){
                    Dice(setState,context);
                    dice =true;
                  }:null,
                  child: AnimatedContainer(
                    duration:Duration(milliseconds: 500),
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.white,
                        image: DecorationImage(image: AssetImage(dice==true?DiskImage:"assets/images/D${Duration.millisecondsPerSecond%6+1}.jpg"))
                    ),
                    curve: Curves.bounceInOut,
                  ),
                ):Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,
                      image: DecorationImage(image: AssetImage(DiskImage))
                  ),
                )):Container(),
                BenTen[0]==CurrentPlayer?InkWell(
                  onTap:dc==true?(){
                    Dice(setState,context);
                    dice =true;
                  }:null,
                  child: AnimatedContainer(
                    duration:Duration(milliseconds: 500),
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.white,
                        image: DecorationImage(image: AssetImage(dice==true?DiskImage:"assets/images/D${Duration.millisecondsPerSecond%6+1}.jpg"))
                    ),
                    curve: Curves.bounceInOut,
                  ),
                ):  Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,
                      image: DecorationImage(image: AssetImage(DiskImage))
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // red
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: CurrentPlayer==Shiva[0]?Colors.greenAccent:Colors.red,
                      child: LudoChoiseBord(context,Shiva),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: Colors.white,
                      child: BordPlayerForRed(context,Colors.red),
                    ),

                    // Blue
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: CurrentPlayer==Doreamon[0]?Colors.greenAccent:Colors.blue,
                      child: LudoChoiseBord(context,Doreamon),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width*0.2,
                  color: Colors.white,
                  child: BordPlayerForGreenOrBlue(context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Green
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: CurrentPlayer==BenTen[0]?Colors.greenAccent:Colors.green,
                      child: LudoChoiseBord(context,BenTen),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.2,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: Colors.white,
                      child: BordPlayerForYellow(context, Colors.yellow),
                    ),

                    // Yellow
                    AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.4,
                      width: MediaQuery.of(context).size.width*0.4,
                      color: CurrentPlayer==Patlu[0]?Colors.greenAccent:Colors.yellow,
                      child:  LudoChoiseBord(context,Patlu),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: GamePlayer==4?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
              children: [
                Doreamon[0]==CurrentPlayer?InkWell(
                  onTap:dc==true?(){
                    Dice(setState,context);
                    dice =true;
                  }:null,
                  child: AnimatedContainer(
                    duration:Duration(milliseconds: 500),
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(color: Colors.white,
                        image: DecorationImage(image: AssetImage(dice==true?DiskImage:"assets/images/D${Duration.millisecondsPerSecond%6+1}.jpg"))
                    ),
                    curve: Curves.bounceInOut,
                  ),
                ):Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white,
                      image: DecorationImage(image: AssetImage(DiskImage))
                  ),
                ),
                GamePlayer==4?(
                    Patlu[0]==CurrentPlayer? InkWell(
                      onTap:dc==true?(){
                        Dice(setState,context);
                        dice =true;
                      }:null,
                      child: AnimatedContainer(
                        duration:Duration(milliseconds: 500),
                        height:50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.white,
                            image: DecorationImage(image: AssetImage(dice==true?DiskImage:"assets/images/D${Duration.millisecondsPerSecond%6+1}.jpg"))
                        ),
                        curve: Curves.bounceInOut,
                      ),
                    ):  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.white,
                          image: DecorationImage(image: AssetImage(DiskImage))
                      ),
                    )
                ):Container(),
              ],
            ),

          ],
        ),
      ) ,
    );



  }


  Widget BordPlayerForRed(context,Color){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(5),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),

            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(56),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(55),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            // box Color
            // Todo r1
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(6),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Shiva[2]==57||Shiva[3]==57||Shiva[4]==57||Shiva[1]==57?Ply(57):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(54),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            // Todo R2
            Container(

              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(7),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:Shiva[1]==58||Shiva[2]==58||Shiva[3]==58||Shiva[4]==58?Ply(58):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(53),
              decoration: BoxDecoration(
                color: Colors.black45,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(8),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Shiva[1]==59||Shiva[2]==59||Shiva[3]==59||Shiva[4]==59?Ply(59):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(52),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(9),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Shiva[2]==60||Shiva[3]==60||Shiva[4]==60||Shiva[1]==60?Ply(60):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(51),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(10),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Shiva[2]==61||Shiva[3]==61||Shiva[4]==61||Shiva[1]==61?Ply(61):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(50),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget BordPlayerForYellow(context,Color){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(24),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:Patlu[1]==61||Patlu[2]==61||Patlu[3]==61||Patlu[4]==61?Ply(87):null,

              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,

              child: Ply(36),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(25),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:Patlu[1]==60||Patlu[2]==60||Patlu[3]==60||Patlu[4]==60?Ply(86):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(35),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
              ),
            ),
          ],
        ),

        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(26),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:Patlu[1]==59||Patlu[2]==59||Patlu[3]==59||Patlu[4]==59?Ply(85):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(34),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(27),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:Patlu[1]==58||Patlu[2]==58||Patlu[3]==58||Patlu[4]==58?Ply(84):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(33),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(28),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Patlu[1]==57||Patlu[2]==57||Patlu[3]==57||Patlu[4]==57?Ply(83):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(32),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: Color
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(29),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(30),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),

              ),
            ),
            Container(
              child: Patlu[1]==57||Patlu[2]==57||Patlu[3]==57||Patlu[4]==57?null:Ply(31),
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),

      ],
    );
  }

  Ply(int i) {
    // int a = i-13>6?i-13:(i+40);

    int b =((i - 13) >= 6 ? (i - 13) : (i + 39));
    int  p  = ((i - 26) >= 6 ? (i - 26) : (i + 26));
    int d = ((i - 39) >= 6 ? (i - 39) : (i + 13));
    col = CurrentPlayer==Shiva[0]?i:CurrentPlayer==BenTen[0]?b:CurrentPlayer==Patlu[0]?p:d;
    //todo benten
    return CurrentPlayer==BenTen[0] ?BenTen[1]==b?Player1(context,BenTen,index):BenTen[2]==b? Player2(context, BenTen, index):BenTen[3]==b? Player3(context,BenTen, index):BenTen[4]==b? Player4(context, BenTen, index):(Shiva[1]==i?Player1(context,Shiva,index):Shiva[2]==i? Player2(context, Shiva, index):Shiva[3]==i? Player3(context, Shiva, index):Shiva[4]==i? Player4(context, Shiva, index):(Patlu[1]==p?Player1(context,Patlu,index):Patlu[2]==p? Player2(context, Patlu, index):Patlu[3]==p? Player3(context,Patlu, index):Patlu[4]==p? Player4(context, Patlu, index):((Doreamon[1]==d?Player1(context,Doreamon,index):Doreamon[2]==d? Player2(context, Doreamon, index):Doreamon[3]==d? Player3(context,Doreamon, index):Doreamon[4]==d? Player4(context, Doreamon, index):null)))):CurrentPlayer==Shiva[0]?(Shiva[1]==i?Player1(context,Shiva,index):Shiva[2]==i? Player2(context, Shiva, index):Shiva[3]==i? Player3(context, Shiva, index):Shiva[4]==i? Player4(context, Shiva, index):BenTen[1]==b?Player1(context,BenTen,index):BenTen[2]==b? Player2(context, BenTen, index):BenTen[3]==b? Player3(context,BenTen, index):BenTen[4]==b? Player4(context, BenTen, index):(Patlu[1]==p?Player1(context,Patlu,index):Patlu[2]==p? Player2(context, Patlu, index):Patlu[3]==p? Player3(context,Patlu, index):Patlu[4]==p? Player4(context, Patlu, index):((Doreamon[1]==d?Player1(context,Doreamon,index):Doreamon[2]==d? Player2(context, Doreamon, index):Doreamon[3]==d? Player3(context,Doreamon, index):Doreamon[4]==d? Player4(context, Doreamon, index):null)))):CurrentPlayer==Doreamon[0]?((Doreamon[1]==d?Player1(context,Doreamon,index):Doreamon[2]==d? Player2(context, Doreamon, index):Doreamon[3]==d? Player3(context,Doreamon, index):Doreamon[4]==d? Player4(context, Doreamon, index):(Shiva[1]==i?Player1(context,Shiva,index):Shiva[2]==i? Player2(context, Shiva, index):Shiva[3]==i? Player3(context, Shiva, index):Shiva[4]==i? Player4(context, Shiva, index):BenTen[1]==b?Player1(context,BenTen,index):BenTen[2]==b? Player2(context, BenTen, index):BenTen[3]==b? Player3(context,BenTen, index):BenTen[4]==b? Player4(context, BenTen, index):(Patlu[1]==p?Player1(context,Patlu,index):Patlu[2]==p? Player2(context, Patlu, index):Patlu[3]==p? Player3(context,Patlu, index):Patlu[4]==p? Player4(context, Patlu, index):null)))):(Patlu[1]==p?Player1(context,Patlu,index):Patlu[2]==p? Player2(context, Patlu, index):Patlu[3]==p? Player3(context,Patlu, index):Patlu[4]==p? Player4(context, Patlu, index):((Doreamon[1]==d?Player1(context,Doreamon,index):Doreamon[2]==d? Player2(context, Doreamon, index):Doreamon[3]==d? Player3(context,Doreamon, index):Doreamon[4]==d? Player4(context, Doreamon, index):(Shiva[1]==i?Player1(context,Shiva,index):Shiva[2]==i? Player2(context, Shiva, index):Shiva[3]==i? Player3(context, Shiva, index):Shiva[4]==i? Player4(context, Shiva, index):BenTen[1]==b?Player1(context,BenTen,index):BenTen[2]==b? Player2(context, BenTen, index):BenTen[3]==b? Player3(context,BenTen, index):BenTen[4]==b? Player4(context, BenTen, index):null))));

  }
  Widget BordPlayerForGreenOrBlue(context){
    var C = Colors.blue;
    var Color = Colors.green;
    return Column(
      children: [

        // Todo for Green
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(16),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(17),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: BenTen[1]==57||BenTen[2]==57||BenTen[3]==57||BenTen[4]==57?null:Ply(18),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            // box Color
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(15),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: BenTen[1]==57||BenTen[2]==57||BenTen[3]==57||BenTen[4]==57?Ply(70):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(19),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(14),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  BenTen[1]==58||BenTen[2]==58||BenTen[3]==58||BenTen[4]==58?Ply(71):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(20),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(13),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  BenTen[1]==59||BenTen[2]==59||BenTen[3]==59||BenTen[4]==59?Ply(72):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(21),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(12),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  BenTen[1]==60||BenTen[2]==60||BenTen[3]==60||BenTen[4]==60?Ply(73):null,

              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(22),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(11),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  BenTen[1]==61||BenTen[2]==61||BenTen[3]==61||BenTen[4]==61?Ply(74):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Color,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(23),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),

        Container(
          height: MediaQuery.of(context).size.width*0.2,
          width: MediaQuery.of(context).size.width*0.2,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomPaint(// Specify size
                size:Size(MediaQuery.of(context).size.width*0.20,MediaQuery.of(context).size.width*0.20),
                painter: TrianglePainter(),
              ),
              Shiva[1]==62||Shiva[2]==62||Shiva[3]==62||Shiva[4]==62 ? Ply(62)??Text(""):Text(""),
              BenTen[1]==62||BenTen[2]==62||BenTen[3]==62||BenTen[4]==62 ? Ply(75)??Text(""):Text(""),
              Patlu[1]==62||Patlu[2]==62||Patlu[3]==62||Patlu[4]==62?Ply(88)??Text(""):Text(""),
              Doreamon[1]==62||Doreamon[2]==62||Doreamon[3]==62||Doreamon[4]==62?Ply(101)??Text(""):Text(""),

            ],
          )
          ,
        ),


        // Todo  For Blue


        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(49),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Doreamon[1]==61||Doreamon[2]==61||Doreamon[3]==61||Doreamon[4]==61?Ply(100):null,

              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: C,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(37),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(48),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Doreamon[1]==60||Doreamon[2]==60||Doreamon[3]==60||Doreamon[4]==60?Ply(99):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: C,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(38),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(47),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Doreamon[1]==59||Doreamon[2]==59||Doreamon[3]==59||Doreamon[4]==59?Ply(98):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: C,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(39),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(46),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Doreamon[1]==58||Doreamon[2]==58||Doreamon[3]==58||Doreamon[4]==58?Ply(97):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: C,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(40),

              decoration: BoxDecoration(
                  color: Colors.black45,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(45),

              decoration: BoxDecoration(

                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: C
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child:  Doreamon[1]==57||Doreamon[2]==57||Doreamon[3]==57||Doreamon[4]==57?Ply(96):null,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: C,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(41),

              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1

                ),
                ),
              ),),
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Doreamon[2]==57||Doreamon[1]==57||Doreamon[3]==57||Doreamon[4]==57?null:Ply(44),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(43),

              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.066,
              height: MediaQuery.of(context).size.width*0.066,
              child: Ply(42),

              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
      ],
    );
  }


  Future<void> GameOutPlayer(GamePlayer,p1,setState)async {
    switch (p1[index])
    {
      case 6:
        break;
      case 14:
        break;
      case 19:
        break;
      case 27:
        break;
      case 32:
        break;
      case 40:
        break;
      case 45:
        break;
      case 53:
        break;
      case 62:
        break;
      default:
        switch (GamePlayer) {
          case 4:
            if (p1[0] == Doreamon[0] && (!Doreamon.contains(62))) {
              for(int i =1;i<=4;i++) {
                if ((Shiva[i] - p1[index] == 39 ||
                    p1[index] - Shiva[i] == 13) && p1[index] != Shiva[i] &&Shiva[i]!=0 &&Shiva[i]<57) {
                  setState((){
        Shiva[i] = 0;
        });
                 await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("shiva.mp3");
                  }
                }else if ((BenTen[i] - p1[index] == 26 || p1[index] - BenTen[i] == 26) && p1[index] != BenTen[i] &&BenTen[i]!=0&&BenTen[i]<57) {
                  setState((){
                    BenTen[i] = 0;
                  });

                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }
                }
                else if (((p1[index] - Patlu[i]) == 39 || Patlu[i]-p1[index]==13)&& p1[index] != Patlu[i] &&Patlu[i]!=0&&Patlu[i]<57) {
                 setState((){
                   Patlu[i] = 0;
                 });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2 ==true) {
                    await FlameAudio.play("motu.mp3");
                  }
                }
              }
            }
            else if (p1[0] == Shiva[0] && (!Shiva.contains(62))) {

              for(int i=1;i<=4;i++) {
                if ((Doreamon[i] - p1[index] == 13 ||
                    p1[index] - Doreamon[i] == 39) &&
                    p1[index] != Doreamon[i] &&Doreamon[i]!=0 &&Doreamon[i]<57) {
                  setState((){
                    Doreamon[i] = 0;
                  });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }
                }
                else if ((BenTen[i] - p1[index] == 39 ||
                    p1[index] - BenTen[i] == 13) && p1[index] != BenTen[i]&&BenTen[i]!=0&& BenTen[i]<57) {
                  setState((){
                    BenTen[i] = 0;
                  });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }

                }
                else if ((Patlu[i] - p1[index] == 26 ||
                    p1[index] - Patlu[i] == 26) &&
                    p1[index] != Patlu[i]&&Patlu[i]!=0&&Patlu[i]<57) {
                  setState(() {
                    Patlu[i] = 0;
                  });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2 ==true) {
                    await FlameAudio.play("motu.mp3");
                  }
                }
              }
            }
            else if (p1[0] == Patlu[0] && (!Patlu.contains(62))) {

              for(int i=1;i<=4;i++) {
                if ((Shiva[i] - p1[index] == 26 ||
                    p1[index] - Shiva[i] == 26) && p1[index] != Shiva[i] &&Shiva[i]!=0&&Shiva[i]<57) {
                  setState(() {
                    Shiva[i] = 0;
                  });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("shiva.mp3");
                  }
                }
                else if ((BenTen[i] - p1[index] == 13 ||
                    p1[index] - BenTen[i] == 39) && p1[index] != BenTen[i]&&BenTen[i]!=0&&BenTen[i]<57) {
                 setState(() {
                   BenTen[i] = 0;
                 });
                 await Future.delayed(Duration(milliseconds: 500));
                 if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }
                } else if ((Doreamon[i] - p1[index] == 39 ||
                    p1[index] - Doreamon[i] == 13) &&
                    p1[index] != Doreamon[i]&&Doreamon[i]!=0&&Doreamon[i]<57) {
                  setState(() {
                    Doreamon[i] = 0;
                  });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }
                }
              }

            }
            else if (p1[0] == BenTen[0] && (!BenTen.contains(62))) {

              for(int i=1;i<=4;i++) {
                if ((Shiva[i] - p1[index] == 13 ||
                    p1[index] - Shiva[i] == 39) && p1[index] != Shiva[i]&&Shiva[i]!=0&&Shiva[i]<57) {
                  setState((){
        Shiva[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 500));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("shiva.mp3");
                  }
                }
                else if ((Doreamon[i] - p1[index] == 26 ||
                    p1[index] - Doreamon[i] == 26) &&
                    p1[index] != Doreamon[i]&&Doreamon[i]!=0&&Doreamon[i]<57) {
                  setState((){
        Doreamon[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }

                }
                else if ((Patlu[i] - p1[index] == 39 ||
                    p1[index] - Patlu[i] == 13) && p1[index] != Patlu[i]&&Patlu[i]!=0&&Patlu[i]<57) {
                 setState((){
        Patlu[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2 ==true) {
                    await FlameAudio.play("motu.mp3");
                  }
                }
              }

            }
            break;

          case 3:
            if (p1[0] == Doreamon[0] && (!Doreamon.contains(62))) {
              for(int i =1;i<=4;i++) {
                if ((Shiva[i] - p1[index] == 39 ||
                    p1[index] - Shiva[i] == 13) && p1[index] != Shiva[i] &&Shiva[i]!=0&&Shiva[i]<57) {
                  setState((){
        Shiva[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("shiva.mp3");
                  }

                }else if ((BenTen[i] - p1[index] == 26 || p1[index] - BenTen[i] == 26) && p1[index] != BenTen[i] &&BenTen[i]!=0 &&BenTen[i]<57) {
                 setState((){
        BenTen[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }

                }
              }
            }
            else if (p1[0] == Shiva[0] && (!Shiva.contains(62))) {

              for(int i=1;i<=4;i++) {
                if ((Doreamon[i] - p1[index] == 13 ||
                    p1[index] - Doreamon[i] == 39) &&
                    p1[index] != Doreamon[i] &&Doreamon[i]!=0&&Doreamon[i]<57) {
                  setState((){
        Doreamon[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }
                }
                else if ((BenTen[i] - p1[index] == 39 ||
                    p1[index] - BenTen[i] == 13) && p1[index] != BenTen[i]&&BenTen[i]!=0&&BenTen[i]<57) {
                 setState((){
        BenTen[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }

                }

              }
            }
            else if (p1[0] == BenTen[0] && (!BenTen.contains(62))) {

              for(int i=1;i<=4;i++) {
                if ((Shiva[i] - p1[index] == 13 ||
                    p1[index] - Shiva[i] == 39) && p1[index] != Shiva[i]&&Shiva[i]!=0&&Shiva[i]<57) {
                  setState((){
        Shiva[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("shiva.mp3");
                  }
                }
                else if ((Doreamon[i] - p1[index] == 26 ||
                    p1[index] - Doreamon[i] == 26) &&
                    p1[index] != Doreamon[i]&&Doreamon[i]!=0&&Doreamon[i]<57) {
                  setState((){
        Doreamon[i] = 0;
        });
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }
                }
              }

            }
            break;
          case 2:
            if (p1[0] == Doreamon[0] && (!Doreamon.contains(62))) {
              for(int i =1;i<=4;i++) {
                if ((BenTen[i] - p1[index] == 26 || p1[index] - BenTen[i] == 26) && p1[index] != BenTen[i] &&BenTen[i]!=0&&BenTen[i]<57) {
                  setState((){BenTen[i] = 0;});
                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("benten.mp3");
                  }

                }
              }
            }
            else if (p1[0] == BenTen[0] && (!BenTen.contains(62))) {

              for(int i=1;i<=4;i++) {
               if ((Doreamon[i] - p1[index] == 26 || p1[index] - Doreamon[i] == 26) && p1[index] != Doreamon[i]&&Doreamon[i]!=0) {
                 setState((){
                   Doreamon[i] = 0;
                 });

                  await Future.delayed(Duration(milliseconds: 300));
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Doreamon.mp3");
                  }
                }
              }

            }
            break;
          default:
            break;
        }
        break;
    }

    await Future.delayed(Duration(milliseconds: 500));

  }
  Player1(context,List Player,index){
    return CurrentPlayer==Player[0]?InkWell(
      onTap: () async {
        print("Col $col");

        index=1;
        print(Player);
        // setState(() {
        //   Player[index]++;
        // });


        if(r==6)
        {
          if(Player[index]==0)
          {

            setState(() {
              Player[index] += 6;
              dc = true;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            r=0;
            CurrentPlayer = Player[0];
            print(Player);
            // Game Player out

            await GameOutPlayer(GamePlayer,
                  CurrentPlayer == Doreamon[0] ? Doreamon : CurrentPlayer ==
                      Patlu[0] ? Patlu : CurrentPlayer == BenTen[0]
                      ? BenTen
                      : Shiva,setState);

          }else if(Player[index]!=0 &&Player[index]+r<=62)
          {
            while(r>0) {
              setState(() {
                Player[index]++;
              });
              if(SongPlayer2==true) {
                await FlameAudio.play("Player.mp3");
              }
              await Future.delayed(Duration(milliseconds: 500));
              r--;
            }
            CurrentPlayer = Player[0];
            print(Player);

            // Game Player out
            setState(() {
              dc = true;
            });


              await GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);

          }
        }else
        {
          if((Player[index]!=0) && Player[index]+r<=62)
          {

            while(r>0) {
              setState(() {
                Player[index] ++;
              });
              if(SongPlayer2==true) {
                await FlameAudio.play("Player.mp3");
              }
              await Future.delayed(Duration(milliseconds: 500));
              r--;
            }


            // Game Player Out



await              GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);



            print("Executed");

            setState(() {
              dc  = true;
              cll.head = cll.head!.next;
              CurrentPlayer = cll.head!.data;
              if(CurrentPlayer==BenTen[0] && robotPlayer==true)
              {
                autoPlay(context, setState);
              }
            });
          }
        }
        if(Player[1]==62 && Player[2]==62 && Player[3]==62 && Player[4]==62)
        {
          setState(() {
            Winner.add(Player[0]);
            // print("Player $Winner wins");
            print("raj $Winner");

            // todo panding for delete
            if(cll.head!.data==Player[0])
              {
                cll.head = cll.head!.next;
                CurrentPlayer =cll.head!.data;
                cll.delete(Player[0]);
              }else{
              cll.delete(Player[0]);
            }
            End(Winner,Player);
          });
          if(SongPlayer2==true)
          {
            await FlameAudio.play("Wins.mp3");
          }

        }



      },
      child: OverflowBox(
        maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
        // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
        child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
      ),
    ):OverflowBox(
      maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
    );
  }
  Player2(context,List Player,index){
  return CurrentPlayer==Player[0]?InkWell(
    onTap: () async {
      print("Col $col");

      index=2;
      print(Player);
      // setState(() {
      //   Player[index]++;
      // });


      if(r==6)
      {
        if(Player[index]==0)
        {

          setState(() {
            Player[index] += 6;
            dc = true;
          });
          if(SongPlayer2==true) {
            await FlameAudio.play("Player.mp3");
          }
          r=0;
          CurrentPlayer = Player[0];
          print(Player);
          // Game Player out

          await GameOutPlayer(GamePlayer,
              CurrentPlayer == Doreamon[0] ? Doreamon : CurrentPlayer ==
                  Patlu[0] ? Patlu : CurrentPlayer == BenTen[0]
                  ? BenTen
                  : Shiva,setState);

        }else if(Player[index]!=0 &&Player[index]+r<=62)
        {
          while(r>0) {
            setState(() {
              Player[index]++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }
          CurrentPlayer = Player[0];
          print(Player);

          // Game Player out
          setState(() {
            dc = true;
          });


          await GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);

        }
      }else
      {
        if((Player[index]!=0) && Player[index]+r<=62)
        {

          while(r>0) {
            setState(() {
              Player[index] ++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }


          // Game Player Out



          await              GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);



          print("Executed");

          setState(() {
            dc  = true;
            cll.head = cll.head!.next;
            CurrentPlayer = cll.head!.data;
            if(CurrentPlayer==BenTen[0] && robotPlayer==true)
            {
              autoPlay(context, setState);
            }
          });
        }
      }
      if(Player[1]==62 && Player[2]==62 && Player[3]==62 && Player[4]==62)
      {
        setState(() {
          Winner.add(Player[0]);
          // print("Player $Winner wins");
          print("raj $Winner");

          // todo panding for delete
          if(cll.head!.data==Player[0])
          {
            cll.head = cll.head!.next;
            CurrentPlayer =cll.head!.data;
            cll.delete(Player[0]);
          }else{
            cll.delete(Player[0]);
          }
          End(Winner,Player);
        });
        if(SongPlayer2==true)
        {
          await FlameAudio.play("Wins.mp3");
        }

      }



    },
    child: OverflowBox(
      maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
    ),
  ):OverflowBox(
    maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
  );
}
  Player3(context,List Player,index){
  return CurrentPlayer==Player[0]?InkWell(
    onTap: () async {
      print("Col $col");

      index=3;
      print(Player);
      // setState(() {
      //   Player[index]++;
      // });


      if(r==6)
      {
        if(Player[index]==0)
        {

          setState(() {
            Player[index] += 6;
            dc = true;
          });
          if(SongPlayer2==true) {
            await FlameAudio.play("Player.mp3");
          }
          r=0;
          CurrentPlayer = Player[0];
          print(Player);
          // Game Player out

          await GameOutPlayer(GamePlayer,
              CurrentPlayer == Doreamon[0] ? Doreamon : CurrentPlayer ==
                  Patlu[0] ? Patlu : CurrentPlayer == BenTen[0]
                  ? BenTen
                  : Shiva,setState);

        }else if(Player[index]!=0 &&Player[index]+r<=62)
        {
          while(r>0) {
            setState(() {
              Player[index]++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }
          CurrentPlayer = Player[0];
          print(Player);

          // Game Player out
          setState(() {
            dc = true;
          });


          await GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);

        }
      }else
      {
        if((Player[index]!=0) && Player[index]+r<=62)
        {

          while(r>0) {
            setState(() {
              Player[index] ++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }


          // Game Player Out



          await              GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);



          print("Executed");

          setState(() {
            dc  = true;
            cll.head = cll.head!.next;
            CurrentPlayer = cll.head!.data;
            if(CurrentPlayer==BenTen[0] && robotPlayer==true)
            {
              autoPlay(context, setState);
            }
          });
        }
      }
      if(Player[1]==62 && Player[2]==62 && Player[3]==62 && Player[4]==62)
      {
        setState(() {
          Winner.add(Player[0]);
          // print("Player $Winner wins");
          print("raj $Winner");

          // todo panding for delete
          if(cll.head!.data==Player[0])
          {
            cll.head = cll.head!.next;
            CurrentPlayer =cll.head!.data;
            cll.delete(Player[0]);
          }else{
            cll.delete(Player[0]);
          }
          End(Winner,Player);
        });
        if(SongPlayer2==true)
        {
          await FlameAudio.play("Wins.mp3");
        }

      }



    },
    child: OverflowBox(
      maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
    ),
  ):OverflowBox(
    maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
  );
}
  Player4(context,List Player,index){
  return CurrentPlayer==Player[0]?InkWell(
    onTap: () async {
      print("Col $col");

      index=4;
      print(Player);
      // setState(() {
      //   Player[index]++;
      // });


      if(r==6)
      {
        if(Player[index]==0)
        {

          setState(() {
            Player[index] += 6;
            dc = true;
          });
          if(SongPlayer2==true) {
            await FlameAudio.play("Player.mp3");
          }
          r=0;
          CurrentPlayer = Player[0];
          print(Player);
          // Game Player out

          await GameOutPlayer(GamePlayer,
              CurrentPlayer == Doreamon[0] ? Doreamon : CurrentPlayer ==
                  Patlu[0] ? Patlu : CurrentPlayer == BenTen[0]
                  ? BenTen
                  : Shiva,setState);

        }else if(Player[index]!=0 &&Player[index]+r<=62)
        {
          while(r>0) {
            setState(() {
              Player[index]++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }
          CurrentPlayer = Player[0];
          print(Player);

          // Game Player out
          setState(() {
            dc = true;
          });


          await GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);

        }
      }else
      {
        if((Player[index]!=0) && Player[index]+r<=62)
        {

          while(r>0) {
            setState(() {
              Player[index] ++;
            });
            if(SongPlayer2==true) {
              await FlameAudio.play("Player.mp3");
            }
            await Future.delayed(Duration(milliseconds: 500));
            r--;
          }


          // Game Player Out



          await              GameOutPlayer(GamePlayer,CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer==Patlu[0]?Patlu:CurrentPlayer==BenTen[0]?BenTen:Shiva,setState);



          print("Executed");

          setState(() {
            dc  = true;
            cll.head = cll.head!.next;
            CurrentPlayer = cll.head!.data;
            if(CurrentPlayer==BenTen[0] && robotPlayer==true)
            {
              autoPlay(context, setState);
            }
          });
        }
      }
      if(Player[1]==62 && Player[2]==62 && Player[3]==62 && Player[4]==62)
      {
        setState(() {
          Winner.add(Player[0]);
          // print("Player $Winner wins");
          print("raj $Winner");

          // todo panding for delete
          if(cll.head!.data==Player[0])
          {
            cll.head = cll.head!.next;
            CurrentPlayer =cll.head!.data;
            cll.delete(Player[0]);
          }else{
            cll.delete(Player[0]);
          }
          End(Winner,Player);
        });
        if(SongPlayer2==true)
        {
          await FlameAudio.play("Wins.mp3");
        }

      }



    },
    child: OverflowBox(
      maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
      child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
    ),
  ):OverflowBox(
    maxHeight: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    // maxWidth: CurrentPlayerIndex==0? MediaQuery.of(context).size.width*0.1: MediaQuery.of(context).size.width*0.05,
    child: Image(image: AssetImage(Player[0]=="BenTen"?"assets/images/Benten.png":Player[0]=="Patlu"?"assets/images/patluStanding.png":Player[0]=="Doremon"?"assets/images/doreamon.png": "assets/images/shiva.png")),
  );
}


  End(var Win,var P)
  {
  if(GamePlayer==4&&Win.length==3)
  {
    Win.add(P[0]);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>EndGame(GamePlayer: 4,Winner: Win,)));
  }else if(GamePlayer==3 &&Win.length==2)
  {
    Win.add(P[0]);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>EndGame(GamePlayer: 4,Winner: Win,)));
  }else if(GamePlayer==2&&Win.length==1)
  {
    Win.add(P[0]);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>EndGame(GamePlayer: 4,Winner: Win,)));

  }
}


  Widget LudoChoiseBord(context,List Player){
    return Winner.length==1? (Winner[0]==Player[0]?SizedBox(
        height: 200,
        width: 90,
        child: Image(image: AssetImage("assets/images/King1.webp"))):Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[1]==0?Player1(context, Player,1):null,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Colors.white,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[2]==0?Player2(context, Player,2):null,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[3]==0?Player3(context, Player,3):null,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: Colors.white
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[4]==0?Player4(context, Player,4):null,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: Colors.white
              ),
            ),
          ],
        ),
      ],
    )):Winner.length==2?
        Winner[1]==Player[0]?SizedBox(
            height: 200,
            width: 90,
            child: Image(image: AssetImage("assets/images/King2.webp"))):Winner[0]==Player[0]? SizedBox(
            height: 200,
            width: 90,
            child: Image(image: AssetImage("assets/images/King1.webp"))):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Player[1]==0?Player1(context, Player,1):null,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(width: 1)),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Player[2]==0?Player2(context, Player,2):null,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.fromBorderSide(BorderSide(width: 1))
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Player[3]==0?Player3(context, Player,3):null,
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(width: 1)),
                      color: Colors.white
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width*0.1,
                  width: MediaQuery.of(context).size.width*0.1,
                  child: Player[4]==0?Player4(context, Player,4):null,
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(width: 1)),
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ],
        ) :Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[1]==0?Player1(context, Player,1):null,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Colors.white,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[2]==0?Player2(context, Player,2):null,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(BorderSide(width: 1))
              ),
            ),
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[3]==0?Player3(context, Player,3):null,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: Colors.white
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.1,
              width: MediaQuery.of(context).size.width*0.1,
              child: Player[4]==0?Player4(context, Player,4):null,
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(width: 1)),
                  color: Colors.white
              ),
            ),
          ],
        ),
      ],
    );
  }



}

