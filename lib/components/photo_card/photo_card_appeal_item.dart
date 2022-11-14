import 'package:flutter/material.dart';
import 'package:ouul/models/photo_card_info_view_model.dart';

class PhotoCardAppealItem extends StatefulWidget {
  const PhotoCardAppealItem(
      {super.key,
      required this.selectedCardColor,
      required this.cardInfo,
      required this.cardIndex});
  final Color selectedCardColor;
  final PhotoCardInfoViewModel cardInfo;
  final int cardIndex;

  @override
  State<PhotoCardAppealItem> createState() => _PhotoCardAppealItemState();
}

class _PhotoCardAppealItemState extends State<PhotoCardAppealItem>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat(reverse: true);
  late Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ),
  );

  @override
  void initState() {
    super.initState();
    if (widget.cardIndex.isOdd) {
      _animation = Tween<AlignmentGeometry>(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ),
      );
    } else {
      _animation = Tween<AlignmentGeometry>(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      // decoration: BoxDecoration(border: Border.all()),
      width: 300,
      height: double.maxFinite,
      child: AlignTransition(
          alignment: _animation,
          child: AnimatedContainer(
              width: 300,
              height: 450,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              child: Column(
                children: [
                  Expanded(
                      child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: widget.cardInfo.color,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/Spinner-1s-200px.gif',
                              image: widget.cardInfo.imgUrl,
                              fit: BoxFit.fill,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Text('$error');
                              },
                            ),
                          )),
                      Opacity(
                        opacity: 0.5,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            color: widget.cardInfo.color,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '콜리',
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  widget.cardInfo.charmPoint,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            )),
                      ),
                    ],
                  )),
                ],
              ))),
    ));
  }
}
