import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routerName = '/details';

  double imageHeight = 460;
  double moveUp = 40;

  String name = 'Stranger Things season 4 has been confirmed by Netflix.';
  String news =
      "Stranger Things season 4 is official, and production has already started. Netflix renewed the popular sci-fi horror for a fourth season in 2019 – but there's no formal release date yet. There is a first teaser trailer for season 4, however, which shows the dramatic return of Hopper, this time in a Russian prison after the events of the finale. So what we can we expect from Stranger Things season 4? Netflix's Momita SenGupta has described it as \"bigger, bolder and more intricate than ever\". The show is filming at least partially in New Mexico, whereas previous seasons were shot in Atlanta. For now, though, filming has been halted Covid-19, which means filming on all Netflix shows has been suspended for two weeks.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Positioned(
        //   bottom: MediaQuery.of(context).size.height - imageHeight,
        //   child: Hero(
        //     tag: name,
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: imageHeight,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage('assets/stranger.jpg'),
        //           fit: BoxFit.cover,
        //           alignment: Alignment.topCenter,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: MediaQuery.of(context).size.height - imageHeight,
          child: Hero(
            tag: name,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: imageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/stranger.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.1),
                          Colors.black.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 26 + moveUp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: const BoxDecoration(
                              color: Color(0xFFE75285),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            'Netflix',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 22,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: const EdgeInsets.all(0),
                      width: 44.0,
                      height: 44.0,
                      child: Material(
                        type: MaterialType.transparency,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: imageHeight - moveUp,
          child: Hero(
            tag: '$name--section',
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height:
                    MediaQuery.of(context).size.height - imageHeight + moveUp,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 32, 22, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            news,
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.4,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: imageHeight - moveUp - 20,
          left: MediaQuery.of(context).size.width - 48 - 100,
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: Offset(0, 4),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
            ),
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        Positioned(
          top: imageHeight - moveUp - 20,
          left: MediaQuery.of(context).size.width - 48 - 34,
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: Offset(0, 4),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
            ),
            child: Material(
              type: MaterialType.transparency,
              child: IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 23,
                ),
                onPressed: () {},
              ),
            ),
          ),
        )
      ],
    ));
  }
}
