import 'package:flutter/material.dart';
import '../utils/light_theme.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchController,
    this.onChanged,
    this.searchClear,
    required this.searchValue,
  });

  final TextEditingController searchController;
  final void Function(String)? onChanged;
  final void Function()? searchClear;
  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffB0D3CF),
        hintText: 'بحث ...',
        prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor),
        suffixIcon: Visibility(
          visible: searchValue != '' || searchValue.isNotEmpty,
          child: IconButton(
            icon:
                const Icon(Icons.close_rounded, color: AppColors.primaryColor),
            onPressed: searchClear,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
