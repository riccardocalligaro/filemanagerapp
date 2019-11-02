import 'package:filemanager_app/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blueColor,
        body: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(profileImage),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Folders',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .apply(color: Colors.white, fontWeightDelta: 2),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Storage',
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(
                                '51GB of 63GB Used',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white),
                            child: LayoutBuilder(builder: (ctx, constraints) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                        )),
                                  ),
                                  Container(
                                    width: 80,
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                  ),
                                  Container(
                                    width: 181,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                        )),
                                  ),
                                ],
                              );
                            }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          LayoutBuilder(
                            builder: (context, contraints) {
                              return Wrap(
                                runSpacing: 9,
                                children: List.generate(6, (f) {
                                  return Container(
                                    width: contraints.maxWidth / 3,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 7,
                                          height: 21,
                                          decoration: BoxDecoration(
                                              color: storageList[f]['color'],
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("${storageList[f]['name']}"),
                                            Text(
                                              "${storageList[f]['size']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                      color: Colors.white),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Recent files',
                              style: Theme.of(context).textTheme.title),
                          FlatButton(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              'View all',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: RemoveScrollViewGlow(),
                          child: ListView.builder(
                            itemCount: filesList.length,
                            itemBuilder: (context, index) {
                              String image;
                              Color color;
                              switch (filesList[index]['type']) {
                                case fileType.sheet:
                                  {
                                    image = 'assets/file_sheet.png';
                                    color = Color(0xffe3f9f3);
                                  }
                                  break;

                                case fileType.document:
                                  {
                                    image = 'assets/file_word.png';
                                    color = Color(0xffeaeaea);
                                  }
                                  break;
                                case fileType.pdf:
                                  {
                                    image = 'assets/file_pdf.png';
                                    color = Color(0xfff8bdba);
                                  }
                                  break;
                                case fileType.video:
                                  {
                                    image = 'assets/file_video.png';
                                    color = Color(0xfffceeeb);
                                  }
                                  break;
                                default:
                                  {
                                    image = 'assets/file_word.png';
                                    color = Color(0xff939aef);
                                  }
                              }
                              return ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(11.0),
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Image.asset(image),
                                ),
                                title: Text(filesList[index]['name']),
                                subtitle: Text(
                                    "${filesList[index]['date']} | ${filesList[index]['size']}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.more_vert),
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RemoveScrollViewGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Widget _popupMenu() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ],
      onSelected: (_) {},
    );
