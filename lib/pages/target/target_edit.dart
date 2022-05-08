import 'package:flutter/material.dart';
import 'package:flutterrtest/common/config.dart';
import 'package:flutterrtest/models/target.dart';

enum TaskEditPageEnterType {
  TaskEditPageEnterType_New,
  TaskEditPageEnterType_Type,
}

class TargetEditPage extends StatefulWidget {
  TargetEditPage(this.target,
      {this.enterType = TaskEditPageEnterType.TaskEditPageEnterType_New});

  final Target target;
  final TaskEditPageEnterType enterType;

  @override
  State<StatefulWidget> createState() {
    return _TargetEditPageState();
  }
}

class _TargetEditPageState extends State<TargetEditPage> {
  TextEditingController textEditingController = TextEditingController()
    ..addListener(() {});

  FocusNode focusNode = FocusNode();

  int? targetDays;
  Color? targetColor;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '电话'),
        _buildButtonColumn(color, Icons.near_me, '路线'),
        _buildButtonColumn(color, Icons.share, '分享'),
      ],
    );

    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/images/publicimage.png',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          _titleSection(),
          buttonSection,
          _textSection(),
        ],
      ),
    );
  }
}

Widget _titleSection() {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          /*
              * 将Column元素放到Expanded widget中可以拉伸该列，以利用该行中所有剩余的闲置空间
              * 设置crossAxisAlignment属性值位CrossAxisAlignment.start，这会将该列放置在行的起始位置
              * */
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //将文本放入到Container容器可以增加内间距
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  '你有见过我的猫嘛',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '孙成龙',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        //红色心形图标和文字41。整行都在一个Container容器布局中。每条边都有32像素的内间距。
        // Icon(
        //   Icons.star,
        //   color: Colors.red[500],
        // ),
        // const Text('41'),
        const FavoriteWidget(),
      ],
    ),
  );
}

//FavoritWidget类管理自己的状态，因此它通过重写createState()来创建状态对象。
//框架会在构建widget时调用createState().

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

//以下划线开头的成员或类是私有的
//_FavoriteWidgetState类存储可变信息；可以在widget的生命周期内改变逻辑和内部状态。
//状态对象也定义了build()方法，创建一个红色IconButton和Text的行。具有OnPressed属性，该属性定义了处理点击的回调方法
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _FavoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _FavoriteCount -= 1;
        _isFavorited = false;
      } else {
        _FavoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_FavoriteCount'),
          ),
        )
      ],
    );
  }
}
//当Text在40和41之间变化时，将文本放在SizedBox中并设置其宽度可放置出现明显的跳跃，因为这些值具有不同的宽度。

Widget _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

Widget _textSection() {
  return const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      '猫舌表面非常粗糙，这是因为猫舌表面有许多独特的乳头状突出物，它们在猫咪身上扮演着重要角色。'
      '此外，倒钩法还能去除松散的毛发和死皮，从而帮助猫梳理毛发。 '
      '猫咪立式反射是一种令人羡慕的能力，当猫咪摔倒时，它可以调整自己的方向，用脚着地。 '
      '尽管运动物理已经超出了我所知的范围，但是我还是认为它是角动量、惯性和快速运动能力的奇迹。'
      '由于猫的物种进化历史，一只健康的猫的肾脏会产生浓缩程度不高的尿液。 ',
      softWrap: true,
    ),
  );
}
