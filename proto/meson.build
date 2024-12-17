inc_xcb += include_directories('.')

f_check += []
h_check += []

src = files(
)

lib = library('xcb-proto', src,
  include_directories: inc_xcb,
  version: '0.0.0',
  install: true,
)

xcbproto = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: '',
)