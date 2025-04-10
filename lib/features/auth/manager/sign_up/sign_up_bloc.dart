// import 'dart:ui';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/features/auth/manager/sign_up/sign_up_state.dart';
//
// import '../../../../core/utils/colors.dart';
// import '../../../../data/repository/auth_repository.dart';
//
// part 'sign_up_events.dart';
//
// class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
//   final AuthRepository _repo;
//
//   SignUpBloc({required AuthRepository repo}) :_repo = repo, super(SignUpState.initial()) {
//     on<SignUpRequested>(_onSignUpRequested);
//   }
//
//   Future<void> _onSignUpRequested(
//       SignUpRequested event, Emitter<SignUpState> emit) async {
//     emit(SignUpState.loading());
//
//     try {
//       final success = await _repo.signUp(
//         fullName: event.fullName,
//         email: event.email,
//         password: event.password,
//       );
//
//       if (success) {
//         emit(SignUpState.success());
//       } else {
//         emit(SignUpState.error("Sign up failed, please try again."));
//       }
//     } catch (e) {
//       emit(SignUpState.error(e.toString()));
//     }
//   }
//
//   bool? fullNameValid, emailValid, passwordValid;
//
//   Color getBackgroundColor() {
//     if (fullNameValid == null || emailValid == null || passwordValid == null) {
//       return AppColors.greySub;
//     }
//     if (!fullNameValid! || !emailValid! || !passwordValid!) {
//       return AppColors.greySub;
//     }
//     return AppColors.blackMain;
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/notification.svg', height: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Search bar
            Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    // Search icon inside TextField
                    SvgPicture.asset('assets/icons/search.svg', height: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for clothes...',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Microphone icon inside TextField
                    SvgPicture.asset('assets/icons/microphone.svg', height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ListView to show the results
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/splash.png',
                        width: 56,
                        height: 54,
                      ),
                      const SizedBox(width: 8),
                      const Text("Clothes Item 1"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/splash.png',
                        width: 56,
                        height: 54,
                      ),
                      const SizedBox(width: 8),
                      const Text("Clothes Item 2"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/splash.png',
                        width: 56,
                        height: 54,
                      ),
                      const SizedBox(width: 8),
                      const Text("Clothes Item 3"),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
