import 'package:flutter/material.dart';

import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Nuevo usuario')), body: _RegisterView());
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
              if (value.length < 6) return 'Debe contener más de 6 letras';
              return null;
            },
          ),

          SizedBox(height: 15),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) return 'No tiene el formato adecuado';
              return null;
            },
          ),

          SizedBox(height: 15),

          CustomTextFormField(
            label: 'Contraseña',
            onChanged: (value) => password = value,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'No deben haber espacios innecesarios';
              if (value.length < 6) return 'Debe contener más de 6 letras';
              return null;
            },
          ),

          SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState?.validate() ?? false;
              if (!isValid) return;
            },
            icon: Icon(Icons.save),
            label: Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
