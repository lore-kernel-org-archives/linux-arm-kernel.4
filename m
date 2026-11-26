Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29873606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0u+/BwJY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe0R7jCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=; b=0u+/BwJYdC4NZM6ccnOtqXgoZp
	0aYgkw2BgMLFLghTR+cyYVu4ks0DYFlFcaoZjPFWA5tGEDU1aG5fCrYQ/tofwBj0cOSu1BsEa9/M+
	Vh3JsyLj5gSHEnicKg4rp75hWkNjiFR64RA1u8Y/7tzi0O10sTikYvgM7hqA08in9DgqwtoWV7itS
	0Lgm4NAVPpMtb1J6HxnfVPeObhgj1eXnfvtHKHvu9MG+0nBt2R7yKHA3NLMMjA6HGMavyNlVbKhsq
	wdeHv7OBGwlVPvXHNPYdOQ8RfLwqgzyURGWGANfCCTN+/UdXngQR+oUlJPLssqahkLM/6T24qehoL
	cDItEQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfVZ-0000000EOGr-3cet;
	Thu, 26 Nov 2026 19:51:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfVN-0000000EO9A-3Zqo;
	Thu, 26 Nov 2026 19:51:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E559451F6;
	Thu, 26 Nov 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795722700;
	b=zw27A1A5zJTnqU9MKgz/LGAfb/QfVcKOlZbapK45m0pboCZq//ODWOwFWS8x/K2pxaDl
	 0C9i2ZadN1mUeS2tyB++mJ06AzQuf1Lh0RqQ1J3Jgf1/4HbyGn6wMnrJ5JMOv6yVDGWDn
	 0WffJCL18zucZB3ijHtXhPczEIQ4iTfKR28a6k0ebAumWKWxbJmBWRt0E56NuiLnNU4cO
	 582oYzZRaawjwQ6T2rP9NeEnBcPqg9t8Yfv18mk2piXWuKU3ZHNxY9541W1MThuhoW5LP
	 eJuuJ3UB5th7L+N4NSprHYsskAEe+CCexob/MvTMUfcO9ks182ggNVQWI/lrWv5P8Jg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795722700;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	b=HKptJJ9rqW8dfG6cA1Yk9PO3k14hJWiaFp+8GkWtHpiTx/DlKivHz7Hkgo/4UCVKMD2/
	 sUZiyONiKSXMKDNNmcoA8Bf62SSoUFRXi2H3W1fMakkbq9OxzNfVfPQTtq0JIx7oj5tsQ
	 lv5oyJV8SY3AtDCCwAiJOWHFKlU45TGHaN2qkZ8Z1KJ3ydTnZjiIs+cg3conCxSWXh7vX
	 QKtLg215gptFeJ+Vs/HtPBBjo5r+CinbjxjIKejNbuavZHi6mpv+9PLCp7MNnkY75Yg7O
	 DjElo5/1yuPu3+0V3Kr13YkHEQ0lUURukjuc9QNOfWJtWokriVuW3IM44Q4Yid20KDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52C7B1F000D0;
	Thu, 26 Nov 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722700;
	bh=R2eFuVKMuKx/HT5/2aCPbO7MjOp+iQ1ERiIlQILhiRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Oe0R7jCk6cOqGTdPFcS95Otvw48XMn4d13CDXz++UA0kDzVUcsqBxGmEdbCOLeNxv
	 Ydslxd/yYUgjG/2ZmadUf3qPqbYENo9ky4Dwx54EqLs8KcuUfr9MQC6X7ckfucCumQ
	 Xs5IX0xFsEF9xzMgnABSBoE4OxwA1/NdPs0EvYVRyILYrCJ56Ds6UAjxbJngAXo6YW
	 QN8uHrSjWlTzAOL3SzIFZCRxHDM6rviajsvagN5xxjzoZmlRQWH156cshTPsxmAONa
	 DPX42HDMLusJhr7gm3JrAaWx9YPpf1FRqHOdzlneX80DWyfbo56U00WAKDsL+cRaNY
	 koME2pr436i2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D38E14D7D6;
	Thu, 26 Nov 2026 19:51:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 19:51:30 +0000
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Add IEP2 deinterlacer to
 RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-iep2-v5-4-3deac0976f10@gmail.com>
References: <20261126-iep2-v5-0-3deac0976f10@gmail.com>
In-Reply-To: <20261126-iep2-v5-0-3deac0976f10@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795722687; l=1631;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pLFuCmNVRbb5CYDpQgDI0o9UDTdkG7B7CO7SPDGMaZU=;
 b=alHddsvsruCU7g11zR0BvJGXQYO6bpOx0AAe6gWdgS0Sh/ZGoU/3GK0SwCsupSBCow5AyPtDf
 9etk8sa0MR4Cty6Wj3u3qvSj0PN0Ab9w0elVXIDA1KEThQ73jR86FK2
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

Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
share GIC SPI 117 and sit in the VDPU power domain.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..5297519bd251 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	iep: deinterlace@fdbb0000 {
+		compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+		reg = <0x0 0xfdbb0000 0x0 0x500>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>, <&cru CLK_IEP2P0_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>, <&cru SRST_IEP2P0_CORE>;
+		reset-names = "axi", "ahb", "core";
+		power-domains = <&power RK3588_PD_VDPU>;
+		iommus = <&iep_mmu>;
+	};
+
+	iep_mmu: iommu@fdbb0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbb0800 0x0 0x100>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
 		reg = <0x0 0xfdc38000 0x0 0x100>,

-- 
2.55.0



