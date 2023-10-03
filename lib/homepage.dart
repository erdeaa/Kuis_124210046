import 'package:flutter/material.dart';
import 'package:kuis/details.dart';
import 'package:kuis/data_buku.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Halaman Utama'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.5),
        child: GridView.builder(
          itemCount: listBuku.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
          itemBuilder: (context, index) {
            final DataBuku judul = listBuku[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details(judul: judul),));
              },
              child: Card(
                child: SizedBox(

                  child: Column(
                    children: [
                      SizedBox(
                          height: 150,
                          child: Container(
                            child: Image.network(
                              judul.imageLink,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      SizedBox(height: double.minPositive,),
                      Text(judul.title, textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}