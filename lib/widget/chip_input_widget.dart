import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:vyapar_party_app/widget/text_caret_widget.dart';

typedef ChipsInputSuggestions<T> = Future<List<T>> Function(String query);
typedef ChipSelected<T> = void Function(T data, bool selected);
typedef ChipsBuilder<T> = Widget Function(BuildContext context, ChipsInputState<T> state, T data);

class ChipsInput<T> extends StatefulWidget {
  ChipsInput({
    Key? key,
    this.function,
    this.decoration = const InputDecoration(),
    @required this.chipBuilder,
    @required this.suggestionBuilder,
    @required this.findSuggestions,
    @required this.onChanged,
    this.onChipTapped,
    this.focusNode,
  }) : super(key: key);

  final InputDecoration? decoration;
  final ChipsInputSuggestions? findSuggestions;
  final ValueChanged<List<T>>? onChanged;
  FocusNode? focusNode;
  Function? function;
  final ValueChanged<T>? onChipTapped;
  final ChipsBuilder<T>? chipBuilder;
  final ChipsBuilder<T>? suggestionBuilder;

  @override
  ChipsInputState<T> createState() => ChipsInputState<T>();
}

class ChipsInputState<T> extends State<ChipsInput<T>> implements TextInputClient {
  static const kObjectReplacementChar = 0xFFFC;

  Set<T> _chips = Set<T>();
  List? _suggestions;
  int _searchId = 0;

 
  TextEditingValue _value = TextEditingValue();
  TextInputConnection? _connection;

  String get text {
    return String.fromCharCodes(
      _value.text.codeUnits.where((ch) => ch != kObjectReplacementChar),
    );
  }

  @override
  TextEditingValue get currentTextEditingValue => _value;

  bool get _hasInputConnection => _connection != null && _connection!.attached;

  void requestKeyboard() {
    if (widget.focusNode!.hasFocus) {
      _openInputConnection();
    } else {
      FocusScope.of(context).requestFocus(widget.focusNode);
    }
  }

  void selectSuggestion(T data) {
    setState(() {
      _chips.add(data);
      _updateTextInputState();
      _suggestions = null;
    });
    widget.onChanged!(_chips.toList(growable: false));
  }

  void deleteChip(T data) {
    setState(() {
      _chips.remove(data);
      _updateTextInputState();
    });
    widget.onChanged!(_chips.toList(growable: false));
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode = FocusNode();
    widget.focusNode!.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (widget.focusNode!.hasFocus) {
      _openInputConnection();
    } else {
      _closeInputConnectionIfNeeded();
    }
    setState(() {
      // rebuild so that _TextCursor is hidden.
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    _closeInputConnectionIfNeeded();
    super.dispose();
  }

  void _openInputConnection() {
    if (!_hasInputConnection) {
      _connection = TextInput.attach(this, TextInputConfiguration());
      _connection!.setEditingState(_value);
    }
    _connection!.show();
  }

  void _closeInputConnectionIfNeeded() {
    if (_hasInputConnection) {
      _connection!.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    var chipsChildren = _chips
        .map<Widget>(
          (data) => widget.chipBuilder!(context, this, data),
        )
        .toList();

    final theme = Theme.of(context);

    chipsChildren.add(
      Container(
        height: 32.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              text,
              style: theme.textTheme.headline6!.copyWith(
                height: 1.5,
              ),
            ),
            TextCaret(
              resumed: widget.focusNode!.hasFocus,
            ),
          ],
        ),
      ),
    );

    return Container(
      height: 70.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: requestKeyboard,
            child: InputDecorator(
              decoration: widget.decoration!,
              isFocused: widget.focusNode!.hasFocus,
              isEmpty: _value.text.length == 0,
              child: Wrap(
                children: chipsChildren,
                spacing: 4.0,
                runSpacing: 4.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return widget.suggestionBuilder!(context, this, _suggestions![index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void updateEditingValue(TextEditingValue value) {
    final oldCount = _countReplacements(_value);
    final newCount = _countReplacements(value);
    setState(() {
      if (newCount < oldCount) {
        _chips = Set.from(_chips.take(newCount));
      }
      _value = value;
    });
    _onSearchChanged(text);
  }

  int _countReplacements(TextEditingValue value) {
    return value.text.codeUnits.where((ch) => ch == kObjectReplacementChar).length;
  }

  @override
  void updateFloatingCursor(RawFloatingCursorPoint point) {
    // Not required
  }

  @override
  void connectionClosed() {
    print("ca;;ed");
    widget.focusNode!.unfocus();
  }

  @override
  void performAction(TextInputAction action) {
    widget.function!();
  }

  void _updateTextInputState() {
    final text = String.fromCharCodes(_chips.map((_) => kObjectReplacementChar));
    _value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange(start: 0, end: text.length),
    );
    _connection!.setEditingState(_value);
  }

  void _onSearchChanged(String value) async {
    final localId = ++_searchId;
    final results = await widget.findSuggestions!(value);
    if (_searchId == localId && mounted) {
      setState(() => _suggestions = results.where((profile) => !_chips.contains(profile)).toList(growable: false));
    }
  }

  @override
  // TODO: implement currentAutofillScope
  AutofillScope? get currentAutofillScope => throw UnimplementedError();

  @override
  void performPrivateCommand(String action, Map<String, dynamic> data) {
    // TODO: implement performPrivateCommand
  }

  @override
  void showAutocorrectionPromptRect(int start, int end) {
    // TODO: implement showAutocorrectionPromptRect
  }
}