import 'package:flutter/material.dart';
import 'package:flutterrtest/common/widgets/navigator_bar.dart';
import 'package:flutterrtest/pages/talk/msg/msg_box.dart';
import 'package:flutterrtest/pages/talk/msg/receive_msg_box.dart';
import 'package:flutterrtest/pages/talk/msg/send_msg_box.dart';
import 'package:get/get.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({Key? key}) : super(key: key);

  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> with TickerProviderStateMixin {
  final List<MsgBox> _messages = [];
  final FocusNode _focusNode = FocusNode();
  final _textController = TextEditingController();
  bool _isComposing = false;
  bool _isSelf = true;

  @override
  void initState() {
    super.initState();
    _messages.insert(
        0,
        SendMsgBox(
            message: "你好。",
            animationController: _buildAnimationController()));
    _messages.insert(
        0,
        ReceiveMsgBox(
            message: "你好，最近怎么样？",
            animationController: _buildAnimationController()));
    _messages.insert(
        0,
        SendMsgBox(
            message: "我还好，你呢？",
            animationController: _buildAnimationController()));
    _messages.insert(
        0,
        ReceiveMsgBox(
            message: "我也还好",
            animationController: _buildAnimationController()));

    Future.delayed(Duration(milliseconds: 250), () {
      _focusNode.requestFocus();
      _messages.forEach((message) {
        message.animationController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigatorBar(
        title: "聊天室",
        closeCallBack: () {
          print("返回到首页");
          Get.back();
        },
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration:
                    const InputDecoration.collapsed(hintText: '发送信息'),
                focusNode: _focusNode,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                ))
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });

    var message = _isSelf
        ? SendMsgBox(
            message: text,
            animationController: _buildAnimationController(),
          )
        : ReceiveMsgBox(
            message: text,
            animationController: _buildAnimationController(),
          );

    setState(() {
      _messages.insert(0, message);
    });

    _focusNode.requestFocus();
    message.animationController.forward();

    _isSelf = !_isSelf;
  }

  AnimationController _buildAnimationController() {
    return AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }
}
