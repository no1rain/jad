CREATE FUNCTION [dbo].[FN_SPLIT] (
     @리스트   VARCHAR(MAX)
    ,@분리자   VARCHAR(10)
)
RETURNS @TB TABLE
(
POS     INT IDENTITY PRIMARY KEY,
VAL1    VARCHAR(200)
)
AS
/*
- '' 값도 반환한다
- 마지막은 분리자로 끝낸다
SELECT * FROM  dbo.[FN_SPLIT]('^1^^333^2^222^3^333^4^444^5^555^6^666^7^777^8^888^9^999','^') A
SELECT * FROM  dbo.[FN_SPLIT]('1^^22^^^^^^444444','^^') A
*/
BEGIN
    DECLARE @시작위치   SMALLINT
           ,@마지막위치  SMALLINT
           ,@카운터    SMALLINT
           ,@분리자크기  SMALLINT

    SELECT @분리자크기 = LEN(@분리자)

    IF RIGHT(@리스트,@분리자크기)!=@분리자
    BEGIN
        SET @리스트=@리스트+@분리자
    END

    SET @리스트=@분리자+@리스트

    SET @시작위치 = 1
    SELECT @마지막위치 = CHARINDEX (@분리자,@리스트 ,@시작위치+@분리자크기)
    SET @카운터 = 0
    WHILE (1=1)
    BEGIN
        SET @시작위치 = CHARINDEX (@분리자,@리스트 )
        SELECT @마지막위치 = CHARINDEX (@분리자,@리스트 ,@시작위치+@분리자크기)
        IF @마지막위치 <= 0 BREAK
        INSERT INTO @TB(VAL1) VALUES (SUBSTRING(@리스트,@시작위치+@분리자크기,@마지막위치-@시작위치-@분리자크기))
        SELECT @리스트 = STUFF(@리스트,@시작위치,@분리자크기,'')
        SET @카운터 = @카운터 + 1
    END
    RETURN
END



-------------------------------------------------------------------------------------------------------
-- Split 유형의 함수
-- 문자열에서 구분자(@iSeparator)로 몇번째 단어 가져오기
-- 예 : SELECT 데이터베이스명.소유자명.fn_GetIdxDataLikeSplit('가-나-다',2,'-') -> '나'
-------------------------------------------------------------------------------------------------------
CREATE FUNCTION [dbo].[fn_GetIdxDataLikeSplit] (
     @iText         VARCHAR(200)
    ,@idx           INT
    ,@iSeparator    VARCHAR(10) = '-'
)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @vData      VARCHAR(200)
    DECLARE @vText      VARCHAR(200)
    DECLARE @vSeparator VARCHAR(10)
    DECLARE @nNum       INT

    SET @vData      = '';
    SET @nNum       = 1;
    SET @vSeparator = LTRIM(RTRIM(@iSeparator));
    SET @vText      = LTRIM(LTRIM(@iText)) + @vSeparator

    IF CHARINDEX(@vSeparator, @iText) > 0
    BEGIN
        WHILE @idx >= @nNum
        BEGIN
            IF CHARINDEX(@vSeparator, @vText) > 0
            BEGIN
                --문자열의 인덱스 위치의 요소를 반환
                SET @vData = SUBSTRING(@vText, 1, CHARINDEX(@vSeparator, @vText) - 1);
                SET @vData = LTRIM(RTRIM(@vData));

                --반환된 문자는 버린 후 좌우공백 제거
                SET @vText = LTRIM(RTRIM(RIGHT(@vText, LEN(@vText) - (LEN(@vData) + LEN(@iSeparator)))))
            END
            ELSE
            BEGIN
                SET @vData = ''
            END
            SET @nNum = @nNum + 1
        END
    END
    ELSE
    BEGIN
        SET @vData = @iText
    END

    RETURN (@vData)
END



DECLARE @items NVARCHAR(MAX)
SET @items = '111,222,333,444,555,666,777,888,999'

DECLARE @delimiter NVARCHAR(1)
SET @delimiter = ','

DECLARE @item NVARCHAR(MAX)
SET @item = NULL

DECLARE @results TABLE (
    Item    NVARCHAR(MAX)
)

WHILE LEN(@items) > 0
BEGIN
    DECLARE @index    INT
    SET @index = PATINDEX('%' + @delimiter + '%', @items)
    IF @index > 0
    BEGIN
        SET @item = SUBSTRING(@items, 0, @index)
        SET @items = SUBSTRING(@items, LEN(@item + @delimiter) + 1, LEN(@items))

        INSERT INTO @results ( Item ) VALUES ( @item )
    END
    ELSE
    BEGIN
        SET @item = @items
        SET @items = NULL

        INSERT INTO @results ( Item ) VALUES ( @item )
    END
END

SELECT * FROM @results







CREATE FUNCTION arr_split(
     @sText  VARCHAR(500)    -- 대상 문자열
    ,@str    CHAR(1) = '|'   -- 구분기호(Default '|')
    ,@idx    INT             -- 배열 인덱스

)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @word       CHAR(20)        -- 반환할 문자
          , @sTextData  VARCHAR(600)
          , @num        SMALLINT;

    SET @num = 1;
    SET @str = LTRIM(RTRIM(@str));
    SET @sTextData = LTRIM(RTRIM(@sText)) + @str;

    WHILE @idx >= @num
    BEGIN
        IF CHARINDEX(@str, @sTextData) > 0
        BEGIN
            -- 문자열의 인덱스 위치의 요소를 반환
            SET @word = SUBSTRING(@sTextData, 1, CHARINDEX(@str, @sTextData) - 1);
            SET @word = LTRIM(RTRIM(@word));

            -- 반환된 문자는 버린후 좌우공백 제거
            SET @sTextData = LTRIM(RTRIM(RIGHT(@sTextData, LEN(@sTextData) - (LEN(@word) + 1))))
        END
        ELSE
        BEGIN
            SET @word = NULL;
        END
        SET @num = @num + 1
    END
    RETURN(@word);
END






/*
 *  해당 문자열을 해당 구분문자로 분리하여 테이블형식으로 반환한다.
 *  2005년 12월 14일 - 이세영 -
 */
CREATE FUNCTION FN_SPLIT (
     @StrValue      VARCHAR(1000)   -- 분리할 문자열
    ,@SplitChar     VARCHAR(1)      -- 구분할 문자
)
RETURNS @SPLIT_TEMP TABLE ( VALUE VARCHAR(50) )
AS
BEGIN
    DECLARE @oPos INT, @nPos INT
    DECLARE @TmpVar VARCHAR(1000) -- 분리된 문자열 임시 저장변수

    SET @oPos = 1 -- 구분문자 검색을 시작할 위치
    SET @nPos = 1 -- 구분문자 위치

    WHILE (@nPos > 0)
    BEGIN

        SET @nPos = CHARINDEX(@SplitChar, @StrValue, @oPos )

        IF @nPos = 0
            SET @TmpVar = RIGHT(@StrValue, LEN(@StrValue)-@oPos+1 )
        ELSE
            SET @TmpVar = SUBSTRING(@StrValue, @oPos, @nPos-@oPos)

        IF LEN(@TmpVar)>0
            INSERT INTO @SPLIT_TEMP VALUES( @TmpVar )

        SET @oPos = @nPos +1
    END
    RETURN
END


[사용방법]

SELECT * FROM FN_SPLIT('빨강|노랑|파랑|빨강|노랑|','|')
SELECT * FROM FN_SPLIT('A,B,C,D,A',',')





CREATE FUNCTION [dbo].[fn_SplitNumber](
    @String VARCHAR(8000)
)
RETURNS @Array TABLE
(
DataSeq     INT IDENTITY(1,1),
Data        FLOAT
)
AS
BEGIN
DECLARE
    @Value      FLOAT
,   @Temp       VARCHAR(100)
,   @Length     SMALLINT
,   @CurrentIndex   SMALLINT
,   @NextIndex  SMALLINT

SET @Length = LEN(@String)
SET @CurrentIndex = 1
SET @NextIndex = 1


WHILE @NextIndex > 0
BEGIN
SET @NextIndex = CHARINDEX(',', @String, @CurrentIndex)

IF @NextIndex = 0
BEGIN
SET @Temp = SUBSTRING(@String, @CurrentIndex, (@Length - @CurrentIndex + 1))
END
ELSE
BEGIN
SET @Temp = SUBSTRING(@String, @CurrentIndex, (@NextIndex - @CurrentIndex))
SET @CurrentIndex = @NextIndex + 1
END
IF @Temp <> ''
BEGIN
SET @Value = CONVERT(FLOAT, @Temp)
INSERT @Array VALUES(@Value)
END
END
RETURN
END














--. 테이블 명세서 출력
SELECT  A.TABLE_SCHEMA              AS [스키마]
    ,   A.TABLE_NAME                    AS [테이블명]
    ,   A.COLUMN_NAME               AS [컬럼명]
    ,   B.ColumnDescription             AS [컬럼 설명]
    ,   A.ORDINAL_POSITION              AS [순서]
    ,   A.DATA_TYPE                 AS [데이터 타입]
    ,   CASE
            WHEN A.CHARACTER_MAXIMUM_LENGTH IS NULL THEN
                ISNULL(A.NUMERIC_PRECISION, '')
            ELSE A.CHARACTER_MAXIMUM_LENGTH
        END                             AS [길이]
    ,   A.IS_NULLABLE                   AS [NULL 여부]
    ,   ISNULL(A.COLUMN_DEFAULT, '')        AS [디폴트 값]
FROM  INFORMATION_SCHEMA.COLUMNS AS A WITH (NOLOCK)
    INNER JOIN (
        SELECT  A.name  AS TableName
            ,   B.name  AS ColumnName
            ,   C.Value     AS ColumnDescription
        FROM    sys.tables AS A WITH (NOLOCK)
                INNER JOIN sys.columns AS B WITH (NOLOCK)
                    ON A.object_id = B.object_id
                INNER JOIN sys.extended_properties AS C WITH (NOLOCK)
                    ON A.object_id = C.major_id
                    AND B.column_id = c.minor_id
        ) AS B
            ON A.TABLE_NAME = B.TableName
            AND A.COLUMN_NAME = B.ColumnName
WHERE A.TABLE_NAME = 'tb_Test'









-- SQL Server 배열형 매개변수 처리

개발을 하다 보면 1차원 배열을 받아서 테이블 형태로 가공한 뒤 처리해야 할 경우가 발생한다.
이를 처리하는 방법에 대한 정리.

Method 1: Dynamic SQL

CREATE PROC dbo.GetOrderList1
(
    @OrderList varchar(500)
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @SQL varchar(600)

    SET @SQL =
    'SELECT OrderID, CustomerID, EmployeeID, OrderDate
    FROM dbo.Orders
    WHERE OrderID IN (' + @OrderList + ')'

    EXEC(@SQL)
END
GO

EXEC dbo.GetOrderList1 '10248,10252,10256,10261,10262,10263,10264,10265,10300,10311'
GO

Method 2: Pass...

Method 3: Parsing the comma separated values into a table variable and joining the table variable to main table

CREATE PROC dbo.GetOrderList3
(
    @OrderList varchar(500)
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @TempList table
    (
        OrderID int
    )

    DECLARE @OrderID varchar(10), @Pos int

    SET @OrderList = LTRIM(RTRIM(@OrderList))+ ','
    SET @Pos = CHARINDEX(',', @OrderList, 1)

    IF REPLACE(@OrderList, ',', '') <> ''
    BEGIN
        WHILE @Pos > 0
        BEGIN
            SET @OrderID = LTRIM(RTRIM(LEFT(@OrderList, @Pos - 1)))
            IF @OrderID <> ''
            BEGIN
                INSERT INTO @TempList (OrderID) VALUES (CAST(@OrderID AS int)) --Use Appropriate conversion
            END
            SET @OrderList = RIGHT(@OrderList, LEN(@OrderList) - @Pos)
            SET @Pos = CHARINDEX(',', @OrderList, 1)


        END
    END

    SELECT o.OrderID, CustomerID, EmployeeID, OrderDate
    FROM    dbo.Orders AS o
        JOIN
        @TempList t
        ON o.OrderID = t.OrderID

END
GO

EXEC dbo.GetOrderList3 '10248,10252,10256,10261,10262,10263,10264,10265,10300,10311'
GO


Method 4: Using XML

CREATE PROC dbo.GetOrderList4
(
    @OrderList varchar(1000)
)
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @DocHandle int

    EXEC sp_xml_preparedocument @DocHandle OUTPUT, @OrderList

    SELECT o.OrderID, CustomerID, EmployeeID, OrderDate
    FROM    dbo.Orders AS o
        JOIN
        OPENXML (@DocHandle, '/ROOT/Ord',1) WITH (OrderID  int) AS x
        ON o.OrderID = x.OrderID

    EXEC sp_xml_removedocument @DocHandle
END
GO

EXEC dbo.GetOrderList4 '
<ROOT>
<Ord OrderID = "10248"/> <Ord OrderID = "10252"/>
<Ord OrderID = "10256"/> <Ord OrderID = "10261"/>
<Ord OrderID = "10262"/> <Ord OrderID = "10263"/>
<Ord OrderID = "10264"/> <Ord OrderID = "10265"/>
<Ord OrderID = "10300"/> <Ord OrderID = "10311"/>
<Ord OrderID = "11068"/> <Ord OrderID = "11069"/>
<Ord OrderID = "11070"/> <Ord OrderID = "11071"/>
<Ord OrderID = "11072"/> <Ord OrderID = "11073"/>
<Ord OrderID = "11074"/> <Ord OrderID = "11075"/>
<Ord OrderID = "11076"/> <Ord OrderID = "11077"/>
</ROOT>'
GO


Method 5: Using a table of numbers or pivot table, to parse the comma separated list

--Create a table called Numbers
CREATE TABLE dbo.Numbers
(
    Number int PRIMARY KEY CLUSTERED
)
GO

--Insert 8000 numbers into this table (from 1 to 8000)
SET NOCOUNT ON
GO

DECLARE @CTR int
SET @CTR = 1
WHILE @CTR < 8001
BEGIN
    INSERT INTO dbo.Numbers (Number) VALUES (@CTR)
    SET @CTR = @CTR + 1
END
GO
--The above two steps are to be run only once. The following stored procedure uses the number table.

CREATE PROC dbo.GetOrderList5
(
    @OrderList varchar(1000)
)
AS
BEGIN
    SET NOCOUNT ON

    SELECT o.OrderID, CustomerID, EmployeeID, OrderDate
    FROM dbo.Orders AS o
    JOIN
    (

        SELECT LTRIM(RTRIM(SUBSTRING(OrderID, number+1, CHARINDEX(',', OrderID, number+1)-number - 1))) AS OrderID
        FROM
        (
            SELECT ',' + @OrderList + ',' AS OrderID
        ) AS InnerQuery
        JOIN
        Numbers n
        ON
        n.Number < LEN(InnerQuery.OrderID)
        WHERE SUBSTRING(OrderID, number, 1) = ','
    ) as Derived
    ON o.OrderID = Derived.OrderID

END
GO

EXEC dbo.GetOrderList5 '10248,10252,10256,10261,10262,10263,10264,10265,10300,10311'
GO

Method 6: Using a general purpose User Defined Function (UDF) to parse the comma separated OrderIDs

--The following is a general purpose UDF to split comma separated lists into individual items.
--Consider an additional input parameter for the delimiter, so that you can use any delimiter you like.
CREATE FUNCTION dbo.SplitOrderIDs
(
    @OrderList varchar(500)
)
RETURNS
@ParsedList table
(
    OrderID int
)
AS
BEGIN
    DECLARE @OrderID varchar(10), @Pos int

    SET @OrderList = LTRIM(RTRIM(@OrderList))+ ','
    SET @Pos = CHARINDEX(',', @OrderList, 1)

    IF REPLACE(@OrderList, ',', '') <> ''
    BEGIN
        WHILE @Pos > 0
        BEGIN
            SET @OrderID = LTRIM(RTRIM(LEFT(@OrderList, @Pos - 1)))
            IF @OrderID <> ''
            BEGIN
                INSERT INTO @ParsedList (OrderID)
                VALUES (CAST(@OrderID AS int)) --Use Appropriate conversion
            END
            SET @OrderList = RIGHT(@OrderList, LEN(@OrderList) - @Pos)
            SET @Pos = CHARINDEX(',', @OrderList, 1)

        END
    END
    RETURN
END
GO

CREATE PROC dbo.GetOrderList6
(
    @OrderList varchar(500)
)
AS
BEGIN
    SET NOCOUNT ON

    SELECT  o.OrderID, CustomerID, EmployeeID, OrderDate
    FROM    dbo.Orders AS o
        JOIN
        dbo.SplitOrderIDs(@OrderList) AS s
        ON
        o.OrderID = s.OrderID
END
GO

EXEC dbo.GetOrderList6 '10248,10252,10256,10261,10262,10263,10264,10265,10300,10311'
GO

Best Solution (최상의 성능과 간단한 구현)
: 천재다...
DECLARE @textXML XML
DECLARE @data NVARCHAR(MAX),
        @delimiter NVARCHAR(5)

SELECT  @data = 'A,B,C',
        @delimiter = ','

SELECT    @textXML = CAST('<d>' + REPLACE(@data, @delimiter, '</d><d>') + '</d>' AS XML)
SELECT  T.split.value('.', 'nvarchar(max)') AS data
FROM    @textXML.nodes('/d') T(split)

참고 URL
http://vyaskn.tripod.com/passing_arrays_to_stored_procedures.htm
http://stackoverflow.com/questions/1922191/passing-array-as-parameter-to-sql-2005-stored-procedure






-- MSSQL 문자열 구분자 분리 (테이블 반환 함수)
CREATE FUNCTION [dbo].[fn_Split]
(
     @pSource    VARCHAR(MAX)
    ,@pSeparator VARCHAR(1)
)
RETURNS @TAB_RETURN TABLE
(
     ItemIndex   INT
    ,ItemValue   VARCHAR(1000)
)
AS
BEGIN
    DECLARE @buffer VARCHAR(MAX);
    DECLARE @item   VARCHAR(MAX);

    DECLARE @tmp   INT;
    DECLARE @index INT;


    SET     @index = 1;

    WHILE LEN(@pSource) > 0
    BEGIN
        SET @tmp = CHARINDEX(@pSeparator, @pSource);

        IF @tmp > 0
        BEGIN
            SET @item    = SUBSTRING(@pSource, 1, @tmp - 1);
            SET @pSource = RIGHT(@pSource, LEN(@pSource) - @tmp);
            INSERT INTO @TAB_RETURN VALUES(@index, @item);

            SET @index = @index + 1;
        END ELSE
        BEGIN
            INSERT INTO @TAB_RETURN VALUES(@index, @pSource);

            BREAK;
        END;
    END;

    RETURN
END












































































































