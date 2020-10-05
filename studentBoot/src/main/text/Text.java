import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
public class Text {

    public static void main(String[] args) {

        Text t = new Text();//10,2,[1,1,2,3,7,7,7,9,9,10]
        int[] a = {1,1,2,3,7,7,7,9,9,10};
        System.out.println(t.upper_bound(10, 2, a));
    }
            /**
             * 二分查找
             * @param n int整型 数组长度
             * @param v int整型 查找值
             * @param a int整型一维数组 有序数组
             * @return int整型
             */
            public int upper_bound(int n,int v,int[] a) {
                int start=0;
                int end=n;
                return find(start,end,a,v);

            }
            public int find(int start,int end,int[]a ,int v){
                int middle=(start+end)/2;
                if(v<a[middle]){
                    find(start,middle-1,a,v);
                }else if(v>a[middle]){
                    find(middle+1,end,a,v);
                }else if(v==a[middle]){
                    return middle;
                }
                    return a.length+1;
            }

}
