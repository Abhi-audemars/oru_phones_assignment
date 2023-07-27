// import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_phones_assignment/utils/listing_service.dart';
import 'package:oru_phones_assignment/widgets/main_card.dart';
import 'package:oru_phones_assignment/widgets/top_brands_card.dart';
import 'package:oru_phones_assignment/widgets/custom_appbar.dart';
import 'package:oru_phones_assignment/models/products.dart';
import 'package:oru_phones_assignment/utils/bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListingsService listingsService = ListingsService();
  final List<Listing> _listings = [];
  int _currentPage = 1;
  final int _limit = 10;
  bool _isLoading = false;
  bool _isLoadingMore = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchData();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0 &&
        !_isLoadingMore) {
      
      _fetchData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _fetchData() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      try {
        final ListingsData res =
            await listingsService.fetchListings(_currentPage, _limit);
        final List<Listing> newItems = res.listings;
        if (newItems.isNotEmpty) {
          setState(() {
            _listings.addAll(newItems);
            _currentPage++;
          });
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        setState(() {
          _isLoading = false;
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            if (_scrollController.position.extentAfter == 0) {
              _fetchData();
            }
          }
          return true;
        },
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                'Buy Top Brands',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  TopBrands(image: 'assets/app1.png'),
                  TopBrands(image: 'assets/moto.png'),
                  TopBrands(image: 'assets/mi.png'),
                  TopBrands(image: 'assets/vivo.png'),
                  TopBrands(image: 'assets/one.png'),
                  TopBrands(image: 'assets/real.png'),
                ],
              ),
            ),
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/banner3.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/banner_web_2.png',
                  height: 200,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/banner_4.png',
                  height: 200,
                  fit: BoxFit.cover,
                )
              ],
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1,
                height: 200,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                'Shop By',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 115,
              child: ListView(
                itemExtent: 90,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  shopBy('assets/1.svg', 'Bestselling', 'Mobiles'),
                  shopBy('assets/2.svg', 'Verified', 'Devices Only'),
                  shopBy('assets/3.svg', 'Like new', 'Condition'),
                  shopBy('assets/4.svg', 'Phone with', 'Warranty'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Best Deals Near You',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'India',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                      onTap: () => bottomSheetShow(context),
                      child: const Icon(Icons.filter_list_sharp)),
                )
              ],
            ),
            SizedBox(
              // height: 200,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0, 
                    childAspectRatio: 0.64),
                controller: _scrollController,
                itemCount: _listings.length + 1,
                itemBuilder: (context, index) {
                  if (index < _listings.length) {
                    final Listing listing = _listings[index];
                    // String leadingImage = listing.images.isNotEmpty
                    //     ? listing.images[1].fullImage
                    //     : '';
                    return MainCard(
                        imageUrl: listing.defaultImage.fullImage,
                        modelName: listing.model,
                        price: listing.listingNumPrice.toString(),
                        size: listing.deviceRam,
                        condition: listing.deviceCondition,
                        city: listing.listingLocation,
                        uploadDate: listing.listingDate);
                  } else {
                    if (_isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column shopBy(String svgUrl, String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgUrl,
          height: 50,
          width: 50,
        ),
        Text(
          text1,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        Text(
          text2,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        )
      ],
    );
  }
}
