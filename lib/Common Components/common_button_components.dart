
import 'package:flutter/material.dart';

class ButtonTypeCommonComponents {
  static Column defaultMaterialButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "Material Button",
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function(bool)? onFocusChange,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: onPressed,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          onHighlightChanged: onFocusChange,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: colorScheme.primary),
          ),
          color: colorScheme.primaryContainer,
          splashColor: colorScheme.secondary.withOpacity(0.2),
          highlightColor: colorScheme.primary.withOpacity(0.2),
          hoverColor: colorScheme.secondary.withOpacity(0.1),
          focusColor: colorScheme.primary.withOpacity(0.1),
          textColor: colorScheme.onPrimaryContainer,
          disabledColor: Colors.grey.shade300,
          disabledTextColor: Colors.grey,
          elevation: 4,
          focusElevation: 8,
          highlightElevation: 10,
          hoverElevation: 6,
          disabledElevation: 0,
          minWidth: 200,
          height: 50,
          animationDuration: const Duration(milliseconds: 200),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          enableFeedback: true,
          mouseCursor: SystemMouseCursors.click,
          colorBrightness: Theme.of(context).brightness,
          textTheme: ButtonTextTheme.primary,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }

  static Column defaultElevatedButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "Elevated Button",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    void Function(bool)? onFocusChange,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          onFocusChange: onFocusChange,
          onLongPress: onLongPress,
          onHover: onHover,
          statesController: statesController,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style: style ??
              ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  static Column defaultTextButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "Text Button",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    WidgetStatesController? statesController,
    bool? isSemanticButton = true,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style: style ??
              TextButton.styleFrom(
                foregroundColor: colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          statesController: statesController,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  static Column defaultOutlinedButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String text = "OutlinedButton",
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    WidgetStatesController? statesController,

    Color borderColor = Colors.blue,
    double borderWidth = 1.5,
    double borderRadius = 8.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
    Color? foregroundColor,
    Color? backgroundColor,
    WidgetStatePropertyAll? overlayColor,
    Color? shadowColor,
    WidgetStateProperty<OutlinedBorder>? customShape,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          statesController: statesController,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          style: style ??
              OutlinedButton.styleFrom(
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
                padding: padding,
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor,
                overlayColor: overlayColor?.resolve({}),
                shadowColor: shadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
          child: Text(text),
        ),
      ],
    );
  }


  static Column defaultFloatingActionButton(
    BuildContext context, {
    required VoidCallback onPressed,
    IconData icon = Icons.add,
    String extendedLabel = "Extended FAB",
    bool isExtended = false,
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 16,
    Color? shadowColor,
    Color? splashColor = Colors.white24,
    Color? hoverColor = Colors.white10,
    Color? focusColor = Colors.white30,
    double? elevation = 6.0,
    double? hoverElevation = 8.0,
    double? focusElevation = 6.0,
    double? highlightElevation = 12.0,
    double? disabledElevation = 0.0,
    ShapeBorder? shape,
    Object? heroTag,
    String? tooltip,
    FocusNode? focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    bool enableFeedback = true,
    Clip clipBehavior = Clip.antiAlias,
    EdgeInsetsGeometry extendedPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
    ),
    double extendedIconLabelSpacing = 8.0,
    TextStyle extendedTextStyle = const TextStyle(fontWeight: FontWeight.bold),
  }) {
    final ShapeBorder defaultShape =
        shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExtended
            ? FloatingActionButton.extended(
              onPressed: onPressed,
              label: Text(extendedLabel, style: extendedTextStyle),
              icon: Icon(icon),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              shape: defaultShape,
              heroTag: heroTag,
              tooltip: tooltip,
              focusNode: focusNode,
              autofocus: autofocus,
              elevation: elevation,
              hoverElevation: hoverElevation,
              focusElevation: focusElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              materialTapTargetSize: materialTapTargetSize,
              mouseCursor: mouseCursor,
              splashColor: splashColor,
              hoverColor: hoverColor,
              focusColor: focusColor,
              enableFeedback: enableFeedback,
              clipBehavior: clipBehavior,
              extendedPadding: extendedPadding,
              extendedIconLabelSpacing: extendedIconLabelSpacing,
            )
            : FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              shape: defaultShape,
              heroTag: heroTag,
              tooltip: tooltip,
              focusNode: focusNode,
              autofocus: autofocus,
              elevation: elevation,
              hoverElevation: hoverElevation,
              focusElevation: focusElevation,
              highlightElevation: highlightElevation,
              disabledElevation: disabledElevation,
              materialTapTargetSize: materialTapTargetSize,
              mouseCursor: mouseCursor,
              splashColor: splashColor,
              hoverColor: hoverColor,
              focusColor: focusColor,
              enableFeedback: enableFeedback,
              clipBehavior: clipBehavior,
              isExtended: isExtended,
              child: Icon(icon),
            ),
      ],
    );
  }

  static Column defaultIconButton(
    BuildContext context, {
    required VoidCallback onPressed,
    IconData icon = Icons.thumb_up,
    Color? iconColor,
    double iconSize = 24.0,
    double splashRadius = 20.0,
    double borderRadius = 12.0,
    String? tooltip,
    FocusNode? focusNode,
    bool autofocus = false,
    VisualDensity visualDensity = VisualDensity.compact,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
    AlignmentGeometry alignment = Alignment.center,
    bool? isSelected = false,
    Widget? selectedIcon,
    Color? hoverColor = Colors.blueAccent,
    Color? focusColor = Colors.blueAccent,
    Color? highlightColor = Colors.blueAccent,
    Color? splashColor = Colors.blueAccent,
    Color? disabledColor = Colors.grey,
    bool enableFeedback = true,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    BoxConstraints? constraints,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    ButtonStyle? style,
    ShapeBorder? shape,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          color: iconColor,
          splashRadius: splashRadius,
          tooltip: tooltip,
          padding: padding,
          alignment: alignment,
          visualDensity: visualDensity,
          focusNode: focusNode,
          autofocus: autofocus,
          isSelected: isSelected,
          selectedIcon: selectedIcon,
          hoverColor: hoverColor,
          focusColor: focusColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          enableFeedback: enableFeedback,
          mouseCursor: mouseCursor,
          constraints: constraints,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          style:
              style ??
              ButtonStyle(
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
        ),
      ],
    );
  }

  static Column defaultPopupMenuButton(
    BuildContext context, {
    required void Function(String) onSelected,
    String label = "PopupMenu",
    List<String> items = const ["Option 1", "Option 2"],
    Widget? child,
    Icon? icon,
    Color? iconColor,
    double iconSize = 24.0,
    Color? color,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    Color? shadowColor,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    Offset offset = Offset.zero,
    PopupMenuPosition position = PopupMenuPosition.over,
    TextStyle? style,
    double? elevation = 8.0,
    bool enabled = true,
    bool enableFeedback = true,
    String? tooltip,
    void Function()? onCanceled,
    void Function()? onOpened,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        PopupMenuButton<String>(
          onSelected: onSelected,
          itemBuilder: (BuildContext context) {
            return items
                .map((item) => PopupMenuItem(value: item, child: Text(item)))
                .toList();
          },
          icon: icon ?? Icon(Icons.more_vert),
          iconColor: iconColor,
          iconSize: iconSize,
          color: color,
          shape: shape,
          clipBehavior: clipBehavior,
          shadowColor: shadowColor,
          borderRadius: borderRadius,
          padding: padding ?? const EdgeInsets.all(8),
          offset: offset,
          position: position,
          // style: style,
          elevation: elevation,
          enabled: enabled,
          enableFeedback: enableFeedback,
          tooltip: tooltip,
          onCanceled: onCanceled,
          onOpened: onOpened,
          child: child,
        ),
      ],
    );
  }

  static Column defaultDropdownButton(
    BuildContext context, {
    required void Function(String?) onChanged,
    String label = "Dropdown",
    List<String> items = const ["Option 1", "Option 2"],
    String? value,
    AlignmentGeometry alignment = Alignment.centerLeft,
    bool autofocus = false,
    BorderRadius? borderRadius,
    Widget? disabledHint,
    Color? dropdownColor,
    int elevation = 8,
    bool enableFeedback = true,
    Color? focusColor,
    FocusNode? focusNode,
    Widget? hint,
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 24.0,
    bool isDense = false,
    bool isExpanded = true,
    double? itemHeight,
    double? menuMaxHeight,
    double? menuWidth,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    DropdownButtonBuilder? selectedItemBuilder,
    TextStyle? style,
    Widget? underline,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        DropdownButton<String>(
          alignment: alignment,
          autofocus: autofocus,
          borderRadius: borderRadius,
          disabledHint: disabledHint,
          dropdownColor: dropdownColor,
          elevation: elevation,
          enableFeedback: enableFeedback,
          focusColor: focusColor,
          focusNode: focusNode,
          hint: hint,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          menuMaxHeight: menuMaxHeight,
          menuWidth: menuWidth,
          onChanged: onChanged,
          onTap: onTap,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
          selectedItemBuilder: selectedItemBuilder,
          style: style,
          underline: underline,
          value: value ?? items.first,
        ),
      ],
    );
  }

  static Column defaultToggleButton(
    BuildContext context, {
    required void Function(int) onPressed,
    List<bool> isSelected = const [true, false],
    List<Widget> children = const [Text("A"), Text("B")],

    // Customization props
    double borderRadius = 8.0,
    double borderWidth = 1.5,
    Color? borderColor,
    Color? selectedBorderColor,
    Color? fillColor,
    Color? selectedColor,
    Color? color,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? focusColor,
    Color? disabledColor,
    Color? disabledBorderColor,
    List<FocusNode>? focusNodes,
    MouseCursor mouseCursor = SystemMouseCursors.click,
    BorderSide? side,
    BoxConstraints? constraints,
    TextStyle? textStyle,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Axis direction = Axis.horizontal,
    EdgeInsetsGeometry? padding,
    bool renderBorder = true,
    MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: isSelected,
          onPressed: onPressed,
          direction: direction,
          verticalDirection: verticalDirection,
          borderRadius: BorderRadius.circular(borderRadius),
          borderWidth: borderWidth,
          borderColor: borderColor ?? Theme.of(context).colorScheme.outline,
          selectedBorderColor:
              selectedBorderColor ?? Theme.of(context).colorScheme.primary,
          fillColor:
              fillColor ??
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          selectedColor: selectedColor ?? Theme.of(context).colorScheme.primary,
          color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
          splashColor: splashColor ?? Theme.of(context).splashColor,
          hoverColor: hoverColor ?? Theme.of(context).hoverColor,
          highlightColor: highlightColor ?? Theme.of(context).highlightColor,
          focusColor: focusColor ?? Theme.of(context).focusColor,
          disabledColor: disabledColor ?? Theme.of(context).disabledColor,
          disabledBorderColor:
              disabledBorderColor ?? Theme.of(context).disabledColor,
          renderBorder: renderBorder,
          textStyle: textStyle ?? const TextStyle(fontWeight: FontWeight.w600),
          focusNodes: focusNodes,
          constraints:
              constraints ?? const BoxConstraints(minHeight: 40, minWidth: 64),
          tapTargetSize: tapTargetSize,
          mouseCursor: mouseCursor,
          children: children,
        ),
      ],
    );
  }
}