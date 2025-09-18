import 'package:desconto_direto_mobile/screens/login_screen/components/login_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class login_Screen extends StatefulWidget {
  const login_Screen({super.key});

  @override
  State<login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<login_Screen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _submit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final data = _formKey.currentState!.value;
      print('Email: ${data['email']}');
      print('Senha: ${data['password']}');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login realizado com sucesso')));
    } else {
      print('Erro na validação');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF023047),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  width: 170.0,
                  height: 110.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 74),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color(0xFFFFB703),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 40, 16, 40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.kaiseiDecol(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20.0),
                          FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: [
                                LoginTextInput(
                                  name: 'email',
                                  label: 'Email',
                                  prefixIcon: Icons.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      errorText: 'Email obrigatório',
                                    ),
                                    FormBuilderValidators.email(
                                      errorText: 'Email inválido',
                                    ),
                                  ]),
                                ),
                                const SizedBox(height: 24),
                                LoginTextInput(
                                  name: 'password',
                                  label: 'Senha',
                                  prefixIcon: Icons.lock,
                                  obscureText: true,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      errorText: 'Senha obrigatória',
                                    ),
                                    FormBuilderValidators.minLength(
                                      6,
                                      errorText:
                                          'Senha deve ter ao menos 6 caracteres',
                                    ),
                                  ]),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: _submit,
                                  child: const Text('Entrar'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
