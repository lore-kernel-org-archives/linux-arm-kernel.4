Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D6606A8AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=um5et6wB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANwfseDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aWQrPeagJRuHhlv3UwVohIzY/ndLnIlqUr3hBo8qhN4=; b=um5et6wBZ0U6r+W1KMf2v6xYyT
	1LwpHrSpuTmx7twj06Ht7z8X7ocOQtzAsovD1E2X011ODHP1AaMkz5b4/CppkydwPUoTIfwi5KdyX
	6hkkncij/cKiFnV9Nli7xYgi0UHGbuKFh6PaZq7y8wm9FBeZIBD4T8LxSjckfrNe4HIFtYVTdHEP5
	04VYHeN6Ofti/Cjm66bQ58d3uWbWPeqo2XahCPABgzbeH0TDfOhWRdSUAEr7mukJkM1cObUxqGLqX
	bLi8A/kPvWVP7geMbjcxiCC53UCCYqJdXd3bxDrSOxb2AQXHgyFqosgSJvcfU8dUkxej/hrvSuQVq
	QNIIkzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIu-0000000DZM0-0x7l;
	Fri, 13 Nov 2026 16:39:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIe-0000000DZAP-0Kk7;
	Fri, 13 Nov 2026 16:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0464D469C9;
	Fri, 13 Nov 2026 16:38:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587931;
	b=FPQod+xZcgov4am5UvhhKxVM3/XYCnmqf1qlOmO8QI4NcqeCJs43qvfAU9JbjPQzf7a2
	 lzULnx7gDbyQu9YJrSJWLyEM2MFnu84VpPSa05q7IDtRs5NiGhQTTJu7Aqk6dQ9x24XPQ
	 N32lYpU9T2cfsmeAoQjaNKrJd9puCynG76/gN7N5bzusuLncXpGsFA2be/8M2jmNfLeNI
	 OjIvV3Ra2sHfz+CqGzkGfneE5Md6s7TTQRDhJPgl996kVKhnA4mZBBKd13PKZ+CJTguMy
	 mZqgSk0EgYUd4aiP6tWWkCTm53S6A+4nS47ckGxMUGZ9vDPF9GqWeUSFF+vZKSnfeMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aWQrPeagJRuHhlv3UwVohIzY/ndLnIlqUr3hBo8qhN4=;
	b=Ox0GQEJMGgZhUCOqYDTR9ZFZdXSM22p0O7oXObwYi/V/g+p/sp/De69weM+AO0G5OU2s
	 60Xj1aFzJQRhWrMHyAHT5gd5jhcw7CA9W48uJUJ2M3LpAYdgSBZA1L8WGWcvjGpFaNDj2
	 T4N+uqCDhRBNyU8v3VpLJg/Hj2KHC5R/09bWCqXie3DYjR6HCfRIsqs6yQMxyQIeZfjeO
	 0gFLdJfBhC/5626sk36sE7pgKyuxv9gF9F83FvByA+c8Ki5mBKH4jVWWUdQKpP81Lc1fe
	 73XF3nUTsIUCCzE9qUi03l5PKS5uCVhLswuNNeGEqqniPEoO5A5QQy8Pw8PcbWnTXig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 673B91F000C8;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587931;
	bh=aWQrPeagJRuHhlv3UwVohIzY/ndLnIlqUr3hBo8qhN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ANwfseDxlRVhtwI/+TDGsbXThfNorLa/nWtjxjgun5swENib16W2LvfsDBmNgJO8Y
	 LqcQ1t7KodxhOXluBrKg9Z8YJV6D4Q39LURJYARnwXywXdkuBYBlyw/TtwGFosedO1
	 6JiNPH0Li/FDSxkqiA2kA3OHM2Jm9CM7M6rsFYDdit5chlWTrcdDxgom/agRJQA2P/
	 quG7YRxRmyiWh7gQfLvCLSRK91dK1VaNJoWOE2paFHZX3em22Lq7tQW536C+kNpfMP
	 k16oy1gZsBAFuJjFpFiMEwvSO3cjtpy8VdK+1CoexEFhWeGDIQviLjLNbDI30PaHkZ
	 IsZfiP68Bhn5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B74F499AE;
	Fri, 13 Nov 2026 16:38:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:54 +0000
Subject: [PATCH 8/9] arm64: dts: rockchip: Attach the masters of the RK3588
 PHP SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-8-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
In-Reply-To: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=3063;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Eywo1baNrJ1Su6epW6UvLlR5LbuALQF4wCpKeTucpp0=;
 b=nZdrYLxPkrM8t5kgc8zE46GmG7YiEe37zQU/0qimGODqdNWa1XU0hl4ibHEnRFGyNy0jrx5Wz
 AIpNMKWpha+CX4LhWo3q5qXrGXglhp81dgdSq7IpUmmNkhylyT/XD48
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

GMAC0/1, SATA0-2 and USB3OTG_2 are behind MMU600_PHP with StreamIDs
1-6. No effect until the SMMU is enabled.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 3bf8d0e4ff33..cb0a39f63788 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -534,6 +534,7 @@ usb_host2_xhci: usb@fcd00000 {
 		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
 		reg = <0x0 0xfcd00000 0x0 0x400000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH 0>;
+		iommus = <&mmu600_php 6>;
 		clocks = <&cru REF_CLK_USB3OTG2>, <&cru SUSPEND_CLK_USB3OTG2>,
 			 <&cru ACLK_USB3OTG2>, <&cru CLK_UTMI_OTG2>,
 			 <&cru CLK_PIPEPHY2_PIPE_U3_G>;
@@ -2310,6 +2311,7 @@ gmac1: ethernet@fe1c0000 {
 		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH 0>;
 		interrupt-names = "macirq", "eth_wake_irq";
+		iommus = <&mmu600_php 2>;
 		clocks = <&cru CLK_GMAC_125M>, <&cru CLK_GMAC_50M>,
 			 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
 			 <&cru CLK_GMAC1_PTP_REF>;
@@ -2357,6 +2359,7 @@ sata0: sata@fe210000 {
 		compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci";
 		reg = <0 0xfe210000 0 0x1000>;
 		interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH 0>;
+		iommus = <&mmu600_php 3>;
 		clocks = <&cru ACLK_SATA0>, <&cru CLK_PMALIVE0>,
 			 <&cru CLK_RXOOB0>, <&cru CLK_PIPEPHY0_REF>,
 			 <&cru CLK_PIPEPHY0_PIPE_ASIC_G>;
@@ -2380,6 +2383,7 @@ sata2: sata@fe230000 {
 		compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci";
 		reg = <0 0xfe230000 0 0x1000>;
 		interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>;
+		iommus = <&mmu600_php 5>;
 		clocks = <&cru ACLK_SATA2>, <&cru CLK_PMALIVE2>,
 			 <&cru CLK_RXOOB2>, <&cru CLK_PIPEPHY2_REF>,
 			 <&cru CLK_PIPEPHY2_PIPE_ASIC_G>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 2bcf30d8a338..425770a8ff61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -538,6 +538,7 @@ gmac0: ethernet@fe1b0000 {
 		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
 		interrupt-names = "macirq", "eth_wake_irq";
+		iommus = <&mmu600_php 1>;
 		clocks = <&cru CLK_GMAC_125M>, <&cru CLK_GMAC_50M>,
 			 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
 			 <&cru CLK_GMAC0_PTP_REF>;
@@ -585,6 +586,7 @@ sata1: sata@fe220000 {
 		compatible = "rockchip,rk3588-dwc-ahci", "snps,dwc-ahci";
 		reg = <0 0xfe220000 0 0x1000>;
 		interrupts = <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
+		iommus = <&mmu600_php 4>;
 		clocks = <&cru ACLK_SATA1>, <&cru CLK_PMALIVE1>,
 			 <&cru CLK_RXOOB1>, <&cru CLK_PIPEPHY1_REF>,
 			 <&cru CLK_PIPEPHY1_PIPE_ASIC_G>;

-- 
2.55.0



