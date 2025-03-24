import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My portfolio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  Container(
        decoration: const BoxDecoration(
          image:DecorationImage(image: AssetImage('assets/images/Background.jpg'),
          fit:BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60, backgroundImage: AssetImage('assets/images/my_image.png'),
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rahul Sain',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'Pali, Rajasthan',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.school),
                        SizedBox(width: 25),
                        Text(
                          '',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.computer_rounded),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'School Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'School Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.email),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'School Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.phone),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'School Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("About Me qew wqe  t5er ae5ewr rgwer awser wr  rtr rret wr  rt we4 htye we we trtw sdrwq qiuye ue7  wier4 odbwes,a ",style: TextStyle(fontSize: 22),),
              ),
        SizedBox(height: 30,),
              Text('Created by Ram'),
            ],
          ),
        ),
      ),
    );
  }
}
