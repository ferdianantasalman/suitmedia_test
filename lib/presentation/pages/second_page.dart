import 'package:flutter/material.dart';
import 'package:suitmedia/core/resources/color.dart';
import 'package:suitmedia/core/resources/font.dart';
import 'package:suitmedia/domain/entities/user.dart';
import 'package:suitmedia/presentation/pages/third_page.dart';
import 'package:suitmedia/presentation/widgets/button_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
    this.name,
    this.userModel,
  });

  final String? name;
  final User? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cWhite),
        elevation: 5,
        backgroundColor: cBlue,
        title: Text(
          "Select User",
          style: bold.copyWith(fontSize: 20, color: cWhite),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 5),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: regular.copyWith(fontSize: 18, color: cBlack),
              ),
              const SizedBox(height: 10),
              name != null
                  ? Text(
                      "Name : $name",
                      style: bold.copyWith(fontSize: 17, color: cBlack),
                    )
                  : Text(
                      "Name : ",
                      style: bold.copyWith(fontSize: 17, color: cBlack),
                    ),
              const SizedBox(height: 105),
              userModel != null
                  ? Text(
                      "Selected User : ${userModel!.firstName} ${userModel!.lastName}",
                      style: bold.copyWith(fontSize: 17, color: cBlack),
                    )
                  : Text(
                      "Selected User : ",
                      style: bold.copyWith(fontSize: 17, color: cBlack),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.all(20),
          height: 100,
          child: ButtonWidget("Choose a user", onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage(name: name)),
            );
          }, color: cBlue)),
    );
  }
}
