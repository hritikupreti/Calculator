import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Frame(),
  ));
}
class Frame extends StatefulWidget {
  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  String output= '0';
  String output2='0';
  String _output="0";
  String operand="";
  double num1=0.0;
  double num2=0.0;

  buttonpressed(String buttonText)
  {
    if(buttonText=="+"|| buttonText=="/"|| buttonText=="-"|| buttonText=="*")
      {
        num1= num1+ double.parse(_output);
        operand=buttonText;
        _output="0";
        setState(() {
          output="$num1 $operand ";
        });

      }
    else if(buttonText==".") {
      if (_output.contains(".")) {
        print("not allowed");
      }
      else {
        _output = _output + buttonText;
      }
    }
      else if(buttonText=="clear")
        {
          _output="0";
          output2="0";
          output="0";
           operand="";
           num1=0.0;
           num2=0.0;

          setState(() {
            output2=double.parse(_output).toStringAsFixed(2);
          });
        }
      else if(buttonText=='=')
        {
          num2=double.parse(_output);
          if(operand=="+")
            {
              _output=(num1+num2).toString();
            }
          if(operand=="-")
          {
            _output=(num1-num2).toString();
          }
          if(operand=="*")
          {
            _output=(num1*num2).toString();
          }
          if(operand=="/")
          {
            _output=(num1/num2).toString();
          }
          num1=0;
          num2=0;
          setState(() {
            output2=double.parse(_output).toStringAsFixed(2);
          });
          output='0';
    }
      else
        {
            _output=_output+ buttonText;
            setState(() {
              output=double.parse(_output).toStringAsFixed(2);
            });
        }
  }



  Widget button(String buttontext){
    return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(23.0),
          onPressed: (){
            buttonpressed(buttontext);
          },
          child: Text(buttontext,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('calculator',
        style: TextStyle(
          fontSize: 25,
          letterSpacing: 1,
        ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        ),
    body: Container(
      child: Column(
        children:<Widget>[
           Container(
             alignment: Alignment.centerRight,
               padding: EdgeInsets.symmetric(
                 vertical:59,
                 horizontal: 14,
               ),

               child: Text('$output',
               style: TextStyle(
                 fontSize: 40,
                 color: Colors.black45,
               ),
               ),
      ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical:19,
                  horizontal: 14,
                ),
                child: Text('$output2',
                 style: TextStyle(
                   fontSize: 50,
                 ),
                 ),
              ),

          Expanded(
            child : Divider(),
          ),
          Row( children:<Widget>[
            button('7'),
            button('8'),
            button('9'),
            button('/'),
          ]
          ),
          Row(children:[
            button('4'),
            button('5'),
            button('6'),
            button('*'),
          ],
          ),
          Row(children:[
            button('1'),
            button('2'),
            button('3'),
            button('-'),
          ],
          ),
          Row(children:[
            button('.'),
            button('0'),
            button('00'),
            button('+'),
          ],
          ),
          Row(children:[
            button('clear'),
            button('='),
          ],
          ),
        ],
      ),
      ),
    );
  }
}

