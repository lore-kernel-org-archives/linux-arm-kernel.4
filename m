Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C10606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNXxLosm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuUqt0sc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uVupoW+kahnaPSWgFyIp1BQs39uWiXLnt0FbgSsbxs4=; b=UNXxLosmpKr1Wh
	05eHFDNQKCuTEfnPwINHJFfLzZWfgCuSV4Py20r2FxHnzx2BhNTKDGZZ1n3l6Pc/+QSJ3mSy79hlg
	QOH1++FeGPBmm72C7cNVnfguT8PHOqisSGA67l/mosNMu4l+C/p1f0VBrTRnmESPHtQL0C1yFF1y/
	aiBvHaqMiWwXWO01gKnrslSdZ92Kaub/D6J817IalJ66Ya0Vu1y/YEq1imzbdOPeTv+0lxidFFrFA
	Xkw6jzTIvr4hTTKrkUthMEywyEXYagOLcUQbktw8Iy4HkxrrIjF43TuJM8UmhqJJahx3Coztritdm
	b52/niDHe3UT3u/dWtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUI-0000000BfT8-3W5Z;
	Thu, 26 Nov 2026 00:37:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUE-0000000BfRr-3eHi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9264F40601
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA2C1F000C6;
	Thu, 26 Nov 2026 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653438;
	bh=uVupoW+kahnaPSWgFyIp1BQs39uWiXLnt0FbgSsbxs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DuUqt0scyQ4BfGn60h3o/qj6MXFvD0z3ynsfSxlhiQgsVyVxdjpQzkaeCJia7WvO+
	 c6mSLSMKChFMGh3JK7QtJ90jKzaHOKK9jtlTep02T4mkkHLFFCb0CHIffLpwiXbV5z
	 X0Bf13tWStvZYPD2k+LGcOgduw+bwUmhJhVFVZWk4huNhxN5VPhlTK4cK0rKKvb39D
	 LZqaPIFhJNQYydxtVtDOgJ9PjG2hcXZo8TMOFsZE/JmpvuxIWWn7+5Dgy+j+dEk58R
	 LFrZnEifrW2iJZw1I8myTNBKeze64P7dRK6Y5qqs5nEIptyTUS1F63dS8GNkvM7zDy
	 cRzF31OKM1SPA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:08 +0100
Subject: [PATCH 04/20] ARM: dts: ux500: Remove bus clock rates from I2C
 peripheral nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-4-791cd62d8870@kernel.org>
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

Several Samsung I2C peripherals contain clock-frequency = <400000>.
These devices do not consume such a clock; bus frequency belongs to
the I2C controller. Remove the misplaced properties while retaining
the controller settings. Found with CHECK_DTBS=1.

Fixes: 8388234ec562 ("ARM: dts: ux500: Add Codina TMO device tree")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     | 3 ---
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts     | 1 -
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts       | 2 --
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts     | 2 --
 6 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index 3350fc775cc9..6afc9b0113ff 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -241,7 +241,6 @@ i2c-gpio-1 {
 		magnetometer@c {
 			compatible = "alps,hscdtd008a";
 			reg = <0x0c>;
-			clock-frequency = <400000>;
 
 			avdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
 			dvdd-supply = <&ab8500_ldo_aux8_reg>; // 1.8V
@@ -482,7 +481,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Codina has the Amstaos TMD2672 */
 				compatible = "amstaos,tmd2672";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 
 				/* IRQ on GPIO146 "PS_INT" */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 8df2e4b74174..d3325276dfa0 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -298,7 +298,6 @@ i2c-gpio-0 {
 		magnetometer@c {
 			compatible = "alps,hscdtd008a";
 			reg = <0x0c>;
-			clock-frequency = <400000>;
 
 			avdd-supply = <&ab8500_ldo_aux1_reg>; // 3V
 			dvdd-supply = <&ab8500_ldo_aux2_reg>; // 1.8V
@@ -321,7 +320,6 @@ nfc@2b {
 			compatible = "nxp,pn544-i2c";
 			/* IF0, IF1 high, gives I2C address 0x2B */
 			reg = <0x2b>;
-			clock-frequency = <400000>;
 			/* NFC IRQ on GPIO32 */
 			interrupt-parent = <&gpio1>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
@@ -565,7 +563,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Codina has the Amstaos TMD2672 */
 				compatible = "amstaos,tmd2672";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 
 				/* IRQ on GPIO146 "PS_INT" */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index 277060c08a20..1cbccaa1c3cd 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -536,7 +536,6 @@ i2c@80004000 {
 			proximity@39 {
 				/* Gavini has the GP2A030S00F proximity sensor */
 				compatible = "sharp,gp2a030s00f";
-				clock-frequency = <400000>;
 				reg = <0x39>;
 				/* FIXME: GPIO146 provides power on, IR LED? */
 			};
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index e821527f418c..1ab09e8d8d2d 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -411,7 +411,6 @@ nfc@2b { /* 0x30? */
 			compatible = "nxp,pn544-i2c";
 			/* IF0, IF1 high, gives I2C address 0x2B */
 			reg = <0x2b>;
-			clock-frequency = <400000>;
 			/* NFC IRQ on GPIO32 */
 			interrupt-parent = <&gpio1>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
@@ -607,7 +606,6 @@ i2c@80004000 {
 			proximity@44 {
 				/* Janice has the GP2AP002A00F with light sensor */
 				compatible = "sharp,gp2ap002a00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index 30f9bdfd2893..dad2844169b1 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -414,7 +414,6 @@ i2c@80004000 {
 
 			proximity@44 {
 				compatible = "sharp,gp2ap002s00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
@@ -438,7 +437,6 @@ i2c@80128000 {
 
 			accel@18 {
 				compatible = "bosch,bma254";
-				clock-frequency = <400000>;
 				reg = <0x18>;
 
 				mount-matrix = "-1", "0", "0",
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index c3eb07fe2a27..9aaf42014efe 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -394,7 +394,6 @@ i2c@80004000 {
 
 			proximity@44 {
 				compatible = "sharp,gp2ap002s00f";
-				clock-frequency = <400000>;
 				reg = <0x44>;
 
 				interrupt-parent = <&gpio4>;
@@ -419,7 +418,6 @@ i2c@80128000 {
 
 			accel@18 {
 				compatible = "bosch,bma254";
-				clock-frequency = <400000>;
 				reg = <0x18>;
 
 				/* GPIO224 used as "smart alert" interrupt */

-- 
2.56.1


