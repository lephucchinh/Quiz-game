import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newtest/app/bloc/app_bloc.dart';
import 'package:newtest/constants.dart';
import 'package:newtest/ui/home_page.dart';


class scoreScreen extends StatelessWidget {
  const scoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {

        return Scaffold(
          extendBodyBehindAppBar: true,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      context.read<AppBloc>().add(ResetTimer());
                      context.read<AppBloc>().add(ResetAnsewr());
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),

          ),
          body: Stack(
            children: [
              SvgPicture.asset('assets/images/bg.svg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Align(
                  alignment: Alignment.center,
                  child:
                  Text('SCORE: ${state.diem}', style: TextStyle(
                    fontSize: kDefaultPadding,
                  ),)),
            ],
          ),
        );
      },

    );

  }
}
