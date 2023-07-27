class ListingsData {
  String nextPage;
  String message;
  List<Listing> listings;

  ListingsData({
    required this.nextPage,
    required this.message,
    required this.listings,
  });

  factory ListingsData.fromJson(Map<String, dynamic> json) {
    return ListingsData(
      nextPage: json['nextPage'],
      message: json['message'],
      listings: List<Listing>.from(
          json['listings'].map((listing) => Listing.fromJson(listing))),
    );
  }
}

class Listing {
  String id;
  String deviceCondition;
  String listedBy;
  String deviceStorage;
  List<ImageData> images;
  ImageData defaultImage;
  String listingLocation;
  String make;
  String marketingName;
  String mobileNumber;
  String model;
  bool verified;
  String status;
  String listingDate;
  String deviceRam;
  String createdAt;
  String listingId;
  int listingNumPrice;
  String listingState;

  Listing({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingLocation,
    required this.make,
    required this.marketingName,
    required this.mobileNumber,
    required this.model,
    required this.verified,
    required this.status,
    required this.listingDate,
    required this.deviceRam,
    required this.createdAt,
    required this.listingId,
    required this.listingNumPrice,
    required this.listingState,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['_id'],
      deviceCondition: json['deviceCondition'],
      listedBy: json['listedBy'],
      deviceStorage: json['deviceStorage'],
      images: List<ImageData>.from(
          json['images'].map((image) => ImageData.fromJson(image))),
      defaultImage: ImageData.fromJson(json['defaultImage']),
      listingLocation: json['listingLocation'],
      make: json['make'],
      marketingName: json['marketingName'],
      mobileNumber: json['mobileNumber'],
      model: json['model'],
      verified: json['verified'],
      status: json['status'],
      listingDate: json['listingDate'],
      deviceRam: json['deviceRam'],
      createdAt: json['createdAt'],
      listingId: json['listingId'],
      listingNumPrice: json['listingNumPrice'],
      listingState: json['listingState'],
    );
  }
}

class ImageData {
  String fullImage;

  ImageData({required this.fullImage});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(fullImage: json['fullImage']);
  }
}
