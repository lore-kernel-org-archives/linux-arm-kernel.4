Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A91606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=edv90+Tw;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=bsOBY8gu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=; b=edv90+TwRAC/g1
	+y5jtb/W33uRhhyBBjmOjeLn/5RfBA3v1TGpPO/4HS7clQlPmn1iBsUFpvPr0mPNvZI3WPkT3D+2u
	JRA5cwUEeWrxShsly6LJ8rMTlg/26+9PaKg02cYpKM8tQEUVOrw0lGteAV5RAkgRcOhDDYdMnLZQn
	oZk2OqEIwy2GqX6C9e98mmHokMbcpRhJgTDOWblhUBmy1jvYeMGPV2t0ADUM0RkkWamxw5B9zNhAm
	G+TxUwqCLTZdf4jdUcruGbYKX6NRZY1aFffmNh7AWZK4YdXgHXMUdBGDdfEwadHvICJ0sRR9hCy0e
	RjGSFmt1Rb/CDsQXHyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWph6-0000000F4Px-0xbi;
	Fri, 27 Nov 2026 06:44:28 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWph1-0000000F4OW-0vu7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:44:24 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AAB7A402B4;
	Fri, 27 Nov 2026 17:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=;
	b=bsOBY8guAiWMupofge1nqfQpZ5UHlvIMK4ScAUxYtO/MYF/luOcqArHgxE6B3ylegbi2pT
	EyEiIPxrBxnEpzajIsXVS8tiRBV68wQ405gvF/uAsrrc/oJ/HCIVG6Nuhkv7PL1nq5zS37
	alhxz+jCAWcT1qIgWaAmauUpEe6R8GqhpIgL9e14DKNM5/S/FWsZmaKpGXk0HlGTAvGwju
	qG/H4wc/RfyF3Lg0oOhvPoqDE+hHk7eMZe/ZEC2rn5NwRcsyOnrjc38pfFLqMgQM44psw3
	pplBnFHVoArmWufLNHAJsLNKq8QleFcvwhM6ohNNqeQQZk3uakq+dxp6ZXRjBg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel or firmware project, which perfectly aligns
	with the personal/professional context of the recipient alastair@d-silva.org;
	the From domain (d-silva.org) matches the sender's identity and
	the mailbox domain; there are no phishing indicators, urgency, or
	marketing content, and the subject line describes specific technical
	work (arm64: dts: allwinner).
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: sun60i-a733: Add SPI0 node
Date: Fri, 27 Nov 2026 17:44:07 +1100
Message-ID: <20261127064408.1344250-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127064408.1344250-1-alastair@d-silva.org>
References: <20261127064408.1344250-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_224423_435196_62E282BA 
X-CRM114-Status: GOOD (  10.17  )
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

Add the SPI0 controller and PC pinmux nodes to sun60i-a733.dtsi.
Omit dmas and spi1..spi4 until the DMA controller is added and other
buses are tested.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..d64b98995173 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -164,6 +164,20 @@ mmc2_pins: mmc2-pins {
 				drive-strength = <30>;
 				bias-pull-up;
 			};
+
+			/omit-if-no-ref/
+			spi0_pc_pins: spi0-pc-pins {
+				pins = "PC2", "PC4", "PC12";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
+			/omit-if-no-ref/
+			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
+				pins = "PC3";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
 		};
 
 		ccu: clock-controller@2002000 {
@@ -194,6 +208,19 @@ uart0: serial@2500000 {
 			status = "disabled";
 		};
 
+		spi0: spi@2540000 {
+			compatible = "allwinner,sun60i-a733-spi",
+				     "allwinner,sun55i-a523-spi";
+			reg = <0x02540000 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
+			clock-names = "ahb", "mod";
+			resets = <&ccu RST_BUS_SPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@3400000 {
 			compatible = "arm,gic-v3";
 			reg = <0x03400000 0x10000>,
-- 
2.53.0


