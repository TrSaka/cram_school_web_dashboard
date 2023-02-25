import 'package:flutter/material.dart';
import 'package:flutter_school/core/constants/app/global/global_keys.dart';

class HomeWorkView extends StatefulWidget {
  const HomeWorkView({super.key});

  @override
  State<HomeWorkView> createState() => _HomeWorkViewState();
}

class _HomeWorkViewState extends State<HomeWorkView> {
  String selectedLesson = "Türkçe";
  List<String> dersler = [
    'Türkçe',
    'Matematik',
    'Fizik',
    'Kimya',
    'Biyoloji',
    'Coğrafya',
    'Felsefe',
    'Edebiyat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add, size: 18),
            label: const Text("Yeni Ödev Ekle"),
            onPressed: () {
              CreateAlertDialog(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(
            children: const [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.circle_notifications,
                    color: Colors.blue,
                  ),
                  title: Text("Genel Duyuru"),
                  subtitle: Text("Tarih Eklenecek"),
                  trailing: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.circle_notifications,
                    color: Colors.blue,
                  ),
                  title: Text("Genel Duyuru"),
                  subtitle: Text("Tarih Eklenecek"),
                  trailing: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  final DateTime _dateTime = DateTime.now();
  CreateAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
                height: 600,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          icon: Icon(Icons.home_work),
                          hintText: "Ödev başlığı giriniz",
                          labelText: "Ödev Başlığı",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Bu alan boş bırakılamaz.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Burayı doldurunuz",
                            helperText:
                                "Buraya ödevin içeriği hakkında bilgi giriniz.",
                            labelText: "Ödev açıklaması"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Bu alan boş bırakılamaz.';
                          }
                          return null;
                        },
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButton<String>(
                        hint: const Text("Ders seçiniz"),
                        items: dersler.map((ders) {
                          return DropdownMenuItem<String>(
                            child: Text(ders),
                            value: ders,
                          );
                        }).toList(),
                        onChanged: (data) {
                          setState(() {
                            selectedLesson = data!;
                          });
                        },
                        value: selectedLesson,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime,
                                firstDate: _dateTime
                                    .subtract(const Duration(days: 20)),
                                lastDate:
                                    _dateTime.add(const Duration(days: 30)));
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text(
                            "Tarih Seçiniz",
                            style: TextStyle(color: Colors.white),
                          )),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: const Text('Oluştur'),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                          )),
                    ],
                  ),
                )),
          );
        });
  }
}
