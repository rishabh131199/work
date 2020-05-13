import 'package:flutter/material.dart';
import 'details.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  double w, h;
  double smallcontainersheight = 0.08;
  double leftPadding = 0.08;
  String _text = "";
  String timeElapsed = "2:51";
  bool islistopen = false;

  static const Color BACKGROUND_COLOR = Details.BACKGROUND_COLOR;
  static const Color SECONDARY_COLOR = Details.SECONDARY_COLOR;
  static const Color PRIMARY_COLOR = Details.PRIMARY_COLOR;

  Widget iconRender(Icon ico) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR, width: w * 0.01),
        color: BACKGROUND_COLOR,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(w * 0.02),
        child: ico,
      ),
    );
  }

  Widget pplsingleview(String img, String name) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: w * 0.05,
            backgroundImage: NetworkImage(img),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: w * 0.02),
              child: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: w * 0.025, vertical: h * 0.005),
            decoration: BoxDecoration(
              color: BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: PRIMARY_COLOR, width: w * 0.007),
            ),
            child: Text(
              "Block",
              style: TextStyle(color: Colors.white, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget upperPart() {
    return Expanded(
      flex: 6,
      child: Stack(
        children: <Widget>[
          // the live video here  ----------------
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/liveimage.jpg'), fit: BoxFit.cover),
              // color: Colors.white,
            ),
          ),

          // onLayer Buttons ----------------------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // upper options ---------------------------
              Container(
                height: h * smallcontainersheight,
                color: SECONDARY_COLOR,
                padding: EdgeInsets.only(left: w * leftPadding),
                child: Row(
                  children: <Widget>[
                    iconRender(Icon(
                      Icons.network_locked,
                      size: w * 0.04,
                      color: Colors.white,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Live',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          islistopen = !islistopen;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text("● 87 viewers",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Icon(
                            islistopen
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // People List Here ------------------
              islistopen
                  ? Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: w * 0.5),
                        constraints: BoxConstraints.expand(),
                        color: SECONDARY_COLOR,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=9', 'bretta'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=8', 'max'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=7', 'allen'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=6', 'mike'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=9', 'bretta'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=7', 'allen'),
                              pplsingleview(
                                  'https://i.pravatar.cc/150?img=6', 'mike'),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),

              // Lower options ------------------------
              Container(
                // height: h * smallcontainersheight,
                color: SECONDARY_COLOR,
                padding: EdgeInsets.symmetric(horizontal: w * leftPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    iconRender(Icon(
                      Icons.camera_alt,
                      size: w * 0.04,
                      color: Colors.white,
                    )),
                    iconRender(Icon(
                      Icons.mic,
                      size: w * 0.04,
                      color: Colors.white,
                    )),
                    iconRender(Icon(
                      Icons.pause,
                      size: w * 0.04,
                      color: Colors.white,
                    )),
                    // time elapsed + Ending Live STream
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: h * 0.02,
                          child: FittedBox(
                            child: Text(timeElapsed,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom : h*0.02),
                            decoration: BoxDecoration(
                              color: BACKGROUND_COLOR,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: PRIMARY_COLOR, width: w * 0.01),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Text("X   End Stream",
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget singleComment(String img, String name, String msg, String time) {
    return Container(
      padding: EdgeInsets.only(left: w * leftPadding),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: w * 0.06,
            backgroundImage: NetworkImage(img),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: w * 0.03),
            width: w * 0.15,
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                msg,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: w * 0.03, right: 0),
            width: w * 0.1,
            child: Text(
              time,
              style: TextStyle(fontSize: 10, color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }

  Widget commentsection() {
    return Expanded(
      flex: 4,
      child: Column(
        children: <Widget>[
          // on going comments ----------------------------
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: BACKGROUND_COLOR,
                child: Column(
                  children: <Widget>[
                    singleComment('https://i.pravatar.cc/150?img=9', 'bretta',
                        'Lorem ipsum, Valar morghulis Valar dohearis', '11:10'),
                    singleComment('https://i.pravatar.cc/150?img=8', 'user_max',
                        'Lorem ipsum, Valar morghulis', '11:13'),
                    singleComment(
                        'https://i.pravatar.cc/150?img=7',
                        'user_allen',
                        'Lorem ipsum, Valar morghulis Valar dohearis and a really long paragraph to show that it is flexbile',
                        '11:15'),
                    singleComment(
                        'https://i.pravatar.cc/150?img=6',
                        'user_mike',
                        'Lorem ipsum, Valar morghulis Valar dohearis',
                        '11:17'),
                    singleComment('https://i.pravatar.cc/150?img=8', 'user_max',
                        'Lorem ipsum, Valar morghulis', '11:17'),
                    singleComment('https://i.pravatar.cc/150?img=9', 'bretta',
                        'Lorem ipsum, Valar morghulis Valar dohearis', '11:18'),
                  ],
                ),
              ),
            ),
          ),

          // user text field (type to comment) ----------------------------
          Container(
            padding: EdgeInsets.symmetric(horizontal: w * leftPadding),
            height: h * smallcontainersheight,
            decoration: BoxDecoration(color: BACKGROUND_COLOR, boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.tag_faces, color: Colors.white),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: w * leftPadding * 0.5),
                      border: InputBorder.none,
                      hintText: _text == "" ? "Reply..." : _text,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _text = val;
                      });
                    },
                  ),
                ),
                Icon(Icons.send, color: Colors.white)
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          upperPart(),
          commentsection(),
        ],
      ),
    );
  }
}
