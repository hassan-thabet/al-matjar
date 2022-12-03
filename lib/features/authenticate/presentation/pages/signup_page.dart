import 'package:flutter/material.dart';

import '../widgets/register_with_button_widget.dart';
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F9FA),
          title: const Text('Sign up' , style: TextStyle(color: Colors.black87),),
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                    height: 128,
                    width: 128,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/hassan.jpg'),
                        ),
                        Positioned(
                            bottom: -12,
                            right: -20,
                            child: RawMaterialButton(
                              onPressed: (){},
                              elevation: 4,
                              fillColor: Colors.white,
                              shape: const CircleBorder(),
                              child: const Icon(Icons.camera_alt_outlined, color: Color(0xffFC6B68) ,size: 16,),
                            )
                        )

                      ],
                    )
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'first name'.toUpperCase(),
                            labelStyle:
                            const TextStyle(color: Colors.black54 ,fontSize: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: CircleAvatar(
                                  backgroundColor: const Color(0xffFC6B68).withAlpha(10),
                                  child: const Icon(
                                    Icons.looks_one_outlined,
                                    color: Color(0xffFC6B68),
                                  )),
                            ),
                            // suffixIcon: (isPassword == true)
                            //     ? const Padding(
                            //   padding: EdgeInsets.only(right: 12),
                            //   child: Icon(
                            //     Icons.visibility_off_outlined,
                            //     color: Colors.black54,
                            //   ),
                            // )
                            //     : const Text(' '),
                          ),
                          style: const TextStyle(color: Colors.black , fontSize: 18),
                          cursorColor: Colors.black54,
                          cursorWidth: 1,
                          //keyboardType: (isPassword == true) ? TextInputType.text : TextInputType.emailAddress,
                          //obscureText: (isPassword == true) ? true : false,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'last name'.toUpperCase(),
                            labelStyle:
                            const TextStyle(color: Colors.black54 ,fontSize: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: CircleAvatar(
                                  backgroundColor: const Color(0xffFC6B68).withAlpha(10),
                                  child: const Icon(
                                    Icons.looks_two_outlined,
                                    color: Color(0xffFC6B68),
                                  )),
                            ),
                            // suffixIcon: (isPassword == true)
                            //     ? const Padding(
                            //   padding: EdgeInsets.only(right: 12),
                            //   child: Icon(
                            //     Icons.visibility_off_outlined,
                            //     color: Colors.black54,
                            //   ),
                            // )
                            //     : const Text(' '),
                          ),
                          style: const TextStyle(color: Colors.black , fontSize: 18),
                          cursorColor: Colors.black54,
                          cursorWidth: 1,
                          //keyboardType: (isPassword == true) ? TextInputType.text : TextInputType.emailAddress,
                          //obscureText: (isPassword == true) ? true : false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6,),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'e-mail'.toUpperCase(),
                      labelStyle:
                      const TextStyle(color: Colors.black54 ,fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor: const Color(0xffFC6B68).withAlpha(10),
                            child: const Icon(
                              Icons.email_outlined,
                              color: Color(0xffFC6B68),
                            )),
                      ),
                      // suffixIcon: (isPassword == true)
                      //     ? const Padding(
                      //   padding: EdgeInsets.only(right: 12),
                      //   child: Icon(
                      //     Icons.visibility_off_outlined,
                      //     color: Colors.black54,
                      //   ),
                      // )
                      //     : const Text(' '),
                    ),
                    style: const TextStyle(color: Colors.black , fontSize: 18),
                    cursorColor: Colors.black54,
                    cursorWidth: 1,
                    //keyboardType: (isPassword == true) ? TextInputType.text : TextInputType.emailAddress,
                    //obscureText: (isPassword == true) ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'phone number'.toUpperCase(),
                      labelStyle:
                      const TextStyle(color: Colors.black54 ,fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor: const Color(0xffFC6B68).withAlpha(10),
                            child: const Icon(
                              Icons.phone_android_rounded,
                              color: Color(0xffFC6B68),
                            )),
                      ),
                      // suffixIcon: (isPassword == true)
                      //     ? const Padding(
                      //   padding: EdgeInsets.only(right: 12),
                      //   child: Icon(
                      //     Icons.visibility_off_outlined,
                      //     color: Colors.black54,
                      //   ),
                      // )
                      //     : const Text(' '),
                    ),
                    style: const TextStyle(color: Colors.black , fontSize: 18),
                    cursorColor: Colors.black54,
                    cursorWidth: 1,
                    //keyboardType: (isPassword == true) ? TextInputType.text : TextInputType.emailAddress,
                    //obscureText: (isPassword == true) ? true : false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'password'.toUpperCase(),
                          labelStyle:
                          const TextStyle(color: Colors.black54 ,fontSize: 14),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CircleAvatar(
                                backgroundColor: const Color(0xffFC6B68).withAlpha(10),
                                child: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color(0xffFC6B68),
                                )),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black54,
                            ),
                          )
                      ),
                      style: const TextStyle(color: Colors.black , fontSize: 18),
                      cursorColor: Colors.black54,
                      cursorWidth: 1,
                      obscureText: true
                  ),
                ),

                RegisterWithButtonWidget(
                  buttonTextLabel: 'Sign Up',
                  buttonBackgroundColor: const Color(0xffFC6B68),
                  labelColor: Colors.white,
                  onClick: () {  },
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
