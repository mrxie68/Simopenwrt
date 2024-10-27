rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

rm -rf feeds/packages/net/tailscale
git clone https://github.com/tailscale/tailscale.git feeds/packages/net/tailscale
go install tailscale.com/cmd/tailscale{,d}
./build_dist.sh tailscale.com/cmd/tailscale
./build_dist.sh tailscale.com/cmd/tailscaled


if [[ $WRT_TARGET == *"IPQ"* ]]; then
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
./scripts/feeds update istore
./scripts/feeds install -d y -p istore luci-app-store
fi

