

import 'package:album_app/layout/cubit/app-cubit.dart';
import 'package:album_app/layout/cubit/app-state.dart';
import 'package:album_app/module/homeScreen/homeScreen.dart';
import 'package:album_app/module/signUpScreen/signupscreen.dart';
import 'package:album_app/shared/component.dart';
import 'package:album_app/shared/style/fonts.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  String? dropdownvalue ;
  var items = [
    'Ar',
    'En',

  ];


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text('login', style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: FontSizeManager.s18,
                  fontWeight: FontWeightManager.light,

                ),),
                centerTitle: true,
                automaticallyImplyLeading: false,
                actions: [
                 /* Row(
                    children: [
                      Text('En'),
                      IconButton(onPressed: (){
                        print('lang');
                      } ,
                          icon: Icon(Icons.language , size: 30,)),
                    ],
                  ),*/

                  Container(

                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey ),
                          // borderRadius: BorderRadius.circular(30)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                          value: dropdownvalue,
                          hint:
                         /* Text('Select Language' ,
                              style:TextStyle(
                                  color: Colors.grey ,
                                  fontSize: 14)
                          ) ,*/
                            Icon(Icons.language , size: 30,),

                          icon: const Icon(Icons.keyboard_arrow_down , color: Colors.white,),

                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items, style: TextStyle(
                                // color: Colors.white
                              ),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      )

                  )]

                      ),


              body:
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50 , horizontal: 20),
                  child: Column(
                      children: [
                        Form(
                            key: formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                             /*   Container(
                                    // width: double.infinity ,
                                    height: 50,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                 child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                      value: dropdownvalue,
                                       hint: Text('Select Language' ,
                                         style:TextStyle(
                                             color: Colors.grey ,
                                             fontSize: 14)
                                         ) ,
                                      icon: const Icon(Icons.keyboard_arrow_down),

                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  )),*/

                                  SizedBox(height: 20,),

                                  Container(
                                    height: 56,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      controller: usernameController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty)
                                          return 'Please enter your username ';
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                          ),

                                          hintText: 'username',
                                          hintStyle: TextStyle(
                                              fontFamily: fontFamily,
                                              fontSize: FontSizeManager.s15,
                                              fontWeight: FontWeightManager.regular
                                          )

                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20,),

                                  Container(
                                    height: 56,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return 'Please enter your password';
                                        },
                                        onFieldSubmitted: (value) {
                                          if (formKey.currentState!.validate()) {

                                          }
                                        },
                                        decoration: InputDecoration(

                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                            ),
                                            hintText: 'password',
                                            hintStyle: TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: FontSizeManager.s15,
                                                fontWeight: FontWeightManager
                                                    .regular
                                            )

                                        )),
                                  ),

                                  SizedBox(height: 40,),

                                  Container(
                                    width: 150 ,
                                    height: 50,

                                    child: MaterialButton(
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.amberAccent,
                                      onPressed: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {

                                          navTo( context, HomeScreen() );
                                        }

                                      }
                                      ,
                                      child: Text('login' ,
                                        style: TextStyle(
                                            fontFamily: fontFamily,
                                            color: Colors.white ,
                                            fontWeight: FontWeightManager.medium ,
                                            fontSize: FontSizeManager.s18
                                        ),),),
                                  ),

                                  SizedBox(height: 5,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center ,
                                    children: [
                                      Text('Don\'t have account ?',
                                        style: TextStyle(
                                            color: Colors.grey
                                        ),),
                                      TextButton(onPressed: (){
                                        navTo(context , SignUpScreen() );
                                      }, child: Text('Sign Up',
                                      style: TextStyle(
                                        color: Colors.blue
                                      ),))
                                    ],
                                  )


                                ]))
                      ]),
                ),
              ));
        });
  }
}
