Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUEkiWG5;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=c1eTpMFk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9anpMZ2Ucx/sgVuz8+mMJ83HICMy2B3fJ91xVGgA93Q=; b=XUEkiWG5ZlDuza
	howSmBPilqfyiRFveaP+bQhrLsR7ff77KxwRvxGhOCbiBZVjlOp6yCaNMeAw9XZTqO2s1qG2yJenZ
	W1dO0ufnOzfTZPDPUigNVZ425eilHhRbOdXbDC6yLRseeHhj83vw2xhHneqKZ5G1YJh7UXpoU2KZQ
	dq4+Cr9t/IdjaFUknX8eAsL0dzyrF6HzxEn1nzij8VZPNhrjVIx7s6rOWAMo6C7SH4H8JBGTiTjDU
	aVrku7FJVBjvwMO/AiTtNAqvOnrCSNSG2N+VIEC8El0Z6YOVZbp/+qQYMqJ1Ur6WYW/lK54wjhPbt
	gzT0ooBOJ1goi+2G9eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJQ-0000000BE2F-2OZu;
	Wed, 25 Nov 2026 20:09:52 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJJE-0000000BDzF-2VUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:09:42 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id C1EBA404C4;
	Thu, 26 Nov 2026 07:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9anpMZ2Ucx/sgVuz8+mMJ83HICMy2B3fJ91xVGgA93Q=;
	b=c1eTpMFkuJVMAEZx944vIeMY+ciT8f0A8RvjWiMGocTlgKo6X31wSMXStbsgSUhKG23jyT
	Yvr8Aufrz2QcRcYPnL2RWdZLyAk0vqPR+l4Abr+MbdXFHSi4Bq70HHxSvgFNR/ZSPvrIkb
	hQqliWs6mnk7g7etEpHfyKrPOhI//UBnRbA9i5KxAUAfMZKuokfrOOiv7VH6kbqQtPz8NN
	XWSWV9xjUPWsE9Lu2MWcr1SC7idir0gcrA8EjFvFascY1OP2J4Gck+6VXg4wSPHNvFnVPD
	V5V65mJ/yvkQwvLn6Ulh51UqBgdNZS6n4OVNQGzJnWbBS0HNtudhJBLP1Mhoog==
X-GPT-Reason: This is a legitimate technical contribution or personal
	communication. The mailbox (alastair@d-silva.org) directly matches
	the sender's identity (alastair@d-silva.org), the content is a
	specific technical software patch (Linux kernel style) regarding
	"allwinner" hardware, and there are no phishing indicators such
	as urgency, malicious links, or requests for sensitive information.
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
Subject: [PATCH 1/2] arm64: dts: allwinner: sun60i-a733: Add SPI0 node
Date: Thu, 26 Nov 2026 07:09:26 +1100
Message-ID: <20261125200927.515136-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125200927.515136-1-alastair@d-silva.org>
References: <20261125200927.515136-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_120940_787187_C9978F73 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the SPI0 controller and PC pinmux nodes to sun60i-a733.dtsi.
Omit dmas and spi1..spi4 until the DMA controller is added and other
buses are tested.

Assisted-by: LLM
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


