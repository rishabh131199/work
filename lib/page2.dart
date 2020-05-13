import 'package:flutter/material.dart';
import 'details.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  double w, h;
  double leftpadding = 0.08;
  bool isFull = false;
  // this will help us to change the color at only one place i.e Details Class
  static const Color BACKGROUND_COLOR = Details.BACKGROUND_COLOR;
  static const Color SECONDARY_COLOR = Details.SECONDARY_COLOR;
  static const Color PRIMARY_COLOR = Details.PRIMARY_COLOR;
  static const Color PRIMARY_COLOR_DARK = Details.PRIMARY_COLOR_DARK;
  static const Color BLUR_COLOR = Details.BLUR_COLOR;

  List transactions = Details.transactions;

  Widget upperPart() {
    return Container(
      height: h * 0.35,
      // color: PRIMARY_COLOR,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [PRIMARY_COLOR,PRIMARY_COLOR_DARK]
        )
      ),
      child: Row(
        children: <Widget>[
          // back and balance info ----------------------------
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Back Button ------------
                Container(
                  padding: EdgeInsets.all(15),
                  // color: Colors.black,
                  height: h * 0.1,
                  child: FittedBox(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Balance info --------------
                Container(
                  width: w * 0.5,
                  padding: EdgeInsets.symmetric(vertical: h * 0.04),
                  decoration: BoxDecoration(
                    color: BACKGROUND_COLOR,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(w * 0.25),
                      bottomRight: Radius.circular(w * 0.25),
                      topLeft: Radius.zero,
                      bottomLeft: Radius.zero,
                    ),
                    // boxShadow: kElevationToShadow[4],
                    boxShadow: [
                      BoxShadow(
                        color: PRIMARY_COLOR,
                        blurRadius: 1.0,
                        spreadRadius: 4,
                        offset: Offset(
                          0,0// Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: w * 0.25,
                        child: FittedBox(
                          child: Text('Your Balance',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        width: w * 0.25,
                        child: FittedBox(
                          child: Text('\$3,452',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Add money and Withdraw buttons --------------------
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: w * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_COLOR, width: w * 0.01),
                    color: BACKGROUND_COLOR,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: kElevationToShadow[4],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.02),
                    child: FittedBox(
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ),
                Text('Withdraw', style: TextStyle(color: Colors.white)),
                Container(
                  width: w * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: PRIMARY_COLOR, width: w * 0.01),
                    color: BACKGROUND_COLOR,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: kElevationToShadow[4],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(w * 0.02),
                    child: FittedBox(
                      child: Icon(
                        Icons.add_circle,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                ),
                Text('Add Money', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget accountBox(String date, List details) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: w * leftpadding, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: kElevationToShadow[4],
        color: BACKGROUND_COLOR,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
          SizedBox(height: 5),

          // det[0] -> first line
          // det[1] -> sec line
          // det[x][0] -> xth line's Sent or Recieved
          ListView.builder(
            itemCount: details.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext c, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                // color: Colors.yellowAccent,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: w * 0.2,
                        // color: Colors.orangeAccent,
                        child: Text(
                          details[index][0],
                          style: details[index][0] == "Sent"
                              ? TextStyle(color: PRIMARY_COLOR)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        )),
                    Expanded(
                        child: Text(
                      details[index][1],
                      style: TextStyle(color: Colors.white),
                    )),
                    Container(
                        width: w * 0.15,
                        // color: Colors.orangeAccent,
                        child: Text(
                          details[index][2],
                          style: TextStyle(color: Colors.white70),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget lowerPart() {
    return Expanded(
      child: Container(
        color: BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // history and view all ---------------
              Container(
                margin: EdgeInsets.only(
                    left: w * leftpadding,
                    right: w * leftpadding,
                    top: h * 0.05),
                decoration: BoxDecoration(
                    // color: Colors.yellow,
                    border: Border(
                  left: BorderSide(width: 3, color: PRIMARY_COLOR),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "History",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                    // tap here to expand ----------
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFull = !isFull;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              isFull ? 'View Less' : 'View All ',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white70),
                            ),
                            isFull
                                ? Icon(
                                    Icons.arrow_back,
                                    color: Colors.white70,
                                  )
                                : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white70,
                                  ),
                          ],
                        )),
                  ],
                ),
              ),

              // scrollable details
              accountBox('Today', transactions[0]),
              accountBox('Yesterday', transactions[1]),
              accountBox('20/March/2020', transactions[2]),
              accountBox('19/March/2020', transactions[0]),
              accountBox('18/March/2020', transactions[1]),
              accountBox('17/March/2020', transactions[2]),
            ],
          ),
        ),
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
          isFull
              ? Container(
                  height: 20,
                  color: BACKGROUND_COLOR,
                )
              : upperPart(),
          lowerPart(),
        ],
      ),
    );
  }
}
