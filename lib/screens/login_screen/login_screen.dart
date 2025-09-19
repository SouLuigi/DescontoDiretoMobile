import 'package:desconto_direto_mobile/screens/login_screen/components/global_button.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF023047),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Logo e espaço (ajustados para um layout mais dinâmico)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 200, 16, 40),
              child: Container(
                width: 155.0,
                height: 144.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_text.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ), // Espaço para o logo
            const SizedBox(height: 50),
            // Container do formulário
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color(0xFFFFB703),
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 40),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: GoogleFonts.kaiseiDecol(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
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
                          const SizedBox(height: 25),
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
                          const SizedBox(height: 30),
                          GlobalButton(text: 'Entrar', onPressed: _submit),
                          const SizedBox(height: 20),
                          GlobalButton(text: 'Cadastro', onPressed: _submit),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
