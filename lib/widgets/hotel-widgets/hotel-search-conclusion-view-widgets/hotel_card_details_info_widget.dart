import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCardDetailsInfoWidget extends StatelessWidget {
  const HotelCardDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: context.height * 0.65,
          width: context.width * 1,
          padding: const EdgeInsets.only(left: 10, right: 10),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextWidget(
                  text: hotelCubit.hotelDetailsValue!.summaryText!,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              // TextWidget(
              // fontSize: 14,
              // fontWeight: FontWeight.bold,
              //     text:
              //         'Kristal berraklığındaki suların dokunuşunu hissedin... Crystal Admiral Resort Suites Spa Side\'de hizmet vermekte olup denize yakın konumdadır.Farklı sıcak mimarisi ve özenli peyzajının güzelliği ile ön plana çıkan otel, sahilindeince kumlu özel plajı, toplamda 3450 m² alana sahip çeşitli büyüklükte havuzları ve aquaparkı ile özellikle çocuklu aileler için adeta bir tatil cennetidir.Crystal Admiral Resortte yer alan, tam teşekküllü SPA sağlık ve güzellik merkezinde, uygulanan cilt ve vücut bakım kürleri, özel SPA bahçesi, özel açık SPA havuzu ve SPA bahçesinde bulunan Bali tipi açık masaj bölümleri ile sizleri eşsiz bir tatilin içinde hissetmenizi sağlar. Antalya da, Side Kızılot mevkiinde bulunan Crystal Hotel Admiral Resort Suites & Spa, Antalya Havalimanı\'na 80 km ve Antalya şehir merkezine 85 km uzaklıktadır.Otel denize 50 m mesafede olup, 250 m uzunluğunda, 100 m genişliğinde ince kumlu özel plaja sahiptir. Otel denize 50 m,Antalya Havalimanı 80 km,Antalya 85 km mesafededir. SPA – Denize Yakın Konum – Özel Plaj - Cocuk Dostu OtelHavuz ve Plaj Olanakları: Denize 50 metre mesafede olan tesis ince kumlu özel plaja sahiptir. Otelde açık yüzme havuzları, kapalı ve ısıtmalı yüzme havuzları, kaydıraklı yüzme havuzları ve çocuk havuzları vardır.Aktiviteler: Gün boyu animasyon aktiviteleri, akşam gösterileri, canlı müzik haftanın belirli günlerinde ve disko. Cocuk / Bebek:Cocuklar için 4–12 yaş özel çocuk havuzu, mini kulüp ve gölgelikli çocuk oyun parkı olup gençler için de oyun alanları mevcutturKonsept:Ultra Her Sey DahilSabah, öğle, akşam açık büfe yemekler ücretsiz. Tesisin belirlemiş olduğu markalar dahilinde bazı yerli alkollü ve alkolsüz içecekler 24 saat ücretsiz. Bazı yabancı içecekler 10.00-23.00 saatleri arasında ücretsiz, tüm yabancı içkiler 23.00-10.00 saatleri arasında ücretli. A la carte restoranlar 7 günlük konaklamalarda rezervasyonlu ve 1 defa ücretsiz Balık ve Grill A La Carte Restoran hariç. Balık ve Grill A La Carte Restoranlar rezervasyonlu ve ücretli. Minibar her gün soft içecekler ile dolduruluyor.A LA CARTE RESTORANLAR:Balık A La Carte Restoran - Balık Restoranı Ücretli Grill A La Carte Restoran Ücretli İtalyan A La Carte Restoran - İtalyan Mutfağı Meksika A La Carte Restoran - Meksika Mutfağı İstanbul A La Carte Restoran - Türk MutfağıHizmetler Saatleri:07.00 - 10.00 Kahvaltı10.00 - 11.00 Geç Kahvaltı11.30 - 16.00 Gözleme12.00 - 17.00 Snack İkram12.30 - 14.30 Öğle Yemeği19.00 - 21.30 Akşam Yemeği23.30 - 01.00 Geç Snack01.00 - 06.00 Gece Sandviç10.00 - 23.00 Relax Bar10.00 - 18.00 Caretta Beach Bar10.00 - 23.00 Cafe Turca10.00 - 23.00 Veranda Bar10.00 - 23.00 Vitamin Bar Pasta, Kek, Dondurma, Waffle, Donat, Kahve Köşesi'),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        );
      },
    );
  }
}
