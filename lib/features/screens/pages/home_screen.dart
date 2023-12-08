import 'package:fashion_ecommerce_app/features/models/get_all_products_model.dart';
import 'package:fashion_ecommerce_app/features/services/get_products_service.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GetAllProductsModel>? getAllProducts;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final ref = FirebaseDatabase.instance.ref('products');
    //  DatabaseReference ref = FirebaseDatabase.instance.ref();

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search categories',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                    future: GetProductsService().getProducts(),
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        return GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data[index]['image'],
                                            ),
                                          ),
                                        ),
                                        // child: Image.network(
                                        //   data[index]['image'],
                                        //   fit: BoxFit.contain,
                                        // ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        data[index]['title'],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        data[index]['category'],
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        "\$${data[index]['price'].toString()}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      return const Text('Something Went Wrong!!!');
                    }),

                // Expanded(
                //   child: GridView.builder(
                //       shrinkWrap: true,
                //       itemCount: products.length,
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //         //  mainAxisSpacing: 5,
                //         crossAxisSpacing: 10,
                //         crossAxisCount: 2,
                //       ),
                //       itemBuilder: (context, index) {
                //         final item = products[index];
                //         return Column(
                //           children: [
                //             Container(
                //               height: 100,
                //               width: 200,
                //               decoration: BoxDecoration(
                //                 color: Colors.blue,
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               child: Image.asset(item.image, fit: BoxFit.cover),
                //             ),
                //             Text(
                //               item.itemTitle,
                //               style: GoogleFonts.poppins(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             Text(
                //               item.itemDescription,
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //             Text(
                //               '\$${item.itemPrice}',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 20,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ],
                //         );
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
