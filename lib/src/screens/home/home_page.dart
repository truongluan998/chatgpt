import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_dependencies.dart';
import '../../blocs/chat/chat_cubit.dart';
import '../../blocs/chat/chat_state.dart';
import '../../constants/app_constants.dart';
import '../../models/model_chatgpt/chat_model.dart';
import '../../routes/app_router.dart';
import '../../services/firebase/auth/auth_service.dart';
import '../../theme/app_color.dart';
import '../../theme/app_theme.dart';
import '../widgets/app_message_widget.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/avatar_chat_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final _authService = AppDependencies.injector.get<AuthService>();
  final _messageCubit = AppDependencies.injector.get<ChatCubit>();

  List<Message> _messages = [];
  String _userID = '';
  bool _isAnswered = true;

  bool _isLastMessageLeft(List<Message> messages, int index, String id) {
    if ((index > 0 && messages[index - 1].sender == id) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool _isLastMessageRight(List<Message> messages, int index, String id) {
    if ((index > 0 && messages[index - 1].sender != id) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _listScrollController.addListener(_scrollListener);
  }

  _scrollListener() async {
    var preventCall = false;

    if (_listScrollController.position.pixels == _listScrollController.position.maxScrollExtent) {
      if (!preventCall) {
        preventCall = true;
        await _messageCubit.loadMessages().then((_) => preventCall = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _messageCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'default_title_appbar'.tr(),
            style: textTheme.appBarTitle,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.router.push(const ProfileRoute());
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _authService.logout();
                context.router.replaceAll([const SignInRoute()]);
              },
            ),
          ],
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            state.maybeWhen(
              chatLoaded: (messages, id) {
                if (state is ChatLoaded) {
                  _messages = state.messages;
                  _userID = state.id;
                  if (_messages.isNotEmpty) {
                    if (_messages.first.sender == FirestoreConstants.botSender) {
                      _isAnswered = true;
                    }
                  }
                }
              },
              chatLoading: () => const Center(child: CircularProgressIndicator()),
              orElse: () {},
              chatError: (e) => _isAnswered = true,
            );
            return Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _listScrollController,
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      if (_messages[index].sender == _userID) {
                        // Right (my message)
                        return Padding(
                          padding: const EdgeInsets.only(right: DimensionConstants.size_20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppMessageWidget(
                                textColor: AppColor.whiteColor,
                                backgroundColor: AppColor.primaryColor,
                                content: _messages[index].text!,
                                checkCurrentUserChat: _isLastMessageRight(
                                  _messages,
                                  index,
                                  _userID,
                                ),
                                time: _messages[index].timestamp!,
                                timeColor: AppColor.whiteColor,
                              ),
                              AvatarChatWidget(
                                checkLastMessage: _isLastMessageRight(
                                  _messages,
                                  index,
                                  _userID,
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: DimensionConstants.size_10,
                            left: DimensionConstants.size_20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AvatarChatWidget(
                                checkLastMessage: _isLastMessageLeft(
                                  _messages,
                                  index,
                                  _userID,
                                ),
                              ),
                              AppMessageWidget(
                                backgroundColor: AppColor.whiteColor,
                                textColor: AppColor.textBlackColor,
                                content: _messages[index].text!,
                                time: _messages[index].timestamp!,
                                timeColor: AppColor.primaryColor,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: DimensionConstants.size_35,
                    left: DimensionConstants.size_20,
                    right: DimensionConstants.size_20,
                  ),
                  width: double.infinity,
                  height: DimensionConstants.size_50,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(
                      DimensionConstants.size_18,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          textColor: AppColor.whiteColor,
                          cursorColor: AppColor.whiteColor,
                          iconColor: AppColor.whiteColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(DimensionConstants.radius_40),
                            borderSide: const BorderSide(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          backgroundColor: AppColor.primaryColor,
                          elevation: DimensionConstants.size_0,
                          textEditingController: _textEditingController,
                          hintText: 'hint_text_input_chat_page'.tr(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: DimensionConstants.size_8),
                        child: IconButton(
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: DimensionConstants.durationMilliseconds_300),
                            transitionBuilder: (child, anim) => RotationTransition(
                              turns: child.key ==
                                      const ValueKey(
                                        AppConstants.keyValueIconOne,
                                      )
                                  ? Tween<double>(
                                      begin: DimensionConstants.rotationTransitionOffset_1,
                                      end: DimensionConstants.rotationTransitionOffset_0,
                                    ).animate(anim)
                                  : Tween<double>(
                                      begin: DimensionConstants.rotationTransitionOffset_0,
                                      end: DimensionConstants.rotationTransitionOffset_1,
                                    ).animate(anim),
                              child: FadeTransition(
                                opacity: anim,
                                child: child,
                              ),
                            ),
                            child: _isAnswered
                                ? const Icon(Icons.send, key: ValueKey(AppConstants.keyValueIconOne))
                                : const CircularProgressIndicator(
                                    color: AppColor.whiteColor,
                                    key: ValueKey(AppConstants.keyValueIconTwo),
                                  ),
                          ),
                          color: AppColor.whiteColor,
                          onPressed: () async {
                            if (_isAnswered) {
                              _isAnswered = false;
                              await _messageCubit.addMessage(_textEditingController.text);
                              _textEditingController.clear();
                              _scrollListener();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageCubit.close();
    _textEditingController.dispose();
    _listScrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _messageCubit.loadMessages(isLoadFirstTime: true);
    await _messageCubit.listenToMessages();
  }
}
