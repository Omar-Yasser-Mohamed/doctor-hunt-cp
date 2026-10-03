# Doctor Hunt Architecture & Coding Guidelines

## Responsive Sizing (`flutter_screenutil`)
- Design Base: `Size(375, 812)`
- Use `.w` for widths and horizontal padding/margins (`20.w`, `52.w`).
- Use `.h` for heights and vertical dimensions (`28.h`, `54.h`).
- Use `.r` for border radius (`12.r`).
- Spacing: Always use `num.height` and `num.width` from `package:doctor_hunt/app/core/extensions/sized_box_extentions.dart` (e.g. `14.height`, `10.width`). NEVER use `SizedBox(height: ...)` or `SizedBox(width: ...)`.
- Screen metrics: Use `context.topPadding`, `context.bottomPadding`, `context.screenWidth`, `context.screenHeight` from `context_extentions.dart`.

## Colors (`AppColors`)
- Always use colors from `package:doctor_hunt/app/core/theme/app_colors.dart`.
- NEVER use hardcoded colors (`Color(0xFF...)` or `Colors.*`).
- Use `AppColors.primary`, `AppColors.textMain`, `AppColors.textSub`, `AppColors.border`, `AppColors.white`, etc.
- Use `color.withValues(alpha: ...)` for transparency.

## Text Styles (`AppTextStyles`)
- Always use the generated `BuildContext` extensions: `context.<weight><size><ColorName>` (e.g., `context.regular12TextSub`, `context.medium16TextMain`, `context.bold18TextMain`, `context.bold24White`).
- NEVER write manual `TextStyle(...)`.
- Use `.copyWith(...)` on top of context extensions when custom overrides (e.g. fontSize or decoration) are strictly necessary.

## Widget Architecture & Decomposition
- Screens (`<feature>_screen.dart`): Only setup the scaffold, floating action buttons, app bars, and delegate the body to `<feature>_screen_body.dart`.
- Bodies (`<feature>_screen_body.dart`): Assemble the layout using modular components.
- Modular widgets: Break every distinct section, card, list, header, search bar, and empty state into its own file in `presentation/widgets/`.

## Reusable Core Widgets
Always reuse components from `package:doctor_hunt/app/core/widgets/`:
- `AppButton` & `AppOutlineButton`
- `AppTextField`
- `AppBackButton`
- `AdminScaffold` & `PatientScaffold`
- `DynamicRatingStars`
- `ProfileImage`

## Localization & Assets
- Use Slang translations: `t.<key>` from `package:doctor_hunt/generated/translations.g.dart`.
- Images & Icons: `AppImages.*` and `AppIcons.*` from `package:doctor_hunt/app/core/utils/`.
- Routes: Type-safe GoRouter routes from `package:doctor_hunt/app/core/routing/app_routes.dart`.
