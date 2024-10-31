rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

sed -i 's/PKG_VERSION:=1.70.0/PKG_VERSION:=1.76.0/' feeds/packages/net/tailscale/Makefile
sed -i 's/PKG_HASH:=8429728708f9694534489daa0a30af58be67f25742597940e7613793275c738f/PKG_HASH:=eaec1fa9a882d877ce6e5fb6ef47b3387124321a8963c66c4c37319106b5c5c2/' feeds/packages/net/tailscale/Makefile
rm -rf feeds/packages/net/tailscale/patches

if [[ $WRT_TARGET == *"IPQ"* ]]; then
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
fi

