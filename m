Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F468606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m3VA54x+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLFtpCd6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=; b=m3VA54x+oYkksETE2kiUFVFEiZ
	RNx7Gj6E39dd/DsJ7qdbf/ScW91UMvwoBpUIfiy5yp7lbGBNoPGGh/+rasJ7hfGIjCv3gJFVniO6U
	xKIO7vWbWW5oUwEK8m1ek+hgXGQV21Fhhe2FhqQ2J4MGkZGMbGTEyjBv//O23H1uLKP6K2yUtuD1T
	b3Ma97TjBSBuJUadrjgZE8i+yCKEqZKiqkqnvu72Z6yH88C9AT9G3383X2720dTy2sKdr4KvDtFNZ
	JKmfsg5v6QQEmXDF5W1hoocACnLVRUEx1QCS0+uT4Ryi7UVwRk30WPz1iNlU7DxRwEpWg4XOGuNYn
	+B661Enw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOY2-00000000guH-3aOq;
	Mon, 09 Nov 2026 12:32:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXu-00000000glX-3T3d;
	Mon, 09 Nov 2026 12:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 327A062DD4;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227541;
	b=rh6/20QVS+OtOlEE5IYCYIbXk4trkzT9BOFpX6Q8kqX0IL0vm+05z4VDBMS1KjHniZV6
	 OdH4JivOBNYY48j93+gP73yOIkEvlg+6Hc2OqSa9j+KA3tfetKS5E0dSEIUlDf4DnHlqN
	 5NIcR23wSApksPl66f5jT4c35k/1J3rp2fg/tCELHJqv28KtQA1r/rkAgnylnRU2+w43+
	 QqvQFxVS/zyb8YxTGdnAEu398b/jB4VvCLP42LloiO3F7PjZ5gqwcJcSQzMue57tEC4s7
	 oaDnc87Y7wffxpaS2O8+Swc80giFRjjmZpliaBrIdljsVqH6nP80i6fdoZAWZb0I3vw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=;
	b=3GAkKR7OuZoptemKw9A2Ac/X58msgoJiBKNSPvx1AKTFZcn4m3S8GGNCc/OwPHB7CXk9
	 cKhH+W751eB83M0oxfWN/09LfxgyRGPq9WzcIGvMoi/GwdsI1MC/GbxybJ2Ge9fHaJcvM
	 w3T2pzZrScpkKyowisBc0UQmHTiJcX491MduOVjN0VCHnyQtiFQajTtJHl/xSMPQzd96H
	 roZSJPKF/w2W6a3VklYgx8vLVeoCxxI+iUbZ9JE3rI+iFTbC8YJM3R83fdhfdu/jVNlTI
	 sSOxbwKfBHW0/g9jgwfGDDAGzQuwxy2xLp+ozMwNl1Vi9QGw3bZP7fEyUhI2e9Na5vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEF511F008BC;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227541;
	bh=olYTIdkLJxAg9ZNyzTo6fHUfJ4/iA0PRcdopyr4LHJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kLFtpCd6OD5VbEPMcaEkRjdDCoBau3EgaJRb32OV//jhSg6mAduL9dQYw2k4y/j9c
	 pJ8lAiTZkduq4D/tce4Fae69QeBkdhYKMb608qxmmtHb9NqEaTSUiJSPTDT222jhtT
	 n7Ip3XtFUzWMWB1BZou7zGrDW0TG3YFYiWK2Rbqcww+fKsqMGnDDnqmUnH2Zvgl58q
	 F8DxfbUgXlbhnIP39RtqPBBkYIdUNcgJ5GzsoB/CB5KWpyW/EZHIgkOWD9wAuofkgb
	 Euwe3TkksEJg2yDonLYLdaRJDuJOx00s7vaWpjXkC/4mfkc3fIk3QhAbxAHDcfciRd
	 BQ3saLE133XrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 405A048492;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:18 +0100
Subject: [PATCH v6 3/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on CM3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-3-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=w++noZywksCGrRRO7c3hF1elr/qmFxdKHWCq2dOL318=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1RbN0sIvNk4HfWMyphDIMDobu3+n+g4Ae1W
 yqozNRP7s+JATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UQAKCRA7Xj/jnsft
 6a8mCACVkbcWbUkpvUzkSoHR/3R3Jk5N0j8ID7eq+SIPZMvaQwgjDZJabc2IFw9CiFrSq3KXbax
 laJ3bG81DGrbfRRzpLNFZzxaOnlyzny8NQrxBdp6VILR0b2/QcX4fj27NCm885q9i3tEQypE1bO
 XWwT9RJrsxhcI6hX++Ev5vU1f+2d7hp7SYSMIRSEIkn54pKTq5tdeLtlh4psuzE2aMXClaDNAKX
 59AfyZ/4eb2ovQK6xxmepIxDm5nkGGhqLaW0rpg2ic8rDMuMtaKROHSLvqBjCwqMPD/n2drOdM7
 ThzbAedS36WOjcw882EUoBgbIrrOPhUcoVRUFbTNoO4eGCu0
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

The FriendlyElec CM3588 SoM carries one on-board Realtek RTL8125 NIC
behind pcie2x1l2.

Describe the PCI function node and attach an ethernet0 alias, so that
U-Boot's fdt_fixup_ethernet() can fill in its MAC address from its
ethaddr environment.

The node goes in the SoM dtsi, as the RTL8125 sits on the SoM, not on
the CM3588-NAS carrier.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index 49cf4b85c4e9..d6cff0f5dc86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -18,6 +18,7 @@ / {
 	compatible = "friendlyarm,cm3588", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -257,6 +258,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_pcie20>;
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
 
 &pd_gpu {

-- 
2.47.3



