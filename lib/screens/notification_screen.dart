// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  final RemoteMessage? message;
  const NotificationScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  static const String routName = '/notir';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: ,
        title: SvgPicture.asset(
          'assets/logo_square.svg',
          height: 30,
          width: 30,
        ),
        actions: [
          const Text(
            'India',
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 130, 75, 226), Colors.black],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: EdgeInsets.only(right: 9, left: 9, bottom: 6),
            child: Text(
              'Notifications',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.message != null
                  ? widget.message!.notification!.title!
                  : 'No notifications',
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
