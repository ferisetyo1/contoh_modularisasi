import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:produk/produk.dart';

class ProdukRepository extends IProdukRepository {
  RequestHandler requestHandler;
  ProdukRepository(this.requestHandler);

  @override
  Future<ResponseHandler<IList<Produk>>> fetchListProduk() {
    return requestHandler.doRequest(
      request: (dio) => dio.get("650b9fcb205af66dd4a2666b"),
      onMapping: (json) {
        final data = BaseResponse<IList<Produk>>.fromJson(json, (json) {
          debugPrint(json.toString());
          return IList.fromJson(
              json, (json) => Produk.fromJson(json as dynamic));
        });
        return data.record ?? IList();
      },
    );
  }

  @override
  Future<ResponseHandler<Produk>> fetchProduk(int id) {
    return requestHandler.doRequest(
      request: (dio) => dio.get("650ba298adb5f56d8f18a5a9"),
      onMapping: (json) {
        final data =
            BaseResponse.fromJson(json, (json) => Produk.fromJson(json));
        return data.record ?? Produk();
      },
    );
  }
}
