import 'package:flutter/material.dart';
import 'package:contactapp/constant/constants.dart';

class EditText extends StatefulWidget {
  String placeholder;
  TextEditingController controller;
  TextInputType keybord;
  FocusNode focus;
  FocusNode nextfocus;
  bool obscureText;

  EditText({this.placeholder, this.controller, this.keybord, this.focus,
      this.nextfocus,this.obscureText=false});

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {

  bool _is_focus=false;
  @override
  void initState() {
    super.initState();
    widget.focus.addListener(_onFocusChange);
  }
  void _onFocusChange(){
    if(widget.focus.hasFocus){
      if (this.mounted) {
        setState(() {
          _is_focus = true;
        });
      }
    }else{
      if (this.mounted) {
        setState(() {
          _is_focus = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color newcolor = Colors.black;
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.black,
      ),
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: new TextFormField(
          textInputAction: TextInputAction.next,
          obscureText:widget.obscureText,
          onFieldSubmitted: (v){
            FocusScope.of(context).requestFocus(widget.nextfocus);
          },
          focusNode: widget.focus,
          controller: widget.controller,
          keyboardType: widget.keybord,
          cursorColor: Colors.black,
          style: new TextStyle(color: _is_focus ? newcolor: Colors.black.withOpacity(0.8)),
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: _is_focus?  newcolor :Color.fromRGBO(235,235,235,1),
                )
            ),
            hintText: widget.placeholder,
            hintStyle: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.3)),
          ),
        ),
      ),
    );
  }
}
