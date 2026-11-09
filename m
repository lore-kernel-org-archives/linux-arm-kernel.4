Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A52606D811
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwfC0urx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUayY9KT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=; b=rwfC0urxRFJLVqwmWyI5+yNt5o
	K+wcDlhFI+XJOK6n7knadZ5IcZRnEUcykpS7My30rikXFqB/4XvNukaLoQNDEdDlXK/XAJy6waJJ/
	fokeV7ejf7Wx0kGG8xaEl4/22S5fepppsB3Vlk6o3XcoXjSjAXQ7TGOcC8q+hx+vINVBCNi/Li52L
	sMSURizIqsyD2W5ZcwNBSl3g37nLHHDzL2eixGhXmAtV/ypE9xfO70TwlB5c4IXwknJqFL8bNsvE+
	PyFXe+2UpcFn4ZlnYglIVCIiY6qg16paXJh+bWwaqj6wqdbqFGz/diue2vD33ASiMPHQafc5NrDmQ
	/e/grbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOY2-00000000gtl-30v3;
	Mon, 09 Nov 2026 12:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOXv-00000000gmC-0xcl;
	Mon, 09 Nov 2026 12:32:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E69A94391C;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=ia8gJuRUEiuMW3XLTxT97mi5ZnXTz8uIYkl+8cP4sbeUmaMQPUAnOOHJ4Ng0ZlJv01pj
	 wUQlIwoPF6Kblq5w57tjAwIdQlwW3l+LKadtJ4R87BDlLCk9wlciEfOscLqTcYR43ISvI
	 cO/fsRISn8BuNZOIaBAMGo+6vgrf3+z77Nhgtl3DN0m76LKhfu1vZircPn1zQ9q69JWnM
	 zzVgSeumoswlKJmmleURSZDUIcXJ+YlHRLSQaHiF9hJ0dPOA/tnU7jOKkW4/jiu6IGUvj
	 cg0Sku5aZ6N7QIgTWtXOqRE1oMLlBK0BdEUwoPjmBe47Y+UiTMT7Eiwwrj3tHkxYcUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=;
	b=n1t/Hbfc8suTDhZZiEiXjazy5mvE5S41BXOFJTbRbTdcT1sxlzGahNoxkF9zILlE/f9K
	 bhAQulT17kkBXXkswfwgJgbILXvl9qc5mBgAMByVVZTEYsdnYBZmgub64xIDd8WKsjcHa
	 JIV9mEt5L/+Ey7n84ZhtQEmJ/B/yZKdII9qGp6KtqAv+4aYTs2j3NV+m3uZj6l7ogRDiF
	 70o1fgeWJb25Tt84rbsy8jS+V+3VC32ysX9xK0QCj7RtgvlxJw1I2K9mD0tUDKvdHf8wu
	 vIwqMKowYvWUfSRU70HW+bxpTI4CWco+BT1bZTcw0lWep8gCshEvChEL6YayeJCBOew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C03631F008BD;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gUayY9KTU6VMHvW/s3F1McmcfA1JrWSKXaq0JblTTCDJkg6zoL+f/lSmWN1pCOj2t
	 dM5r/kVlj3u9+/h3ZD4teojOXayrt0Voc+Lr1zBnzQwlwDyQxRuPf8VORVJvYzn/ve
	 +jyTZ0jbd/SsZvbs8knz/tTmbOHILr5eBcUiapPKkNRrdN/l2ZEzec9IQtfiyi4ENo
	 QSgtEECODdcmhbTnlnnTfLHRyRiWXNQEHVTA5wJkr1ZhqtKEfzSPmI4Q74ywzRryE7
	 yn0AdwM5f4FE1YpBEs1a9M20MqipMIF7+KuMFuDm1ylRP077N2C7MK1Nkbmr2lZ7J1
	 yYK4Pfy1zbQtg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5098B48496;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:19 +0100
Subject: [PATCH v6 4/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R5S
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-4-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=9Qdpul39fnmAarjmMc25c0t/ABrJ0d7zNPsppxOnomA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1S7P1PUZdxHS2z05B6fB1U5Ut+tiA2yKi97
 SsemaqOQCSJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UgAKCRA7Xj/jnsft
 6XRPB/973BDOvDuQjjo4E+7kB3Rtk8TZCHbP9KLq0ooMDtoPhj/HuVOL/3B8/c3V8iBSZLnzjyh
 WBokNxOVmJt2WdYrPcDt/yCkULPlBTBffjHCdylVZodF4z1QhyciKsUqFkUdGLm5HkVaP0VI2p8
 tn93L7W4jrMGlZD09xTd0+OVFQBV9hwZh4g4X7KhZoVdyIAThNR5LN2QnmRZdDCI8q28J0oAqBs
 /Je2wNpo2zvlvSqY1m5dZC+v6YnkIkerhtLIP8lmQlnxDUpxDIWM7fgLzR8ESOV0e748igqhNId
 ds9tATm4dG2oA1vYugT69W5uUo9getW6K9ilsfqLZEGc1SQS
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

The FriendlyElec NanoPi R5S carries two on-board Realtek RTL8125
NICs behind pcie2x1 and pcie3x1.

Describe the PCI function nodes and attach ethernet1/ethernet2
aliases, so that U-Boot's fdt_fixup_ethernet() can fill in their MAC
addresses from its eth1addr/eth2addr environment.

ethernet0 stays mapped to the on-SoC gmac0.

Note that mainline U-Boot's rockchip_setup_macaddr() derives only
ethaddr and eth1addr from the CPU ID, so ethernet2 only gets a stable
MAC if eth2addr is set in the U-Boot environment.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 90ce6f0e1dcf..e588ee7fadc5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -15,6 +15,8 @@ / {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &rtl_eth1;
+		ethernet2 = &rtl_eth2;
 	};
 
 	gpio-keys {
@@ -107,6 +109,20 @@ &pcie2x1 {
 	num-lanes = <1>;
 	reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x000000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x01 0x0f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x010000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {
@@ -119,6 +135,20 @@ &pcie3x1 {
 	reset-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x100000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x11 0x1f>;
+
+		rtl_eth2: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x110000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie3x2 {

-- 
2.47.3



