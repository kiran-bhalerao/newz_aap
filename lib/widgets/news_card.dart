import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  final String name;
  final String tag;
  final String img;
  final Function onClick;

  const NewsCard({
    Key key,
    @required this.name,
    @required this.tag,
    @required this.img,
    @required this.onClick,
  }) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double swipeThreshold = 4.5;

  _onDrag(DragUpdateDetails details) {
    _controller.value = _controller.value + details.primaryDelta / 40;
  }

  _onDragEnd(DragEndDetails details) {
    if (_controller.value >= swipeThreshold) {
      _controller.forward();
    } else if (_controller.value <= -swipeThreshold) {
      _controller.reverse();
    } else {
      _controller.animateTo(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: -30,
      upperBound: 30,
      duration: Duration(seconds: 1),
    );
    _controller.value = 0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (ctx, _) {
          return Transform.translate(
            offset: Offset(_controller.value * 40, 0),
            child: Transform.rotate(
              angle: _controller.value * 0.1,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDrag,
                onHorizontalDragEnd: _onDragEnd,
                onTap: widget.onClick,
                child: Container(
                    height: MediaQuery.of(context).size.height - 220 - 60,
                    margin: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Hero(
                            tag: widget.name,
                            child: Container(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          Colors.black.withOpacity(0.8),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          margin:
                                              const EdgeInsets.only(bottom: 12),
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFE75285),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            widget.tag,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          widget.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(widget.img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Hero(
                          tag: '${widget.name}--section',
                          child: Material(
                            type: MaterialType.transparency,
                            child: Container(
                              height: 90,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage('assets/profile.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Patria Parker',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          'Jul 20 • 2 Min Read',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey,
                                            decoration: TextDecoration.none,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
