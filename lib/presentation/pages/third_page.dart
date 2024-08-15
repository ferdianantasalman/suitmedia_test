import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/core/resources/color.dart';
import 'package:suitmedia/core/resources/font.dart';
import 'package:suitmedia/domain/entities/user.dart';
import 'package:suitmedia/presentation/bloc/user/user_bloc.dart';
import 'package:suitmedia/presentation/pages/second_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    super.key,
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cWhite),
        elevation: 5,
        backgroundColor: cBlue,
        title: Text(
          "List of Users",
          style: bold.copyWith(fontSize: 20, color: cWhite),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserStateError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is UserStateSuccessGetAll) {
          List<User> listUser = state.listUser;
          return RefreshIndicator(
            onRefresh: () async {
              const Center(
                child: CircularProgressIndicator(),
              );
              context.read<UserBloc>().add(UserEventGetAll(
                  page: Random().nextInt(2) + 1,
                  perPage: Random().nextInt(10) + 1));
            },
            child: ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                User user = listUser[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SecondPage(name: name, userModel: user)),
                    );
                  },
                  title: Text(
                    "${user.firstName} ${user.lastName}",
                    style: bold.copyWith(fontSize: 15, color: cBlack),
                  ),
                  subtitle: Text(
                    "${user.email}",
                    style: regular.copyWith(fontSize: 14, color: cBlack),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: cWhite,
                    backgroundImage: NetworkImage(
                      "${user.avatar}",
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("User tidak ditemukan"),
          );
        }
      }),
    );
  }
}
