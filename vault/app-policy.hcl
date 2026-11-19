# A least-privilege policy: the app can only READ secrets under secret/myapp/.
path "secret/data/myapp/*" {
  capabilities = ["read"]
}
