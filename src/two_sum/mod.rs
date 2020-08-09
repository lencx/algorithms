// @author: lencx
// @create_at: Aug 09, 2020

use std::collections::HashMap;

#[allow(dead_code)]
pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
  let mut temp = HashMap::new();
  for i in 0..nums.len() {
    if let Some(v) = temp.get(&(target - nums[i])) {
      return vec![*v as i32, i as i32];
    }
    temp.insert(nums[i], i);
  }
  // panic!("Not Found");
  vec![]
}

#[test]
fn test() {
  assert_eq!(two_sum(vec![2, 5, 7, 11], 9), vec![0, 2]);
  assert_eq!(two_sum(vec![2, 5, 7, 11], 20), vec![]);
}
