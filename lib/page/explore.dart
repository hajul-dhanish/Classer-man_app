//
import 'package:flutter/material.dart';

import '../globalvar.dart';

const credentials = r'''
{
  "type": "service_account",
  "project_id": "classer-man",
  "private_key_id": "fb8f5b3536d30812ce979cebba0dcf3b954706ad",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFehdJPb6KuxN2\n7mumYRW1lgRZItFQ3i8HiLcHMHhv8p8zgEB4oQ43AfcCpJpb/ZHh3dXNemOh0x+0\ntBmsE8p3+K8zUztb5lVf3EO3eEzgaubNYXDnGNQOzTb5PFzy7HbbSe4nuydtoFRh\n8XP2SPFelF9D3INx2cCfrd3wIRkywWu4P2fSyPkwOTZbOHO3RxqtT9vdufXmX7HM\n2BO4Nu7uZ7Et6fuBN0Xi2FxvSqP5312OQUbJcY5+JM7BUnArzJM5Pli3ArBV8XqA\nOmfOrnbGItusowvK2WRj5gFn16iDULAovAyI/ZoUBFC6g0IXlMzC4oz3zBAJ4qTY\ntvlEefmHAgMBAAECggEAExa1L4g/Zeulewaa809JKO9iZjdeYmHHzAOkJZbC3Zdn\nWjQYh1CSLjELbn74yNGfC2VFKIKfJOJimzYZkS+sj6JDVUPDZiPCtux0w0Rmsf7D\nZrD3l+8neHLP0JHMLlM7PgFMexy1N/yai4kqe3Ebm9fdyZKERjoVS5oj7PVWGTi7\ngx2dwAIrHQsrG5mmfzyMnCZehWUEAL89wUz2yvzL+xbFoEU4Gxbx3MobXPdGetRg\nmKD5tHpl7jpSR8Kag+tTr5YrkkWvg9IbKTxE2Qd2Wcx3FpvPIP0rVl71fhXV6pIC\nJFCQIdFVkzSzh7keaINcGXp1aNqkBw92FVwcpRzZWQKBgQD32a4HQGG8N6lAWPRp\nXtl4kqOfmfu4oESF2azbtnV/TIojRIxkDULghOP3JgiqnJxkZ9QTiRy5MaSiy+zI\nzcKBmYuXhCe20YGB7x+6LBkKr8tmDGDzMUQyB6917LyRX8L81RD8M26HDzc58iT0\n4KrOotucB73JhVieKD3ezhkM+wKBgQDL+GKMBzurujKbVlRIDoQG3AmYxguHRmEP\nuLTP/g3vLBQ9vFBxag1UxOGZQELDp5UHk41QIFzRZOX8RV++Iz+g7DN0mmBgyTDZ\nwqFIMWGueJY4ryIkXhYscD6h6CkIK63WoeoqtPLz9jOpSzDqWFfDVaESLs+k41zX\naph2L1uH5QKBgQDHjW3+zKlkP3R4KKbwx7tUxswSzonLhs5k7nOsmuVTTy7RYnme\nfMbhul1JOkg0BdAtTyODbxu/R+cEZCgLLQ90BUpM/cxz947MLNlgreyjnBKp4UGV\nzI7ZsTJmQes5KN73bh000bwl5exTLVDwEIu1v44NvHXj8Qb+n+vgnhOxTQKBgGuB\nOP+w+ERk2TOCZt2ruO6cnvpEt+LOt22/3p0ZvGJpCyoWzRdZ3DjnpDhP5GCXPTdH\nD95BkGpVEdrK/dGLZof8toooq8+XewXrTXJthJyeth6eQBKG/IzjhD91y9qgmvlb\nUb68rKjlBQmfteJuOaOcyE57GbpAk7h+WGlCQK35AoGBAJ5YGmAcQ8vsjqbVITHN\ndjBmEEq2BH4dvk6kvuwkAYqYaBIcWPO9xMpAgFk/65/KHgbL6LdYiWgoYgMb5Q8i\nZNFHXHsnRJd9TfHPjKjcwm11O91DG50fRjOB8AenIXwBZQ3w/Hfb0lDFIFiIl9Fk\nTy+C91mAPdBpLcxRMlzm2h1/\n-----END PRIVATE KEY-----\n",
  "client_email": "classer-man@classer-man.iam.gserviceaccount.com",
  "client_id": "106049668445640084766",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/classer-man%40classer-man.iam.gserviceaccount.com"
}
''';

const spreadsheetid = '1oKFXdt9YbNpI4NnGlubgsikXzKqvPXmxrYlefJKrT34';

// void main() async {
//   final gsheet = GSheets(_credentials);
//   final ss = await gsheet.spreadsheet(_spreadsheetid);
//   var sheet = ss.worksheetByTitle('Project-classer');

//   final cellsRow = await sheet.cells.row(1);

//   runApp(const ExplorePage());
// }


class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);



  @override
  State<ExplorePage> createState() => _ExplorePageState();



}

class _ExplorePageState extends State<ExplorePage>  {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage("assets/class.png"),
              ),
            ),
            Div,
            
          ],
        ),
      ),
    );
  }
}