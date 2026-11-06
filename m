Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D024606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ptlDR5M;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=GHG5A8Xj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WWqOS7cTYH7Hfu4TugC2jyBdj65ccrW05fQttvi8nt4=; b=0ptlDR5M0G/bRu
	im8UCJ2x2eOpRNbaOJAwqQiUsSec9EGJi1N8084IzdQV0P4VisVt/zXuv+oywFdrNQZpq0vyTaUgj
	OJ9Sa3iT44hYQ1/G8rU7Tp9AGz+yz3JMTQl7UBrohZcW4HHVPxibPc/MKVGlI/zU4DVGZgkQHVkU+
	fjPMwqFKUCDYwmGqQ3SjU5wJLcGdA8Dg4tJ7JhATbsOmjL7SKb/fsRFM9U6hPLq6s0L1sKVHr9nCQ
	oCbk22xVPCpwrmPiYbGXvO3oX2M1UxQtMJNqeY5GPCdQKoqxAz/MNKZ66WyecPpt9ElQBGrz7ds6d
	hnTJpvHPliFTu44rTd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEx-0000000D8JZ-1VLQ;
	Fri, 06 Nov 2026 16:56:35 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEq-0000000D8Fu-2Uit
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:56:30 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWqOS7cTYH7Hfu4TugC2jyBdj65ccrW05fQttvi8nt4=;
	b=GHG5A8Xjj3WiwVI/va3LbQdnVheYXYGExWEypmIo+qqitqsDUqjFDTLHjRTUvCFVEz1Ei8
	zV6Um8AmqvlZjhkqiHMdLMROF/YqdUge2CPFlgiQ47cq1r3tpO9iemIFrX72cpzP5B/Sh4
	4IwksEowov78quaxhq6kwECoYnUXzws=
Date: Fri, 06 Nov 2026 17:56:15 +0100
Subject: [PATCH v2 3/4] arm64: dts: apple: t8132: Fix line-length-related
 dt-check-style issues
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-3-1e715e80b066@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_085628_798128_E5D5B3BD 
X-CRM114-Status: UNSURE (   9.39  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes `dt-check-style --mode=strict` issues related to line
length.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  3 ++-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index b0c5d71943b6..9d9aeb4d074e 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -22,7 +22,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 6d070306e29a..b1e77a8ae406 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -206,7 +206,8 @@ soc: soc {
 		nonposted-mmio;
 
 		pmgr: power-management@380700000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x3 0x80700000 0 0x14000>;
@@ -225,18 +226,21 @@ aic: interrupt-controller@381000000 {
 			affinities {
 				e-core-pmu-affinity {
 					apple,fiq-index = <AIC_CPU_PMU_E>;
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3 &cpu_e4 &cpu_e5>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2
+						&cpu_e3 &cpu_e4 &cpu_e5>;
 				};
 
 				p-core-pmu-affinity {
 					apple,fiq-index = <AIC_CPU_PMU_P>;
-					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+					cpus = <&cpu_p0 &cpu_p1
+						&cpu_p2 &cpu_p3>;
 				};
 			};
 		};
 
 		pinctrl_nub: pinctrl@3881f0000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x881f0000 0x0 0x4000>;
 			power-domains = <&ps_nub_gpio>;
 
@@ -258,7 +262,8 @@ pinctrl_nub: pinctrl@3881f0000 {
 		};
 
 		pmgr_mini: power-management@388280000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x3 0x88280000 0 0x4000>;
@@ -274,7 +279,8 @@ wdt: watchdog@3882b0000 {
 		};
 
 		pinctrl_smc: pinctrl@38c820000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x8c820000 0x0 0x4000>;
 
 			gpio-controller;
@@ -295,7 +301,8 @@ pinctrl_smc: pinctrl@38c820000 {
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x90824000 0x0 0x4000>;
 
 			gpio-controller;
@@ -316,7 +323,8 @@ pinctrl_aop: pinctrl@390824000 {
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x9a000000 0x0 0x100000>;
 			power-domains = <&ps_gpio>;
 

-- 
2.56.0


