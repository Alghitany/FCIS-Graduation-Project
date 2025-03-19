import 'package:flutter/material.dart';
import 'package:project/view/DeveloperExplorCategoryDetailsScreen/developer_explor_category_details_screen.dart';
import 'package:project/widgets/Shared/shared_back_arrow.dart';

class DeveloperExplorAllCategoriesScreen extends StatelessWidget {
  const DeveloperExplorAllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    /// **Define a list of categories**
    List<CategoryModel> categories = [
      CategoryModel(
        job: 'UI/UX Designer',
        location: 'Mansora, Tanta, 18 more',
        positionNumbers: 30,
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeveloperExplorCategoryDetailsScreen();
            },
          ));
        },
      ),
      CategoryModel(
        job: ' Front-end',
        location: 'Mansora, Tanta, 18 more',
        positionNumbers: 60,
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeveloperExplorCategoryDetailsScreen();
            },
          ));
        },
      ),
      CategoryModel(
        job: 'Flutter Developer',
        location: 'Mansora, Tanta, 18 more',
        positionNumbers: 50,
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeveloperExplorCategoryDetailsScreen();
            },
          ));
        },
      ),
      CategoryModel(
        job: ' Backend Engineer',
        location: 'Mansora, Tanta, 18 more',
        positionNumbers: 40,
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeveloperExplorCategoryDetailsScreen();
            },
          ));
        },
      ),
      CategoryModel(
        job: 'Cyber Security',
        location: 'Mansora, Tanta, 18 more',
        positionNumbers: 50,
        ontap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DeveloperExplorCategoryDetailsScreen();
            },
          ));
        },
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: sharedBackArrow(screenWidth, context),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "All Categories",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  hintText: "Search for job",
                  prefixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffCCCCCC)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 8),

            /// **Build the CategoryContainer list dynamically**
            ListView.builder(
              shrinkWrap: true, // Important for SingleChildScrollView
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryContainer(categoryModel: categories[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// **Category Model**
class CategoryModel {
  final String job;
  final String location;
  final int positionNumbers;
  VoidCallback ontap;
  CategoryModel({
    required this.ontap,
    required this.job,
    required this.location,
    required this.positionNumbers,
  });
}

/// **Category Container Widget**
class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: categoryModel.ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        margin: EdgeInsets.only(top: 16),
        height: 109,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryModel.job,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              categoryModel.location,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${categoryModel.positionNumbers}',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff465697)),
                ),
                Text(
                  ' Positions',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
