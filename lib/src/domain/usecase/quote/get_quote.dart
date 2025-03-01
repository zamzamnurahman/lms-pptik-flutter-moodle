part of 'quote.dart';

class GetQuote {
  final QuoteRepositoryImpl _quoteRepositoryImpl;

  GetQuote(this._quoteRepositoryImpl);

  Future<Either<Failure, QuoteModel>> execute(String tag) async {
    return await _quoteRepositoryImpl.getQuotes(tag);
  }
}
