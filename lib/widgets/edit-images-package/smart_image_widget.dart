import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';

class SmartImage extends StatelessWidget {
  final String src;
  final BoxFit? fit;
  final bool isPost;
  final double? radius;

  SmartImage(this.src, {Key? key, this.fit, this.isPost = false, this.radius})
      : super(key: key);

  bool networkImage() => src.startsWith('https');
  final Uint8List kTransparentImage = Uint8List.fromList(<int>[
    0x89,
    0x50,
    0x4E,
    0x47,
    0x0D,
    0x0A,
    0x1A,
    0x0A,
    0x00,
    0x00,
    0x00,
    0x0D,
    0x49,
    0x48,
    0x44,
    0x52,
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00,
    0x00,
    0x01,
    0x08,
    0x06,
    0x00,
    0x00,
    0x00,
    0x1F,
    0x15,
    0xC4,
    0x89,
    0x00,
    0x00,
    0x00,
    0x0A,
    0x49,
    0x44,
    0x41,
    0x54,
    0x78,
    0x9C,
    0x63,
    0x00,
    0x01,
    0x00,
    0x00,
    0x05,
    0x00,
    0x01,
    0x0D,
    0x0A,
    0x2D,
    0xB4,
    0x00,
    0x00,
    0x00,
    0x00,
    0x49,
    0x45,
    0x4E,
    0x44,
    0xAE,
    0x42,
    0x60,
    0x82,
  ]);
  //bool base64() => src.contains('[]');

  @override
  Widget build(BuildContext context) {
    return networkImage()
        ? FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: src,
            fit: fit,
            imageErrorBuilder: (_, e, a) {
              return Container(
                alignment: Alignment.center,
                child: const Text(
                  "Error. Please check your internet connection",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          )
        : isPost
            ? Image.file(
                File(src),
                fit: fit,
              )
            : CircleAvatar(
                radius: radius,
                backgroundImage: MemoryImage(
                  imageDecoder(src),
                  //fit: fit,
                ),
              );
  }

  Uint8List imageDecoder(String image) {
    final List<int> list = List<int>.from(jsonDecode(image));
    return Uint8List.fromList(list);
  }
}
