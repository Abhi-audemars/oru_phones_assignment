import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:oru_phones_assignment/screens/notification_screen.dart';
import 'package:oru_phones_assignment/screens/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 60); 

      

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Lottie.asset('assets/lottie.json', height: 20, width: 10),
          )),
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
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen())),
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 9, left: 9, bottom: 6),
          child: Container(
            height: 40,
            width: double.infinity, // Full width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextField(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen())),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 3),
                hintText: 'Search with make and model...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              onChanged: (value) {
               
              },
            ),
          ),
        ),
      ),
    );
  }
}
