import 'package:flutter/material.dart';

import 'api.dart';

class MyWhatsapp extends StatelessWidget {
  final TextEditingController messageText = TextEditingController();
  final TextEditingController numberText = TextEditingController();
  final TextEditingController countryCodeText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    countryCodeText.text = '91';
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/icon_whatsapp.png',
          height: 28,
          width: 28,
        ),
        backgroundColor: Colors.blue[700],
        title: Text(
          'Random Whatapp Messenger',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      width: 70,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextField(
                        controller: countryCodeText,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        // maxLengthEnforced: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          prefixText: '+',
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          hoverColor: Colors.black26,
                          border: InputBorder.none,
                          counterStyle: TextStyle(height: double.minPositive),
                          counterText: '',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 230,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: numberText,
                        maxLines: 1,
                        maxLength: 10,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter Number',
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          hoverColor: Colors.black26,
                          border: InputBorder.none,
                          counterStyle: TextStyle(height: double.minPositive),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: deviceWidth > 700 ? 600 : deviceWidth * 0.8,
                  height: deviceHeight * 0.3,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    controller: messageText,
                    minLines: 1,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    // autofocus: true,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Message Here',
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 25),
                        border: InputBorder.none,
                        hoverColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.tealAccent,
                    ),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 12,
                    //   vertical: 13,
                    // ),
                    // onHover: Colors.lightGreen,
                    // color: Colors.tealAccent,
                    // focusColor: Colors.lightGreen,
                    onPressed: () {
                      if (countryCodeText.text == null ||
                          messageText.text == null ||
                          numberText.text == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Empty Fields !!!'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else if (numberText.text.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Wrong Number - Length is shorter than 10 !!"),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        try {
                          WhatsappAPI().sendMessage(
                            int.parse(countryCodeText.text),
                            int.parse(numberText.text),
                            messageText.text,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error !'),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 5, right: 10, bottom: 4),
                          height: 28,
                          width: 28,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.send,
                            size: 35,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
