
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/app_constats.dart';
import '../models/movies_model.dart';

class CustonSharedListView extends StatelessWidget {
  const CustonSharedListView({super.key, required this.futurelist});
final Future<List<MoviesModel>> futurelist;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurelist,
      builder: (context,snapshot) {

        if(snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              var item=snapshot.data![index];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade800,
                ),
                child: Row(
                  children: [
                    if(item.image!=null)
                    Image.network('${AppConstant.baseImage}${item.image}'
                      , height: 120,width: 100,fit:BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title!, style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 21,
                                padding: EdgeInsets.symmetric(horizontal: 7),
                                child: Center(
                                  child: Text(item.ratingCount!.toString(),
                                    style: TextStyle(

                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                decoration:BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5)
                                ) ,
                              ),
                              SizedBox(width: 15,),
                              const Icon(Icons.star,
                                size: 15,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 5,),
                              Text(item.ratingAverege.toString(),
                                style: const TextStyle(

                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(item.description!,
                            maxLines:2 ,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              // fontSize: 18,
                            ),),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder:  (context,index){
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 20);
        }
        else if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(child:  CircularProgressIndicator());
        }else{
         return const Center(child: Text('error'));
        }
      },
    );
  }
}
