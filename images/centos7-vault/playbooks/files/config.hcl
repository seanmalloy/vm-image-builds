storage "gcs" {
  bucket = "smalloy-sbx1-vault"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

seal "gcpckms" {
  project    = "smalloy-sbx1"
  region     = "us-central1"
  key_ring   = "vault-keyring"
  crypto_key = "vault-key"
}
