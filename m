Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE67606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iSXfbIrN;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=r4AAqOq8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6MyheDk9AmIiMUlnMcbJVkjS1qaDN78uIvkLvU/yuaI=; b=iSXfbIrN1qjauo
	L9rteWgRkOFOzHmcHZHA4oopMv7S3WYhN+oSAVo/C/Htfook0z0NXhD2YEObzKzEEipANRoao1g6o
	94SJmGWrgUhPE7sXlly8JgK/zExQiWDdEAe5QmKTEFFG6ubapAlKSlufzgWxQ44dQXM3KSaHD8sZW
	sRhuAU5hmi1xEQMm1Ubxj2gLLJ0iYxNlxu9oA/mGi5jMshoUX5WLJwcNQRCE4DrhMaNgW43K6O224
	V4yxB1TBaQa2depFt+4qH3MAiEASNZdzKD3Vq8MhixSve2dZ7/YNN6CV0RaiUlqKgM6it7WmooYQu
	hYbKUQ5z9vi25hPiitQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNF1-0000000D8Mj-2dj8;
	Fri, 06 Nov 2026 16:56:39 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEw-0000000D8Fg-1yh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:56:35 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MyheDk9AmIiMUlnMcbJVkjS1qaDN78uIvkLvU/yuaI=;
	b=r4AAqOq8CJd+WTHowBxNRL530plm6NayXIfPIEa5uB3JxaKIo3+XIPHPKYd3WdtC8RLm+J
	lpDE8LhyJi+o6Mcx00buFdcGDFwJa+6CyCV6iaWwdGdHSOGAYqNIIglrf0fx52tluWVjqc
	YFjAfVqkS5Ml/iQKlRFlxOpYPN1zfVA=
Date: Fri, 06 Nov 2026 17:56:13 +0100
Subject: [PATCH v2 1/4] arm64: dts: apple: t8132: Fix indentation-related
 dt-check-style issues
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-1-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_085634_699601_F55E03E7 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes `dt-check-style --mode=strict` issues related to
indentation in the t8132 device trees, specifically replacing the use of
8 or more spaces for alignment with n//8 tabs + n%8 spaces.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132.dtsi | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index afec92a06015..58805c6ab002 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -241,12 +241,12 @@ pinctrl_nub: pinctrl@3881f0000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pmgr_mini: power-management@388280000 {
@@ -278,12 +278,12 @@ pinctrl_smc: pinctrl@38c820000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 552 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 554 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 555 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 554 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 555 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
@@ -299,12 +299,12 @@ pinctrl_aop: pinctrl@390824000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 423 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 425 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 426 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
@@ -321,36 +321,36 @@ pinctrl_ap: pinctrl@39a000000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(104, 1)>,
-				         <APPLE_PINMUX(103, 1)>;
+					 <APPLE_PINMUX(103, 1)>;
 			};
 
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(106, 1)>,
-				         <APPLE_PINMUX(105, 1)>;
+					 <APPLE_PINMUX(105, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(44, 1)>,
-				         <APPLE_PINMUX(43, 1)>;
+					 <APPLE_PINMUX(43, 1)>;
 			};
 
 			i2c3_pins: i2c3-pins {
 				pinmux = <APPLE_PINMUX(42, 1)>,
-				         <APPLE_PINMUX(41, 1)>;
+					 <APPLE_PINMUX(41, 1)>;
 			};
 
 			i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(108, 1)>,
-				         <APPLE_PINMUX(107, 1)>;
+					 <APPLE_PINMUX(107, 1)>;
 			};
 		};
 
@@ -458,9 +458,9 @@ timer {
 		interrupt-parent = <&aic>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 

-- 
2.56.0


