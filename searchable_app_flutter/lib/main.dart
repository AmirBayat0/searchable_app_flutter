// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import './fadeanimation/fadeanimation.dart';
import './model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Users> _foundedUsers = [];

  @override
  void initState() {
    super.initState();

    
      _foundedUsers = listOfUsers;
    
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = listOfUsers
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  removeUser(int index) {
    setState(() {
      _foundedUsers.removeAt(index);
    });
  }

/////////////////////////////////////
// @CodeWithFlexz on Instagram
//
// AmirBayat0 on Github
// Programming with Flexz on Youtube
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (val) => onSearch(val),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 228, 228, 228),
                      contentPadding: EdgeInsets.all(10),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 146, 146, 146),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 131, 131, 131))),
                ),
              ),
            ),
            body: Container(
              color: Color.fromARGB(255, 245, 245, 245),
              child: _foundedUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundedUsers.length,
                      itemBuilder: (ctx, index) {
                        return FadeAnimation(
                          delay: 0.8 * index,
                          child: Slidable(
                            child: userComponent(user: _foundedUsers[index]),
                            actionPane: SlidableStrechActionPane(),
                            actionExtentRatio: 0.20,
                            actions: [
                              IconSlideAction(
                                caption: 'Archive',
                                color: Color.fromARGB(255, 236, 236, 236),
                                iconWidget: Icon(
                                  Icons.archive,
                                  color: Colors.black,
                                ),
                                onTap: () => print("Archive"),
                              ),
                              IconSlideAction(
                                caption: 'Share',
                                color: Color.fromARGB(255, 236, 236, 236),
                                iconWidget: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                ),
                                onTap: () => print("Share"),
                              ),
                            ],
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Remove',
                                color: Colors.red,
                                iconWidget: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onTap: () => removeUser(index),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No users found",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
            )),
      ),
    );
  }

// User Components
  userComponent({required Users user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    user.imageAd,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 5,
              ),
              Text(user.userName,
                  style: TextStyle(color: Color.fromARGB(255, 90, 90, 90))),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowed = !user.isFollowed;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color:
                        user.isFollowed ? Colors.blue[700] : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: user.isFollowed
                            ? Colors.transparent
                            : Colors.grey.shade700,
                        width: 1)),
                child: Center(
                    child: Text(user.isFollowed ? 'Unfollow' : 'Follow',
                        style: TextStyle(
                            color: user.isFollowed
                                ? Colors.white
                                : Color.fromARGB(255, 17, 17, 17))))),
          )
        ],
      ),
    );
  }
}
