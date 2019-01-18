public class ObjectUtils {

    public static boolean isEmpty(Object s) {
        if (s == null) {
            return true;
        }
        if ((s instanceof String) && (((String)s).trim().length() == 0)) {
            return true;
        }
        if (s instanceof Map) {
            return ((Map<?, ?>)s).isEmpty();
        }
        if (s instanceof List) {
            return ((List<?>)s).isEmpty();
        }
        if (s instanceof Object[]) {
            return (((Object[])s).length == 0);
        }
        return false;
    }
}


--배열을 문자열 또는 리스트로 변환

배열을 문자열로 변환: java.util.Arrays 클래스의 toString() 함수를 이용
String[] array = new String[]{
  "a",
  "b",
  "c"
};
String text = Arrays.toString(array);
System.out.printf("%s\n", text);

결과: [a, b, c]

배열을 리스트로 변환: java.util.Arrays 클래스의 asList() 함수를 이용
String[] array = new String[]{
  "a",
  "b",
  "c"
};
List<String> list = Arrays.asList(array);
System.out.printf("%s\n", list);

결과: [a, b, c]


!) Arrays 클래스를 이용하게 되는 경우 ', ' 구분자에 [] 로 쌓여 있는 문자열을 얻게 된다.
다른 형식의 문자열 결과를 원하는 경우 아래 링크를 참조한다.






1) Join String Array using String.join() method – Java 8
String[] greeting = {"Hey", "there", "amigo!"};
String delimiter = " ";
String.join(delimiter, greeting) 







/*
        Java String Array to String Example
        This Java String Array to String Length example shows how to convert String array to
        Java String object.
 */
 
import java.util.Arrays;
 
public class StringArrayToStringExample {
       
        public static void main(String args[]){
               
                //String array
                String[] strArray =
                        new String[]{"Java", "String", "Array", "To", "String", "Example"};
               
               
                /*
                 * There are several in which we can convert String array to
                 * String.
                 */
               
                /*
                 * 1. Using Arrays.toString method
                 * This method returns string like [element1, element2..]
                 */
               
                String str1 = Arrays.toString(strArray);               
                //replace starting "[" and ending "]" and ","
                str1 = str1.substring(1, str1.length()-1).replaceAll(",", "");
               
                System.out.println("String 1: " + str1);
                /*
                 * 2. Using Arrays.asList method followed by toString.
                 * This method also returns string like [element1, element2..]
                 */
               
                String str2 = Arrays.asList(strArray).toString();
                //replace starting "[" and ending "]" and ","
                str2 = str2.substring(1, str2.length()-1).replaceAll(",", "");
                System.out.println("String 2: " + str2);
               
                /*
                 * PLEASE NOTE that if the any of the array elements contain ",", it will be
                 * replaced too. So above both methods does not work 100%.
                 */
               
                //3. Using StringBuffer.append method
                StringBuffer sbf = new StringBuffer();
               
                if(strArray.length > 0){
                       
                        sbf.append(strArray[0]);
                        for(int i=1; i < strArray.length; i++){
                                sbf.append(" ").append(strArray[i]);
                        }
                       
                }
                System.out.println("String 3: " + sbf.toString());
               
        }
       
}
 
/*
Output of above example would be
String 1: Java String Array To String Example
String 2: Java String Array To String Example
String 3:Java String Array To String Example
*/



jQuery.ajax({
    type: "GET|POST|DELETE|PUT",
    url: url,
    data: data,
    dataType:"text|html|json|jsonp|script|xml"
    success: success_callback,
    error: error_callback
});
Common Options

The most commonly used jQuery.ajax() options are the following, for a complete list see the jQuery API reference:

type
Specify the request method. It can be one of the "GET", "POST", "DELETE", "PUT" values.

url
Url of the resource on the web.

data
Data to be sent in the body of the request.

dataType
Specifies the type of data expected in the response and how that data should be processed by jQuery. Legal values are "text", "html", "script", "json", "jsonp", and "xml".

success
Callback function to be invoked when the request is completed. 











