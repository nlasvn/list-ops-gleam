pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case first {
    [h, ..t] -> [h, ..append(t, second)]
    _ -> second
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(lists, [], append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [h, ..t] ->
      case function(h) {
        True -> [h, ..filter(t, function)]
        False -> filter(t, function)
      }
    [] -> []
  }
}

pub fn length(list: List(a)) -> Int {
  case list {
    [_, ..tail] -> 1 + length(tail)
    [] -> 0
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [h, ..t] -> [function(h), ..map(t, function)]
    [] -> []
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [h, ..t] -> foldl(t, function(initial, h), function)
    [] -> initial
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [h, ..t] -> function(foldr(t, initial, function), h)
    [] -> initial
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  case list {
    [h, ..t] -> append(reverse(t), [h])
    [] -> []
  }
}
