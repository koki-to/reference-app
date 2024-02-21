import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicFormField extends ConsumerStatefulWidget {
  const BasicFormField({
    required this.onChanged,
    required this.validator,
    required this.hintText,
    this.initialValue,
    super.key,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? initialValue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasicFormFieldState();
}

class _BasicFormFieldState extends ConsumerState<BasicFormField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
