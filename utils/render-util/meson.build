inc_xcb += include_directories('.')

f_check += []
h_check += []

dep_int_renderutil = [xcb]

src = files(
)

lib = library('xcb-renderutil', src,
  include_directories: inc_xcb,
  dependencies: dep_int_renderutil,
  version: '0.0.0',
  install: true,
)

renderutil = declare_dependency(
  link_with: lib,
  include_directories: inc_xcb,
)

pkg.generate(lib,
  name: '',
  description: '',
  version: '',
  requires: 'xcb',
)