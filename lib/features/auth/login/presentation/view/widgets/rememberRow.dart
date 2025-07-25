import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/core/widgets/gradientText.dart';
import 'package:resturant_app/features/auth/forgetPass/presentation/view/forgetPassView.dart';
import 'package:resturant_app/features/auth/login/presentation/cubit/checkbox_cubit.dart'
    show CheckboxCubit, CheckboxState, CheckBox;

class RememberRow extends StatefulWidget {
  const RememberRow({super.key});

  @override
  State<RememberRow> createState() => _RememberRowState();
}

class _RememberRowState extends State<RememberRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          BlocBuilder<CheckboxCubit, CheckboxState>(
            builder: (context, state) {
              return Checkbox(
                value: state is CheckBox ? state.isChecked : false,
                onChanged: (value) {
                  BlocProvider.of<CheckboxCubit>(
                    context,
                  ).changeBoxState(isChecked: value!);
                },
              );
            },
          ),
          const SizedBox(width: 3),
          Text(LangKeys.rememberMe.tr, style: Fontstyle.f15w400w),
          const Spacer(),
          InkWell(
            onTap: () {
              context.getNavigateTo(child: const Forgetpassview());
            },
            child: const GradientText(
              text: LangKeys.forgetPass,
              gradient: const LinearGradient(
                colors: [Colors.tealAccent, Colors.blueAccent],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
