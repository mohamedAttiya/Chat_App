// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_states.dart';
class AuthCubit extends Cubit<AuthStates>
{
  AuthCubit():super(InitialState());
  static AuthCubit get(context)=>BlocProvider.of(context);
  bool isPassword = false;
  int currentIndex = 0;
  bool? termsAndConditionCheckBoxValue = false;
  Icon suffix = const Icon(Icons.visibility_outlined,color:Colors.grey,);
  void changeVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? const Icon(Icons.visibility_off_outlined,color:Colors.grey,) : const Icon(Icons.visibility_outlined,color:Colors.grey,);
    emit(ChangeIconState());
  }
  Future<void> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String firstName,
    required String lastName,
}) async
  {
    try {
      emit(LoadingCreateUserWithEmailAndPassword());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await addUserProfile(firstName:firstName,lastName:lastName,emailAddress: emailAddress);
      await verifyEmail();
      emit(SuccessCreateUserWithEmailAndPassword());
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(ErrorCreateUserWithEmailAndPassword('The password provided is too weak.'));
      } else if (error.code == 'email-already-in-use') {
        emit(ErrorCreateUserWithEmailAndPassword('The account already exists for that email.'));
      }
      else if (error.code == 'invalid-email') {
        emit(ErrorCreateUserWithEmailAndPassword('The Email is already invalid.'));
      }
      else
      {
        emit(ErrorCreateUserWithEmailAndPassword(error.code));
      }
    } catch (error) {
      emit(ErrorCreateUserWithEmailAndPassword(error.toString()));
      print(error);
    }
  }
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
}) async
  {
    try {
      emit(LoadingCreateUserWithEmailAndPassword());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      emit(SuccessCreateUserWithEmailAndPassword());
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        emit(ErrorCreateUserWithEmailAndPassword('No user found for that email.'));
      } else if (error.code == 'wrong-password') {
        emit(ErrorCreateUserWithEmailAndPassword('Wrong password provided for that user.'));
      }
      else
      {
        emit(ErrorCreateUserWithEmailAndPassword('Check Your Email And Password!.'));
      }
    } catch(error)
    {
      emit(ErrorCreateUserWithEmailAndPassword(error.toString()));
    }
  }
  void updateTermsAndConditionCheckBox({required newValue})
  {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
  Future<void> verifyEmail() async
  {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }
  Future<void> resetPasswordWithLink({
    required String email,
}) async
  {
    emit(LoadingForgetPasswordState());
    await FirebaseAuth.instance.sendPasswordResetEmail(email:email).then((value)
    {
      emit(SuccessForgetPasswordState());
    }).catchError((error)
    {
      emit(ErrorForgetPasswordState(error.toString()));
    });
  }
  Future<void> addUserProfile({
    required String firstName,
    required String lastName,
    required String emailAddress,
}) async
  {
    await FirebaseFirestore.instance.collection('users').add({
      'first_name':firstName,
      'last_name':lastName,
      'email':emailAddress,
    });
  }
  void changeBotNav(int index)
  {
    currentIndex = index;
    emit(BottomNavigationBarState());
  }
}