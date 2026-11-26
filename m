Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0361606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gKm3t0s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOOpcgZK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1VBRDqcHt2mhINg0GWtS/jFrH3vPdeVvBrzmi+p2094=; b=4gKm3t0sfpv/Ka
	KelGvGSwcqaOOx0IZAFYz0+86uYE9msXvyVFzgskpSIjigCcnzPTQDdCDt3GsRNx0/upm19B7Irb3
	Z1cPu2fqWXGrvIKE2dZCOY+6xcpE8eCiRia9JfbTgnu/A9nWFP6KP1zBO1cWtszWgc42l5+OUdDxW
	jMm8ICemFn5dz0DAmifCnXCde9Uk9dvv3HA8KFaMWJJjmafbrq6csOO77pWUxgbPnAQkfhOYwACbY
	I3UG7EXb7rHAJz48xVhuJJQ7GM86BpTEclldqVpvM28vm6LbulUSRplfXTHbsmFmEo63MgQpkYRwI
	uKccxxDkhXyDwAq08LRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUI-0000000BfSr-2vp8;
	Thu, 26 Nov 2026 00:37:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUD-0000000BfRf-0oGN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A08F660D14
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF11F000C6;
	Thu, 26 Nov 2026 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653436;
	bh=1VBRDqcHt2mhINg0GWtS/jFrH3vPdeVvBrzmi+p2094=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SOOpcgZKvrGJF5SeBKnl18qpjfFps4iTpZTg9dvPMfigzqTDKjw39ZcdmFSulMtz/
	 ir+++YejxuNjT2Uz+75A6Z5T44tA44Eq0HTTKdZRoIgI3gj4LZaSQhbTrjD84LYq5m
	 H/JwWMqViSvT1atELnqp6HCVKjVT0/ChgdwzjU2mHrGhKiF0SAN8NmaeaIJ/jH4Q7i
	 Zwn2exlavGjNEbYdnCVqnEJUbXo96RR4pHkJbYYSiExeVgOPN+bTB1P6985ur9xlH9
	 4SntrAnGbsIWX/K/lN5RbQW8+0QRbtKcGRZWsD2KetEWOMWC9LyFfBm4oaKnSuOg2O
	 YxH2vvi/oc2yQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:07 +0100
Subject: [PATCH 03/20] ARM: dts: ux500: Correct HREF thermistor and pin
 group names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-3-791cd62d8870@kernel.org>
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

The thermistors have no address and must not have unit addresses.
The pin configuration container named gpios is mistaken for a GPIO
specifier by the generic GPIO schema. Use descriptive node names
without changing their labels. Found with CHECK_DTBS=1.

Fixes: 695055861a36 ("ARM: dts: ux500: Add thermistors to the HREF")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-hrefv60plus.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
index b23966c16a32..c9e9ef830988 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus.dtsi
@@ -49,7 +49,7 @@ map0 {
 	 * Thermistors on the board, formally to monitor battery temperatures
 	 * but what they measure is the board temperature.
 	 */
-	therm1: thermistor@0 {
+	therm1: thermistor-0 {
 		compatible = "murata,ncp18wb473";
 		io-channels = <&gpadc 0x06>; /* AUX1 */
 		pullup-uv = <1800000>;
@@ -58,7 +58,7 @@ therm1: thermistor@0 {
 		#thermal-sensor-cells = <0>;
 	};
 
-	therm2: thermistor@1 {
+	therm2: thermistor-1 {
 		compatible = "murata,ncp18wb473";
 		io-channels = <&gpadc 0x07>; /* AUX2 */
 		pullup-uv = <1800000>;
@@ -361,7 +361,7 @@ hrefv60_cfg2 {
 					};
 				};
 			};
-			gpios {
+			dangling-pins {
 				/* Dangling GPIO pins */
 				gpios_hrefv60_mode: gpios_hrefv60 {
 					default_cfg1 {

-- 
2.56.1


