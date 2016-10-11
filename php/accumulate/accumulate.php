<?php

function accumulate(array $input, callable $accumulator) {
  $result = [];
  foreach ($input as $x){
    $result[] = call_user_func($accumulator, $x);
  }
  return $result;
}
