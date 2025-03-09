import 'package:bookly/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/connectivity_service.dart';
import '../../../../../core/widgets/custom_alert_dialog_widget.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _searchTextController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    _searchTextController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    bool isConnected = await ConnectivityService.checkConnection();
    if (!isConnected) {
      _searchTextController.clear();
      showDialog(
        context: context,
        builder: (context) => const AlertDialogWidget(
          content: 'No internet connection. Please check your network.',
        ),
      );
    } else {
      String query = _searchTextController.text.trim();
      if (query.isNotEmpty) {
        context.read<SearchCubit>().fetchSearchBooks(query: query);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SearchBarWidget(
        controller: _searchTextController,
        focusNode: _focusNode,
        onChanged: (value) async {
          bool isConnected = await ConnectivityService.checkConnection();
          if (isConnected && value.trim().isNotEmpty) {
            _performSearch();
          } else if (!isConnected) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialogWidget(
                content: 'No internet connection. Please check your network.',
              ),
            );
          }
        },
        onClear: () {
          _searchTextController.clear();
          _focusNode.unfocus();
          context.read<SearchCubit>().clearSearch();
        },
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
