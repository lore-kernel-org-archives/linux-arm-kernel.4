Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7263A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Td1tqkZZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyUZjsdb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=; b=Td1tqkZZqP6GeSHE53rqtT05wh
	sBalwlhvf3o7FWzYjjzEs4pRBooWtw74PYPQnyY1WJ/DrAvYq2mel7B1zE4Wrbk8NU/v0qUIrUXyV
	rT+sS4il+xkmbpjuvMpdXkY43E9fgLIjzar+cwsKmAk30hCzz7F15V4qT7VPL0p6RZeKR1tk5va87
	1dTISWGfs+X7XHvqhyCqv2GPfX3GpPGKhZvzvT1fMmcTYKYuCb2fGMxATEftX2tXn1ZgHMaX3Qvvk
	/793vAayxBDrRYKy6Wnqs7JRaOSCISyqKGZivLm1loa/nFrdE9ucBIwrjS+NnCkX+n/MzKLhQL88x
	wPDmCCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuiI-0000000Au5H-3rFV;
	Thu, 19 Nov 2026 05:29:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuiG-0000000Au3z-3lKC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 05:29:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87C1261344;
	Thu, 19 Nov 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795066175;
	b=yQ7iTRmO0bobqpKv7wXoE0A5qItoDRjac4VP5Hac3SGhWcQ6FfbAGdZHBnDjrqjZp+DN
	 zVvZcphxJr2qwljU3OTyFlKB9TRYvdp3aGb6oJyae7tGqPtZVNDo9z0dErLx7JjaUiDvq
	 TdsryFucoQ0sfiJh5QEOPI4DFT6Ni3liizM+ufYTDR3lmN5FJ7CzlZ32le6xAG6BB8m7W
	 Noh1lRCep1/dj9DDtS38dHlUOdTJUySHkHVohaKel+O7P9VbGRzceM2RHYUrELMSZAcgJ
	 SAAcsAJ5bJ5d69dACSHY94HxEBnLW/kjHSxwequTAmuFEkHNkhTDcfVLZ6X2SHCAh3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795066175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=;
	b=iHR5DEWv8v7AubdMJHk5RSgjVr3Sc0OwpDwR3sNmpMR14b0o6WlEOe/mVF2joHXuFQVD
	 u74z7N0CdIjLTbRWOKyEbMjtzXBkBWXMARBK7tBD7/zHqQbh4DT2ZPDCHo1DbTZv+kkPh
	 oj86OpQ9jE3/hB2cFnkSqhEL2LH0XhgA3wLCXDYxibWr/YiCczUIHcnitRV6ofkC5dsQY
	 AygoykOZrSCtcawJ4BFJb6TLEq0z+z/dKs7b8bN1z5fBZQPOa/pLKeIw0HiahT1YNcAGy
	 +j16ZHiDLIvtExXOe6dKWcHNg6edBDyI3UtyTANY7PuKy2L9DVZiCY9eCBIb1dPVMcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4AA91F000C5;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795066175;
	bh=Qk/WiXag4NiAb7SQYrAI82ZXlfWM6gKQ6LP6PETB5Lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SyUZjsdb08WIX5rkL/R6HiQQrJUgGpE3jZOrXoocxl+FHDQDemEzFCss122T7L8y+
	 gWOS2juA2dl+BSOaTSdROXmqB8gRS8N1Qru3JKYW2sAwAfDgsU94sYI0yaRC4jyR9J
	 +I7TCD2Zt5nEE1thlPByKlIj2EsAp2SxRLz7cJvRSbmO5mPjqciBYgNQyUsBizLPMw
	 TxQ4usbba2ix5DWmLLCrSfl5gdoXKVb3RBJkf1KiBORshYTXdidMPjtFe4v3i4N71h
	 a951WOFp6A+TXOn1+2f+KUeFZVU17StxKEmWpV+D254Bvwn5AqsOKWv8BYOG0/ULhN
	 16EPknnO5OdCQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2EBCA4B111;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:29:34 +0000
Subject: [PATCH v2 1/2] arm64: dts: allwinner: orangepi-zero2: Reference
 the SPI NOR by label
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-zero2-spi-nor-dual-read-v2-1-185c87065e39@gmail.com>
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795066173; l=1653;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Q67hG4LUmhhGEHNYhzy/cl5VtGg3Fnoo9rBc5WdZgVg=;
 b=QrPHNczIJ3tpZjilTnMJlGmRdNz9hN+huIkd/Hg9qAHyJ105T47Sa1JjlqhqPvMgKnRUyLyt6
 51zPNn9l0f/AfQ8TFGJtpZfn/1vOovDcSIOaWnKJZ59LbZGkNAXKcf0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Andre Przywara suggested labelling the flash node, so the Zero2 sets its
supply through the label instead of nesting flash@0 in &spi0.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..646d92e0f724 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -104,7 +104,7 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
 
-	flash@0 {
+	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..59bbb09bcdbf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -24,6 +24,10 @@ &emac0 {
 	phy-supply = <&reg_dcdce>;
 };
 
+&flash {
+	vcc-supply = <&reg_aldo1>;
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
@@ -147,9 +151,3 @@ &pio {
 	vcc-ph-supply = <&reg_aldo1>;
 	vcc-pi-supply = <&reg_aldo1>;
 };
-
-&spi0 {
-	flash@0 {
-		vcc-supply = <&reg_aldo1>;
-	};
-};

-- 
2.55.0



