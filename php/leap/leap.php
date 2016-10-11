<?php

// learned: no type hinting for scalar types!
function isLeap($year) {
  $m = function($mod) use ($year) {
    return $year % $mod == 0;
  };

  return $m(4) && (!$m(100) || $m(400));
}

