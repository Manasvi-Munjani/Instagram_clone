import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/appcolor_const.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Audio',style: TextStyle(color: AppColorConst.appGray,fontWeight: FontWeight.w400,fontSize: 15),),
    );
  }
}
