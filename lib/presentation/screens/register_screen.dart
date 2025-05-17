import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(appBar: AppBar(title: Text('Nuevo usuario')), body: _RegisterView()),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [FlutterLogo(size: 100), SizedBox(height: 15), _RegisterForm(), SizedBox(height: 20)],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: registerCubit.state.username.errorMessage,

            // onChanged: (value) {
            //   registerCubit.usernameChanged(value);
            //   _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
            //   if (value.length < 6) return 'Debe contener más de 6 letras';
            //   return null;
            // },
          ),

          SizedBox(height: 15),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: registerCubit.state.email.errorMessage,

            // onChanged: (value) {
            //   registerCubit.emailChanged(value);
            //   _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
            //   final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            //   if (!emailRegExp.hasMatch(value)) return 'No tiene el formato adecuado';
            //   return null;
            // },
          ),

          SizedBox(height: 15),

          CustomTextFormField(
            label: 'Contraseña',
            onChanged: registerCubit.passwordChanged,
            errorMessage: registerCubit.state.password.errorMessage,
            obscureText: true,

            // onChanged: (value) {
            //   registerCubit.passwordChanged(value);
            //   _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
            //   if (value.length < 6) return 'Debe contener más de 6 letras';
            //   return null;
            // },
          ),

          SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState?.validate() ?? false;
              // if (!isValid) return;

              registerCubit.onSubmit();
            },
            icon: Icon(Icons.save),
            label: Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
