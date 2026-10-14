import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedWodeBanner: false,
      title: 'BD Business VIP',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const BDBusinessHome(),
    );
  }
}

class BDBusinessHome extends StatefulWidget {
  const BDBusinessHome({Key? key}) : super(key: key);
  @override
  State<BDBusinessHome> createState() => _BDBusinessHomeState();
}

class _BDBusinessHomeState extends State<BDBusinessHome> {
  // ১. আপনার ড্রপডাউনের নির্দিষ্ট ডেমো লিস্ট সমূহ
  final List<String> districts = ['বগুড়া', 'টাঙ্গাইল', 'যশোর', 'রাজশাহী', 'ঢাকা'];
  final List<String> upazilas = ['উপজেলা ১', 'উপজেলা ২', 'উপজেলা ৩'];
  final List<String> unions = ['ইউনিয়ন ১', 'ইউনিয়ন ২', 'ইউনিয়ন ৩'];
  
  // আপনার দেওয়া নির্দিষ্ট ফসলের ড্রপডাউন লিস্ট
  final List<String> cropsList = [
    'ধান-বি আর ২৯', 'ধান-বি আর ২৮', 'ধান-কাটারি ভোগ', 
    'পাট-তোষা', 'পাট-দেশি সুতি', 'গম', 'ভুট্টা', 'তিল', 
    'সরিষা', 'চিনা বাদাম', 'পিঁয়াজ', 'রসুন', 'হলুদ', 'আদা', 'मরিচ'
  ];

  // ২. দৈনিক বাজার দর অনুসন্ধানের ভ্যারিয়েবল সমূহ
  String? searchDistrict;
  String? searchUpazila;
  String? searchUnion;
  String? searchCrop;
  String marketPriceResult = "ইউজার এখানে জেলা, উপজেলা, ফসল মেনু থেকে সিলেক্ট করলে দেখতে পাবে বাজার দর";

  // ৩. সদস্য নিবন্ধন ফরমের ভ্যারিয়েবল ও কন্ট্রোলার সমূহ
  String? regUserType = 'বিক্রেতা-(কৃষক,পাইকার,মহাজন)';
  String? regDistrict;
  String? regUpazila;
  String? regUnion;
  String? regCrop;
  bool isOtpSent = false;
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController marketController = TextEditingController();
  final TextEditingController searchMarketController = TextEditingController();
  final TextEditingController regOtherCropController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // ৪. চাহিদার বোর্ডের ভ্যারিয়েবল (যা ফরম হতে অটো আসবে)
  String boardUserType = 'বিক্রেতা';
  String boardName = 'শরিফ আহমেদ';
  String boardPhone = '01700000000';
  String boardAddress = 'বগুড়া, উপজেলা ১, ইউনিয়ন ২, গ্রাম: চকপাড়া, মোকাম: সেন্ট্রাল বাজার';
  String boardCropInfo = 'ধান-বি আর ২৯ (৫০ মণ)';

  void _showSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('বিডি বিজনেস (BD Business VIP)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // ================== ১। সরকারী কৃষি হেল্প ও ভিআইপি মেম্বারশীপ ==================
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Text('১। সরকারী কৃষি হেল্প', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      onPressed: () => _showSnackbar('১৬১২৩ নম্বরে ফ্রি কল চালু হচ্ছে...'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text('১৬১২৩ নম্বরে ফ্রি কল করুন', style: TextStyle(color: Colors.white)),
                    ),
                    const Divider(height: 25),
                    const Text('ভিআইপি মেম্বারশীপ প্ল্যান:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.orange)),
                    const SizedBox(height: 4),
                    const Text('(প্রতিমাসে মাত্র ২০০/-শত টাকা দিয়ে মেম্বার হয়ে সরাসরি বড় চালানের সব অফার সবার আগে দেখুন)', 
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black87)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _showSnackbar('বিকাশ/নগদ পেমেন্ট গেটওয়ে ওপেন হচ্ছে...'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text('ভিআইপি মেম্বার শীপ চালু করুন', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ================== ২। দৈনিক বাজার দর অনুসন্ধান ==================
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('২। দৈনিক বাজার দর অনুসন্ধান', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                    const SizedBox(height: 12),
                    
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: '*জেলা (সিলেক্ট করুন)', border: OutlineInputBorder()),
                      value: searchDistrict,
                      items: districts.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (v) => setState(() => searchDistrict = v),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: '*উপজেলা (সিলেক্ট করুন)', border: OutlineInputBorder()),
                      value: searchUpazila,
                      items: upazilas.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (v) => setState(() => searchUpazila = v),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: '*ইউনিয়ন (সিলেক্ট করুন)', border: OutlineInputBorder()),
                      value: searchUnion,
                      items: unions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (v) => setState(() => searchUnion = v),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: searchMarketController,
                      decoration: const InputDecoration(labelText: '*মোকাম বা বাজার (হাতে লিখবে)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: '*ফসলের নাম (ড্রপডাউন ফিল্টার)', border: OutlineInputBorder()),
                      value: searchCrop,
                      items: cropsList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (v) => setState(() => searchCrop = v),
                    ),
                    const SizedBox(height: 12),
                    
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.yellow.shade100,
                      child: Text(marketPriceResult, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 13)),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (searchDistrict != null && searchUpazila != null && searchCrop != null) {
                          setState(() {
                            if (searchCrop == 'ধান-বি আর ২৯') {
                              marketPriceResult = "সর্বশেষ বাজার দর ($searchDistrict, $searchUpazila): ১২৫০ - ১৩০০ টাকা/মণ";
                            } else if (searchCrop == 'পাট-তোষা') {
                              marketPriceResult = "সর্বশেষ বাজার দর ($searchDistrict, $searchUpazila): ৩০০০ - ৩২০০ টাকা/মণ";
                            } else {
                              marketPriceResult = "সর্বশেষ বাজার দর ($searchDistrict): ৯৫০ - ১১০০ টাকা (প্রতিকেজি/মণ)";
                            }
                          });
                        } else {
                          _showSnackbar('দয়া করে জেলা, উপজেলা এবং ফসলের নাম সিলেক্ট করুন');
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Center(child: Text('ফসলের দর অনুসন্ধান করুন', style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ================== ৩। সদস্য নিবন্ধন ফরম ==================
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
