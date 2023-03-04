pkgname=ds4xb
_pkgname=${pkgname%-git}
pkgver=0.1
pkgrel=1
pkgdesc='DS4 V1 Utilities'
arch=('x86_64')
url="https://github.com/Kvn0l/ds4xb"
depends=('xboxdrv' 'evdevhook')
makedepends=()
conflicts=()
provide=("ds4xb")
source=("git+https://github.com/Kvn0l/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
