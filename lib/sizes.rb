def human_size(n)
  return "0 B" if n.zero?
  sizes = %w{B KiB MiB GiB TiB PiB EiB ZiB YiB}
  x = (Math.log(n) / Math.log(1024)).floor
  n = n / (1024.0 ** x)
  n = n.round(2)
  n = n.to_i if n.round == n
  "#{n} #{sizes[x]}"
end
