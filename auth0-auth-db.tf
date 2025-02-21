module "auth0-auth-db" {
  source   = "./modules/auth0-auth-db"
  for_each = { for v in var.db_connections : v.name => v }

  name                      = each.value.name
  password_policy           = lookup(each.value, "password_policy", "good")
  password_history          = lookup(each.value, "password_history", { enable = true, size = 3 })
  password_no_personal_info = lookup(each.value, "password_no_personal_info", true)
  password_dictionary       = lookup(each.value, "password_dictionary", { enable = true, dictionary = [] })
  brute_force_protection    = lookup(each.value, "brute_force_protection", true)
}
