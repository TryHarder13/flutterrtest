import 'package:flutter/material.dart';

/*
* todo：如何响应点击/创建自定义widget/无状态和有状态widget之间的区别
* */

void main() {
  runApp(const MyApp());
}

/*
* 创建一个包含星型图标和计数的自定义widget，它们都是widget。
* 点击星型图标改变两个我i的沟通的状态，同一个widget应该同时管理着两个widget。
* */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/gridview/pic5.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            _titleSection(),
            buttonSection,
            _textSection(),
          ],
        ),
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
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
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
class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _FavoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if(_isFavorited) {
        _FavoriteCount -= 1;
        _isFavorited = false;
      } else{
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
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}