import 'package:contactapp/constant/constants.dart';
import 'package:contactapp/ui/pages/contact.dart';
import 'package:contactapp/ui/pages/deskboard.dart';
import 'package:contactapp/ui/pages/settings.dart';
import 'package:flutter/material.dart';

class ContactTab extends StatefulWidget {
  @override
  _ContactTabState createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {

  int _selectedIndex = 0;
  var arr = [ContactPatent(),SettingParent()];
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _tabEvent(int _index){
    setState(() {
      _selectedIndex = _index;
    });
    _pageController.animateToPage(_index, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: Text('Contacts',style: TextStyle(color: appColor),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: GestureDetector(
                      onTap: ()=>_tabEvent(0),
                      child: Text('Contact',style: TextStyle(fontSize: 20,color:(_selectedIndex == 0)?appColor:Colors.black),textAlign: TextAlign.end,))),
                  Expanded(child: GestureDetector(
                      onTap: ()=>_tabEvent(1),
                      child: Text('Draft',style: TextStyle(fontSize: 20,color:(_selectedIndex == 1)?appColor:Colors.black),textAlign: TextAlign.start,))),],
              ),
            ),
            Expanded(
              flex: 40,
              child: PageView(
                controller: _pageController,
                children: arr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
