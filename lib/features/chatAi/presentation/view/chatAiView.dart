import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/core/widgets/3.3%20custom_text_field.dart';
import 'package:resturant_app/features/chatAi/presentation/cubit/changetext/changetext_cubit.dart';

class ChatAi extends StatefulWidget {
  const ChatAi({super.key});

  @override
  State<ChatAi> createState() => _ChatAiState();
}

class _ChatAiState extends State<ChatAi> {
  final TextEditingController _controller = TextEditingController();
  String _response = '...مرحبا كيف يمكنني مستعدتك';

  void _askGemini() async {
    BlocProvider.of<ChangetextCubit>(context).loading();
    final result = await Gemini.instance.text(_controller.text);
    _controller.text = '';
    BlocProvider.of<ChangetextCubit>(
      context,
    ).changeText(text: result?.output ?? 'لم يتم الحصول على رد.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Ai Chef', style: Fontstyle.f20w600w),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Get.size.height - 180,
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          Appimages.bottomNavBar[3],
                          width: 35,
                          height: 35,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: BlocBuilder<ChangetextCubit, ChangetextState>(
                          builder: (context, state) {
                            if (state is Changetext) {
                              return Text(
                                state.text,
                                style: Fontstyle.f15w400w,
                              );
                            } else {
                              return AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'مرحبا كيف يمكنني مساعدتك ...',
                                    textStyle: Fontstyle.f16w600,
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                  TyperAnimatedText(
                                    _response,
                                    textStyle: Fontstyle.f16w600,
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: Duration(milliseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextField(
                    controller: _controller,
                    color: Colors.black,
                    suffixIcon: BlocBuilder<ChangetextCubit, ChangetextState>(
                      builder: (context, state) {
                        if (state is ChangetextLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return IconButton(
                            onPressed: () => _askGemini(),
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.blueAccent,
                            ),
                          );
                        }
                      },
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
