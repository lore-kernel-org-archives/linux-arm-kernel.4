Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24714606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5EpQRWOi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIOxuI5k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A+W+M4a0tpMPaBVhwCroEh09aBMO2K9r3DCCzGIO2EE=; b=5EpQRWOiuuI4I4
	3ktrrAGrXT5imrrt4rMLzSdI4xRCinKKhuJcLeRrevSuDR40skEWZ/0yfWcVIRG9iycw2QE66mVTj
	K00U93HMn6Ig5dipLLtP90GTyb8Au7ASoxPeoxqOjmg/iKCR843N+/d1BNXz7hh5IJgZq6e1IYu2C
	iumVilGwO4jH3K8ng7ZjFdfgW6xHMPv0KItzl2ngMO62krYNfgnmqwMICoE/iPLzjX2mXLRt/OJA+
	luDnD8shqJ9DSwMxPYY8rcNB43a1uPkCqsTTHXzF89qUJmOTlm5G9fWJ6jBFw8RBIZ1q4E4xB+r6C
	GKfyzKahFVMwE1AbumXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV5-0000000Bfv7-1fU6;
	Thu, 26 Nov 2026 00:38:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUb-0000000BfgB-3zco
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A40A7404FE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA401F000D3;
	Thu, 26 Nov 2026 00:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653461;
	bh=A+W+M4a0tpMPaBVhwCroEh09aBMO2K9r3DCCzGIO2EE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OIOxuI5kWTuT2dzVew/JqyPxNsN7OTFom43hpSbO0xoX8iT7IfrcerLGmELhmDDLQ
	 X5VS49taztvoH3nsc27m7vMVWyPrPd6YQQ3yfwmnjCHdMMQICrz1wuf1jWY90nDGKX
	 CoIGuk0k4WIB2yYTqu5kAFtmP/6lwn8HDeNGrKOYD8G8KM74nqZAFn+mvg1EkYE6ff
	 Mv2yZnZNXsigcdmzQwe8ogyE4UaoClio3OaAtcF5HtEJQm8ogYZHCg2hht+zb8iDZQ
	 bId0vPi7z0ee1Idh0dimzeJSAMUraQmKUjl9KDQ1Mmwu/OpbJHkskdhrh1sx8Z7YGc
	 ifEn9yD6MH0Fw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:19 +0100
Subject: [PATCH 15/20] ARM: dts: ux500: Correct memory-mapped controller
 unit addresses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-15-791cd62d8870@kernel.org>
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

Add missing unit addresses to the PL310 and clock controller and use
lowercase hexadecimal for DMA40. This lets the simple-bus schema
recognize their register properties. Found with CHECK_DTBS=1.

Fixes: f2b56a6b2b07 ("ARM: dts: ste: Align L2 cache-controller nodename with dtschema")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 7bb09b45698d..920d07fbf00e 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -340,7 +340,7 @@ backupram@80150000 {
 			reg = <0x80150000 0x2000>;
 		};
 
-		L2: cache-controller {
+		L2: cache-controller@a0412000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xa0412000 0x1000>;
 			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
@@ -371,7 +371,7 @@ pm_domains: power-controller {
 						 <DOMAIN_B2R2_MCDE>;
 		};
 
-		clocks {
+		clocks@8012f000 {
 			compatible = "stericsson,u8500-clks";
 			/*
 			 * Registers for the CLKRST block on peripheral
@@ -637,7 +637,7 @@ usb_per5@a03e0000 {
 			clocks = <&prcc_pclk 5 0>;
 		};
 
-		dma: dma-controller@801C0000 {
+		dma: dma-controller@801c0000 {
 			compatible = "stericsson,db8500-dma40", "stericsson,dma40";
 			reg = <0x801C0000 0x1000>;
 			reg-names = "base";

-- 
2.56.1


