formula {
    product = "iay"
    name = "Iay"
    desc = "Minimilist shell prompt."
    homepage = "https://github.com/aaqaishtyaq/iay"
    architectures {
        amd64 {
            darwin {
                enable = true
                binary = "x86_64-apple-darwin"
            }
            linux {
                enable = true
                binary = "x86_64-unknown-linux-gnu"
            }
        }
        aarch64 {
            darwin {
                enable = true
                binary = "aarch64-apple-darwin"

            }
            linux {
                enable = true
                binary = "aarch64-unknown-linux-musl"
            }
        }
    }
}
