/*
 * @author: lencx
 * @create_at: Aug 09, 2020
 */

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
  let o = new Map();
  for (let i = 0; i < nums.length; i++) {
    const val = target - nums[i];
    if (o.has(val)) {
      return [o.get(val), i]
    } else {
      o.set(nums[i], i);
    }
  }
};
