import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/inc/func.dart';

enum DateType { lunar, solar }

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _eventNameController = TextEditingController();
  int _selectedMonth = DateTime.now().month;
  int _selectedDate = DateTime.now().day;
  DateType? _selectedDateType = DateType.solar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        children: <Widget>[
          // 이름 입력
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '이름',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      labelText: '이름을 입력해주세요.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(200, 200, 200, 0),
                        ),
                      )),
                ),
              ),
            ],
          ),
          // 전화번호 입력
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '전화번호',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      labelText: '전화번호를 입력해주세요.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(200, 200, 200, 0),
                        ),
                      )),
                  keyboardType: TextInputType.phone, // 키보드 타입을 전화번호 입력에 맞게 설정
                ),
              ),
            ],
          ),
          //이벤트 이름 입력
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '이벤트 이름',
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  controller: _eventNameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      labelText: '이벤트 이름을 입력해주세요.',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(200, 200, 200, 0),
                        ),
                      )),
                ),
              ),
            ],
          ),
          // 날짜 입력
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '날짜',
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButton<int>(
                      value: _selectedMonth,
                      items: List.generate(12, (index) => index + 1)
                          .map((month) => DropdownMenuItem(
                                value: month,
                                child: Text(month.toString()),
                              ))
                          .toList(),
                      onChanged: (value) => {
                        setState(() {
                          _selectedMonth = value!;
                        })
                      },
                    ),
                  ),
                  const Text('월'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButton<int>(
                      value: _selectedDate,
                      items: List.generate(31, (index) => index + 1)
                          .map((date) => DropdownMenuItem(
                                value: date,
                                child: Text(date.toString()),
                              ))
                          .toList(),
                      onChanged: (value) => {
                        setState(() {
                          _selectedDate = value!;
                        })
                      },
                    ),
                  ),
                  const Text('일'),
                ],
              ),
            ],
          ),
          // 양력, 음력 라디오 버튼
          ListTile(
            title: const Text('양력'),
            leading: Radio<DateType>(
              value: DateType.solar,
              groupValue: _selectedDateType,
              onChanged: (value) {
                print(Func().getEnumName(value));
                setState(() {
                  _selectedDateType = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('음력'),
            leading: Radio<DateType>(
              value: DateType.lunar,
              groupValue: _selectedDateType,
              onChanged: (value) {
                print(Func().getEnumName(value));
                setState(() {
                  _selectedDateType = value;
                });
              },
            ),
          ),
          // 확인 버튼
          ElevatedButton(
            onPressed: () => {
              //이름, 전화번호, 이벤트 이름, 날짜 백엔드 전송
              http.post(
                Uri.parse(''),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: {
                  'name': _nameController.text.toString(),
                  'phone': _phoneController.text.toString(),
                  'eventName': _eventNameController.text.toString(),
                  'month': _selectedMonth.toString(),
                  'date': _selectedDate.toString(),
                },
              )
            },
            child: const Text('확인'),
          )
        ],
      ),
    );
  }
}
