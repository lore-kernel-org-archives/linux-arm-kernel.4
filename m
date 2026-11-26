Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FDA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAwNv+NR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDI1M8Fg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CZaE8oRZd7zdqVVzvxdARw9e1KyFIybIP5uCuCoZ4ks=; b=wAwNv+NR2HWyeU
	LzdtlJ+BsX/VzYjecStxnSX5pZerMYKIurS0kGqwuFCogA8SP0xTfpb0P1oaEx1bJ4PkcCwywydet
	XmN/8ycmguQDUPVWBQ6NEl40ZTNC9hiGHSInxujf9X+tLJ8zGtAhEJjLSlHxPR/TzFftN4tihWXlj
	6qtJ4Fn6t1Aimzm/OQTTikGwsooQAVtaFi/97Ilpm9hyMPGiKUUhr7SsIXbrEo1nRggRcKBuwUjf4
	19Hm5DzWE2knR1PCyH3uxt83QfImPtxho7drP1a8PajT6chpkwwSbo+PDcR3pJ6+Tp6Znr8vi18jp
	rin1sWwTLuyx/4xMyu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV3-0000000Bfrq-1Lh5;
	Thu, 26 Nov 2026 00:38:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUT-0000000Bfa3-0YRZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 83ECC6015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013F21F0089E;
	Thu, 26 Nov 2026 00:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653452;
	bh=CZaE8oRZd7zdqVVzvxdARw9e1KyFIybIP5uCuCoZ4ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dDI1M8Fg1ldXD0ec+Ba3NZIwwQzLHJhdm4J0c06gLcpLJr2p27trhoA/Lh9TvA3VB
	 eI3/+GVAFAf4Uax6L8fqrCoUPWxGoSpAFidwTB3bu9NiqLwiT1sYWpb2738jKli21K
	 34+vQeCoe6ZRN5eFPJXbW/6iaA2P4vDkuLY+HxIN05YrS5e0pvRDYkv+gWPyjpzj9q
	 qCa8Q1aET2HjR7DQRmgepeQeVvRwA1UA+rP+yT/VqVDb5vl1YMdu8IB8KOBtMONB6F
	 YSf3yIyq3Rb0kz2BJ9nsaCqSKE8BYyOIfgwDuS/vVLJ0xU7olmyF0auDqXK2D44GI6
	 e6Dok20yL9S0g==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:15 +0100
Subject: [PATCH 11/20] ARM: dts: ux500: Correct GPIO key descriptions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-11-791cd62d8870@kernel.org>
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

Use names without unit addresses for GPIO keys and drop unused
address cells and vdd-supply. Update the pre-v60 HREF proximity
switch override to match its renamed key node.

Fixes: 1a780d45b10e ("ARM: ux500: move GPIO key configuration to device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          |  7 ++-----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  |  7 ++-----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  |  5 +----
 arch/arm/boot/dts/st/ste-hrefprev60.dtsi          |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 12 +++++-------
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts |  6 +++---
 6 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 09c8be0ad7ea..1f0f4ed74fd2 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -8,19 +8,16 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&prox_stuib_mode>, <&hall_stuib_mode>;
 
-		button@139 {
+		button-139 {
 			/* Proximity sensor */
 			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			linux,code = <11>; /* SW_FRONT_PROXIMITY */
 			label = "SFH7741 Proximity Sensor";
 		};
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index fb9d796c77cc..4a2bfa4c702b 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -9,19 +9,16 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&prox_tvk_mode>, <&hall_tvk_mode>;
 
-		button@139 {
+		button-139 {
 			/* Proximity sensor */
 			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			linux,code = <11>; /* SW_FRONT_PROXIMITY */
 			label = "SFH7741 Proximity Sensor";
 		};
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index 1764ddcdf08b..adb8d0be6f73 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -10,13 +10,10 @@
 / {
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		vdd-supply = <&ab8500_ldo_aux1_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_tvk_mode>;
 
-		button@145 {
+		button-145 {
 			/* Hall sensor */
 			gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 			linux,code = <0>; /* SW_LID */
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
index c87fd27b4434..5686d777311f 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefprev60.dtsi
@@ -10,7 +10,7 @@
 
 / {
 	gpio_keys {
-		button@1 {
+		button-139 {
 			gpios = <&tc3589x_gpio 7 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 5b27393a7ac6..29e680264e5b 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -61,38 +61,36 @@ en_3v3_reg: en_3v3 {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		button@1 {
+		button-1 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <2>;
 			label = "userpb";
 			gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		};
-		button@2 {
+		button-2 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <3>;
 			label = "extkb1";
 			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
 		};
-		button@3 {
+		button-3 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <4>;
 			label = "extkb2";
 			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
 		};
-		button@4 {
+		button-4 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <5>;
 			label = "extkb3";
 			gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		};
-		button@5 {
+		button-5 {
 			debounce-interval = <50>;
 			wakeup-source;
 			linux,code = <6>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index 369572347222..52a54732719e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -391,21 +391,21 @@ gpio-keys {
 
 		label = "GPIO Buttons";
 
-		volume-up {
+		key-volume-up {
 			label = "VOL+";
 			/* GPIO67 (VOL_UP) */
 			gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
-		volume-down {
+		key-volume-down {
 			label = "VOL-";
 			/* GPIO92 (VOL_DOWN) */
 			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		home {
+		key-home {
 			label = "HOME";
 			/* GPIO91 (HOME_KEY) */
 			gpios = <&gpio2 27 GPIO_ACTIVE_LOW>;

-- 
2.56.1


