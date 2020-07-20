import 'package:flutter/material.dart';
import 'package:fyf/src/models/recetaModel.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:url_launcher/url_launcher.dart';


class RecetaDetalle extends StatefulWidget {
  Receta receta;
  RecetaDetalle({@required this.receta});
  @override
  _RecetaDetalleState createState() => _RecetaDetalleState(receta);

}

class _RecetaDetalleState extends State<RecetaDetalle> {
  Receta receta;
  _RecetaDetalleState(this.receta);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context){
          return SliverFab(
            floatingPosition: FloatingPosition(right: 20.0), 
            floatingWidget: FloatingActionButton(
              backgroundColor: Color(0xFFF4C10F),
              child: Icon(Icons.info),
              onPressed: (){
                launch(receta.url); 
              }
            ),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 300.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    receta.label.length > 40
                    ? receta.label.substring(0,37) + "..."
                    : receta.label,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                              receta.image
                            ),
                            fit: BoxFit.fill                            
                          )                          
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4)
                          ),
                        ),
                      ),                      
                    ],
                  ),
                ),           
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(                    
                    [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'CALORIES',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              receta.calories.round().toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 15.0,),
                           
                          ],
                        ),
                      ),                      
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          'INGREDIENTS',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0
                          ),
                        ),
                      ),                      
                      SizedBox(height: 5.0,),    
                      Container(
                        height: 1000,
                        child: ListView.builder(                          
                          itemCount: receta.ingredientLines.length,                          
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.only(left: 10,),
                              child: Text(
                                receta.ingredientLines[index],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0
                                ),
                              ),
                            );
                          }
                        ),
                      )
                                                                                
                    ]
                  )
                ),
              ),       
            ],
          );
        }
      )
    );
  }

  Widget _renderIngredient(String string){
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(string),
      )
    );
  }
}