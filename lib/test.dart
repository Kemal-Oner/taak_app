return new Image.asset('assets/images/'+ widget.category.categoryName + '_' + snapshot.data[index].ned + '.jpg', fit: BoxFit.none,);


return new SizedBox(
child: new Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
// ignore: missing_return
new SizedBox(
child:  new Container(
child: new Image.asset('assets/images/'+ widget.category.categoryName + '_' + snapshot.data[index].ned + '.jpg', fit: BoxFit.none,),
),
),
new Padding(padding: new EdgeInsets.only(top:6.0),child: new Text(snapshot.data[index].ned),)
],
),
);