pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  rec_append(reverse(first), second)
}

fn rec_append(first: List(a), second: List(a)) -> List(a) {
  case first {
    [] -> second
    [h, ..t] -> rec_append(t, [h, ..second])
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(lists, [], append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  rec_filter(list, function, [])
}

fn rec_filter(list: List(a), function: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [] -> reverse(acc)
    [h, ..t] ->
      case function(h) {
        True -> rec_filter(t, function, [h, ..acc])
        False -> rec_filter(t, function, acc)
      }
  }
}

pub fn length(list: List(a)) -> Int {
  rec_length(list, 0)
}

fn rec_length(list: List(a), acc: Int) -> Int {
  case list {
    [] -> acc
    [_, ..tail] -> {
      let acc = acc + 1
      rec_length(tail, acc)
    }
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  rec_map(list, function, [])
}

fn rec_map(list: List(a), function: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> reverse(acc)
    [h, ..t] -> rec_map(t, function, [function(h), ..acc])
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [h, ..t] -> foldl(t, function(initial, h), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [h, ..t] -> function(foldr(t, initial, function), h)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  rec_reverse(list, [])
}

fn rec_reverse(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [h, ..t] -> rec_reverse(t, [h, ..acc])
  }
}
