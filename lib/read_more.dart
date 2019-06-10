import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ReadMore extends StatefulWidget {
  final Widget widgetItem;
  final String readMoreText;
  final String lessMoreText;
  final double boundHeight;

  const ReadMore(
      {this.widgetItem,
      this.boundHeight = 100,
      this.readMoreText = "Read More",
      this.lessMoreText = "Read Less"});

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> with SingleTickerProviderStateMixin {
  double height = 0;
  double moreHeight;
  double moreWidth;
  bool heightCount = false;
  bool expand = false;
  String linkText;
  Widget itemWidget;
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> animationOpacity;


  @override
  void initState() {
    super.initState();
    var txr = TextPainter(
        text: TextSpan(text: "\u2026  Read More", style: TextStyle(color: Colors.blue)),
        maxLines: 1,
        textDirection: ui.TextDirection.ltr);

    txr.layout();
    moreWidth = txr.width;
    moreHeight = txr.height;
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (height == 0)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          heightCount = true;
          height = context.size.height;
        });
      });

    linkText = expand ? widget.lessMoreText : widget.readMoreText;
    itemWidget = widget.widgetItem;

    animation = Tween<double>(begin: widget.boundHeight, end: height + moreHeight).animate(animationController);
    animationOpacity = Tween<double>(begin: 0.3, end: 1.0).animate(animationController);

    return AnimatedBuilder(
      animation: animationController,
      builder: (builder, context){
        print("animation value : ${animation.value}");
        print("opactity value : ${animationOpacity.value}");
        return Stack(
          children: <Widget>[
            expand
                ? ClipPath(
                child: Container(
                  height: animation.value,
                  child:
                  _animateShadermask(itemWidget, animationOpacity)
                ))
                : ClipPath(
                clipper: ReadMoreClipper(width: moreWidth, height: moreHeight),
                child: Container(
                  width: double.infinity,
                  height: height > widget.boundHeight ? animation.value : null,
                  child: (heightCount)
                      ? height > widget.boundHeight
                      ? _animateShadermask(itemWidget, animationOpacity)
                      : itemWidget
                      : Container(),
                )),

            height > widget.boundHeight
                ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              linkText,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              expand = !expand;
                              if(expand){
                                animationController.forward();
                              } else{
                                animationController.reverse();
                              }
                            });
                          })
                    ],
                  ),
                  color: Colors.transparent),
            )
                : Container()
          ],
        );
      }


    );

  }

  Widget _animateShadermask(Widget itemWidget, Animation<double> animateOpacity){
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent.withOpacity(animationOpacity.value)],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: itemWidget);
  }
}


class ReadMoreClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  ReadMoreClipper({this.width, this.height});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height - this.height);
    path.lineTo(size.width - this.width, size.height - this.height);
    path.lineTo(size.width - this.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ReadMoreClipper oldClipper) => false;
}
