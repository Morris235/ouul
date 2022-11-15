import 'package:flutter/material.dart';
import 'package:ouul/models/photo_card_info_view_model.dart';

class PhotoCardAppealItem extends StatefulWidget {
  const PhotoCardAppealItem({
    super.key,
    required this.cardInfo,
    required this.cardIndex,
    this.selectedCardIndex = 100,
  });
  final PhotoCardInfoViewModel cardInfo;
  final int cardIndex;
  final int selectedCardIndex;

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
    return photoCard();
  }

  Widget photoCard() {
    return widget.cardIndex == widget.selectedCardIndex
        // FIXME: 애니메이션 효과를 넣어야 하기 때문에 삼항연산 리턴은 적합하지 않을수 있음
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 1),
            width: 315,
            height: 314,
            child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: widget.cardInfo.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('뒷면')],
                )))
        : Center(
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
                    curve: Curves.ease,
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
                                    placeholder:
                                        'assets/images/Spinner-1s-200px.gif',
                                    image: widget.cardInfo.imgUrl,
                                    fit: BoxFit.fill,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Text('$error');
                                    },
                                  ),
                                )),
                            Opacity(
                              opacity: 0.7,
                              child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  color: widget.cardInfo.color,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/images/img_frame01.png',
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "콜리 ${widget.cardIndex}",
                                        style: const TextStyle(
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
                            )
                          ],
                        )),
                      ],
                    ))),
          ));
  }
}
