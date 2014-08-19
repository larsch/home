`vboxmanage list runningvms`.scan(/^"(\w+)"/).each do |vm, _|
  system "vboxmanage", "controlvm", vm, "acpipowerbutton"
end
