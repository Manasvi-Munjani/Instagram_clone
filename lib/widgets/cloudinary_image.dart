/*
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CloudinaryImage {
  final String cloudName = "dgu8vmtqi";
  final String uploadPreset = "flutter_unsigned";

  final ImagePicker _picker = ImagePicker();

  Future<String?> pickAndUploadImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', pickedFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final respData = await response.stream.bytesToString();
      final json = jsonDecode(respData);
      return json['secure_url'];
    } else {
      print("Upload failed: ${response.statusCode}");
      return null;
    }
  }
}
*/


import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryImage {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickAndUploadImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return null;

      File imageFile = File(pickedFile.path);
      String uploadUrl = 'https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/image/upload';
      String uploadPreset = 'YOUR_UPLOAD_PRESET'; // From Cloudinary

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'upload_preset': uploadPreset,
      });

      final response = await Dio().post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url'];
      } else {
        print("Cloudinary Upload Failed: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
