Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A097B606D806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HudOHgCa;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=1ZHcOi3o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=umTs8YiFR06y1ZbXCwboUGMXg3i3NLqw/+E36ef1DZE=; b=HudOHgCaLdbnlp
	PsiWQeBFVdzN8BbPkGXlEV3iZZ4Ol1TVRSc2r7Trha9UfBoCmoNUKmeAvEQQeILzLYXa2J/dhXG++
	7uxgi9kpZIDPOMX8jF+SUsb1XzzCTm/Im/4i9+kmrkxW8B1BnbjqozF9Na+sgkMEun/nKOUnD36HZ
	/WNic4HhLdh5yivgJhMQ4XqkYGloeQLo+f+AYkchQvgXoPgtheFa7D8SCVkzYBfc4j8VXY8HnLJzD
	QqOpxmciBfWN+VXcrDUu82hTUXUQO2EGMB0GAgWcG4Z9rReWEaw4rAhJp5zYy/AZOWAS7Uy6E+ANA
	LA/qpGF3auLJ/8HEf0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEx-0000000D8Jm-1vZa;
	Fri, 06 Nov 2026 16:56:35 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNEq-0000000D8Fw-3GdH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:56:30 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umTs8YiFR06y1ZbXCwboUGMXg3i3NLqw/+E36ef1DZE=;
	b=1ZHcOi3oEo32UjOAhV9HZmiTXVOucqW6+Wz5HfVeJfHHL/METyy7jQmBMaT/v7xJ2GQ2ZD
	SSqOkl544TL48cHSI0LJj5xexJr99+JVwUClfvnu+5bpEt9ZC+ihBdQByjnbtBqGieVh9Z
	WiJEYBnZzKjB5A+IOewERRRf271Va1E=
Date: Fri, 06 Nov 2026 17:56:16 +0100
Subject: [PATCH v2 4/4] arm64: dts: apple: t8132: Fix ordering-related
 dt-check-style issues
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-4-1e715e80b066@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20261106_085629_024600_2949DBFE 
X-CRM114-Status: GOOD (  10.34  )
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

This fixes `dt-check-style --mode=strict` issues related to node and
property ordering in the t8132 device tres.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-j604.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8132-j623.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8132-j624.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8132-j773g.dts |  2 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 15 +++----
 arch/arm64/boot/dts/apple/t8132.dtsi      | 65 +++++++++++++++++--------------
 8 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
index 93076cd923a9..ebf25fb1bd3c 100644
--- a/arch/arm64/boot/dts/apple/t8132-j604.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
@@ -14,8 +14,8 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	compatible = "apple,j604", "apple,t8132", "apple,arm-platform";
 	model = "Apple MacBook Pro (14-inch, M4, 2024)";
+	compatible = "apple,j604", "apple,t8132", "apple,arm-platform";
 
 	led-controller {
 		compatible = "pwm-leds";
diff --git a/arch/arm64/boot/dts/apple/t8132-j623.dts b/arch/arm64/boot/dts/apple/t8132-j623.dts
index 508e26056022..9b5f6d484c8e 100644
--- a/arch/arm64/boot/dts/apple/t8132-j623.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j623.dts
@@ -13,6 +13,6 @@
 #include "t8132-jxxx.dtsi"
 
 / {
-	compatible = "apple,j623", "apple,t8132", "apple,arm-platform";
 	model = "Apple iMac (24-inch, 2x USB-C, M4, 2024)";
+	compatible = "apple,j623", "apple,t8132", "apple,arm-platform";
 };
diff --git a/arch/arm64/boot/dts/apple/t8132-j624.dts b/arch/arm64/boot/dts/apple/t8132-j624.dts
index 84bdd8e343eb..b1d4fa1b6208 100644
--- a/arch/arm64/boot/dts/apple/t8132-j624.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j624.dts
@@ -13,6 +13,6 @@
 #include "t8132-jxxx.dtsi"
 
 / {
-	compatible = "apple,j624", "apple,t8132", "apple,arm-platform";
 	model = "Apple iMac (24-inch, 4x USB-C, M4, 2024)";
+	compatible = "apple,j624", "apple,t8132", "apple,arm-platform";
 };
diff --git a/arch/arm64/boot/dts/apple/t8132-j713.dts b/arch/arm64/boot/dts/apple/t8132-j713.dts
index 892a3812bc65..6ffef1f1d242 100644
--- a/arch/arm64/boot/dts/apple/t8132-j713.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j713.dts
@@ -14,8 +14,8 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	compatible = "apple,j713", "apple,t8132", "apple,arm-platform";
 	model = "Apple MacBook Air (13-inch, M4, 2025)";
+	compatible = "apple,j713", "apple,t8132", "apple,arm-platform";
 
 	led-controller {
 		compatible = "pwm-leds";
diff --git a/arch/arm64/boot/dts/apple/t8132-j715.dts b/arch/arm64/boot/dts/apple/t8132-j715.dts
index 212d194bd1ae..391cb9f6f5dc 100644
--- a/arch/arm64/boot/dts/apple/t8132-j715.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j715.dts
@@ -14,8 +14,8 @@
 #include <dt-bindings/leds/common.h>
 
 / {
-	compatible = "apple,j715", "apple,t8132", "apple,arm-platform";
 	model = "Apple MacBook Air (15-inch, M4, 2025)";
+	compatible = "apple,j715", "apple,t8132", "apple,arm-platform";
 
 	led-controller {
 		compatible = "pwm-leds";
diff --git a/arch/arm64/boot/dts/apple/t8132-j773g.dts b/arch/arm64/boot/dts/apple/t8132-j773g.dts
index 0583cb9d19f6..b76ea6ffa1fd 100644
--- a/arch/arm64/boot/dts/apple/t8132-j773g.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j773g.dts
@@ -13,8 +13,8 @@
 #include "t8132-jxxx.dtsi"
 
 / {
-	compatible = "apple,j773g", "apple,t8132", "apple,arm-platform";
 	model = "Apple Mac mini (M4, 2024)";
+	compatible = "apple,j773g", "apple,t8132", "apple,arm-platform";
 };
 
 /*
diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 9d9aeb4d074e..bfe6701f35d6 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -15,9 +15,10 @@ aliases {
 	};
 
 	chosen {
+		ranges;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		stdout-path = "serial0";
 
@@ -32,17 +33,17 @@ framebuffer0: framebuffer@0 {
 		};
 	};
 
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0x2 0>; /* To be filled by loader */
+	};
+
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 		/* To be filled by loader */
 	};
-
-	memory@800000000 {
-		device_type = "memory";
-		reg = <0x8 0 0x2 0>; /* To be filled by loader */
-	};
 };
 
 &serial0 {
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index b1e77a8ae406..e2e79c7e7fd0 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -15,6 +15,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -66,8 +73,8 @@ core3 {
 		};
 
 		cpu_e0: cpu@0 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -77,8 +84,8 @@ cpu_e0: cpu@0 {
 		};
 
 		cpu_e1: cpu@1 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -88,8 +95,8 @@ cpu_e1: cpu@1 {
 		};
 
 		cpu_e2: cpu@2 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -99,8 +106,8 @@ cpu_e2: cpu@2 {
 		};
 
 		cpu_e3: cpu@3 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -110,8 +117,8 @@ cpu_e3: cpu@3 {
 		};
 
 		cpu_e4: cpu@4 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x4>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -121,8 +128,8 @@ cpu_e4: cpu@4 {
 		};
 
 		cpu_e5: cpu@5 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x5>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -132,8 +139,8 @@ cpu_e5: cpu@5 {
 		};
 
 		cpu_p0: cpu@10100 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10100>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -143,8 +150,8 @@ cpu_p0: cpu@10100 {
 		};
 
 		cpu_p1: cpu@10101 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10101>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -154,8 +161,8 @@ cpu_p1: cpu@10101 {
 		};
 
 		cpu_p2: cpu@10102 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10102>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -165,8 +172,8 @@ cpu_p2: cpu@10102 {
 		};
 
 		cpu_p3: cpu@10103 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10103>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
@@ -190,50 +197,44 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 
 		ranges;
 		nonposted-mmio;
 
+		#address-cells = <2>;
+		#size-cells = <2>;
+
 		pmgr: power-management@380700000 {
 			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
 				     "syscon", "simple-mfd";
+			reg = <0x3 0x80700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x3 0x80700000 0 0x14000>;
 			/* child nodes are added in t8132-pmgr.dtsi */
 		};
 
 		aic: interrupt-controller@381000000 {
 			compatible = "apple,t8132-aic3", "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
 			reg = <0x3 0x81000000 0x0 0x1cc000>,
 			      <0x3 0x81040000 0x0 0x4000>;
 			reg-names = "core", "event";
+			#interrupt-cells = <3>;
+			interrupt-controller;
 			power-domains = <&ps_aic>;
 
 			affinities {
 				e-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_E>;
 					cpus = <&cpu_e0 &cpu_e1 &cpu_e2
 						&cpu_e3 &cpu_e4 &cpu_e5>;
+					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_P>;
 					cpus = <&cpu_p0 &cpu_p1
 						&cpu_p2 &cpu_p3>;
+					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
 		};
@@ -247,7 +248,6 @@ pinctrl_nub: pinctrl@3881f0000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_nub 0 0 32>;
-			apple,npins = <32>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -259,14 +259,16 @@ pinctrl_nub: pinctrl@3881f0000 {
 				     <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <32>;
 		};
 
 		pmgr_mini: power-management@388280000 {
 			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
 				     "syscon", "simple-mfd";
+			reg = <0x3 0x88280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x3 0x88280000 0 0x4000>;
 			/* child nodes are added in t8132-pmgr.dtsi */
 		};
 
@@ -286,7 +288,6 @@ pinctrl_smc: pinctrl@38c820000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_smc 0 0 18>;
-			apple,npins = <18>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -298,6 +299,8 @@ pinctrl_smc: pinctrl@38c820000 {
 				     <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <18>;
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
@@ -308,7 +311,6 @@ pinctrl_aop: pinctrl@390824000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_aop 0 0 57>;
-			apple,npins = <57>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -320,6 +322,8 @@ pinctrl_aop: pinctrl@390824000 {
 				     <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <57>;
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
@@ -331,7 +335,6 @@ pinctrl_ap: pinctrl@39a000000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_ap 0 0 224>;
-			apple,npins = <224>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -344,6 +347,8 @@ pinctrl_ap: pinctrl@39a000000 {
 				     <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
 
+			apple,npins = <224>;
+
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(104, 1)>,
 					 <APPLE_PINMUX(103, 1)>;
@@ -472,11 +477,11 @@ serial0: serial@3ad200000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
 

-- 
2.56.0


