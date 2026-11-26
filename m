Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AGOVK1Ax;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQF1tTEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n3uVzP8dQyNkzHk2u0PewweHFtTDJWu36twC1wg6sd0=; b=AGOVK1Axp6E4Fo
	A4hPqVivZFeMGXz5R73WYtpr6n7jT6ybgZjq8exBCHnr2v7nVBiGWPvi+xjY028Dr3FbPtG3j6cnC
	HWFP+KkHBu3dz+5UzXxJaqP84YheY52LZIVvmKLG+nRQZ5jeYIvXx+g/EZpG0RFT1tpc39ji+HXXj
	CAM+c4meuiDy26A54zWZUNR6sQhv08mjmQCSzUefakA6L+rYGPUQhwVd7OlVWmfn0PCAy7vV9tBhF
	TDnc9/jVtF4V+fjHaE7R/8EgCAzVZQhDie7t1fTFZS31dhrVTC44XR2abvnCxHJknTXCJi58iWLiT
	WebE2mcAMyGamMrf1c8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV3-0000000Bfrf-0jeW;
	Thu, 26 Nov 2026 00:38:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUQ-0000000BfYt-3jcA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A273B429C6
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A701F000D4;
	Thu, 26 Nov 2026 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653450;
	bh=n3uVzP8dQyNkzHk2u0PewweHFtTDJWu36twC1wg6sd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GQF1tTEpG4CKGJeNTXGStn6XH3//4TJ4wLBnKl/Y0UrUacOCrgWUIlCx10J/egPwE
	 zaTRHmDvwKFfFIwYBKvXpPg7dpftvTrHi9Ho/BJAF0GIqOiifeAzVUQN0LlCQQza5p
	 xfaD79iTj5cm1V6E1gMUt0YiopUFh1p7gF5X07Xc6XgYASuUgZHocnYAtzRo+53Lxa
	 XUfOpk/UI0Xc+ONksK22CACn4wrDN1WHmQGrAxWOiy8IZdPvjqohNE1K7/nHEr9Vtc
	 QTnn9tipknmLLLEmq0e6c5opK6lvk2wVSL17WbgE1YbMcQ1AsSHG0P4TzDGjtU8wp9
	 f0IAwvDlO8O1Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:14 +0100
Subject: [PATCH 10/20] ARM: dts: ux500: Fix SD regulator node validation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-10-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

Rename the SD regulator nodes so the GPIO consumer property pattern
does not mistake them for GPIO specifiers. Drop regulator-type from
fixed supplies now that their nodes are validated, and move the
Snowball regulator out of the simple bus because it has no address.

Fixes: 5282da459a97 ("ARM: dts: ux500: Push VMMCI down to each tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href520-tvk.dts           |  2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts      |  2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts        |  2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts     |  2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts       |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts              | 42 +++++++++++-----------
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |  3 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |  3 +-
 11 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href520-tvk.dts b/arch/arm/boot/dts/st/ste-href520-tvk.dts
index 5677df43c3ac..9033832fd572 100644
--- a/arch/arm/boot/dts/st/ste-href520-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-href520-tvk.dts
@@ -15,7 +15,7 @@ / {
 
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
index b142bb2d38d8..5dbf6395daa3 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "st-ericsson,mop500", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
index 5da1ff41b00e..a43d4153ef4c 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
@@ -14,7 +14,7 @@ / {
 	compatible = "st-ericsson,mop500", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
index c4abe24a7cd0..b0bc4df649f0 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "st-ericsson,hrefv60+", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
index f55e8de2b516..363e2ef14f78 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "st-ericsson,hrefv60+", "st-ericsson,u8500";
 
 	/* ST6G3244ME level translator for 1.8/2.9 V */
-	vmmci: regulator-gpio {
+	vmmci: regulator-sd {
 		compatible = "regulator-gpio";
 
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 2e2f787871ed..5b27393a7ac6 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -113,6 +113,27 @@ used-led {
 		};
 	};
 
+	/* ST6G3244ME level translator for 1.8/2.9 V */
+	vmmci: regulator-sd {
+		compatible = "regulator-gpio";
+
+		/* GPIO228 SD_SEL */
+		gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
+		/* GPIO217 MMC_EN */
+		enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "mmci-reg";
+		regulator-type = "voltage";
+
+		startup-delay-us = <100>;
+
+		states = <1800000 0x1
+			  2900000 0x0>;
+	};
+
 	soc {
 		/* Name the GPIO muxed rails on the Snowball board */
 		gpio@8012e000 {
@@ -222,27 +243,6 @@ ethernet@0 {
 			};
 		};
 
-		/* ST6G3244ME level translator for 1.8/2.9 V */
-		vmmci: regulator-gpio {
-			compatible = "regulator-gpio";
-
-			/* GPIO228 SD_SEL */
-			gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
-			/* GPIO217 MMC_EN */
-			enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2900000>;
-			regulator-name = "mmci-reg";
-			regulator-type = "voltage";
-
-			startup-delay-us = <100>;
-
-			states = <1800000 0x1
-				  2900000 0x0>;
-		};
-
 		// External Micro SD slot
 		mmc@80126000 {
 			arm,primecell-periphid = <0x10480180>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 6afc9b0113ff..2d71366c479b 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -66,7 +66,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -76,7 +76,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index d3325276dfa0..c81531adcd63 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -79,7 +79,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -89,7 +89,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 1cbccaa1c3cd..323887f8a858 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -52,7 +52,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO193 EN */
@@ -62,7 +62,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index 61023711f113..0d2d5bcc32d2 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -56,7 +56,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -66,7 +66,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index a10710beff32..335539be55fd 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -52,7 +52,7 @@ bat_therm: thermistor {
 	};
 
 	/* TI TXS0206 level translator for 2.9 V */
-	sd_level_translator: regulator-gpio {
+	sd_level_translator: regulator-sd {
 		compatible = "regulator-fixed";
 
 		/* GPIO87 EN */
@@ -62,7 +62,6 @@ sd_level_translator: regulator-gpio {
 		regulator-name = "sd-level-translator";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		regulator-type = "voltage";
 
 		startup-delay-us = <200>;
 

-- 
2.56.1


