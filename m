Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30118606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quoZhx+Y;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=YCJ1Sm9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=; b=quoZhx+YCi6mec
	5d4vKXuEXrkB966d9zOs8UX0w5Z77h25IKzg/W7v86rHnCdD/7f5aC9rYxAxkczUVPP6XtFp1ftjT
	p+ACsg+tSKM1FvpDjlHSeF3z5dJxP5FMQthzR6M03OLGfw5Qjr9s/WjLth2cBcSB1id49uPv4wvNl
	nc4M3YNntLrJ7jPy8nq9S2S5f8OomKFiRzvUiZXvzYFwqlU1abjDECcDzV2FXZOrlJjUpXVBT6bdY
	1RLz/2hrj7pyTzfXOE3KGRMj7gqiYO9vbR65DrBjN7b1oi1/+ehmbkswxUj3tZ2dFljv9ahfp6qFv
	ewl7HA1nkyfl8Zgc1Y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVvb-00000003yIt-1BJI;
	Mon, 23 Nov 2026 15:25:59 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVvI-00000003y2f-1eET;
	Mon, 23 Nov 2026 15:25:41 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 87D9920215A;
	Mon, 23 Nov 2026 16:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=YCJ1Sm9wSJyTcVdstzw5TsvJXDZrTsBfIFbBj2QnEq1t68ZAOhF3V5MaZ9/eAxq3HNlxTp
	jc/3pewzJvQrqCfRvXslFI41qGS5lBjg0x25htfrqy69o18UWIzMycjC4ezzcslHcaTVUO
	yYB+LVEVHPQWIoKv8KRRldVuVgiFzJsxXSo9LY/LMgeCXpZcjqrHbpYUPQyWkbrhloHJT7
	jJq1PlkUyLZAH9dM7b0ECp+0irb9iNxbL8SqnvSjsxsTvnvFAU7itTDyeE2yrtBI+IbiJu
	PQQFI0W9324A5dSTzfGxgS2F9GZ3iLMG2TkSreMvydlRcKVLyB8p4S86jVau7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZuQpjBISQ5PzofF8ezvlSlMkGFsIg2Ig7KZUE+5nI=;
	b=JdFLa67ldlJXlkWYyXw5VpJGdvOdZ4zAAp3LVTkbFNiGrVQy2ofOAx5QaZbHyFSfuXZkYU
	fTXayBwvauLYRfU4pUsaVy92lJRz3PX+cDVEXkuHzd1F9AcophTX/yEdIERH1WQnG0eoI7
	sk3S+N9qaXNAYADa/SjWp9LjfkerXaR6bIXpSYdEFkiA3MtsvbJ+295evOJfVbDoBcqLj5
	NHqs9sCNlnwM6sdexA6Kc9aJe3dw4iuJjnERt8K2vpcZmUXIyG31XmJ2W3LB4lGVwzukLc
	kvZHOYlPctPwsu/UgkXEmXoeo/l62guBLiRSvkdRercqqKAsaGYhiJFdfMg4Og==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447534; a=rsa-sha256;
	cv=none;
	b=PSfHtdakjULySKUW65G9H7whHeWSjhN4P340vni8F5U5Mv2jTVc7M3bcCjfFLOMXvOx4zt
	GXGeuvGQWhpuaxtoFepPIjcNqW0U6In9KQUX+t2tJe7WgzI6Gv/Pyn3gbyeTF5Fyvp2UlF
	xxiWg1Fi/3c7PsEdyGUQAxDrMIrTlqpTtQDva+McDmsxHZIRuF0q8qo0vG9qexCR3hcqYt
	8jEpNoTEgUCfBfSy5PtfXYSbmbGzkCpMLpX6spo5x0pgMnm4gfaMOpZz8d5EBA9zeM6i+J
	uOKoM5yWcXbJcNpq4PVtkhUi/IXQU0L8Ahs1kL30uIAf/NiWduqpfY7IEGZXqA==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 23 Nov 2026 16:25:22 +0100
Subject: [PATCH v8 3/4] arm64: dts: rockchip: rk3588: Add JPEG decoder node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rockchip-jpegdec-v8-3-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
In-Reply-To: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=2087;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=/5otNey9wykcyEsqmcE7HpFPjCyCSXpdbrUJbjJZsqU=;
 b=2yShTeDEluSQe4gR/nnFNAVc68Wmhp64tCITD1cDWJyFuY4hJMhVnxPZHxrlXbGauz3QEGvJs
 7rU4X2ja9DjAqPaBb1+6B14MWm1tcWrq5unELJp/aHNaTFVL3NnZJtZ
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072540_591121_EE8689FE 
X-CRM114-Status: GOOD (  10.80  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK3588.

The decoder is at 0xfdb90000 with its MMU at 0xfdb90480.  It takes the
AXI and AHB clocks and resets, and sits in the VDPU power domain.  The
AXI clock is pinned to 600 MHz, which is the rate the downstream BSP
runs it at; it is a dedicated clock, not shared with another block.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..cc53878502898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1317,6 +1317,30 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	jpegd: video-codec@fdb90000 {
+		compatible = "rockchip,rk3588-jpegd";
+		reg = <0x0 0xfdb90000 0x0 0x400>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "axi", "ahb";
+		assigned-clocks = <&cru ACLK_JPEG_DECODER>;
+		assigned-clock-rates = <600000000>;
+		resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpegd_mmu: iommu@fdb90480 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb90480 0x0 0x40>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.47.3


