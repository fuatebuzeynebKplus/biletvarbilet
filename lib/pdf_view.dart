import 'dart:io';
import 'dart:typed_data';

import 'package:bamobile1/common/data/enums/air_cabin_type.dart';
import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/enums/weight_unit_type.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/flight/data/models/get_booking_model.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:bamobile1/flight/data/models/get_voucher.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatefulWidget {
  const PdfPreviewScreen({super.key});
  static String id = 'PdfPreviewScreen';
  @override
  _PdfPreviewScreenState createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  String? filePath;
  pw.Document? pdf;
  late String flightDetailsText;
  late String pdfTitle;
  late String pdfOneMessage;
  late String agencyInformation;
  late String company;
  late String phonr;
  late String fax;
  late String email;
  late String iataNo;
  late String location;
  late String reservationInfo;
  late String priceInformation;
  late String seatDetails;
  late String information;
  late String importantReminder;
  late String importantSubTitle;
  late String PdfRedMessage;
  late String passengerType;
  late String fullName;
  late String birthDay;
  late String idOrPassport;
  late String ticketNumber;
  late String transactionDate;

  @override
  void initState() {
    super.initState();

    _generateAndDisplayPdf();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    flightDetailsText = S.of(context).FlightDetails;
    pdfTitle = S.of(context).PdfTitle;
    pdfOneMessage = S.of(context).PdfOneMessage;
    agencyInformation = S.of(context).AgencyInformation;
    company = S.of(context).PhoneNumber;
    phonr =
        S.of(context).AgencyInformation; // يبدو أنك تكرر AgencyInformation هنا
    fax = S.of(context).Fax;
    email = S.of(context).EMail;
    iataNo = S.of(context).IATANo;
    location = S.of(context).Location;
    reservationInfo = S.of(context).ReservationInfo;
    priceInformation = S.of(context).PriceInformation;
    seatDetails = S.of(context).SeatDetails;
    information = S.of(context).Information;
    importantReminder = S.of(context).ImportantReminder;
    importantSubTitle = S.of(context).ImportantSubTitle;
    PdfRedMessage = S.of(context).PdfRedMessage;
    passengerType = S.of(context).PassengerType;
    fullName = S.of(context).FullName;
    birthDay = S.of(context).BirthDay;
    idOrPassport = S.of(context).IdOrPassport;
    ticketNumber = S.of(context).TicketNumber;
    transactionDate = S.of(context).TransactionDate;
  }

  Future<void> _generateAndDisplayPdf() async {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    List<FlightBookingList> flightBookingList = [];
    flightBookingList =
        flightTicketCubit.getBookingModelDetails!.result!.flightBookingList;

    // Parse the HTML string
    print('0000000000000');
    List<String> extractedTexts = flightTicketCubit.extractedTexts;

    print('111111111111111111111111');

    //  await Future.delayed(const Duration(seconds: 1));

//     print('extractedTexts: $extractedTexts');

// // إذا كانت قيمة pdfOneMessage موجودة، أضفها
//     if (pdfOneMessage.isNotEmpty) {
//       extractedTexts.add(pdfOneMessage);
//     }

    // List<List<FlightBookingPax>> paxList = [];
    // for (var elementMain in flightBookingList!) {
    //   paxList.add(elementMain.paxList!);
    // }

    // List<List<FlightBookingLeg>> legList = [];

    // for (var elementMain in flightBookingList) {
    //   legList.add(elementMain.legs!);
    // }
    Future<Uint8List> loadImageFromUrl(String imageUrl) async {
      final response =
          await http.get(Uri.parse(imageUrl)); // Fetch image from URL
      return response.bodyBytes; // Return image as bytes
    }

    final pdfDoc = pw.Document();
    pdf = pdfDoc;
    String imageUrl = (authCubit.agentUrlImage != null &&
            authCubit.agentUrlImage!.isNotEmpty)
        ? 'https://my.kplus.com.tr${authCubit.agentUrlImage}'
        : 'https://firebasestorage.googleapis.com/v0/b/bookingagora-91790.appspot.com/o/user.png?alt=media&token=b788c57e-eb20-4e35-8d1e-f65560749919'; // يمكنك وضع صورة افتراضية هنا

    // String imageUrlFlights = legList.first.first.ticketingAirline!.logo!;

    final ByteData bytes = await rootBundle.load('fonts/Amiri-Regular.ttf');
    final pw.Font robotoFont = pw.Font.ttf(bytes);

    final ByteData bytesBold = await rootBundle.load('fonts/Amiri-Bold.ttf');

    final pw.Font robotoFontBold = pw.Font.ttf(bytesBold);
    final imageBytes = await loadImageFromUrl(imageUrl);
    // final imageBytesForFlights = await loadImageFromUrl(imageUrlFlights);
    pdfDoc.addPage(
      pw.MultiPage(
        // MultiPage will handle page splitting automatically
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) {
          return [
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.symmetric(vertical: 12),
              decoration: pw.BoxDecoration(
                border:
                    pw.Border.all(color: PdfColors.grey300, width: 1), // الإطار
              ),
              child: pw.Text(
                pdfTitle,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontSize: 10, color: PdfColors.black, font: robotoFontBold),
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 2, // التحكم بنسبة العمود الثاني
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // عنوان الجدول
                      pw.Container(
                        width: double.infinity,
                        color: PdfColor.fromHex('F4822C'),
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(
                          reservationInfo,
                          style: pw.TextStyle(
                              fontSize: 10,
                              color: PdfColors.white,
                              font: robotoFontBold),
                        ),
                      ),
                      // مسافة صغيرة بين العنوان والجدول
                      // الجدول
                      buildTableReservationInfo(
                          flightBookingList: flightBookingList, robotoFont),

                      // عنوان الجدول
                      flightTicketCubit.voucherWithPrice == false
                          ? pw.SizedBox()
                          : pw.Container(
                              width: double.infinity,
                              color: PdfColors.orangeAccent100,
                              height: 20,
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(
                                priceInformation,
                                style: pw.TextStyle(
                                    fontSize: 8,
                                    color: PdfColors.black,
                                    font: robotoFont),
                              ),
                            ),
                      // مسافة صغيرة بين العنوان والجدول
                      // الجدول
                      flightTicketCubit.voucherWithPrice == false
                          ? pw.SizedBox()
                          : buildTablePriceInfo(robotoFont,
                              flightBookingList: flightBookingList),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 4),
            pw.Container(
              width: double.infinity,
              color: PdfColor.fromHex('F4822C'),
              padding: const pw.EdgeInsets.all(4),
              child: pw.Center(
                child: pw.Text(
                  seatDetails,
                  style: pw.TextStyle(
                    fontSize: 10,

                    color: PdfColors.white,
                    font: robotoFontBold,

                    // Custom font for title
                  ),
                ),
              ),
            ),
            buildTablesForAllPassengers(
              robotoFont,
              flightBookingList,
            ),
            pw.SizedBox(height: 8),
            pw.Container(
              width: double.infinity,
              color: PdfColor.fromHex('F4822C'),
              padding: const pw.EdgeInsets.all(4),
              child: pw.Center(
                child: pw.Text(
                  flightDetailsText,
                  style: pw.TextStyle(
                    fontSize: 10,

                    color: PdfColors.white,
                    font: robotoFontBold,

                    // Custom font for title
                  ),
                ),
              ),
            ),
            buildTablesForAllLegFlights(
              robotoFont,
              flightBookingList,
            ),
            pw.SizedBox(height: 15),
            pw.Text(
              information,
              style: pw.TextStyle(
                fontSize: 12,

                color: PdfColors.black,
                font: robotoFontBold,

                // Custom font for title
              ),
            ),
            pw.SizedBox(height: 5),
            for (var item in extractedTexts) ...[
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 18),
                child: pw.Text(
                  '* $item',
                  style: pw.TextStyle(
                    fontSize: 8,
                    color: PdfColors.black,
                    font: robotoFont,
                  ),
                ),
              ),
              pw.SizedBox(height: 5),
            ],
            pw.SizedBox(height: 5),
            pw.Text(
              importantReminder,
              style: pw.TextStyle(
                fontSize: 12,

                color: PdfColors.black,
                font: robotoFontBold,

                // Custom font for title
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              importantSubTitle,
              style: pw.TextStyle(
                fontSize: 10,

                color: PdfColors.black,
                font: robotoFont,

                // Custom font for title
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 18), // مسافة بين الجداول
              child: pw.Text(
                PdfRedMessage,
                style: pw.TextStyle(
                  fontSize: 8,

                  color: PdfColors.redAccent,
                  font: robotoFont,

                  // Custom font for title
                ),
              ),
            )
          ];
        },
      ),
    );

    // حفظ الملف في ذاكرة الجهاز المؤقتة
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/ticket.pdf");
    await file.writeAsBytes(await pdfDoc.save());

    // تحديث حالة المسار لعرضه لاحقاً
    setState(() {
      filePath = file.path;
    });
  }

  Future<Uint8List> loadImageFromUrl(String imageUrl) async {
    final response =
        await http.get(Uri.parse(imageUrl)); // Fetch image from URL
    return response.bodyBytes; // Return image as bytes
  }

  @override
  Widget build(BuildContext context) {
    final fileDownloaded = S.of(context).FileDownloaded;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColors.kAppBarColor,
        toolbarHeight: context.height * 0.06,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextWidget(
          text: S.of(context).PriceVoucher,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          SizedBox(
            width: context.width * 0.04,
          ),
          GestureDetector(
            child: const Icon(
              Icons.download,
              color: Colors.white,
            ),
            onTap: () async {
              final bytes = await pdf!.save();
              final directory = await getExternalStorageDirectory();
              final file = File('${directory!.path}/FlightTicket.pdf');
              await file.writeAsBytes(bytes);

              SnackbarUtils.showSnackbar(
                  context, '$fileDownloaded ${file.path}', 2);
            },
          ),
          SizedBox(
            width: context.width * 0.04,
          ),
          GestureDetector(
            child: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            onTap: () async {
              await Printing.sharePdf(
                bytes: await pdf!.save(),
                filename: 'FlightTicket.pdf',
              );
            },
          ),
          SizedBox(
            width: context.width * 0.04,
          ),
        ],
      ),
      body: filePath == null
          ? const Center(child: CircularProgressIndicator())
          : pdfx.PdfView(
              controller: pdfx.PdfController(
                document: pdfx.PdfDocument.openFile(filePath!),
              ),
            ),
    );
  }

  pw.Widget _buildTableCell(String text, pw.Font? font,
      {bool isHeader = false,
      double fontSize = 30.0,
      Uint8List? imageUint8List,
      String? imageString}) {
    return pw.Container(
        height: fontSize,
        padding: const pw.EdgeInsets.symmetric(
            vertical: 6, horizontal: 4), // Adjust padding
        alignment: pw.Alignment.center, // Center the text in the cell
        decoration: pw.BoxDecoration(
          color: isHeader
              ? PdfColors.grey200
              : null, // Orange background for headers
          border:
              pw.Border.all(color: PdfColors.grey, width: 0.5), // Light border
        ),
        child: imageString == null
            ? pw.Text(
                text,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: isHeader ? 10 : 8,
                  font: font,
                  color: PdfColors.black,
                ),
              )
            : pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(
                    pw.MemoryImage(imageUint8List!),
                    fit: pw.BoxFit.contain, // Adjust fit as needed
                    height: 60, // Make the image stretch vertically
                    width: 60,
                  ),
                  pw.Text(
                    text,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: isHeader ? 10 : 8,
                      font: font,
                      color: PdfColors.black,
                    ),
                  ),
                ],
              ));
  }

  /*


pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            image == null
                ? pw.SizedBox()
                : pw.Image(
                    pw.MemoryImage(image),
                    fit: pw.BoxFit.contain, // Adjust fit as needed
                    height: 100, // Make the image stretch vertically
                    width: 100,
                  ),
            pw.Text(
              text,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: isHeader ? 12 : 10, // تكبير النص إذا كان العنوان
                font: font,
                color: PdfColors.black, // النص يكون باللون الأسود
              ),
            ),
          ],
        )

  */

  // pw.Widget buildTablesForAllList(
  //   pw.Font? font,
  //   List<FlightBookingList> flightBookingList,
  // ) {
  //   return pw.Column(
  //     children: List.generate(
  //       flightBookingList.length,
  //       (index) => buildTablesForAllLegFlights(font, flightBookingList, index),
  //     ),
  //   );
  // }

  pw.Widget buildTablesForAllPassengers(
    pw.Font? font,
    List<FlightBookingList> flightBookingList,
  ) {
    return pw.Column(
      children: List.generate(
        flightBookingList[0].paxList.length, // عدد الركاب في القائمة
        (index) => pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 0), // مسافة بين الجداول
          child: buildTablePassengerInfo(
            font,
            flightBookingList: flightBookingList,
            index: index,
            showTitle: index == 0 ? true : false,
          ),
        ),
      ),
    );
  }

// Main PDF table structure with auto-size and full width
  pw.Widget buildTablePassengerInfo(pw.Font? font,
      {required List<FlightBookingList> flightBookingList,
      required int index,
      required bool showTitle}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2),
        1: const pw.FlexColumnWidth(3.5),
        2: const pw.FlexColumnWidth(3),
        3: const pw.FlexColumnWidth(3),
        4: const pw.FlexColumnWidth(3.5),
      },
      children: [
        showTitle == true
            ? pw.TableRow(
                children: [
                  _buildTableCell(passengerType, font, isHeader: true),
                  _buildTableCell(fullName, font, isHeader: true),
                  _buildTableCell(birthDay, font, isHeader: true),
                  _buildTableCell(idOrPassport, font, isHeader: true),
                  _buildTableCell(ticketNumber, font, isHeader: true),
                ],
              )
            : const pw.TableRow(
                children: [],
              ),
        pw.TableRow(
          children: [
            _buildTableCell(
                flightBookingList.first.paxList[index].pax!.genderType ==
                        GenderType.male
                    ? 'Mr.'
                    : 'Ms.',
                font),
            _buildTableCell(
                '${flightBookingList.first.paxList[index].pax!.firstName} ${flightBookingList.first.paxList[index].pax!.lastName}',
                font),
            _buildTableCell(
                '${flightBookingList.first.paxList[index].pax!.dateOfBirth}',
                font),
            _buildTableCell(
                '${flightBookingList.first.paxList[index].pax!.identityNumber == null || flightBookingList.first.paxList[index].pax!.identityNumber == "" ? flightBookingList.first.paxList[index].pax!.passportNumber : flightBookingList.first.paxList[index].pax!.identityNumber}',
                font),
            _buildTableCell(
                '${flightBookingList.first.paxList[index].ticketNumber}', font),
          ],
        ),
        // Add more rows if needed here
      ],
    );
  }

  pw.Widget buildTableReservationInfo(pw.Font? font,
      {required List<FlightBookingList> flightBookingList}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2.5), // عرض العمود الأول
        1: const pw.FlexColumnWidth(3.5), // عرض العمود الثاني
      },
      children: [
        // السطر الأول (رأس الجدول)
        pw.TableRow(
          children: [
            _buildTableCell(S.of(context).TransactionDate, font,
                fontSize: 30), // عنوان العمود الأول
            _buildTableCell(
                DateFormat('yyyy.MM.dd HH:mm')
                    .format(flightBookingList.first.bookingDate!),
                font,
                fontSize: 30), // عنوان العمود الثاني
          ],
        ),
        // السطر الثاني
        pw.TableRow(
          children: [
            _buildTableCell('PNR', font, fontSize: 20), // بيانات العمود الأول
            _buildTableCell(
                '${flightBookingList.first.legs.first.vendorPnr}', font,
                fontSize: 20), // بيانات العمود الثاني
          ],
        ),
        // السطر الثالث
      ],
    );
  }

  pw.Widget buildTablePriceInfo(pw.Font? font,
      {required List<FlightBookingList> flightBookingList}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2.5), // عرض العمود الأول
        1: const pw.FlexColumnWidth(3.5), // عرض العمود الثاني
      },
      children: [
        // السطر الأول (رأس الجدول)
        pw.TableRow(
          children: [
            _buildTableCell(S.of(context).TicketPrice, font,
                fontSize: 20), // عنوان العمود الأول
            _buildTableCell(
                '${(BlocProvider.of<FlightTicketCubit>(context).formatNumber(flightBookingList.first.amount!.totalSellAmount! - flightBookingList.first.amount!.totalTaxAmount!))} '
                '${flightBookingList.first.amount!.currencyCode!}',
                font,
                fontSize: 20), // عنوان العمود الثاني
          ],
        ),
        // السطر الثاني
        pw.TableRow(
          children: [
            _buildTableCell(S.of(context).Taxes, font,
                fontSize: 20), // بيانات العمود الأول
            _buildTableCell(
                '${(BlocProvider.of<FlightTicketCubit>(context).formatNumber(flightBookingList.first.amount!.totalTaxAmount!))} '
                '${flightBookingList.first.amount!.currencyCode!}',
                font,
                fontSize: 20), // بيانات العمود الثاني
          ],
        ),

        // السطر الثالث
        pw.TableRow(
          children: [
            _buildTableCell(S.of(context).TotalCharge, font,
                fontSize: 20), // عنوان العمود الأول
            _buildTableCell(
                '${(BlocProvider.of<FlightTicketCubit>(context).formatNumber(flightBookingList.first.amount!.totalSellAmount!))} ' //.toStringAsFixed(2)

                '${flightBookingList.first.amount!.currencyCode!}',
                font,
                fontSize: 20),
          ],
        ),
      ],
    );
  }

  pw.Widget buildTablesForAllLegFlights(
    pw.Font? font,
    List<FlightBookingList> flightBookingList,
  ) {
    return pw.Column(
      children: List.generate(
        flightBookingList[0].legs.length,
        (index) => pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 0),
          child: buildTableFlightInfo(
            indexMain: 0,
            font,
            flightBookingList: flightBookingList,
            index: index,
            showTitle: index == 0, //
          ),
        ),
      ),
    );
  }

  pw.Widget buildTableFlightInfo(pw.Font? font,
      {required List<FlightBookingList> flightBookingList,
      required int index,
      required bool showTitle,
      required int indexMain}) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(2),
        1: const pw.FlexColumnWidth(3),
        2: const pw.FlexColumnWidth(1.5),
        3: const pw.FlexColumnWidth(2),
        4: const pw.FlexColumnWidth(2),
        5: const pw.FlexColumnWidth(1.5),
        6: const pw.FlexColumnWidth(1.5),
        7: const pw.FlexColumnWidth(1.5),
      },
      children: [
        showTitle == true
            ? pw.TableRow(
                children: [
                  _buildTableCell(S.of(context).Airline, font, isHeader: true),
                  _buildTableCell(S.of(context).Route, font, isHeader: true),
                  _buildTableCell(S.of(context).Flight, font, isHeader: true),
                  _buildTableCell(S.of(context).Departure, font,
                      isHeader: true),
                  _buildTableCell(S.of(context).Arrival, font, isHeader: true),
                  _buildTableCell(S.of(context).Baggage, font, isHeader: true),
                  _buildTableCell(S.of(context).Class, font, isHeader: true),
                  _buildTableCell(S.of(context).Status, font, isHeader: true),
                ],
              )
            : const pw.TableRow(
                children: [],
              ),
        pw.TableRow(
          children: [
            _buildTableCell(
                '${flightBookingList[indexMain].legs[index].ticketingAirline!.name}',
                font),
            _buildTableCell(
                '${flightBookingList[indexMain].legs[index].departureAirport!.name} ||  ${flightBookingList[indexMain].legs[index].arrivalAirport!.name}',
                font),
            _buildTableCell(
                '${flightBookingList[indexMain].legs[index].ticketingAirline!.ticketingCode}${flightBookingList[indexMain].legs[index].flightNo}',
                font),
            _buildTableCell(
                DateFormat('yyyy.MM.dd HH:mm').format(
                    flightBookingList[indexMain].legs[index].departureDate!),
                font),
            _buildTableCell(
                DateFormat('yyyy.MM.dd HH:mm').format(
                    flightBookingList[indexMain].legs[index].arrivalDate!),
                font),
            _buildTableCell(
                '${flightBookingList[indexMain].paxList[indexMain].flightPaxType == 0 ? 'Adult: ' : flightBookingList[indexMain].paxList[index].flightPaxType == 1 ? 'Child: ' : 'Baby: '} ${flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].type == WeightUnitType.pc ? flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].value == '0' ? 'HandLuggage' : 'PC' : '${flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].value!}KG'}',
                font),
            _buildTableCell(
                '${flightBookingList[indexMain].legs[index].classCode} - ${flightBookingList[indexMain].legs[index].cabinType == AirCabinType.business ? 'Business' : 'Economy'}',
                font),
            _buildTableCell(
                flightBookingList[indexMain].paxList[indexMain].statusType == 1
                    ? 'Ok'
                    : 'Not Ok',
                font),

            // _buildTableCell(
            //     '${flightBookingList[indexMain].legs[index].ticketingAirline!.name}',
            //     font),
            // _buildTableCell(
            //     '${flightBookingList[indexMain].legs[index].departureAirport!.name} ||  ${flightBookingList[indexMain].legs[index].arrivalAirport!.name}',
            //     font),
            // _buildTableCell(
            //     '${flightBookingList[indexMain].legs[index].ticketingAirline!.ticketingCode}${flightBookingList[indexMain].legs[index].flightNo}',
            //     font),
            // _buildTableCell(
            // DateFormat('yyyy.MM.dd HH:mm').format(
            //     flightBookingList[indexMain].legs[index].departureDate!),
            //     font),
            // _buildTableCell(
            // DateFormat('yyyy.MM.dd HH:mm').format(
            //     flightBookingList[indexMain].legs[index].arrivalDate!),
            //     font),
            // _buildTableCell(
            //     ' ${flightBookingList[indexMain].paxList[indexMain].flightPaxType == PaxType.adult ? 'Adult: ' : flightBookingList[indexMain].paxList[index].flightPaxType == PaxType.child ? 'Child: ' : 'Baby: '} ${flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].type == WeightUnitType.pc ? flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].value == '0' ? 'HandLuggage' : 'PC' : '${flightBookingList[indexMain].paxList[indexMain].baggageAllowances[index].value!}KG'} ',
            //     font),
            // _buildTableCell(
            //     '${flightBookingList[indexMain].legs[index].classCode} - ${flightBookingList[indexMain].legs[index].cabinType == AirCabinType.business ? 'Business' : 'Economy'}',
            //     font),
            // _buildTableCell(
            // flightBookingList[indexMain].paxList[indexMain].statusType == 1
            //     ? 'Ok'
            //     : 'Not Ok',
            //     font),
          ],
        ),
        // Add more rows if needed here
      ],
    );
  }

  pw.Widget buildInfoRowWithDivider(String label, String value, pw.Font? font,
      {required bool isHeader}) {
    return pw.Column(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 1),
          child: pw.Row(
            children: [
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  label,
                  style: pw.TextStyle(
                    font: font,
                    fontSize: isHeader ? 10 : 8,
                  ),
                ),
              ),
              pw.Expanded(
                flex: 3,
                child: pw.Text(
                  value,
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        // خط فاصل
        pw.SizedBox(
          height: 1,
          child: pw.Divider(color: PdfColors.grey, thickness: 0.5),
        ),
      ],
    );
  }
}

/*

import 'dart:io';
import 'dart:typed_data';
import 'package:bamobile1/common/data/enums/air_cabin_type.dart';
import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';

class PdfPreviewScreen extends StatefulWidget {
  const PdfPreviewScreen({super.key});
  static String id = 'PdfPreviewScreen';
  @override
  _PdfPreviewScreenState createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  String? filePath;

  @override
  void initState() {
    super.initState();

    _generateAndDisplayPdf();
  }

  Future<void> _generateAndDisplayPdf() async {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    List<FlightBooking>? flightBookingList;
    flightBookingList = flightTicketCubit
        .getReservationsList[flightTicketCubit.saveReservationIndexValue!]
        .flightBookingList;
    List<List<FlightBookingPax>> paxList = [];
    for (var elementMain in flightBookingList!) {
      paxList.add(elementMain.paxList!);
    }

    List<List<FlightBookingLeg>> legList = [];

    for (var elementMain in flightBookingList) {
      legList.add(elementMain.legs!);
    }

    final pdf = pw.Document();
    String imageUrl = (authCubit.agentUrlImage != null &&
            authCubit.agentUrlImage!.isNotEmpty)
        ? 'https://my.kplus.com.tr${authCubit.agentUrlImage}'
        : 'https://firebasestorage.googleapis.com/v0/b/bookingagora-91790.appspot.com/o/user.png?alt=media&token=b788c57e-eb20-4e35-8d1e-f65560749919'; // يمكنك وضع صورة افتراضية هنا

    String imageUrlFlights = legList.first.first.ticketingAirline!.logo!;
    final imageBytes = await loadImageFromUrl(imageUrl);
    final imageBytesForFlights = await loadImageFromUrl(imageUrlFlights);
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'ELECTRONIC TICKET PASSENGER ITINERARY RECEIPT',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                //mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Table section
                  pw.SizedBox(
                    width: 100, // Width of the image container

                    child: pw.Image(
                      pw.MemoryImage(imageBytes),
                      fit: pw.BoxFit.contain, // Adjust fit as needed
                      height:
                          double.infinity, // Make the image stretch vertically
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Table(
                      border: pw.TableBorder.all(),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Company'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Company'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Demo'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Phone'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('+90 555 555 5555'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Fax'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('+90 555 555 5555'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Email'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('-'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Address'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child:
                                pw.Text('Kahramanmaras Kahramanmaras / Turkey'),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  // Image section
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Passenger Information',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Title'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                          paxList.first.first.pax!.genderType == GenderType.male
                              ? "Mr."
                              : "Ms."),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Passenger Name'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                          '${paxList.first.first.pax!.firstName} ${paxList.first.first.pax!.lastName}'),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Birth Date'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('${paxList.first.first.pax!.dateOfBirth}'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('ID No'),
                    ),
                    pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        child: pw.Text(paxList.first.first.pax!.passportNumber
                                    ?.isNotEmpty ==
                                true
                            ? paxList.first.first.pax!.passportNumber
                            : paxList.first.first.pax!.identityNumber
                                        ?.isNotEmpty ==
                                    true
                                ? paxList.first.first.pax!.identityNumber
                                : null)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Ticket Number'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('${paxList.first.first.ticketNumber}'),
                    ),
                  ]),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Flight Information',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Airline Name'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Row(
                        children: [
                          pw.Image(
                            pw.MemoryImage(imageBytesForFlights),
                            width: 40, // Adjust logo size
                            height: 40, // Adjust logo size
                            fit: pw.BoxFit.contain,
                          ),

                          pw.SizedBox(width: 10), // Space between text and logo
                          pw.Text(
                              '${legList.first.first.ticketingAirline!.name}'),
                        ],
                      ),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Destination'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                          '${legList.first.first.departureAirport!.cityName} (${legList.first.first.departureAirport!.code}) -> ${legList.last.first.arrivalAirport!.cityName} (${legList.last.first.arrivalAirport!.code})'),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('FlightNo'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('TK2444'),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Departure'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(
                            DateTime.parse(legList.first.first.departureDate!)),
                      ),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Arrival'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(
                            DateTime.parse(legList.last.first.arrivalDate!)),
                      ),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Baggage'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('15KG'),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Class'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                          '${legList.first.first.classCode!} - ${legList.first.first.cabinType == AirCabinType.economy ? "Economy" : "Business"}'),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Status'),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('OK'),
                    ),
                  ]),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    child: pw.Table(
                      border: pw.TableBorder.all(),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Process Date'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(
                              DateFormat('yyyy-MM-dd HH:mm').format(
                                  DateTime.parse(
                                      flightBookingList!.first.bookingDate!)),
                            ),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('PNR'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('${legList.first.first.vendorPnr}'),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Table(
                      border: pw.TableBorder.all(),
                      children: [
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Basefare'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(
                                '${flightBookingList.first.amount!.totalSellAmount! - flightBookingList.first.amount!.totalTaxAmount!} '
                                '${flightBookingList.first.amount!.currencyCode!}'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Taxes'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(
                                '${flightBookingList.first.amount!.totalTaxAmount!} '
                                '${flightBookingList.first.amount!.currencyCode!}'),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Total'),
                          ),
                          pw.Container(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text(
                                '${flightBookingList.first.amount!.totalSellAmount!} '
                                '${flightBookingList.first.amount!.currencyCode!}'),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // حفظ الملف في ذاكرة الجهاز المؤقتة
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/ticket.pdf");
    await file.writeAsBytes(await pdf.save());

    // تحديث حالة المسار لعرضه لاحقاً
    setState(() {
      filePath = file.path;
    });
  }

  Future<Uint8List> loadImageFromUrl(String imageUrl) async {
    final response =
        await http.get(Uri.parse(imageUrl)); // Fetch image from URL
    return response.bodyBytes; // Return image as bytes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: filePath == null
          ? const Center(child: CircularProgressIndicator())
          : PdfView(
              controller: PdfController(
                document: PdfDocument.openFile(filePath!),
              ),
            ),
    );
  }
}



*/
