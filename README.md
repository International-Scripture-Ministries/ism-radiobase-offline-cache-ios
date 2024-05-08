# offline-db

Offline db capacitor plugin for iOS.

## Install

```bash
npm install offline-db
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`getAllBooks()`](#getallbooks)
* [`getVerses(...)`](#getverses)
* [`getBookTeaching(...)`](#getbookteaching)
* [`getTeachings(...)`](#getteachings)
* [`getTeaching(...)`](#getteaching)
* [`getTotalDownloads()`](#gettotaldownloads)
* [`getDownloadList(...)`](#getdownloadlist)
* [`getPercentage(...)`](#getpercentage)
* [`getBookPercentage(...)`](#getbookpercentage)
* [`updateDownload(...)`](#updatedownload)
* [`deleteDownloads(...)`](#deletedownloads)
* [`delete(...)`](#delete)
* [`getBookDownloads(...)`](#getbookdownloads)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### getAllBooks()

```typescript
getAllBooks() => Promise<{ result: any; }>
```

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getVerses(...)

```typescript
getVerses(bookId: string, bibleId: String, chapterNumber: Number) => Promise<{ result: any; }>
```

| Param               | Type                                      |
| ------------------- | ----------------------------------------- |
| **`bookId`**        | <code>string</code>                       |
| **`bibleId`**       | <code><a href="#string">String</a></code> |
| **`chapterNumber`** | <code><a href="#number">Number</a></code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getBookTeaching(...)

```typescript
getBookTeaching(book_id: string) => Promise<{ result: any; }>
```

| Param         | Type                |
| ------------- | ------------------- |
| **`book_id`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getTeachings(...)

```typescript
getTeachings(bible_book: string) => Promise<{ result: any; }>
```

| Param            | Type                |
| ---------------- | ------------------- |
| **`bible_book`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getTeaching(...)

```typescript
getTeaching(book_id: string, teaching_uuid: string) => Promise<{ result: any; }>
```

| Param               | Type                |
| ------------------- | ------------------- |
| **`book_id`**       | <code>string</code> |
| **`teaching_uuid`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getTotalDownloads()

```typescript
getTotalDownloads() => Promise<{ result: any; }>
```

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getDownloadList(...)

```typescript
getDownloadList(book_id: string, file_type: string) => Promise<{ result: any; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`book_id`**   | <code>string</code> |
| **`file_type`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getPercentage(...)

```typescript
getPercentage(book_id: string, file_type: string) => Promise<{ result: any; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`book_id`**   | <code>string</code> |
| **`file_type`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getBookPercentage(...)

```typescript
getBookPercentage(file_type: string) => Promise<{ result: any; }>
```

| Param           | Type                |
| --------------- | ------------------- |
| **`file_type`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### updateDownload(...)

```typescript
updateDownload(file_name: string, local_path: String) => Promise<{ result: any; }>
```

| Param            | Type                                      |
| ---------------- | ----------------------------------------- |
| **`file_name`**  | <code>string</code>                       |
| **`local_path`** | <code><a href="#string">String</a></code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### deleteDownloads(...)

```typescript
deleteDownloads(book_id: string, file_type: String, chapterDownloads: Boolean, studyDownloads: Boolean) => Promise<{ result: any; }>
```

| Param                  | Type                                        |
| ---------------------- | ------------------------------------------- |
| **`book_id`**          | <code>string</code>                         |
| **`file_type`**        | <code><a href="#string">String</a></code>   |
| **`chapterDownloads`** | <code><a href="#boolean">Boolean</a></code> |
| **`studyDownloads`**   | <code><a href="#boolean">Boolean</a></code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### delete(...)

```typescript
delete(book_id: string, file_type: String, chapter_number: String, uuid: String) => Promise<{ result: any; }>
```

| Param                | Type                                      |
| -------------------- | ----------------------------------------- |
| **`book_id`**        | <code>string</code>                       |
| **`file_type`**      | <code><a href="#string">String</a></code> |
| **`chapter_number`** | <code><a href="#string">String</a></code> |
| **`uuid`**           | <code><a href="#string">String</a></code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### getBookDownloads(...)

```typescript
getBookDownloads(book_id: string) => Promise<{ result: any; }>
```

| Param         | Type                |
| ------------- | ------------------- |
| **`book_id`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ result: any; }&gt;</code>

--------------------


### Interfaces


#### String

Allows manipulation and formatting of text strings and determination and location of substrings within strings.

| Prop         | Type                | Description                                                  |
| ------------ | ------------------- | ------------------------------------------------------------ |
| **`length`** | <code>number</code> | Returns the length of a <a href="#string">String</a> object. |

| Method                | Signature                                                                                                                      | Description                                                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **toString**          | () =&gt; string                                                                                                                | Returns a string representation of a string.                                                                                                  |
| **charAt**            | (pos: number) =&gt; string                                                                                                     | Returns the character at the specified index.                                                                                                 |
| **charCodeAt**        | (index: number) =&gt; number                                                                                                   | Returns the Unicode value of the character at the specified location.                                                                         |
| **concat**            | (...strings: string[]) =&gt; string                                                                                            | Returns a string that contains the concatenation of two or more strings.                                                                      |
| **indexOf**           | (searchString: string, position?: number \| undefined) =&gt; number                                                            | Returns the position of the first occurrence of a substring.                                                                                  |
| **lastIndexOf**       | (searchString: string, position?: number \| undefined) =&gt; number                                                            | Returns the last occurrence of a substring in the string.                                                                                     |
| **localeCompare**     | (that: string) =&gt; number                                                                                                    | Determines whether two strings are equivalent in the current locale.                                                                          |
| **match**             | (regexp: string \| <a href="#regexp">RegExp</a>) =&gt; <a href="#regexpmatcharray">RegExpMatchArray</a> \| null                | Matches a string with a regular expression, and returns an array containing the results of that search.                                       |
| **replace**           | (searchValue: string \| <a href="#regexp">RegExp</a>, replaceValue: string) =&gt; string                                       | Replaces text in a string, using a regular expression or search string.                                                                       |
| **replace**           | (searchValue: string \| <a href="#regexp">RegExp</a>, replacer: (substring: string, ...args: any[]) =&gt; string) =&gt; string | Replaces text in a string, using a regular expression or search string.                                                                       |
| **search**            | (regexp: string \| <a href="#regexp">RegExp</a>) =&gt; number                                                                  | Finds the first substring match in a regular expression search.                                                                               |
| **slice**             | (start?: number \| undefined, end?: number \| undefined) =&gt; string                                                          | Returns a section of a string.                                                                                                                |
| **split**             | (separator: string \| <a href="#regexp">RegExp</a>, limit?: number \| undefined) =&gt; string[]                                | Split a string into substrings using the specified separator and return them as an array.                                                     |
| **substring**         | (start: number, end?: number \| undefined) =&gt; string                                                                        | Returns the substring at the specified location within a <a href="#string">String</a> object.                                                 |
| **toLowerCase**       | () =&gt; string                                                                                                                | Converts all the alphabetic characters in a string to lowercase.                                                                              |
| **toLocaleLowerCase** | (locales?: string \| string[] \| undefined) =&gt; string                                                                       | Converts all alphabetic characters to lowercase, taking into account the host environment's current locale.                                   |
| **toUpperCase**       | () =&gt; string                                                                                                                | Converts all the alphabetic characters in a string to uppercase.                                                                              |
| **toLocaleUpperCase** | (locales?: string \| string[] \| undefined) =&gt; string                                                                       | Returns a string where all alphabetic characters have been converted to uppercase, taking into account the host environment's current locale. |
| **trim**              | () =&gt; string                                                                                                                | Removes the leading and trailing white space and line terminator characters from a string.                                                    |
| **substr**            | (from: number, length?: number \| undefined) =&gt; string                                                                      | Gets a substring beginning at the specified location and having the specified length.                                                         |
| **valueOf**           | () =&gt; string                                                                                                                | Returns the primitive value of the specified object.                                                                                          |


#### RegExpMatchArray

| Prop        | Type                |
| ----------- | ------------------- |
| **`index`** | <code>number</code> |
| **`input`** | <code>string</code> |


#### RegExp

| Prop             | Type                 | Description                                                                                                                                                          |
| ---------------- | -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`source`**     | <code>string</code>  | Returns a copy of the text of the regular expression pattern. Read-only. The regExp argument is a Regular expression object. It can be a variable name or a literal. |
| **`global`**     | <code>boolean</code> | Returns a <a href="#boolean">Boolean</a> value indicating the state of the global flag (g) used with a regular expression. Default is false. Read-only.              |
| **`ignoreCase`** | <code>boolean</code> | Returns a <a href="#boolean">Boolean</a> value indicating the state of the ignoreCase flag (i) used with a regular expression. Default is false. Read-only.          |
| **`multiline`**  | <code>boolean</code> | Returns a <a href="#boolean">Boolean</a> value indicating the state of the multiline flag (m) used with a regular expression. Default is false. Read-only.           |
| **`lastIndex`**  | <code>number</code>  |                                                                                                                                                                      |

| Method      | Signature                                                                     | Description                                                                                                                   |
| ----------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **exec**    | (string: string) =&gt; <a href="#regexpexecarray">RegExpExecArray</a> \| null | Executes a search on a string using a regular expression pattern, and returns an array containing the results of that search. |
| **test**    | (string: string) =&gt; boolean                                                | Returns a <a href="#boolean">Boolean</a> value that indicates whether or not a pattern exists in a searched string.           |
| **compile** | () =&gt; this                                                                 |                                                                                                                               |


#### RegExpExecArray

| Prop        | Type                |
| ----------- | ------------------- |
| **`index`** | <code>number</code> |
| **`input`** | <code>string</code> |


#### Number

An object that represents a number of any kind. All JavaScript numbers are 64-bit floating-point numbers.

| Method            | Signature                                           | Description                                                                                                                       |
| ----------------- | --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **toString**      | (radix?: number \| undefined) =&gt; string          | Returns a string representation of an object.                                                                                     |
| **toFixed**       | (fractionDigits?: number \| undefined) =&gt; string | Returns a string representing a number in fixed-point notation.                                                                   |
| **toExponential** | (fractionDigits?: number \| undefined) =&gt; string | Returns a string containing a number represented in exponential notation.                                                         |
| **toPrecision**   | (precision?: number \| undefined) =&gt; string      | Returns a string containing a number represented either in exponential or fixed-point notation with a specified number of digits. |
| **valueOf**       | () =&gt; number                                     | Returns the primitive value of the specified object.                                                                              |


#### Boolean

| Method      | Signature        | Description                                          |
| ----------- | ---------------- | ---------------------------------------------------- |
| **valueOf** | () =&gt; boolean | Returns the primitive value of the specified object. |

</docgen-api>
