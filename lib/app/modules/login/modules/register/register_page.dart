import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/component/appbar/app_bar_custom.dart';
import 'package:keep_up/app/component/dialog/dialog_date_time.dart';
import 'package:keep_up/app/component/load/load_elements.dart';
import 'package:keep_up/app/component/select/select_button.dart';
import 'package:keep_up/app/component/textfield/custom_grey_textfield.dart';
import 'package:keep_up/app/models/pairs.dart';
import 'package:keep_up/app/routes/constants_routes.dart';
import 'package:keep_up/app/utils/date_utils.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

import '../../login_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final bloc = Modular.get<LoginBloc>();

  bool _loading = false;
  FocusNode myFocusNode;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        AppBarCustom("Cadastra"),
        Expanded(
            child: SingleChildScrollView(
          child: StreamBuilder(
              stream: bloc.isLoad,
              initialData: false,
              builder: (context, snapshot) {
                var _isLoadRequest = snapshot.data;
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 30, bottom: 5),
                        child: CustomGreyTextField(
                          enabled: !_isLoadRequest,
                          obscureText: snapshot.data,
                          labelText: "Nome",
                          controller: bloc.nameController,
                          prefixIcon: Icon(
                            Icons.person,
                            size: 18,
                            color: AppThemeUtils.colorPrimary,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 5, bottom: 5),
                        child: CustomGreyTextField(
                          enabled: !_isLoadRequest,
                          obscureText: snapshot.data,
                          labelText: "E-mail",
                          controller: bloc.emailController,
                          prefixIcon: Icon(
                            Icons.email,
                            size: 18,
                            color: AppThemeUtils.colorPrimary,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            right: 30, left: 30, top: 5, bottom: 5),
                        child: InkWell(
                            onTap: () {
                              DialogDateTime.selectDateNasc(context,
                                  (date) async {
                                if (date != null) {
                                  bloc.dateNscController.text =
                                      DateUtils.parseDateTimeFormat(date);
                                }
                              });
                            },
                            child: CustomGreyTextField(
                              enabled: false,
                              obscureText: snapshot.data,
                              labelText: "Data de nascimento",
                              controller: bloc.dateNscController,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.date_range,
                                  color: AppThemeUtils.colorPrimaryDark,
                                ),
                                onPressed: () {
                                  DialogDateTime.selectDateNasc(context,
                                      (date) async {
                                    if (date != null) {
                                      bloc.dateNscController.text =
                                          DateUtils.parseDateTimeFormat(date);
                                    }
                                  });
                                },
                              ),
                            ))),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sexo",
                          style: AppThemeUtils.smallSize(),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: SelectButton(
                          tapIndex: (i) {
                            bloc.sexoController.text = i?.first ?? "";
                          },
                          title: [
                            Pairs("M", "Masculino"),
                            Pairs("F", "Feminino"),
                          ],
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: 30, top: 5, bottom: 5),
                                child: CustomGreyTextField(
                                  enabled: !_isLoadRequest,
                                  labelText: "Altura",
                                  keyboardType: TextInputType.number,
                                  controller: bloc.alturaControler,
                                  prefixIcon: Icon(
                                    Icons.accessibility,
                                    size: 18,
                                    color: AppThemeUtils.colorPrimary,
                                  ),
                                ))),
                        Container(
                            margin:
                                EdgeInsets.only(right: 30, top: 5, bottom: 5),
                            child: Center(
                                child: Text(
                              "m",
                              style: AppThemeUtils.normalBoldSize(),
                            )))
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pratica algum tipo de exercicio ou esporte?",style: AppThemeUtils.smallSize(),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: SelectButton(
                          tapIndex: (i) {
                            bloc.sexoController.text = i?.first ?? "";
                          },
                          title: [
                            Pairs("SIM", "SIM"),
                            Pairs("NAO", "NÃO"),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Eu quero...",style: AppThemeUtils.smallSize(),
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        alignment: Alignment.centerLeft,
                        child: SelectButton(
                          tapIndex: (i) {
                            bloc.sexoController.text = i?.first ?? "";
                          },
                          title: [
                            Pairs("PERDER", "Perder peso"),
                            Pairs("GANHAR", "Ganhar peso"),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: StreamBuilder<bool>(
                            stream: bloc.showPass.stream,
                            initialData: false,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              return CustomGreyTextField(
                                enabled: !_isLoadRequest,
                                obscureText: snapshot.data,
                                labelText: "Senha",
                                controller: bloc.passController,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 18,
                                  color: AppThemeUtils.colorPrimary,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    snapshot.data
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppThemeUtils.colorPrimaryDark,
                                  ),
                                  onPressed: () {
                                    bloc.showPass.sink.add(!snapshot.data);
                                  },
                                ),
                              );
                            })),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: StreamBuilder<bool>(
                            stream: bloc.showPassConfirm.stream,
                            initialData: false,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              return CustomGreyTextField(
                                enabled: !_isLoadRequest,
                                obscureText: snapshot.data,
                                labelText: "Confirmar Senha",
                                controller: bloc.passConfirmController,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 18,
                                  color: AppThemeUtils.colorPrimary,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    snapshot.data
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppThemeUtils.colorPrimaryDark,
                                  ),
                                  onPressed: () {
                                    bloc.showPass.sink.add(!snapshot.data);
                                  },
                                ),
                              );
                            })),
                    _isLoadRequest
                        ? loadElements(context)
                        : Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: SizedBox(

                              child: RaisedButton(
                                padding: EdgeInsets.all(5),
                                color: AppThemeUtils.colorPrimary80,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "Cadastrar",
                                  style: AppThemeUtils.normalSize(
                                      color: AppThemeUtils.whiteColor),
                                ),
                                onPressed: () {
                                  bloc.signup(context);
                                },
                              ),
                            ),
                          ),
                    Container(
                        margin:EdgeInsets.only(
                            right: 30, left: 30, top: 5, bottom: 55),
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            onPressed: () {
                              Modular.to.pushNamed(ConstantsRoutes.LOGIN_PAGE);
                            },
                            child: Text(
                              "Já possui acesso?!",
                              style: AppThemeUtils.smallSize(),
                            ))),
                  ],
                );
              }),
        ))
      ],
    ));
  }
}

//           Expanded(
//               child: SingleChildScrollView(
//             child: StreamBuilder(
//                 stream: bloc.isLoad,
//                 initialData: false,
//                 builder: (context, snapshot) {
//                   var _isLoadRequest = snapshot.data;
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 15.0),
//                     child: Form(
//                         key  : _formkey,
//                         child : Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             SizedBox(height: 5.0),
//                             TextFormField(
//                               controller: bloc.nameController,
//                               validator:(input){
//                                 if(input.isEmpty){
//                                   return 'Please Enter Name';
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               onTap: () {
//                                 FocusScopeNode currentFocus = FocusScope.of(context);
//                                 if (!currentFocus.hasPrimaryFocus) {
//                                   currentFocus.unfocus();
//                                 }
//                               },
//                             //  onSaved: (input)=> _name = input,
//                               decoration: InputDecoration(
//                                 labelText: 'Name',
//                               ),
//                             ),
//
//                             SizedBox(height: 10),
//                             TextFormField(
//                               focusNode: myFocusNode,controller: bloc.emailController,
//                               onTap: () {
//                                 FocusScopeNode currentFocus = FocusScope.of(context);
//                                 if (!currentFocus.hasPrimaryFocus) {
//                                   currentFocus.unfocus();
//                                 }
//                               },
//                               validator:(input){
//                                 if(input.isEmpty){
//                                   return 'Please type a Email';
//                                 }
//                                 else{
//                                   Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                   RegExp regex = RegExp(pattern);
//                                   if(!regex.hasMatch(input))
//                                     return 'Enter valid Email';
//                                   else
//                                     return null;
//                                 }
//                               },
//                             //  onSaved: (input)=> _email = input,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 //   focusedBorder: UnderlineInputBorder(
//                                 //     borderSide: BorderSide(color: Colors.green)),
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                             ),
//                             SizedBox(height: 5.0),
//                             TextFormField(controller: bloc.passController,
//                               validator:(input){
//                                 if(input.length < 6 ){
//                                   return 'Your password needs to be atleast 6 characters';
//                                 }
//                                 else{
//                                   return null;
//                                 }
//                               },
//                               onTap: () {
//                                 FocusScopeNode currentFocus = FocusScope.of(context);
//                                 if (!currentFocus.hasPrimaryFocus) {
//                                   currentFocus.unfocus();
//                                 }
//                               },
//                              // onSaved: (input)=> _password = input,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                               ),
//                               obscureText: true,
//                             ),
//
//                             SizedBox(height: 20.0),
//                          _loading ?loadElements(context):   Container(
//                               height: 45.0,
//                               width: 150,
//                               child: Material(
//                                 borderRadius: BorderRadius.circular(22.0),
//                                 shadowColor: Colors.tealAccent,
//                                 color: Colors.teal,
//                                 elevation: 7.0,
//                                 child: GestureDetector(
//                                   onTap: (){
//                                     bloc.signup(context,_formkey);
//                                   },
//                                   child: Center(
//                                     child: Text(
//                                       'SIGN UP',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 15.0),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   'Already have an Account ?',
//                                 ),
//                                 SizedBox(width: 7.0),
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Text(
//                                     'Login',
//                                     style: TextStyle(
//                                         color: Colors.teal,
//                                         fontWeight: FontWeight.bold,
//                                         decoration: TextDecoration.underline
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                     ),
//                   );
//                 }),
//           ))
//         ],
//       ),
//     );
//   }
// }
