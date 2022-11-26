import 'package:flutter/material.dart';
import 'package:leaderboard/usermodel.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var list = [
    User("annajay", 10),
    User("ashish", 20),
    User("bhagya", 30),
    User("shashank", 40),
    User("rohit", 50),
    User("ayush", 10)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(fontSize: 24)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ananjay Gurjar",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "45",
                            style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          Text(
                            "Level",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("#33",
                              style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Leaderboard", style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            /*CircleAvatar(backgroundImage:)*/ Text(
                                list[index].name)
                          ],
                        ),
                        leading: Text("$index"),
                        trailing: Text("${list[index].score}"),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Colors.blue,
                        ),
                    itemCount: list.length),
              ),
            )
          ],
        ));
  }
}
