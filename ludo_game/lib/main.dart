import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:ludo_game/EndScreen.dart';
import 'package:ludo_game/MyHomePage.dart';
import 'package:ludo_game/linklist.dart';

void main() {
  runApp(const MyLudoGame());
}
var bgms;
final l = List.generate(100,(_)=>GlobalKey());
CircularLinkedList cll = CircularLinkedList();
int col=0;
var ludobackPic = "assets/images/ludoBack.jpg";
var GameStart=true;
bool played=false;
var GamePlayer=4;
bool dice=false;
bool dc =true;
var Winner=[];
bool SongPlayer1=false;
bool SongPlayer2=true;
var robotPlayer = false;
final backGroundSong= "retro-game-arcade-236133.mp3";
//
Future<void> autoPlay(context,setState) async
{
  await Future.delayed(Duration(seconds: 2));
  Dice(setState, context);
  for(int i=1;i<=4;i++)
    {
      for(int j=1;j<=4;j++) {
        if (BenTen[i] + r - Doreamon[j] == 26 || Doreamon[j]-BenTen[i]+r==26 && Doreamon[j]!=BenTen[i] &&BenTen[i]!>=57)
          {

              while(r>0)
                {
                  setState(() {
                    BenTen[i]++;
                  });
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Player.mp3");
                  }
                 await Future.delayed(Duration(milliseconds: 500));
                  r--;
                }
                setState(() {
                  autoOutPlayer(BenTen[i]);
                });
            break;
          }
      }
    }

  if(r==6)
    {
      // all are zero;

      if(BenTen[1]==0)
        {
          setState(() {
          BenTen[1] += 6;
         });
          r=0;
          if(SongPlayer2==true) {
            await FlameAudio.play("Player.mp3");
          }
          autoPlay(context, setState);
        }else if(BenTen[1]>0&&BenTen[1]+r<=62)
          {
            while(r>0)
              {
                setState((){
                  BenTen[1]++;
                });
                if(SongPlayer2==true) {
                  await FlameAudio.play("Player.mp3");
                }
                await Future.delayed(Duration(milliseconds: 500));
                r--;
              }
            setState((){autoOutPlayer(BenTen[1]);});
            autoPlay(context, setState);

          }else if(BenTen[1]+r>62 )
            {
              if(BenTen[2]==0) {
                setState(() {
                  BenTen[2] += 6;
                });
                r=0;
                if(SongPlayer2==true) {
                  await FlameAudio.play("Player.mp3");
                }
                autoPlay(context, setState);
              }else if(BenTen[2]>0 &&BenTen[2]+r<=62)
                {
                  while(r>0){
                  setState((){
                    BenTen[2]++;
                  });
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Player.mp3");
                  }
                  await Future.delayed(Duration(milliseconds: 500));
                  r--;
                  }
                  setState((){autoOutPlayer(BenTen[2]);});
                  autoPlay(context, setState);
                }else if(BenTen[2]+r>62)
                  {
                    if(BenTen[3]==0) {
                      setState(() {
                        BenTen[3] += 6;
                      });
                      r=0;
                      if(SongPlayer2==true) {
                        await FlameAudio.play("Player.mp3");
                      }
                      autoPlay(context, setState);
                    }else if(BenTen[3]>0 &&BenTen[3]+r<=62)
                    {
                      while(r>0){
                        setState((){
                          BenTen[3]++;
                        });
                        if(SongPlayer2==true) {
                          await FlameAudio.play("Player.mp3");
                        }
                        await Future.delayed(Duration(milliseconds: 500));
                        r--;
                      }
                      setState((){autoOutPlayer(BenTen[3]);});
                      autoPlay(context, setState);
                    }else if(BenTen[3]+r>62)
                      {
                        if(BenTen[4]==0) {
                          setState(() {
                            BenTen[4] += 6;
                          });
                          r=0;
                          if(SongPlayer2==true) {
                            await FlameAudio.play("Player.mp3");
                          }
                          autoPlay(context, setState);
                        }else if(BenTen[4]>0 &&BenTen[4]+r<=62)
                        {
                          if(BenTen[4]+r==62) {
                            while (r > 0) {
                              setState(() {
                                BenTen[4]++;
                              });
                              if(SongPlayer2==true) {
                                await FlameAudio.play("Player.mp3");
                              }
                              await Future.delayed(Duration(milliseconds: 500));
                              r--;
                            }
                            setState((){
                              Winner.add(BenTen[0]);
                              Winner.add(Doreamon[0]);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EndGame(GamePlayer: GamePlayer,Winner: Winner,)));
                            });
                          }else
                            {
                              while (r > 0) {
                                setState(() {
                                  BenTen[4]++;
                                });
                                if(SongPlayer2==true) {
                                  await FlameAudio.play("Player.mp3");
                                }
                                await Future.delayed(Duration(milliseconds: 500));
                                r--;
                              }
                              setState((){autoOutPlayer(BenTen[4]);});
                              autoPlay(context, setState);
                            }

                        }else if(BenTen[4]+r>62)
                          {
                            setState((){
                              cll.head = cll.head!.next;
                              CurrentPlayer = cll.head!.data;
                            });
                          }
                      }

                  }
              print("Grater");
            }
    }else
      {
        if(BenTen[1]>0&&BenTen[1]+r<=62)
          {
            while(r>0)
              {
                setState((){
                  BenTen[1]++;
                });
                if(SongPlayer2==true) {
                  await FlameAudio.play("Player.mp3");
                }
                await Future.delayed(Duration(milliseconds: 500));
                r--;
              }
              setState((){
                cll.head = cll.head!.next;
                CurrentPlayer=cll.head!.data;
                autoOutPlayer(BenTen[1]);
              });
          }else if(BenTen[1]+r>62)
            {
              if(BenTen[2]==0&&BenTen[1]!=62)
                {
                    setState((){
                      print("ben2");
                      cll.head = cll.head!.next;
                      CurrentPlayer = cll.head!.data;
                      print(CurrentPlayer);
                    });
                }else
              if(BenTen[2]>0&&BenTen[2]+r<=62)
              {
                while(r>0)
                {
                  setState((){
                    BenTen[2]++;
                  });
                  if(SongPlayer2==true) {
                    await FlameAudio.play("Player.mp3");
                  }
                  await Future.delayed(Duration(milliseconds: 500));
                  r--;
                }
                setState((){
                  cll.head = cll.head!.next;
                  CurrentPlayer=cll.head!.data;
                  autoOutPlayer(BenTen[2]);});

              }else if(BenTen[2]+r>62)
                {
                  if(BenTen[3]==0&&BenTen[2]!=62) {
                    setState(() {
                      print("ben3");
                      cll.head = cll.head!.next;
                      CurrentPlayer = cll.head!.data;
                      print(CurrentPlayer);
                    });
                  }else
                  if(BenTen[3]>0&&BenTen[3]+r<=62)
                  {
                    while(r>0)
                    {
                      setState((){
                        BenTen[3]++;
                      });
                      if(SongPlayer2==true) {
                        await FlameAudio.play("Player.mp3");
                      }
                      await Future.delayed(Duration(milliseconds: 500));
                      r--;
                    }
                    setState((){
                      cll.head = cll.head!.next;
                      CurrentPlayer=cll.head!.data;
                    autoOutPlayer(BenTen[3]);});
                  }else if(BenTen[3]+r>62)
                    {
                      if(BenTen[4]==0 &&BenTen[3]!=62)
                        {
                          setState((){

                            cll.head = cll.head!.next;
                            CurrentPlayer = cll.head!.data;
                          });

                        } else
                             if(BenTen[4]>0&&BenTen[4]+r<=62)
                      {
                        if(BenTen[4]+r==62) {
                          while (r > 0) {
                            setState(() {
                              BenTen[4]++;
                            });
                            if(SongPlayer2==true) {
                              await FlameAudio.play("Player.mp3");
                            }
                            await Future.delayed(Duration(milliseconds: 500));
                            r--;
                          }
                          setState(() {
                            Winner.add(BenTen[0]);
                            Winner.add(Doreamon[0]);
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EndGame(GamePlayer: 2,Winner: Winner,)));
                          });
                        }else{
                          while (r > 0) {
                            setState(() {
                              BenTen[4]++;
                            });
                            if(SongPlayer2==true) {
                              await FlameAudio.play("Player.mp3");
                            }
                            await Future.delayed(Duration(milliseconds: 500));
                            r--;
                          }
                          setState((){
                            cll.head = cll.head!.next;
                            CurrentPlayer=cll.head!.data;
                            autoOutPlayer(BenTen[4]);
                          });

                        }
                      }
                    }
                }

            }
      }
  print(BenTen);

}


autoOutPlayer(P1) async
{
  switch (P1) {
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
    default:

      for(int i=1;i<=4;i++)
  {
  if ((P1 - Doreamon[i] == 26 || Doreamon[i] - P1 == 26) &&
  Doreamon[i] != P1 &&Doreamon[i] != 0 &&Doreamon[i]!>=57) {
  Doreamon[i] = 0;
  if(SongPlayer2==true)
    {
      FlameAudio.play("Doreamon.mp3");
    }
  }
  }
      break;
  }

  await Future.delayed(Duration(milliseconds: 500));
}
Gonext(setState)
{
  setState(() {
    cll.head = cll.head!.next;
    CurrentPlayer = cll.head!.data;

  });
}
Dice(setState,context) async
{
  dc = false;
  print("Dice is clicked");

  final random = Random();
  r = random.nextInt(6)+1;
  await FlameAudio.play("Dice.mp3");

  setState(() {
    DiskImage = "assets/images/D$r.jpg";
  });
    played=false;
    await Future.delayed(Duration(milliseconds: 500));
    if(r==6)
    {//  r==6
      Player = CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer ==Shiva[0]?Shiva:CurrentPlayer==Patlu[0]?Patlu:BenTen;
      if(Player[index]+r<=62)
      {
        print("r is 6 ");
        if(played==true)
          {
            print("r is 6 and <62true");
            await Gonext(setState);
            dc = true;
          }else{
          print("r is 6 and <62false");
          print("wiat for player to play");
        }
      }
      else if(Player.skip(1).every((E)=>E+r>62))
      {
        print("r==6 if i>62");
       await Gonext(setState);
        dc = true;
      }
    }
    else
    {
      // r==6 nhi  5,4,3,2,1
      // if all player at home
      Player = CurrentPlayer==Doreamon[0]?Doreamon:CurrentPlayer ==Shiva[0]?Shiva:CurrentPlayer==Patlu[0]?Patlu:BenTen;
      if(Player.skip(1).every((E)=>E==0) ||( (Player[1]==0 ||Player[1]==62) &&(Player[2]==0||Player[2]==62) &&(Player[3]==62||Player[3]==0) &&(Player[4]==0||Player[4]==62)))
        {
          print(" r !=6 and all 0 or 62");
          await Gonext(setState);

          if(CurrentPlayer==BenTen[0] && robotPlayer==true)
            {
              autoPlay(context, setState);
            }
          dc = true;
        }
      else
      {
        // koi ya koi bi nahi gar pe he
        print("r is $r  and Koi player 0 ni");
        if(Player[index]+r<=62&&Player[index]>0)
        {
          if(played==true)
        {
          print("not wait to play");
          await Gonext(setState);
          if(CurrentPlayer==BenTen[0] && robotPlayer==true)
          {
            autoPlay(context, setState);
          }

        } else{
            print("wait to play");
          }
        }
        else if(Player.skip(1).every((E)=>E+r>62))
        {
          print("not true");
        await Gonext(setState);
          if(CurrentPlayer==BenTen[0] && robotPlayer==true)
          {
            autoPlay(context, setState);
          }
          dc = true;
        }
      }
    }


}

// todo loding function
Future<void> onLoad() async
{

ludobackPic = await "assets/images/ludoBack.jpg";
await FlameAudio.audioCache.load(
  backGroundSong
);
// await Future.delayed(Duration(seconds: 2));
}

// todo song player function
audioSong() async{
  if(SongPlayer1==true) {
    bgms = await FlameAudio.loopLongAudio(backGroundSong);
    print("Audio on");
  }else{
    FlameAudio.audioCache.clearAll();
    bgms.dispose();
    print("Audio off");
  }
}
class MyLudoGame extends StatelessWidget {
  const MyLudoGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LudoHome()

    );
  }
}

class LudoHome extends StatefulWidget {
  @override
  State<LudoHome> createState() => _LudoHomeState();
}

class _LudoHomeState extends State<LudoHome>
{
  @override
  void dispose()
  {
    FlameAudio.bgm.stop();
    AudioPlayer().stop();
    AudioPlayer().dispose();
   super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async {
        final value = await showDialog<bool>(context: context, builder:(context)=>
            AlertDialog(
              content: Text("Do you really want to exit?"),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context,false);
                }, child: Text("No"),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context,true);
                }, child: Text("Yes"),
                ),

              ],
            )
        );

        if(value !=null)
        {
          return Future.value(value);
        }
        else
        {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/LudobackPic.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                        cll.head=null;
                        cll.insert("Doremon");
                        cll.insert("BenTen");
                        Winner = [];
                        CurrentPlayer=cll.head!.data;
                        GamePlayer=2;
                        robotPlayer =true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>MyHome(BenTen1: ["BenTen",0,0,0,0],Doreamon1: ["Doremon",0,0,0,0],Shiva1: ["Shiva",0,0,0,0],Patlu1: ["Patlu",0,0,0,0])),
                      );

                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width*0.3,
                      width: MediaQuery.of(context).size.width*0.3,
                      margin: EdgeInsets.all(30),
                      // padding:EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blueGrey,width: 8),
                        image: DecorationImage(image: AssetImage("assets/images/robotPlayer.webp"),fit: BoxFit.contain)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          alignment: Alignment.center,
                          backgroundColor: Colors.transparent,
                          content: Container(
                            height: MediaQuery.of(context).size.width*0.4,
                            width: MediaQuery.of(context).size.width*0.1,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {

                                      cll.head=null;
                                      cll.insert("Doremon");
                                      cll.insert("Shiva");
                                      cll.insert("BenTen");
                                      cll.insert("Patlu");
                                      robotPlayer = false;
                                      Winner=[];
                                      CurrentPlayer=cll.head!.data;
                                      GamePlayer=4;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHome(BenTen1: ["BenTen",62,62,62,57],Doreamon1: ["Doremon",62,62,62,58],Shiva1: ["Shiva",9,0,0,0],Patlu1: ["Patlu",0,0,0,0])),
                                    );

                                  },

                                  child: const Text("4 Player"),
                                ),
                                ElevatedButton(
                                  onPressed: () {

                                      cll.head=null;
                                      cll.insert("Doremon");
                                      cll.insert("Shiva");
                                      cll.insert("BenTen");
                                      robotPlayer = false;
                                      Winner=[];
                                      CurrentPlayer=cll.head!.data;
                                      r=1;
                                      GamePlayer=3;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHome(BenTen1: ["BenTen",0,0,0,0],Doreamon1: ["Doremon",62,62,62,57],Shiva1: ["Shiva",0,0,0,0],Patlu1: ["Patlu",0,0,0,0])),
                                    );
                                    // StartGame(setState,context,Winner);
                                  },
                                  child: const Text("3 Player"),
                                ),
                                ElevatedButton(
                                  onPressed: () {

                                      cll.head=null;
                                      cll.insert("Doremon");
                                      cll.insert("BenTen");
                                      CurrentPlayer=cll.head!.data;
                                      r=1;
                                      Winner=[];
                                      GamePlayer=2;
                                      robotPlayer = false;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHome(BenTen1: ["BenTen",0,0,0,0],Doreamon1: ["Doremon",0,0,0,0],Shiva1: ["Shiva",0,0,0,0],Patlu1: ["Patlu",0,0,0,0])),
                                    );
                                    // StartGame(setState,context,Winner);
                                  },
                                  child: const Text("2 Player"),
                                ),
                              ],
                            ),
                          ),
                         );
                      });
                      },
                    child: Container(
                      height: MediaQuery.of(context).size.width*0.3,
                      width: MediaQuery.of(context).size.width*0.3,
                      margin: EdgeInsets.all(30),
                      // padding:EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.blueGrey,width: 8),
                          image: DecorationImage(image: AssetImage("assets/images/friend1.jpg"),fit: BoxFit.contain)
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      content: StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Container(
                            height: 100,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Back Ground Music"),
                                    Switch(
                                      value: SongPlayer1,
                                      onChanged: (value) {
                                        setStateDialog(() {  // Updates UI inside the dialog
                                          SongPlayer1 = value;
                                          if(value)
                                            {
                                              FlameAudio.audioCache.clearAll();
                                              FlameAudio.bgm.stop();
                                            }
                                          audioSong();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Music"),
                                    Switch(
                                      value: SongPlayer2,
                                      onChanged: (value) {
                                        setStateDialog(() {  // Updates UI inside the dialog
                                          SongPlayer2 = value;
                                          if(value)
                                          {
                                            FlameAudio.audioCache.clearAll();
                                            FlameAudio.bgm.stop();
                                          }
                                        });
                                      },
                                    ),

                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  });
                }, icon: Icon(Icons.settings_applications))
              )
                ],
          ),
        ),
      ),
    );
  }
}






