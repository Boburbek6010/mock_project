import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mock_project/feature/counter/view_model/counter_vm.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var con = Provider.of<CounterVM>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("greeting".tr(), style: const TextStyle(
              fontSize: 34
            ),),
            Text(con.counter.toString()),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            DropdownButton(
              value: con.countryCode,
              items: const [
                DropdownMenuItem(
                    value: "uz",
                    child: Text("UZBEK"),
                ),
                DropdownMenuItem(
                  value: "ru",
                  child: Text("RUSSIAN"),
                ),
                DropdownMenuItem(
                  value: "en",
                  child: Text("ENGLISH"),
                )
              ],
              onChanged: (value){
                con.changeLanguage(context, value.toString());
                log(value.toString());
              },
            ),
            const SizedBox(height: 80),
            SizedBox(
              height: 100,
              child: ListWheelScrollView(
                useMagnifier: true,
                magnification: 1.6,
                onSelectedItemChanged: (index){
                  log(index.toString());
                  if(index == 0){
                    con.changeLanguage(context, "uz");
                  }else if(index == 1){
                    con.changeLanguage(context, "en");
                  }else{
                    con.changeLanguage(context, "ru");
                  }
                },
                itemExtent: 50,
                children: const [
                  Text("UZBEK", style: TextStyle(
                    fontSize: 25,
                  ),),
                  Text("ENGLISH", style: TextStyle(
                    fontSize: 25,
                  ),),
                  Text("RUSSIAN", style: TextStyle(
                    fontSize: 25,
                  ),),
                ],

              )
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          con.increment();
        },
      ),
    );
  }
}
