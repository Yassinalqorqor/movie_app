
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/api_service.dart';

import '../../core/app_constats.dart';

class Nowplayingwidget extends StatelessWidget {
  const Nowplayingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: FutureBuilder(
          future: ApiService.getnowplaying(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.separated(

              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              separatorBuilder: (context,index){

                return const SizedBox(width: 5,);

              },
              itemBuilder: (context,index){
                return Stack(
                  alignment:Alignment.bottomCenter ,
                  children: [
                    if(snapshot.data![index].image!=null)
                    Image.network(  "${AppConstant.baseImage}${snapshot.data![index].image}"  ,
                      height:400 ,fit:BoxFit.fill , width: 450,),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.end,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.circle,color: Colors.red,size: 15,),
                            const SizedBox(
                              width: 3,
                            ),
                            Text("now paying".toUpperCase(),style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400
                                ,fontSize: 18
                            ),)
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(snapshot.data![index].title!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                          ),
                        )
                      ],
                    )
                  ],
                );
              },

            );
            }else if(snapshot.connectionState ==ConnectionState.waiting){

              return const Center(child: CircularProgressIndicator());

            }else{
          return   const Center(child: Text('error'));
            }

          },



              ),

        );
  }
}
