import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/users/presentation/blocs/user_bloc.dart';
import 'package:gamingapp/features/users/presentation/pages/login.dart';
import 'package:gamingapp/features/videogames/presentation/pages/videogame_page.dart';
import 'package:gamingapp/use_case_config.dart';

import 'features/videogames/presentation/blocs/videogame_bloc.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoGameBloc>(
            create: (BuildContext context) => VideoGameBloc(
                getVideoGamesUseCase: usecaseConfig.getVideoGameUsecase!)),
        BlocProvider(
          create: (BuildContext context) => VideoGamesBlocModify(
              addVideoGameUsecase: usecaseConfig.addVideoGameUsecase!,
              deleteVideoGameUseCase: usecaseConfig.deleteVideoGameUseCase!,
              updateVideoGameUseCase: usecaseConfig.updateVideoGameUseCase!),
        ),
        BlocProvider(
          create: (BuildContext context) => UserAuthentication(
              loginUseCase: usecaseConfig.loginUseCase!,
              registerUseCase: usecaseConfig.registerUseCase!),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const VideoGamePage(),
      ),
    );
  }
}
