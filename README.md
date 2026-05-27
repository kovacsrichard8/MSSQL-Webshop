# MSSQL-Webshop
MSSQL webshop database implementation with sample data

## Webshop adatbázis modell (T-SQL)

A projekt egy webáruház alapvető üzleti logikáját kezeli és mutatja be egy relációs adatbáziskezelő környezetben SQL Server Management Studio segítségével.

---

## Webáruház felépítésének szakaszai

Az adatbázis teljes implementációja, minta adatokkal való feltöltése és tesztelése négy szakaszban valósult meg:

### 1. Táblák létrehozása (schema.sql)

- `Customers`: *(Vásárlói adatok megadása egyedi e-mail címekkel)*
- `Product_Categories`: *(Tetszőleges termék kategóriák beállítása)*
- `Products`: *(A termékek nevei, ára és kategóriákhoz való rendelése)*
- `Orders`: *(A rendelések főbb adatai azok alapján, hogy ki, mikor rendelt és milyen státuszban van a rendelése)*
- `Order_Items`: *(Kapcsolótábla a rendelések és a termékek kapcsolatával, megjelenítve a mennyiséget és az egységárat)*
- `Payments`: *(A megkísérelt és végbement fizetési tranzakciókat tartalmazó tábla)*

Link: [Schema.sql](https://learn.microsoft.com/hu-hu/rest/api/compute/virtual-machines?view=rest-compute-2025-04-01)

### 2. Minta adatok feltöltése

A táblák minta adatokkal való feltöltése, hogy az adatbázis használatot előkészítsem és a későbbiekben tesztelhessem a megfelelő működését.

Link: [Insert_data.sql](https://learn.microsoft.com/hu-hu/rest/api/compute/virtual-machines?view=rest-compute-2025-04-01) 

### 3. Indexek beállítása

A táblák bizonyos mezőihez indexek létrehozása a jobb teljesítmény és a lekérdezések felgyorsítása érdekében. 

Link: [Indexes.sql](https://learn.microsoft.com/hu-hu/rest/api/compute/virtual-machines?view=rest-compute-2025-04-01) 

### 4. Lekérdezések az adatbázisból

#### A, Rendelés részleteinek kilistázása az alábbi szempontok alapján:

- rendelés azonosító
- vásárló neve
- termék neve
- mennyiség
- egységár
- sor összértéke

#### B, Rendelésenkénti összérték 

Megmutatja az összes rendelés teljes értékét. 

#### C, Vásárlónkénti rendelésszám 

Megmutatja, hogy egyes vásárlóknak hány rendelése volt.

#### D, Legtöbbet rendelt termékek 

Megmutatja a termékeket a rendelt mennyiség alapján csökkenő sorrendben.

#### E, Kategóriánkénti termékek száma

Megmutatja, hogy egyes kategóriákban hány termék található.

#### F, Még nem rendelő vásárlók 

Megmutatja azokat a vásárlókat, akik még nem adtak le rendelést.

#### G, Fizetett és nem fizetett rendelések 

Megmutatja mely rendelésekhez tartozik sikeres fizetés, és melyekhez nem.

Link: [Queries.sql](https://learn.microsoft.com/hu-hu/rest/api/compute/virtual-machines?view=rest-compute-2025-04-01)






