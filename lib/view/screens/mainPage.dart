import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel/model/country.dart';
import 'package:travel/model/fakeReview.dart';
import 'package:travel/view/screens/TicketDetails.dart';
import 'package:vector_math/vector_math.dart' as vector;

class mainPage extends StatefulWidget {
  mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  country _selected = countries[0];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              height: deviceSize.height / 2,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: _topPart(
                      key: Key(_selected.backGround), countr: _selected))),
          Positioned(
              height: 100,
              top: deviceSize.height / 2 - (100 / 3),
              left: 0,
              right: 0,
              child: _middlePart((int idx) {
                setState(() {
                  _selected = countries[idx];
                });
              })),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: deviceSize.height / 2 + (100 / 3) + 30,
              child: bottomPart())
        ],
      ),
    );
  }

  bottomPart() {
    return LayoutBuilder(
      builder: (p0, p1) => Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: CarouselSlider.builder(
            itemCount: fakeReview.length,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: reviewBody(p1, fakeReview[index]),
              );
            },
            options: CarouselOptions(enlargeFactor: 0.3,autoPlay: true,enlargeCenterPage: true,autoPlayAnimationDuration:Duration(seconds: 1) )),
      ),
    );
  }
}

Widget reviewBody(BoxConstraints size, FakeReview fakeReview) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40)),
        color: Colors.white),
    height: size.maxHeight * 0.6,
    width: size.maxWidth * 0.7,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(fakeReview.image),
              )
            ],
          ),
          Expanded(
            child: Text(
              fakeReview.review,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    ),
  );
}

class _topPart extends StatefulWidget {
  country countr;
  _topPart({super.key, required this.countr});

  @override
  State<_topPart> createState() => __topPartState();
}

class __topPartState extends State<_topPart>
    with SingleTickerProviderStateMixin {
  double _movement = -100;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat(reverse: true);
    //_controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0,
      child: Container(
        /*decoration: BoxDecoration(
          border: Border.all(color: Colors.red)
        ),*/
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Stack(
            fit: StackFit.expand,
            //when clipbehavior=clip.none it  allow that the children of stack to  extend oout of it
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                  left: _movement * (1 - _controller.value),
                  right: _movement * _controller.value,
                  child: Image.asset(
                    widget.countr.backGround,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  top: 50,
                  left: 50,
                  child: Text(
                    widget.countr.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
              Positioned.fill(
                  left: _movement * (1 - _controller.value),
                  right: _movement * _controller.value,
                  child: Hero(
                    tag:widget.countr.name ,
                    child: Image.asset(
                      widget.countr.foreGround,
                      fit: BoxFit.fill,
                    )
                  )),
                  Positioned.fill(child: GestureDetector(
                    onHorizontalDragEnd: (details) {

                      Navigator.of(context).push(PageRouteBuilder(transitionDuration: Duration(seconds: 1),pageBuilder:(context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: CountryDetailsScreen(countr: widget.countr),
                        );
                      }, ));

                      
                    },
                    child: Container(color: Colors.transparent,),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _middlePart extends StatefulWidget {
  Function ontab;
  _middlePart(this.ontab);

  @override
  State<_middlePart> createState() => _middlePartState();
}

class _middlePartState extends State<_middlePart> {
  late ScrollController _scrollController;
  final _key = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      initialItemCount: countries.length,
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index, animation) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                countries.insert(countries.length, countries[index]);
                _key.currentState!.insertItem(countries.length - 1);

                widget.ontab(index);

                _key.currentState!.removeItem(
                    index,
                    (context, animation) => FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            axis: Axis.horizontal,
                            sizeFactor: animation,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                countries[index].backGround,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 70,
                              ),
                            ),
                          ),
                        ));
                countries.removeAt(index);
              },
              child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(vector.radians(45 * 0)),
                  child: Image.asset(
                    countries[index].backGround,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 70,
                  ))),
        );
      },
    );
  }
}
