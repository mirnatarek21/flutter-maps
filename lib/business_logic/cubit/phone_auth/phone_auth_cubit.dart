import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationID;
  PhoneAuthCubit() : super(PhoneAuthCubitInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  //for automatic read of otp
  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verification completed');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('Verification failed: ${error.toString()}');
    emit(ErrorOccured(errorMessage: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('Code sent');
    this.verificationID = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  //function for submiting otp ourselves not automatically read by device
  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationID, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(ErrorOccured(errorMessage: error.toString()));
    }
  }

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }

  User getLogedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
