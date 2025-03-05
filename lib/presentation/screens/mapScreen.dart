import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/strings.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({super.key});

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: BlocProvider<PhoneAuthCubit>(
            create: (context) => phoneAuthCubit,
            child: ElevatedButton(
                onPressed: () async {
                  await phoneAuthCubit.logOut();
                  Navigator.of(context).pushReplacementNamed(loginScreen);
                },
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(110, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)))),
          ),
        ),
      ),
    );
  }
}
