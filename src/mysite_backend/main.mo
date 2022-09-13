import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";

actor {
  public func qsort(arr: [Int]): async [Int] {
    sort(arr)
  };

  func sort(arr: [Int]): [Int] {
    var newArr: [var Int] = Array.thaw(arr);
    partition(newArr, 0, newArr.size() - 1);
    Array.freeze(newArr)
  };

  func partition(arr: [var Int], l: Nat, r: Nat) {
    if (l >= r) return;
		// t为基数，即待排序数组的第一个数
    var t = arr[l];
    var left = l;
    var right = r;
    while(left < right) {
      // 从右往左找第一个小于基数的数
      while(arr[right] >= t and right > left) {
        right -= 1;
      };
      arr[left] := arr[right];
      // 从左往右找第一个大于基数的数
      while(arr[left] <= t and left < right) {
        left += 1;
      };
      arr[right] := arr[left];
    };
    arr[right] := t;
    if (left >= 1) {
      partition(arr, l, left-1);
    };
    partition(arr, left+1, r);
  };
};