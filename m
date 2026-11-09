Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F724606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r2YcF+uM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSuCuoSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=; b=r2YcF+uM5HNd0AsDOqYyQRZtW3
	VlR1QsVTFQgH00OD5alSNpEXZtTeqC18mtuYhd5lA5iiizMuE0otLUUi5sQ+825qtukBxVCc+3ssq
	i+nVVhQ0wH9lBz4d5Qa4NilXY2LrzEYbyvlTqmIqNrWtLpe6S8X2tfi1gOLhWR0m+bGw/ZNIV9+Zt
	pgsioHqwBfe2cbNswFMRXBo2gp8HVGrVG8rMESDuuwDb6A7CrUA/o1+rnJ5SC1IlJE4PE69WH8JKo
	DzhcjgkWAGF/nQu7pQiKX7/cKua1OEHNy7uPQNTTqDjz+fLgQnoM+OXBgDUUbU7BEtoI3RbCcqa9e
	uWtd3Egg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOY2-00000000gsP-1ELm;
	Mon, 09 Nov 2026 12:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXu-00000000glf-3jqT;
	Mon, 09 Nov 2026 12:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A46B7458FB;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=HaduDaU1VmQ5rUWATXf2EjfXvF4b1oSR0EF/gYxiH/8jYe65vumNGALmr7bB+59bcUlC
	 mGC0XWN6rtFFhkeYJRv1ayFz8wpMYuSlAFNlhFfv6BgzN5l9sxxo0v26tZ03JSPBnh/Vm
	 ck3A+3dtZ+fVVEuulfhRzlCcx7b25aAfuvndgPf372yE7r57bSQDWscntG+0ZPc5dwXoC
	 fEUjcGagSHUruf2ytaGfWSVcFXFX0BieyA/pMhiG+uCsRsTsxXFQOB3V/vRjb080+ozsW
	 l7izvKAusAT/0udXwtxnoI62jcQr/DD+VsvSFRcwBWhURk+lFNjNu84iaWwCpL4UpbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=;
	b=UTBaCL0gXZn4Y2fw3xWFKrRoZdeGWeAmpLcIXSZ2Uee6QaTL0bjeCvTlLU2m1xGzIoTc
	 xA0iuy+Oe+9ZTbbYj8ko9zFGH5ruVaPFP4XAVVk1QpW/8/shTsczlAbTRc1gfHENka+0L
	 brtapqM5wYosigBzx9wj2s4VUQRUJURj/BARgYBympNGTj8APuI7d5IedYqxXE/yRnyCs
	 wWZFrwLHkEWATaDB3LCvOOCMSDCBQp8YxEZGAvPbo+tqTRg0njChfPC8UoN+joOCH2Llj
	 V/PjIXB01Xw6g4rQgtAYOQSkbUPiQsMNUvNL+XHDbkKIRK0sES7gMFSoNkIx+e99jkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E4321F008A7;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=dxn+6uDuz6ndoJKiaFtcZm94n3JA2PZg9wgDsgFvyfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TSuCuoSA9DKf50OAYMmD/RggCkukek6tVSJfZlNKA2zAtffz6NlGvSOcPThg9xgOx
	 nXYFbm8bj9xcnvfS3tqK/ynrEiJxt+GS98Iiu4OXPBCZ5Xt84V4ztW1/zQSeMOHC+1
	 KhpO7BHgSebUcRGCK6Aw5s1zy+KtwHvbau/c+Lp8UFoceIx3tX7PIa8OsD1QCcQllP
	 ZvPl8oHY6dwLwVwFjTlWkG+lf/wOOniFD4gF6RTno7b1uHkFaoaySgoxVNT3FQFhnr
	 rlNCwMKsG72InIkCMO/e6ZZ2PxHJOIrhk+0uILZdCg3cIreCkghBQG2R0kZOZadI7C
	 +3Y+9Q+7w7yzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 304F04848E;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:17 +0100
Subject: [PATCH v6 2/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 family
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-2-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=5FUQR0rfH+5npztwgihS2KzQbqIydyXcLzR1mZxE4zY=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1Rqz7/SAbQQrbe2CSUO+hzIC8QLvggk98+u
 ViJ9qqcmPCJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UQAKCRA7Xj/jnsft
 6akgCACPf5E8p9CxpNI6k7h61C2X8pqJyIjbMbEgil14qH4Y6PD4y+iOQ10b0ZXhptGKo1hMiH5
 B4zpkjSDnl7FXeg5KC47PJkceMtW1py9xJVtvGLFLn8TIt9XuRLpn+sFZlPRln4GcRfMYJFHaTN
 rI9Uc3K/mPRqtXYNyGGp73dWRLscyYr3+vcB70l1MT0UVRNwEHwGahCVwkVAjxMGw2eXN4aN99o
 dRRr6D00wYnQj0anuovVoRLfsywaLaeghrDeRwbMTpw6RbTydFL01bAQlcx28s+cXaNOuORvZNE
 e15Orv1Kiyc3VDuNagGttKp2MjNfO7hbfRtoM31rHN4ZCfcr
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5B, 5B+ and 5T carry an on-board Realtek RTL8125 NIC
behind pcie2x1l2; the ROCK 5T has a second one behind pcie2x1l1.

Describe the PCI function nodes and attach ethernet0 (and, on the
ROCK 5T, ethernet1) aliases, so that U-Boot's fdt_fixup_ethernet() can
fill in their MAC addresses from its ethaddr/eth1addr environment.

The shared NIC goes in rk3588-rock-5b-5bp-5t.dtsi, the ROCK 5T's second
NIC in rk3588-rock-5t.dts.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts        | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b8d90936fc20..e8a3eb33e402 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -10,6 +10,7 @@
 
 / {
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -488,6 +489,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 425036146b6d..b1a3e4b2165f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -8,6 +8,10 @@ / {
 	model = "Radxa ROCK 5T";
 	compatible = "radxa,rock-5t", "rockchip,rk3588";
 
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
+
 	analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
@@ -76,6 +80,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x31 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.47.3



