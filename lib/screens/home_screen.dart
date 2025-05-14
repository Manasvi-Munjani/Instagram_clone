import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';
import 'package:instagram_clone/constant/appimage_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConst.appBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  Image.asset(
                    AppImageConst.appInstagramText,
                    height: 35,
                    width: 120,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.add_box_outlined,
                    color: AppColorConst.appWhite,
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.favorite_border_rounded,
                    color: AppColorConst.appWhite,
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.message_rounded,
                    color: AppColorConst.appWhite,
                  )
                ],
              ),
            ),
          /*  SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                        SizedBox(height: 5),
                        Text("User",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),*/

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:  EdgeInsets.symmetric(horizontal: 8),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          padding: const EdgeInsets.all(3), // border thickness
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow,
                                Colors.orange,
                                Colors.red,
                                Colors.purple,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // background color behind image
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                appDpImage, // your image asset
                                fit: BoxFit.cover,
                                width: 58,
                                height: 58,
                              ),
                            ),
                          ),
                        ),

                        /*Container(
                          padding:  EdgeInsets.all(3),
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.yellow,
                                Colors.orange,
                                Colors.red,
                                Colors.purple,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child:  CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(appDpImage),

                          ),
                        ),*/
                        const SizedBox(height: 5),
                        const Text(
                          "User",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.red, radius: 18),
                      SizedBox(width: 10),
                      Text("marvel",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 12),
                      Icon(Icons.chat_bubble_outline, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.send, color: Colors.white),
                      Spacer(),
                      Icon(Icons.bookmark_border, color: Colors.white),
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '105,762 likes',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'marvel ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'We can’t get enough of this dynamic duo. Marvel Studios\' @HawkeyeOfficial is...'),
                      ],
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('View all 103 comments',
                      style: TextStyle(color: Colors.grey)),
                ),

                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 14, backgroundColor: Colors.yellow),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Add a comment...",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.red, size: 16),
                      SizedBox(width: 8),
                      Icon(Icons.emoji_emotions, color: Colors.amber, size: 16),
                    ],
                  ),
                ),

                // Timestamp
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text('13 hours ago',
                      style: TextStyle(color: Colors.grey, fontSize: 11)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
