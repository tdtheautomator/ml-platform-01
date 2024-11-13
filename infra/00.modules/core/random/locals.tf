locals {
    output = join("", [random_string.randomstr.result, random_integer.randomint.result])
}