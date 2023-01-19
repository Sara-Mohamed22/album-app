

import 'package:album_app/layout/cubit/app-cubit.dart';
import 'package:album_app/layout/cubit/app-state.dart';
import 'package:album_app/module/homeScreen/homeScreen.dart';
import 'package:album_app/network/local/cashHelper.dart';
import 'package:album_app/shared/component.dart';
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
    'Ar'.tr,
    'En',

  ];


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          return  Scaffold(
                appBar: AppBar(
                  title: Text('login'.tr, style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: FontSizeManager.s18,
                    fontWeight: FontWeightManager.light,

                  ),),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  actions: [

                    Container(

                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                             style: TextStyle(color: Colors.white),
                            dropdownColor: Colors.black45,
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
                            onChanged: (String? newValue)async {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                              if(newValue == 'Ar')
                              {
                                await  Get.updateLocale( Locale('ar'));
                                CashHelper.saveData(key: "lang", value: "ar") ;

                              }
                              else
                              {
                                await  Get.updateLocale( Locale('en'));
                                CashHelper.saveData(key: "lang", value: "en") ;

                              }

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
                                    Container(
                                      child: Image.asset(
                                        "assets/images/logo.png",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,

                                      ),
                                    ),
                                    SizedBox(height: 40,),

                                    Container(
                                      height: 56,
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: TextFormField(
                                        controller: usernameController,
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty)
                                            return 'Please enter your username '.tr;
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                            ),


                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color: Colors.red),
                                            ) ,

                                            focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide(color: Colors.red),
                                            ) ,


                                            errorStyle:  TextStyle( height: .099 ,
                                                fontSize: 9

                                            ),

                                            hintText: 'username'.tr,
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
                                              return 'Please enter your password'.tr ;
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

                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(color: Colors.red),
                                              ) ,

                                              focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),

                                                borderSide: BorderSide(color: Colors.red),
                                              ) ,


                                              errorStyle:  TextStyle( height: .099 ,
                                                  fontSize: 9

                                              ),

                                              hintText: 'password'.tr,
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
                                        color: Colors.black54,
                                        onPressed: ()
                                        {
                                          if(formKey.currentState!.validate())
                                          {

                                            navTo( context, HomeScreen() );
                                          }

                                        }
                                        ,
                                        child: Text('login'.tr ,
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
                                        Text('Don\'t have account ?'.tr,
                                          style: TextStyle(
                                              color: Colors.black38
                                          ),),
                                        TextButton(onPressed: (){
                                        }, child: Text('Sign Up'.tr,
                                        style: TextStyle(
                                          color: Colors.brown
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
