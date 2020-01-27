locals {
  baselist = ["A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A"]
  
  e1-list = split(",", join(",", data.template_file.e1-two.*.rendered))

  e2-list = (split(",", join(",", data.template_file.e2-two.*.rendered)))
}


data "template_file" "e1-one" {
  count    = var.e1-size
  template = count.index
}
 
data "template_file" "e1-two" {
  count    = var.e2-size
  template = join(",", data.template_file.e1-one.*.rendered)
}


data "template_file" "e2-one" {
  count    = var.e2-size
  template = count.index
}

data "template_file" "e2-two" {
  count    = length(data.template_file.e2-one.*.rendered)
  template = join(",",slice(split(",", replace(join(",", local.baselist), "A", data.template_file.e2-one.*.rendered[count.index])), 0, var.e1-size))
}