import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _customerIdNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obsure = ValueNotifier(true);

  @override
  void dispose() {
    _customerIdNode.dispose();
    _userNameNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  //tự động nhảy vào trường nhập tiếp theo
  void _nextRequest(FocusNode? next) {
    _customerIdNode.unfocus();
    _userNameNode.unfocus();
    _passwordNode.unfocus();

    if (next == null) {
      _handleSignIn();
    } else {
      next.requestFocus();
    }

    setState(() {});
  }

//hàm xử lý đăng nhập, không trường nào trống và xác định được danh tính
  void _handleSignIn() async {
    if (_formKey.currentState!.validate() &&
        _customerIdController.text.isNotEmpty &&
        _userNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      context.read<SignInBloc>().add(
            SignInSubmit(
              tenantCode: _customerIdController.text,
              username: _userNameController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  //SET FOCUS khi ấn, tại dùng node.hasFocus để xác định màu của suffixicon
  void _handleTap(FocusNode node, bool focus) {
    if (focus) {
      node.requestFocus();
    } else {
      node.unfocus();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
