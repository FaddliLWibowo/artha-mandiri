SELECT no_rek, sum(nominal) from simpanan where jenis='S' group by no_rek
// jumlah sim pokok and sim sukarela// SELECT no_rek, sum(nominal) from simpanan where jenis in('P','S')  group by no_rek
// join dengan simpanan === SELECT simpanan.no_rek as Nomor,nasabah.nama, sum(nominal) as Pokok from simpanan inner join nasabah on nasabah.no_rekening=simpanan.no_rek where jenis='P' group by no_rek 