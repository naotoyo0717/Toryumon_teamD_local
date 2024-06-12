import 'package:flutter/material.dart';
import 'dart:async'; // Timerのためにインポート
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'; //タイムピッカ―のためにインポート

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTime = '';
  String _selectedDay = '月曜日'; 
  String _selectedSound = 'サウンド1';
  String _selectedDifficulty = 'easy'; 
  String _selectedDeleteOption = '消す';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(Duration(minutes: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFAF5E8),
        appBar: AppBar(
          backgroundColor: Color(0xFFFAF5E8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.close, color: Color.fromARGB(255, 74, 74, 74)),
              Text('設定', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
              Icon(Icons.check, color: Color.fromARGB(255, 74, 74, 74)),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              color: const Color.fromARGB(255, 74, 74, 74),
              height: 2.0,
            ),
          ),
        ),


        body: Center(


          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                _currentTime,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w300, 
                  color: Color.fromARGB(255, 74, 74, 74),
                ),
              ), // 現在の時刻を表示
              SizedBox(height: 40),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.fromLTRB(27, 5, 27, 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFAEECF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("時間", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
                    SizedBox(width: 10), 
                    TextButton(
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                          showTitleActions: true,
                          showSecondsColumn: false,
                          onChanged: (date) {
                            print(date);
                          },
                          onConfirm: (date) {
                            print(date);
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.jp
                        );
                      },
                      child: const Text(
                        '時間を選択',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.fromLTRB(27, 5, 27, 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFAEECF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("繰り返し", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: _selectedDay,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDay = newValue!;
                        });
                      },
                      items: <String>['月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日', '日曜日']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Color.fromARGB(255, 74, 74, 74))),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.fromLTRB(27, 5, 27, 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFAEECF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("サウンド", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: _selectedSound,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSound = newValue!;
                        });
                      },
                      items: <String>['サウンド1', 'サウンド2', 'サウンド3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Color.fromARGB(255, 74, 74, 74))),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.fromLTRB(27, 5, 27, 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFAEECF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("難易度", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: _selectedDifficulty,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDifficulty = newValue!;
                        });
                      },
                      items: <String>['easy', 'normal', 'hard']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Color.fromARGB(255, 74, 74, 74))),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.fromLTRB(27, 5, 27, 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFAEECF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    Text("削除", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 74, 74, 74))),
                    SizedBox(width: 10), 
                    DropdownButton<String>(
                      value: _selectedDeleteOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDeleteOption = newValue!;
                        });
                      },
                      items: <String>['消す', '08:40']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Color.fromARGB(255, 74, 74, 74))),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}


