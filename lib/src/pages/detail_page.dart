import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_state/src/models/user.dart';
import 'package:bloc_state/src/bloc/user/user_bloc.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  Future<String?> _showNameDialog(BuildContext context) async {
    return await showDialog<String?>(
      context: context,
      builder: (_) {
        String name = '';

        return AlertDialog(
          title: const Text('Enter your name', textAlign: TextAlign.center),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Name'
            ),
            onChanged: (value) => name = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null), 
              child: const Text('Cancel', style: TextStyle(color: Colors.redAccent))
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(name), 
              child: const Text('Acept')
            )
          ],
        );
      }
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return await showDatePicker(
      context: context, 
      initialDate: DateTime(2000), 
      firstDate: DateTime(1950), 
      lastDate: DateTime(2020)
    );
  }

  Future<String?> _showProfessionsDialog(BuildContext context) async {
    return await showDialog<String?>(
      context: context,
      builder: (_) {
        String profession = '';

        return AlertDialog(
          title: const Text('Enter your professions', textAlign: TextAlign.center),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Profession'
            ),
            onChanged: (value) => profession = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null), 
              child: const Text('Cancel', style: TextStyle(color: Colors.redAccent))
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(profession), 
              child: const Text('Acept')
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<UserBloc, UserState, String>(
          selector: (state) => state.existUser ? state.user!.name : 'Detail page',
          builder: (_, title) {
            return Text(title);
          },
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              //-Tambien con crossAligment strech y  FractionallySizedBox
              fixedSize: Size.fromWidth(size.width * 0.5) 
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(width: double.maxFinite),
              ElevatedButton(
                onPressed: () async {
                  final name = await _showNameDialog(context);

                  if(name != null){
                    final user = User(name: name);

                    // BlocProvider.of<UserBloc>(context, listen: false).add(ActivateUser(user)); //dos formas
                    context.read<UserBloc>().add(ActivateUser(user));
                  }
                }, 
                child: const Text('Set User')
              ),

              ElevatedButton(
                onPressed: () async {
                  final date = await _showDatePicker(context);

                  if(date != null){
                    context.read<UserBloc>().add(SetUserAge(date));
                  }
                }, 
                child: const Text('Set Age')
              ),

              ElevatedButton(
                onPressed: () async {
                  final profession = await _showProfessionsDialog(context);

                  if(profession != null){
                    context.read<UserBloc>().add(AddUserProfession(profession));
                  }
                }, 
                child: const Text('Add Profession')
              )
            ],
          ),
        ),
      ),
    );
  }
}

