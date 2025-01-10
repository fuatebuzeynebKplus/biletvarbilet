import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/edit-images-package/smart_image_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:newsfeed_multiple_imageview/newsfeed_multiple_imageview.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageGroupWidget extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  const ImageGroupWidget({
    Key? key,
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    required this.imageUrls,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costraints) => Container(
        width: costraints.maxWidth,
        height: costraints.maxWidth,
        margin: EdgeInsets.fromLTRB(
          marginLeft,
          marginTop,
          marginRight,
          marginBottom,
        ),
        child: GestureDetector(
          child: MultipleImageView(imageUrls: imageUrls),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewer(
                imageUrls: imageUrls,
                titles: titles,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> titles;

  const ImageViewer({
    Key? key,
    required this.imageUrls,
    required this.titles,
  }) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageSlideshow(
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                indicatorColor: AppColors.kSecondColor,
                indicatorBackgroundColor: Colors.grey,
                isLoop: widget.imageUrls.length > 1,
                children: widget.imageUrls
                    .map(
                      (e) => ClipRect(
                        child: SmartImage(
                          e,
                          fit: BoxFit.contain,
                          isPost: true,
                        ),
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              widget.titles[_currentIndex] == ''
                  ? Container()
                  : Positioned(
                      bottom: 100,
                      child: Container(
                        width: context.width * 1,
                        height: context.height * 0.05,
                        padding: const EdgeInsets.all(8),
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(
                          child: TextWidget(
                            text: widget.titles[_currentIndex],
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
