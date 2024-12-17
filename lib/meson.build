inc_xcb += include_directories('.')

f_check += []
h_check += []

dep_int_xcb = []

src = files(
)

lib = library('xcb', src,
  include_directories: inc_xcb,
  dependencies: dep_int_xcb,
  version: '0.0.0',
  install: true,
)

xcb = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: '',
)