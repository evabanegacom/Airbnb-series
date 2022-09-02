# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "axios", to: "https://ga.jspm.io/npm:axios@0.27.2/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/adapters/xhr.js"
pin "#lib/defaults/env/FormData.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/helpers/null.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/buffer.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "geolib", to: "https://ga.jspm.io/npm:geolib@3.3.3/es/index.js"
