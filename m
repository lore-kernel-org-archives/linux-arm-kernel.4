Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73079606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZFZgshUh;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KdPTUQGO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RrOv7CU2NAZPmYfHhE9qmxlo23xuzngVTOTd9duwgRs=; b=ZFZgshUhM3TmBL
	9vZDxxREjGnROX+N5MjvZaEt3sJo03BnJhxTKi8D4brQZko0O6QrkOL+94Vq4fh5Hld2qX1piGbRy
	z6+SpTLS2/A3tau8PD+afP5VrJQSaSeeMf6qmJ3MQ2DplcSh/pfzbHTK5eINfS9OjsjM2cQLOfaD9
	JpiTU+awiRGR7AICyJhZh9pp3Q6xDWB+afDGydup1ti18JVMBfFWQqmD6bSDr5Cp4pFeXEmEPNTv8
	JP62voJVlaoSg7WVXG6/iOkltxNCC/CW0Nbtk69838yEtHjHTrN8dcOMbEPIcrKdIpGY04wcQAxT5
	t6tiAOQQ2KmR9L080FIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWar2-0000000DctN-2JTx;
	Thu, 26 Nov 2026 14:53:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqW-0000000DcIX-3kD0;
	Thu, 26 Nov 2026 14:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704785;
	bh=Bf8dtseVDYyweSiEKFBSZr7qcxyZPpHohYhrJ+QdE6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KdPTUQGO/Q7WkvVjrHm+lV3AjZw3i/4RqGSO0GENiPnevWNcFbNfAcH5NLGy8rexn
	 HJ4yHNj9UMceVOColJRrWkdxj5j4CxyWWRBGwv9QgYsvuykHhmC4iDiKTqmMxkeHmU
	 TR+aTWDWfMjP9nbXTezNReX+c6hmcUpu1EhGd/V5HTp4ivQHLBHf6hoMlPlGgr0Lfw
	 ZSZssynZ/BkqOnKjO3FNshH5rfEFW0dnFW7s0VQcN3wE2xNpMBz0v5Ye1R5AdPbJLs
	 AoPES+zccsddWlglBggWYPIEUIpGOrGAPDpis0iuxIRwbD6lifJWV5HqD0QbUvsY1E
	 gTbTkwaaPZZ+A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F402617E1090;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 670EC480038; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:40 +0100
Subject: [PATCH v3 5/6] arm64: dts: rockchip: add dfi clocks on RK3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-5-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=RUxKo8yjLDpNQswNDTGn2Yq0hb9ptZ/lBMieeJFpQPw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9CrdaNcsU5Jr/JkRVo9MJBZJ4Vwt1KN8
 RccFjsrYzGZRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaoOYP/270kR2vc9JNtA8y0CQIqb6xukuYBrYfS+PENLlRu3f7srQ41sxtpUFqodW7CI61qz2
 yCCW9jzcmxT86Vrqj9OlL+IeOH923Hh7ToEbgSjUIJ62ROsjjxMTFCv671zrpCC1C8HuhMvPrNU
 yDEQCHKSKNpoMf3lyFfeLbfApePgi6VRAGNhWsCgv1YjMO6JVV9ggN0LAcvtDFDcd+O1ZLbWmn8
 udXqcyHbbofSK6uYZcIHUsP+5TY7cvggiEfF5R8aKbG/Q9eA1vzbTEXrqbH6Cj+66shiRZRZpSb
 lb09eDBWOaWlqSJdTcoEhJgOQhVv9l87uaDNYEoXU9+G6dwljkQQA4YcxZVmPojGTUm++2WPyoM
 RkJptW/V9TzBOZBiPea4lCxu76bIs7HejKWWa1cE26s5ohQ+l32kInupk9bexkzx7QI7ngP5Db4
 4BKg4/fBvb3UbcN/DfPtNgIyVCQyrQaEEYQGuRvhYx/8P0mgBSyDZvtJsFZIKXGYvVIjYQCAGb+
 neVq9gyisL1vruKN58UUyTmyTOYoCjYcaD+iyKXMH6HLHsxRy3hk6VYLXiOr4peu5kEkhdDwpl2
 nBSZ/z81BaxTBaaipAEga+cxf5LdCyv4eZMslWTmHbfxStLrZWQ6Miucx5SYBaWQtjC6W23uSD4
 r6ay/giZny+g8//h8eh4jZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065314_072284_45DBB0ED 
X-CRM114-Status: GOOD (  10.52  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The DFI clocks weren't modelled before and the binding didn't know about
them either. That has changed though, and now we actually need to
specify these clocks.

Add all four clocks for all four channels of monitoring.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d0f364547ae5..ef0ff6555fba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2190,6 +2190,10 @@ qos_vop_m1: qos@fdf82200 {
 	dfi: dfi@fe060000 {
 		reg = <0x00 0xfe060000 0x00 0x10000>;
 		compatible = "rockchip,rk3588-dfi";
+		clocks = <&cru PCLK_DDR_MON_CH0>, <&cru PCLK_DDR_MON_CH1>,
+			 <&cru PCLK_DDR_MON_CH2>, <&cru PCLK_DDR_MON_CH3>;
+		clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+			      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,

-- 
2.53.0


