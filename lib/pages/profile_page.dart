import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(context.read<ProfileRepository>())..load(),
      child: Scaffold(
        appBar: MajorPageAppBar(title: context.l10n.profilePageTitle),
        endDrawer: const SettingsDrawer(),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
        body: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, current) =>
              previous.status == ProfileStatus.loading,
          builder: (context, state) => state.status == ProfileStatus.loading
              ? const SizedBox.shrink()
              : _ProfileForm(initialProfile: state.profile),
        ),
      ),
    );
  }
}

class _ProfileForm extends StatefulWidget {
  const _ProfileForm({required this.initialProfile});

  final Profile initialProfile;

  @override
  State<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _focusNodes = {
    for (final field in ProfileField.values) field: FocusNode(),
  };
  late final _controllers = {
    for (final field in ProfileField.values)
      field: TextEditingController(
        text: field.read(widget.initialProfile).toString(),
      ),
  };

  @override
  void dispose() {
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<ProfileCubit>();
    await cubit.save({
      for (final MapEntry(key: field, value: controller)
          in _controllers.entries)
        field: controller.text,
    });
    if (cubit.state.status == ProfileStatus.saved && mounted) {
      context.go(AppRoutes.today);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _scrollableForm(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              onPressed: _save,
              child: Text(context.l10n.profilePageButtonSideActionsSaveButton),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _scrollableForm() {
    final labels = [
      context.l10n.profilePageLabels0,
      context.l10n.profilePageLabels1,
      context.l10n.profilePageLabels2,
      context.l10n.profilePageLabels3,
      context.l10n.profilePageLabels4,
      context.l10n.profilePageLabels5,
      context.l10n.profilePageLabels6,
      context.l10n.profilePageLabels7,
    ];
    const borderRadius = BorderRadius.all(Radius.circular(12));
    final borderSide = BorderSide(color: Colors.green.shade500, width: 1.5);

    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (final field in ProfileField.values)
                Column(
                  children: [
                    heightSpacer(12),
                    TextFormField(
                      controller: _controllers[field],
                      focusNode: _focusNodes[field],
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: (value) =>
                          ProfileField.parse(value ?? '') == null
                          ? context.l10n.profilePageInvalidNumber
                          : null,
                      onFieldSubmitted: (_) {
                        if (field != ProfileField.values.last) {
                          _focusNodes[ProfileField.values[field.index + 1]]!
                              .requestFocus();
                        } else {
                          _formKey.currentState!.validate();
                        }
                      },
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        labelText: labels[field.index],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: borderRadius,
                          borderSide: borderSide,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: borderRadius,
                          borderSide: borderSide.copyWith(width: 2.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: borderRadius,
                          borderSide: borderSide,
                        ),
                      ),
                    ),
                    heightSpacer(12),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
