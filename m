Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD32606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZJiDDbgb;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=SOLCrig4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+nxyRoWCu7CfU2+fdWvrSr0XQ5l6/RharDIAbF7p6Tc=; b=ZJiDDbgbEkiiGm
	90WQnUOhthbry4afykLyS9xDwmsdSrI4qV4OMyOs4OL8NwJx27S2MyidQDdEWPf56+4AFJflPt8xv
	dNs9PdGaiLf5c+Bqyhpl/USEAjR8jFkGhYH6lKuD91eBSxdTdxMR3POPYu9gMnpcwYp5tmAJFT6QO
	bUY3I5mvH9mHwsKbuTE5L1qPW1KuFaReaPSHLGH1Ff7izYYvxo/la7rAjXoe9ldmeJOhRcHa3n+om
	iD/6vz6vtKGNmolmSeRXy0UHin9zUyNF4yg9noj52KAhcaoIL6LZ6XQWC1Z4w8utIMX/0Q6Di9iAo
	a5YtC0h11EswUtiR8QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWstM-0000000FWR8-2ETc;
	Fri, 27 Nov 2026 10:09:20 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsst-0000000FW9R-1L6W;
	Fri, 27 Nov 2026 10:08:52 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4A20B4C98A;
	Fri, 27 Nov 2026 21:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nxyRoWCu7CfU2+fdWvrSr0XQ5l6/RharDIAbF7p6Tc=;
	b=SOLCrig4Kwip2aPdJgn5t0w0qWhTb7mV9oa9Qlc6974hsy0uBqvEFK/SDo1PRqYJ8/HTzV
	u0Jr6Il56s4xfDCkJFqLOXM6UMaD2RqCXSxyWG+U+5wAD2erEWexzn/cTFICQbiZ5pCtNV
	QFO9sH4c2GzeB9m6QSTLThUtxr83GHaNu7NyOLW8hb/qJx4v5kTnV0mic1mWvOH7E3ujhR
	AQE2hyzCxfxRNQ79jSANv+bcKNOpA85BdoylyarkzGtwIuus/fKeosjZAea2jb9q3tPMaF
	g7EiLWwktC0+JHo+QXLbsyNxGFRl/Z+7QueDWQKt307ARZEmhbE5Kn/MA6W8Mw==
X-GPT-Reason: legitimate; this is a technical personal/business
	communication regarding a software patch (Linux kernel/device
	tree style), which aligns with the mailbox alastair@d-silva.org;
	the From domain (d-silva.org) matches the recipient domain perfectly;
	the content is a standard technical update with no signs of marketing,
	urgency, or phishing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 5/6] arm64: dts: allwinner: sun60i-a733: Add USB 2.0 host nodes
Date: Fri, 27 Nov 2026 21:08:07 +1100
Message-ID: <20261127100808.2292229-6-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020851_506433_B30A231A 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the usbphy, ehci0, ohci0, ehci1, and ohci1 nodes for the Allwinner
A733 SoC.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index e062b08006da..96fe8c8c44ed 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -546,6 +546,88 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		usbphy: phy@4100400 {
+			compatible = "allwinner,sun60i-a733-usb-phy";
+			reg = <0x04100400 0x100>,
+			      <0x04101800 0x100>,
+			      <0x04200800 0x100>;
+			reg-names = "phy_ctrl",
+				    "pmu0",
+				    "pmu1";
+			clocks = <&ccu CLK_USB01_REF>,
+				 <&ccu CLK_USB01_REF>,
+				 <&ccu CLK_BUS_OTG>;
+			clock-names = "usb0_phy",
+				      "usb1_phy",
+				      "bus";
+			resets = <&ccu RST_USB_PHY0>,
+				 <&ccu RST_USB_PHY1>;
+			reset-names = "usb0_reset",
+				      "usb1_reset";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		ehci0: usb@4101000 {
+			compatible = "allwinner,sun60i-a733-ehci",
+				     "generic-ehci";
+			reg = <0x04101000 0x100>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_BUS_EHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>,
+				 <&ccu RST_BUS_EHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@4101400 {
+			compatible = "allwinner,sun60i-a733-ohci",
+				     "generic-ohci";
+			reg = <0x04101400 0x100>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci1: usb@4200000 {
+			compatible = "allwinner,sun60i-a733-ehci",
+				     "generic-ehci";
+			reg = <0x04200000 0x100>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_BUS_EHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>,
+				 <&ccu RST_BUS_EHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@4200400 {
+			compatible = "allwinner,sun60i-a733-ohci",
+				     "generic-ohci";
+			reg = <0x04200400 0x100>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x250>;
-- 
2.53.0


