// @author: lencx
// @create_at: Aug 09, 2020

use std::collections::HashMap;

pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let mut temp = HashMap::new();
    for i in 0..nums.len() {
        if let Some(v) = temp.get(&(target - nums[i])) {
            return vec![*v as i32, i as i32];
        }
        temp.insert(nums[i], i);
    }
    panic!("Not Found");
}

// fn main() {
//   let value = two_sum(vec![1,2, 10, 20], 21);
//   println!("value:=> {:?}", value);
// }