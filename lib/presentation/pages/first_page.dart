import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/core/resources/color.dart';
import 'package:suitmedia/core/resources/font.dart';
import 'package:suitmedia/presentation/bloc/palindrome/palindrome_bloc.dart';
import 'package:suitmedia/presentation/pages/second_page.dart';
import 'package:suitmedia/presentation/widgets/button_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController sentenceController = TextEditingController();

    bool isPalindrome = false;

    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cWhite),
        elevation: 5,
        backgroundColor: cBlue,
        title: Text(
          "First Screen",
          style: bold.copyWith(fontSize: 20, color: cWhite),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/C4E0BAQGkvA7bY4OGfg/company-logo_200_200/0/1631303356110?e=1727913600&v=beta&t=f8IqGoBQFTlQjom_OHLdKMOFHGwB2ieWFjKKb_i-Q94',
                      ),
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter your details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    // onChanged: (value) => controller.name.value = value,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: sentenceController,
                    // onChanged: (value) => controller.sentence.value = value,
                    decoration: InputDecoration(
                      labelText: 'Sentence',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<PalindromeBloc, PalindromeState>(
                    builder: (context, state) {
                      return ButtonWidget("CHECK", onPressed: () {
                        context.read<PalindromeBloc>().add(
                            PalindromeEventChecked(
                                text: sentenceController.text));

                        if (state is PalindromeStateSuccessChecked) {
                          return AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.success,
                            title: "Result",
                            desc: state.message,
                            btnOkOnPress: () {
                              isPalindrome = true;
                              // Navigator.pop(context, true);
                            },
                          )..show();
                        }

                        if (state is PalindromeStateError) {
                          return AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.error,
                            title: "Result",
                            desc: state.message,
                            btnOkOnPress: () {
                              isPalindrome = false;
                              // Navigator.pop(context, true);
                            },
                          )..show();
                        }
                      }, color: cBlue);
                    },
                  ),
                  const SizedBox(height: 10),
                  // isPalindrome == true
                  ButtonWidget("NEXT", onPressed: () {
                    var nameUser = nameController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(name: nameUser)),
                    );
                    isPalindrome = false;
                  }, color: cBlue)
                  // : ButtonWidget("NEXT", onPressed: () {
                  //     return AwesomeDialog(
                  //       context: context,
                  //       animType: AnimType.scale,
                  //       dialogType: DialogType.info,
                  //       title: "Info",
                  //       desc: "Please enter name and sentence first",
                  //       btnOkOnPress: () {
                  //         isPalindrome = false;
                  //         // Navigator.pop(context, true);
                  //       },
                  //     )..show();
                  //   }, color: cBlue)
                ],
              )),
        ),
      ),
    );
  }
}
