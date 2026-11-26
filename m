Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8A6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=czax61+o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKbh0d3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NCQTtxn/Sil4DrmbNSeKcCD6R/mM62YVDCQe+KaRvfk=; b=czax61+oicD/PG
	N6vRRK5nDRKfZNpoCMCr1A7tMiHtIYZfJAbgM8YKfur922FzXv5nvmmvmLt9O1626OAWQwJRnoEcl
	fedm1gigKWJbtGldgSM0HCVrHjuM3+rcw0KFiEw6MxplCKKLn5UKU0EpA5INBrKBbr+JB0j//y/tA
	FemPzbEZhaV4/TR70I2WKpJIJmrqQHty4ShK9IdfL6uWIJBp+iEK9Sw8o9ji2utTDgxtzQfTChjHB
	NO0osix4uzj5F9koUxaTuUMIc340x4ImrUJgD/nmz+FgqGni1idGxVGVRIQteCKr2ex5SQSyFrmrf
	EtAv0PJm34oh7PzIg26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV3-0000000Bfsi-3iEd;
	Thu, 26 Nov 2026 00:38:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUM-0000000BfWK-196p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D808401D4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812A51F000D4;
	Thu, 26 Nov 2026 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653445;
	bh=NCQTtxn/Sil4DrmbNSeKcCD6R/mM62YVDCQe+KaRvfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HKbh0d3wY3fle5r6+bAaq41TZh/NK9OTmfPjg7C6Dkm3i/jgRJYadFd9Fox84t1iU
	 EiiUmfNTDPyRsGubBHazqvbbw3jmkqDq+1BSfaOm8gUisO5kQnadp4eps6aEyZYez1
	 8UkrSfmf89xE5+Ej0qA7LDpeznv+PPXs6rlqrM32ut/I7XJ+uZdzxd9hv515qfHfjX
	 QEf2AAAzyRWBpLayejpG0jASaiwlbV6FuAgx0nPsYFj45Kj3b5MAeTLpDPft9Dq5jT
	 tFnGe/UMLqMB4j+k1PbUnRzSETdcr/oJeUDLajyn1iidF3NQSjgxhZ52sdlDTH2DNH
	 bYMqHObIkrcYA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:12 +0100
Subject: [PATCH 08/20] ARM: dts: ux500: Give DSI panels their unit
 addresses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-8-791cd62d8870@kernel.org>
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

The panel children have reg = <0> and must be named panel@0. This also
allows the DSI controller schema to match them. Found with CHECK_DTBS=1.

Fixes: f4bdfcc29a8b ("ARM: dts: Ux500: Add MCDE and Samsung display")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          | 2 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  | 2 +-
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index a7a7146980bd..09c8be0ad7ea 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -199,7 +199,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "samsung,s6d16d0";
 					reg = <0>;
 					vdd1-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index 391e69769941..fb9d796c77cc 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -214,7 +214,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "samsung,s6d16d0";
 					reg = <0>;
 					vdd1-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index c5acb60c15c9..1764ddcdf08b 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -156,7 +156,7 @@ mcde@a0350000 {
 			status = "okay";
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					compatible = "sony,acx424akp";
 					reg = <0>;
 					vddi-supply = <&ab8500_ldo_aux1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index dad2844169b1..61023711f113 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -481,7 +481,7 @@ mcde@a0350000 {
 			pinctrl-0 = <&dsi_default_mode>;
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					/*
 					 * NT35510-based Hydis HVA40WV1
 					 * Apparently some Kyle models can have a NT35512 fitted
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 9aaf42014efe..a10710beff32 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -472,7 +472,7 @@ mcde@a0350000 {
 			pinctrl-0 = <&dsi_default_mode>;
 
 			dsi@a0351000 {
-				panel {
+				panel@0 {
 					/* NT35510-based Hydis HVA40WV1 */
 					compatible = "hydis,hva40wv1", "novatek,nt35510";
 					reg = <0>;

-- 
2.56.1


