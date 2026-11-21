Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFE606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DSxxKS+3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hpxxNDGC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=; b=DSxxKS+3d/XMgc
	rhtRo6YZROkBwqyBAVFfBbCLarFLftQXZq2GkZS6LvLhb8BdyicmcVYg/zkHZKxTYkFn3YpPapc/N
	IM8BEJ2Upr9v1CmMce1cTnM4CHNKNe2BRJ2CMnnQISGG2GEDHXXr3g1ApXWFlYlS4J5jHus/xU8Wv
	EFSkQOrE3iVTGET7MPH7QcMgqH6PCnp3txZByjhMDGbDo2vI7Ww9s9ml6OEd8fDIAYPaeOdfG7RA+
	qUs3Jc5NEUU1Y7+yeXPjhYsmQHNE11wPiGh7ghfokXEGnB9kYy/AbYHlDuOJo1NPgGOwH/+NNVoC5
	I9uqqBP9CO+wMm4jlr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYj-0000000GwCp-1FqJ;
	Sat, 21 Nov 2026 08:34:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYT-0000000Gw7u-3wO4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4427161472;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250081;
	b=qGrMZ26wf5Z47XgYEPR2/vUqJ4iKygmaxTvkbmfcCDhDALQRz8XCI8ISSN8C5inDk/w/
	 9TFmtS2Jfv2TQSKwea2FB3MgqkAcBO0jGxRCGBD3IQvmcOYybcIfBLizSDmS5WHsnCpcD
	 5QRuCT2Bnnk9BgpWp3hBON5eNGg7kwugMZy4rTwMebr2MUoWaBPLL5HQUZk3ZvE/Z4/Ij
	 VPB0poSWWvgCM1CFrna8k94hCmJrjzbstxY2lzNiPjcqYSsY2Vybu0YlolesMN92GLavh
	 5dQOIBNZT5TgX08J+BJEDVEP1fK3Cfcx5HcnzJJiobWXMW/5oYpMnlrnCqJDuZ5Adxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250081;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=;
	b=jAq5EFH2UQFjcEvcnQ7b7FLo2R10COn2fgV7M7vWkD01Y93b1O0HWNHyZuUCFaUlr+Kr
	 vQiqgJJLtsfJ1SpszEwSiEiBpV+pBb63/e3Ggp0vWTr+nsfBZ18Tk3tHPw6zzngQkqhyS
	 1PT4KCbpVjSWn68AP5ZwWCqW5v/9VplppdKJHMDSiD0djVD6mtN6vu4F6uyqdWk7PC00W
	 KstWc5mKLClckPsGuaKLvsQgzp22HUamDJDUed53wBMA9jiF08QqNDHXgsQ2tcbVdwyGy
	 b/LTu4QTm4vF53ALRqES74Qo9wmvKFvnOrB5Yy5o22+fE8YT3XogSmwSZ7TLdBoGNWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12B201F000C0;
	Sat, 21 Nov 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250081;
	bh=rL0MUx276mgMEoRjX+bVIlwuG86tWqK7KWE3DnOCyNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hpxxNDGCHMLFMLXd+NM4KMYZihw6v9cfchd5Xo7Y7FvmEWRhCWugMX6h+1YYWUai9
	 mD9Dm6O4Jj7qPCugRRGWXl0q4oiIUOMc50GWpAlb30mA68iJPQ25xQS545gJDYMSYU
	 iFcSqY70AECzCglI2Oa6UbvfdwVNBTHHkTL9EnQf7MYZc+Jm+G7qtVyLb1FavLuaWb
	 R/RnzQRbMBmdtCtr7stBfYWa4BjWEVrjsnC1e6TZzi3tjCKV5CLy0AgK8Se6ARUEmN
	 CI0N6wuQ+LXcJvCWnZYYID9SOo51DiPSbJtm45AfQiHRs3xnKWULBl6XLjltAZbsx9
	 E8FgjLGdDU8mw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9435D4BB9B;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 08:34:17 +0000
Subject: [PATCH 3/4] arm64: dts: apple: t8122: Add NUB SPMI controller and
 PMIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-t8122-smc-dt-v1-3-898f3f5d6228@gmail.com>
References: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
In-Reply-To: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=2163;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=WIEK8D0DKokW1yUBnum23jVc4HEfCGnQdTPUuT8Oy9E=;
 b=W625NLC3d6xr9LAGJdlO6jThPUcK6j4G4VQEz5SeOSMndkaQlE96OwEsqIE8BG68Zx/nhPdvn
 GXGsKNpWsC+BWxcruLi4GZYC3bSEnM2BrNetv/6oOSDZmNjCM1kGY8H
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Janne Grunau <j@jannau.net>

Add the NUB SPMI controller node and its attached Stowe PMIC with the
fixed NVMEM layout for the Apple M3 (T8122) SoC. These NVMEM cells
provide boot stage, shutdown, panic, and RTC offset storage used by SMC.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 959ddf36efa1..3766da3c7b18 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -411,6 +411,63 @@ wdt: watchdog@2e42b0000 {
 			interrupts = <AIC_IRQ 432 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		nub_spmi: spmi@2e4714000 {
+			compatible = "apple,t8122-spmi", "apple,t8103-spmi";
+			reg = <0x2 0xe4714000 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			pmic1: pmic@e {
+				compatible = "apple,stowe-pmic", "apple,spmi-nvmem";
+				reg = <0xe SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fault_shadow: fault-shadow@867b {
+						reg = <0x867b 0x10>;
+					};
+
+					socd: socd@8b00 {
+						reg = <0x8b00 0x400>;
+					};
+
+					boot_stage: boot-stage@f701 {
+						reg = <0xf701 0x1>;
+					};
+
+					boot_error_count: boot-error-count@f702,0 {
+						reg = <0xf702 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@f702,4 {
+						reg = <0xf702 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@f703 {
+						reg = <0xf703 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@f70f,3 {
+						reg = <0xf70f 0x1>;
+						bits = <3 1>;
+					};
+
+					pm_setting: pm-setting@f801 {
+						reg = <0xf801 0x1>;
+					};
+
+					rtc_offset: rtc-offset@f900 {
+						reg = <0xf900 0x6>;
+					};
+				};
+			};
+		};
+
 		pinctrl_smc: pinctrl@2ec820000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xec820000 0x0 0x4000>;

-- 
2.56.0



