import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_project/core/services/util_service.dart';
import 'package:mock_project/feature/auth/view_model/auth_vm.dart';
import 'package:mock_project/feature/counter/view/counter_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var con = Provider.of<AuthVM>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            controller: con.firstNameController,
            decoration: const InputDecoration(
              hintText: "First name"
            ),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: con.lastNameController,
            decoration: const InputDecoration(
                hintText: "Last name"
            ),
          ),
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: con.phoneNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
                hintText: "Phone number",
              prefixIcon: Text("+998"),
            ),
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: con.emailController,
            decoration: const InputDecoration(
                hintText: "Email"
            ),
          ),

          MaterialButton(
            onPressed: ()async{
              await con.registerUser();
              if(con.isRegistered){
                Future.delayed(Duration.zero).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage()));
                });
              }else{
                Future.delayed(Duration.zero).then((value) {
                  Utils.fireSnackBar("Smth went wrong", context);
                });
              }
            },
            color: Colors.blue,
            minWidth: MediaQuery.of(context).size.width*0.5,
            shape: const StadiumBorder(),
            height: 75,
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
