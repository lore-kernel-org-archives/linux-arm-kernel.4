Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5166606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ra08vm+C;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkElKgQC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=; b=Ra08vm+CsD9EGXTzzPKGB2w+IW
	QbEzw2DMP2VXPiErv8z5h3ap9mno6BCAX+TDEelQPvAUCBCftDpt+8wPnXRM5HssqMJT5gRinOy02
	A6tzG6tNv4WtKlDape+rsz3tI37c8SgCiVJumw8NrGRMUnVsM3ePRFGP53FyNEM+urUmXD1nkNpWZ
	xXTPYJ5eRCE7YrotRrzCUGfk1mO/qhXnYqcEGmnSFURUKJdwKRkjVtctaBFehLyuYBZz0PgVX2Shs
	FNIf93QxSMGxkucl/jkZ34S/qfTAo4YgJmRtItlT1sLy8/uPpgqwArpmCPoBWi4Y70aU/8PQb1HyR
	3h8F79oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQimF-00000003OyH-0z91;
	Tue, 10 Nov 2026 10:08:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQilw-00000003OMY-1Vxy;
	Tue, 10 Nov 2026 10:08:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADEBC6385F;
	Tue, 10 Nov 2026 10:08:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305291;
	b=3oU0SDBegbA21IVpz/wd/wLmf73gLyCSpODYunpZkYE4vo7c35Um5Fh5j1AbaoTnrfB6
	 zPzfAFybxcjEN0MAkoCffLTgKz6gj4DmNmxG2Uax7jfVkh+sqZdQuwPD/iRVSDTvLKh8v
	 yE64JDlDvmT5wOYAz476kAbxjkaHbFGTGvIp1S8P/pBSt4qqZ4COKYzzhewuqKe8Xl+Fz
	 9yjXNWD5FkzRyKHo2bJJSTinuSY/gKvU5ELt78rQUqk2c8KOCcTIMJSzH78NcKe0BeKlc
	 gmmvZzxORgprVOznIyDuO+lz39XvHr24L051djFbIJROsLbzdkmJDftVTtmCgoRNUcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305291;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=;
	b=wtTlIG20j+2SsiDpTOJjjKVjPuVK2jFIOi33QP47bvxZxNz/1BV5qHfEeHzUJXPYtci4
	 Yq8Ml/Dx3AgcUbMQD5G+oeubs7vdd6Mhbyq+P1wRuOSNotaq4uNR4kcyaglECBb5Xlthe
	 +1p0GPlYj6vW9acb58heox3WK1i2OswusVfvNL8GXrw3uAdbx5KaF69gTOZJE8qJbnhNL
	 fXTF1eBlUfeFmjJxpWLUjt1gussRL5Wm7gfXtPaIUG9DfZIYU+PkFbHSTnTExztjn6+Ah
	 aAuHNBYPc2Qsh09LR17OJzNMsSla7iGPD7gVK8YpNLxCzfbWUvmoCz61uTFljSoUShA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CA871F008A2;
	Tue, 10 Nov 2026 10:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305291;
	bh=U6qxJU6eC3Q/bchS7RacWJNWxRDNMV4uNktgoQL7w8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hkElKgQCF9iJFu5nJZ2/fX0ANR7TzUr3kN9lcdSg699suV/Jx+BLLA9udQRtO9tY+
	 //y9BRG5HQW3iRiGdg6wLQ/D8HOr0H7QxEMYEIKivTfDsBq9nh3Rp3IQ60YnrKGzOZ
	 ZZegptyrjXGNj+LzsHPnXyO+8SSGJNtwG5cJyj9gjPFOOA2KO8VZ56zeKVGVXMBKcb
	 aQizxFyuKe7mxGDBh96lc6nF7wyIixlQgAybx2ZwYImByj1THyIZr90u0nG2SjZlzT
	 H/OV+dp7qdLoo0+AZtoxMXeaTTt+JKZmmyLHPHS1ngzUq2qTjwXpY5QylZQBYyip6c
	 hfgcE8ZQkm/zQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20ECB48AEF;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:14 +0000
Subject: [PATCH RFC 12/12] arm64: dts: rockchip: Add the VEPU580 encoder
 cores to the RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvenc-v1-12-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=3181;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=kagifa6Lmg0J/Xo2eD/GKAYer7IvTfvqdz6aGlCXzQU=;
 b=Z55zyJzLXjk5M0iOHQBuQmkiC3qqZVinOuzqIhqBgV9OAHTjmiFRh0C7Jcn5sf5tp6ip/f6hn
 dUnPCBOY7WSCOjYQ4VM4zLV2TEaEVljLIwKq9tLlNcHjTz+3XVBALkU
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

Add the two VEPU580 (RKVENC) video encoder cores and their IOMMUs.

Interrupts, clocks, resets, power domains and the clock rates (500 MHz
AXI, 800 MHz core) are taken from the Rockchip BSP rk3588s.dtsi. Each
IOMMU has two register banks and two interrupts, and keeps the BSP's
rockchip,disable-mmu-reset.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 56 +++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..9c813e6475c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1397,6 +1397,62 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	vepu580_0: video-codec@fdbd0000 {
+		compatible = "rockchip,rk3588-vepu580";
+		reg = <0x0 0xfdbd0000 0x0 0x6000>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC0>, <&cru HCLK_RKVENC0>,
+			 <&cru CLK_RKVENC0_CORE>;
+		clock-names = "aclk", "hclk", "core";
+		assigned-clocks = <&cru ACLK_RKVENC0>, <&cru CLK_RKVENC0_CORE>;
+		assigned-clock-rates = <500000000>, <800000000>;
+		resets = <&cru SRST_A_RKVENC0>, <&cru SRST_H_RKVENC0>,
+			 <&cru SRST_RKVENC0_CORE>;
+		reset-names = "aclk", "hclk", "core";
+		iommus = <&vepu580_0_mmu>;
+		power-domains = <&power RK3588_PD_VENC0>;
+	};
+
+	vepu580_0_mmu: iommu@fdbdf000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbdf000 0x0 0x40>, <0x0 0xfdbdf040 0x0 0x40>;
+		interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC0>, <&cru HCLK_RKVENC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VENC0>;
+		rockchip,disable-mmu-reset;
+		#iommu-cells = <0>;
+	};
+
+	vepu580_1: video-codec@fdbe0000 {
+		compatible = "rockchip,rk3588-vepu580";
+		reg = <0x0 0xfdbe0000 0x0 0x6000>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC1>, <&cru HCLK_RKVENC1>,
+			 <&cru CLK_RKVENC1_CORE>;
+		clock-names = "aclk", "hclk", "core";
+		assigned-clocks = <&cru ACLK_RKVENC1>, <&cru CLK_RKVENC1_CORE>;
+		assigned-clock-rates = <500000000>, <800000000>;
+		resets = <&cru SRST_A_RKVENC1>, <&cru SRST_H_RKVENC1>,
+			 <&cru SRST_RKVENC1_CORE>;
+		reset-names = "aclk", "hclk", "core";
+		iommus = <&vepu580_1_mmu>;
+		power-domains = <&power RK3588_PD_VENC1>;
+	};
+
+	vepu580_1_mmu: iommu@fdbef000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbef000 0x0 0x40>, <0x0 0xfdbef040 0x0 0x40>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVENC1>, <&cru HCLK_RKVENC1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VENC1>;
+		rockchip,disable-mmu-reset;
+		#iommu-cells = <0>;
+	};
+
 	vdec0: video-codec@fdc38000 {
 		compatible = "rockchip,rk3588-vdec";
 		reg = <0x0 0xfdc38000 0x0 0x100>,

-- 
2.55.0



