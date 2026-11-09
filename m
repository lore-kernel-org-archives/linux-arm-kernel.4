Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B67606EEB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FX83KLh4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mkHLlJn5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f6BPwc11c83cwOLH+5RWoaKntH768lNpVpr+TChD/aM=; b=FX83KLh4nScZDl1iRgzZjLlVeR
	N07qs7bUela5lZ9ApvIQxAzhDdQZxNfUK5pX/nNLcuE1bQiea8MSZm6ItyqJRkUAz/XzoxITSlwwW
	eI12tAJ0cnf69y9ImhVg8gXVSK4wobQC7dP8X4A6CKUHjEsIvxlvQ6s5frt175REIG7itSK4gdXNM
	7WMcE2T1N/vE5xiSO4NNpWoTa/JZcmrC/XFRQs85fzgshH1X2dqTOaiwlkthmD3tVJcoHThWHM+Hi
	TnxaO+G3KVZ8EwTbMHIuG3RN4YtMpBPwh6R4M3iTaYL/6jAe05sjkd4NJCU+wMf0LApdkbWaQbuGs
	dVxN5jAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXu-00000000glg-37tF;
	Mon, 09 Nov 2026 12:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXt-00000000gl1-2t0t;
	Mon, 09 Nov 2026 12:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34A2D448A2;
	Mon,  9 Nov 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227541;
	b=PW4HqF9+CYqhiOxqAPW2We3XXUzqcNd8RGVjlfMms6nwvoGVNi3O/rseBF+OqRB7MS2I
	 I9YvEcesmaS5xJRpLBiSiCvu8bis8/LlsQcuj6tlYDRVdd+OqzK3nJABRWC5vXPiTsmL+
	 97XF/5CTCuVpPfs4uGbuX/WJc6iox+smuwnybY2R/CPR1+cQIUzotDDtPFLGmY5dFOhRe
	 gPcg+eoaG7lePOrECQrmbv/DQsbPTdDOC7PE6VnwQPeDmve2TGaav21ZM5r5q8g7m4Pyc
	 JbWxqM2jxBDfWDH4cFBsp9ePf4vwomgzgau8BHj5pYZp3T+RzOantnPBCyBfp5AYaEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=f6BPwc11c83cwOLH+5RWoaKntH768lNpVpr+TChD/aM=;
	b=n/6O3hXRlGwHuDfhY9B7Ja7Qi3NAO0tXXaK5F3MErnRBpAUr1MDSciFa5Cabl2xmxghr
	 MSP5EXK+JMKOPfYb78QeDhdhTRPClX6radRv9ZvqQL3AVLd0aQMEucGYHZUKU3lGU2WJk
	 noOzbTX3Rlkka8g2l0TgTOmcIex3hR5nq6YkeDN1OVbCM0fExFSje8J7WEL5ixe8CwbBl
	 zS8p4/sT4z8P3JIU3gjGXnpdF8i25imoHMEdtHaU57p6RHz4FqoizUq3izI0fbjsonn/p
	 QrUAFBitAEUGSLYBTcEZcqiFUJi9fxQKR+341x2grlTP9fauaL+FCWlIZNBpHlAiBeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E63E1F008A6;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227541;
	bh=f6BPwc11c83cwOLH+5RWoaKntH768lNpVpr+TChD/aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mkHLlJn5ErLxk3HIccgLNbMKQoQYBPhs5eayWT3fR/3dAtf/4yLqj8K3MvL6UKWsW
	 y+N4XacKpZ4JFk0USjnydR2lw8QYd4g1UK6Ek4w9wTuOr1xOoAWsHQ0daQ3s/7VkGU
	 hItBx6fR0tLlqebdtEcIvVJzmTyMy9iWRtn612b/6v2VpkxXCNoZUQiYcBy4clNvZv
	 /wySLeyQmIkFF1oCXaez82uSQwkGKNhBc7UNIAGJGYnSVcIMY4QuQEzwawKyF0b905
	 OGhekJJ9ayKYFn2nv5jTJPKcIHIB/RSf5NeuHtwn0BYPPDUxFZsr8N/8HJ6MNijeOb
	 bEg8DrZ8m271w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1FF7E4842D;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:16 +0100
Subject: [PATCH v6 1/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-1-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=C8auy3c4isZ5XfXrCAmEL8F9N9P5Ye2UTKa9ViZULk4=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1R1mQNBqX9H00xyoLhCeSGvyRx4c7E3McBz
 Sujy0waKGWJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UQAKCRA7Xj/jnsft
 6X0WB/9mVmK7vAE0Ed8SC14q/A6dWjN9RnozSKrufGdXyz9evMZqLZ0NPqJoK63wspfUJSOig7O
 LXhxdtKsLlMwYdf5qGSnmJ5CheTn4VxuMZwCBlsXNFLBQVUZS4vDytBzOqJfjMxpdTgw0426QMs
 3dWdvESPx3Lpne34k2HB/mVmUN/3Y4vuQAhtGtDLkyV5MRqvZ0lEwXbRGtLDF3q57kufDfXVPx4
 0l5KK1vdH64AplwFM4nXUsD6ePAHCk4PCFwg0a7VDLGTOk65pmtbUku56U9zzlsk4s55P4yWlq3
 jFaYVHV6DL5x1t+44mYOQe4QN7ev31fW7fIBGXq0elnvS/J4
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

The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
behind pcie2x1l0 and pcie2x1l2.

Describe the PCI function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can fill in their MAC
addresses from its ethaddr/eth1addr environment.

The labels follow the schematic and case markings: ETH1 (pcie2x1l2) is
rtl_eth1/ethernet0 and ETH2 (pcie2x1l0) is rtl_eth2/ethernet1.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 13be56af095b..18e427e94dcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -20,6 +20,8 @@ / {
 	compatible = "friendlyarm,nanopc-t6", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth1;
+		ethernet1 = &rtl_eth2;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -617,6 +619,20 @@ &pcie2x1l0 {
 	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x21 0x2f>;
+
+		rtl_eth2: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x210000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie2x1l1 {
@@ -633,6 +649,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc_3v3_s3>;
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
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.47.3



