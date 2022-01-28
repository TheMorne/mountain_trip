import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubits/app_cubit.dart';
import 'package:flutter_cubit/pages/detail_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

import '../pages/navpages/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          if(state is WelcomeState){
            return WelcomePage();
          }if(state is LoadedState){
            return MainPage();
          }if(state is DetailState){
            return DetailPage();
          }if(state is LoadingState){
            return Center(
              child: CircularProgressIndicator() ,
            );
          }else{
            return Container(
              child: Text('State not found!'),
            );
          }
        },
      ),
    );
  }
}
