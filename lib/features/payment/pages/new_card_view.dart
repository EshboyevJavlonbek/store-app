import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:store_app/features/common/widgets/store_app_bar.dart';
import 'package:store_app/features/common/widgets/store_app_button.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final formKey = GlobalKey<FormState>();

  final cardController = MaskedCardController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  bool isFormValid = false;

  void _validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    setState(() {
      isFormValid = isValid;
    });
  }

  final cardMask = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final expiryMask = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  InputDecoration customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xff1A1A1A),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black, width: 1.2),
      ),
    );
  }

  @override
  void dispose() {
    cardController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "New Card",
        actions: [
          SvgPicture.asset("assets/icons/notification.svg"),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: const Divider(
            color: Color(0xffE6E6E6),
            thickness: 2,
            height: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          onChanged: _validateForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Debit or Credit Card",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1A1A1A),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Card number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 52,
                child: TextFormField(
                  controller: cardController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    cardMask,
                  ],
                  decoration: customInputDecoration("Enter your card number"),
                  validator: (value) {
                    final raw = value?.replaceAll(' ', '') ?? '';
                    if (raw.length != 16)
                      return "Karta raqami 16 ta raqamdan iborat bo‘lishi kerak";
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Expiry Date",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextFormField(
                            controller: expiryController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              expiryMask,
                            ],
                            decoration: customInputDecoration("MM/YY"),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Karta muddati kiriting';

                              final parts = value.split('/');
                              if (parts.length != 2) return 'Noto‘g‘ri format';

                              final month = int.tryParse(parts[0]);
                              final year = int.tryParse(parts[1]);

                              if (month == null || month < 1 || month > 12)
                                return 'Oy 01–12 bo‘lishi kerak';

                              final now = DateTime.now();
                              final currentYear =
                                  int.parse(now.year.toString().substring(2));
                              final currentMonth = now.month;

                              if (year == null ||
                                  (year == currentYear &&
                                      month < currentMonth) ||
                                  year < currentYear) {
                                return 'Yaroqsiz sana';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Security Code",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 52,
                          child: TextFormField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: customInputDecoration("CVV").copyWith(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SvgPicture.asset(
                                  'assets/icons/question_mark.svg',
                                  height: 16,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 3)
                                return "CVV noto‘g‘ri";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              StoreAppButton(
                text: "Add Card",
                containerColor: isFormValid ? Colors.black : Colors.grey.shade400,
                callback: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: SvgPicture.asset(
                          "assets/icons/dialog_success.svg",
                          height: 64,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 12),
                            const Text(
                              "Congratulations!",
                              style: TextStyle(
                                fontFamily: "General Sans",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Your new card has been added.",
                              style: TextStyle(
                                fontFamily: "General Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actionsPadding: const EdgeInsets.only(bottom: 16),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          StoreAppButton(
                            containerColor: Colors.black,
                            text: "Thanks",
                            containerWidth: 120,
                            callback: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaskedCardController extends TextEditingController {
  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final raw = text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < raw.length; i++) {
      if (i < raw.length - 4) {
        buffer.write('*');
      } else {
        buffer.write(raw[i]);
      }

      if ((i + 1) % 4 == 0 && i != raw.length - 1) {
        buffer.write(' ');
      }
    }

    return TextSpan(text: buffer.toString(), style: style);
  }
}
