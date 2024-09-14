// import 'package:cfl/screens/home/notification.dart';
import 'package:cfl/controllers/home/request_loan/request_loan_controller.dart';
import 'package:cfl/controllers/home/request_loan/request_loan_controller.dart';
import 'package:cfl/screens/home/request_loan/add_new_account.dart';
import 'package:cfl/screens/home/request_loan/request_loan_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestLoan extends StatelessWidget {
  final RequestLoanController cont = Get.put(RequestLoanController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * .63,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: Container(
                          decoration: const BoxDecoration(
                              // color: Colors.white,
                              gradient: LinearGradient(
                                colors: [Color(0xff365EF1), Color(0xff2799EB)],
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40))),
                          padding: EdgeInsets.fromLTRB(25, 80, 25, 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: const Color(0x33d9d9d9),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: const Icon(
                                      CupertinoIcons.back,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Request Loan',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {
                                  // Get.to(() => NotificationScreen());
                                },
                                child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF2EACB),
                                        borderRadius:
                                            BorderRadius.circular(25.71)),
                                    child: Image.asset(
                                      'assets/icons/notification.png',
                                      // height: 8,
                                      // width: 4,
                                      scale: 2,
                                      color: Color(0xff333B63),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          top: 155,
                          right: 25,
                          left: 25,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 23, left: 24, right: 24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x21212121),
                                  // The shadow color with 20% opacity
                                  offset: Offset(0, 4),
                                  // Horizontal and vertical offset
                                  blurRadius: 12, // The blur radius
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/credit.png',
                                          width: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Available Credit Limit',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Color(0xff333B63)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹${cont.availableLimit.value}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff365EF1)),
                                        ),
                                        Text(
                                          '-/-',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff333b63)),
                                        ),
                                        Text(
                                          '₹${cont.totalLimit.value}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0x96333b63)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                              ],
                            ),
                          )),
                    ],
                  )),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 39, top: 20),
                child: Text(
                  'Choose Loan Amount',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 4),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.only(top: 18),
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cont.amounts.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    '₹ ${cont.amounts[index]}',
                                    style: GoogleFonts.poppins(fontSize: 18),
                                  ),
                                  onTap: () {
                                    // Assuming cont.selectedBank is a ValueNotifier or similar
                                    cont.selectedAmount.value = cont.amounts[index];
                                    cont.amountController.text = '₹ ${cont.amounts[index]}';
                                    cont.fAC.value = cont.amounts[index]/10;
                                    cont.amountToBeDisbursed.value = cont.amounts[index]*0.90;
                                    cont.interest.value = cont.amounts[index]*0.02;
                                    cont.tap.value = cont.amounts[index]+cont.interest.value;
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Color(0xd304ffe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/D_circle.png',
                          width: 17,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            enabled: false,
                            controller: cont.amountController,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333b63)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0x735c6371),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Icon(
                              CupertinoIcons.chevron_down,
                              color: Color(0xff333b63),
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 39, top: 20),
                child: Text(
                  'Choose Loan Tenure',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333b63)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 4),
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.only(top: 18),
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cont.tenure.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    '${cont.tenure[index]} Days',
                                    style: GoogleFonts.poppins(fontSize: 18),
                                  ),
                                  onTap: () {
                                    // Assuming cont.selectedBank is a ValueNotifier or similar
                                    cont.selectedTenure.value = cont.tenure[index];
                                    cont.tenureController.text =
                                    '${cont.tenure[index]} Days';
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Color(0xd304ffe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 17,
                          color: Color(0xff333b63),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            enabled: false,
                            controller: cont.tenureController,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333b63)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0x735c6371),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Icon(
                              CupertinoIcons.chevron_down,
                              color: Color(0xff333b63),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x21212121),
                          // The shadow color with 20% opacity
                          offset: Offset(0, 4),
                          // Horizontal and vertical offset
                          blurRadius: 12, // The blur radius
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Loan Amount',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=> Text(
                                '₹${cont.selectedAmount.value}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deductions',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=> Text(
                                '₹${cont.deductions.value}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Financial Accelerator Fees',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=> Text(
                                '₹${cont.fAC.value.toString().replaceAll('.0', '')}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount To Be Disbursed',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=>Text(
                                '₹${cont.amountToBeDisbursed.value.toString().replaceAll('.0', '')}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Image.asset('assets/icons/btm_line.png'),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CFL Cashback',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Text(
                              '₹${cont.cflCashback.value}',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interest Before Due Date',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=> Text(
                                '₹${cont.interest.value.toString().replaceAll('.0', '')}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount Payable',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333b63)),
                            ),
                            Obx(()=> Text(
                                '₹${cont.tap.value.toString().replaceAll('.0', '')}',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff333b63)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x21212121),
                            // The shadow color with 20% opacity
                            offset: Offset(0, 4),
                            // Horizontal and vertical offset
                            blurRadius: 12, // The blur radius
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Obx(
                            () => cont.isLoading.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.blue,
                                          )),
                                    ],
                                  )
                                : cont.noBankFound.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'No Bank Account Added!',
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              color: getImage(cont
                                                          .bankName.value) !=
                                                      ''
                                                  ? Colors.white
                                                  : Color(0xff365EF1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child:
                                                getImage(cont.bankName.value) !=
                                                        ''
                                                    ? Image.asset(getImage(
                                                        cont.bankName.value))
                                                    : SizedBox(),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${cont.bankName.value} ${cont.accountNumber.value.substring(cont.accountNumber.value.length - 4)}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff333b63)),
                                              ),
                                              Text(
                                                'Money will be transfered to this \nbank account.',
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff333b63)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          InkWell(
                            onTap: () async {
                              var result = await Get.to(() => AddNewAccount());
                              if (result != null) {
                                print('1');
                                cont.fetchBank();
                              }
                            },
                            child: Obx(()=> Text(
                                cont.noBankFound.value
                                    ? 'Add Account'
                                    : 'Change Account',
                                style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff365EF1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff365EF1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 60),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RequestLoanPreview(),
                      arguments: [
                        cont.tenureController.text.replaceAll(' Days', ''),
                        cont.selectedAmount.value,
                        '${cont.bankName.value} ${cont.accountNumber.value.substring(cont.accountNumber.value.length - 4)}',
                        cont.bankId.value
                      ]);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff2799EB),
                              Color(0xff1354D1),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Get Cash',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerWithIconAndText(String image, String text) {
    return Container(
      height: 96,
      width: 96,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21212121),
            // The shadow color with 20% opacity
            offset: Offset(0, 4),
            // Horizontal and vertical offset
            blurRadius: 12, // The blur radius
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 38,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xff333B63)),
          )
        ],
      ),
    );
  }

  Widget _containerWithIconAndText2(String image, String text) {
    return Container(
      height: 90,
      width: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xffEBEFFE),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 34,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 9,
                color: Color(0xff333B63)),
          )
        ],
      ),
    );
  }

  String getImage(String bankName) {
    switch (bankName) {
      case 'Axis Bank':
        return 'assets/banks/axis.png';
      case 'Bandhan Bank':
        return 'assets/banks/bandhan.png';
      case 'Bank of Baroda':
        return 'assets/banks/bob.png';
      case 'Bank of India':
        return 'assets/banks/boi.png';
      case 'Canara Bank':
        return 'assets/banks/canara.png';
      case 'Central Bank of India':
        return 'assets/banks/cbi.png';
      case 'City Union Bank':
        return 'assets/banks/cub.png';
      case 'Corporation Bank':
        return 'assets/banks/corporation.png';
      case 'Dhanlaxmi Bank':
        return 'assets/banks/dhanlaxmi.png';
      case 'Federal Bank':
        return 'assets/banks/federal.png';
      case 'HDFC Bank':
        return 'assets/banks/hdfc.png';
      case 'ICICI Bank':
        return 'assets/banks/icici.png';
      case 'IDBI Bank':
        return 'assets/banks/idbi.png';
      case 'IDFC First Bank':
        return 'assets/banks/idfc_fb.png';
      case 'Indian Bank':
        return 'assets/banks/indian.png';
      case 'Indian Overseas Bank':
        return 'assets/banks/iob.png';
      case 'IndusInd Bank':
        return 'assets/banks/indus.png';
      case 'Jammu & Kashmir Bank':
        return 'assets/banks/jkb.png';
      case 'Karnataka Bank':
        return 'assets/banks/karnatakabank.png';
      case 'Karur Vysya Bank':
        return 'assets/banks/karur.png';
      case 'Kotak Mahindra Bank':
        return 'assets/banks/kotak.png';
      case 'Punjab National Bank':
        return 'assets/banks/pnb.png';
      case 'RBL Bank':
        return 'assets/banks/rbl.png';
      case 'South Indian Bank':
        return 'assets/banks/sib.png';
      case 'State Bank of India':
        return 'assets/banks/sbi.png';
      case 'Syndicate Bank':
        return 'assets/banks/syb.png';
      case 'UCO Bank':
        return 'assets/banks/uco.png';
      case 'Union Bank of India':
        return 'assets/banks/ubi.png';
      case 'Yes Bank':
        return 'assets/banks/yes.png';
      default:
        return '';
    }
  }
}
