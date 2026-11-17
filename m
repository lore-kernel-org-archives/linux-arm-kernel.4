Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E2606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WcURFHIx;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WqSwzdVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pshjW8eicM8rChkpHlSvk4dQiQFqKxPFO8ikM5TWoyc=; b=WcURFHIxT4Kt6S
	aZayqln7g+d6bI7rAbrBI4AqlmQ3m8PMnnSRBFY8Sh68+V4F2vxgPqk1nRizMB9hi2o0p2aUC0oX4
	MMnv1/aqqNQkqCxtst0JQ2FozSovlEht8VpE4nafwqgHiwglZmA6V1lnAA2YKmV9UlYGEPLKrhD+3
	oKartofYS4WDxn7z+o0ibWMPQTg1E1R/+WGZmTe9xKb34VOSnRVwGUvEDkEF13KxRj8eTBRy+yPip
	9vp6eAdYmn2D17LrrFjLflUm3axUzj6PRq2GlZB2Lq/v3oavp/wCAnPu4/3BBSIKIgvHiJj9HtrhJ
	w3tZfjsVlbXlpkFcfFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLF6-00000006Jx0-0tEp;
	Tue, 17 Nov 2026 15:37:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLEX-00000006JQX-1yjA;
	Tue, 17 Nov 2026 15:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794929785;
	bh=sfvU1MpEHL7ndx8ksFWtSCkUSSvxFRq0F4J1gPe6myM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WqSwzdVOTAtQ9P4CHUAGnaaOJO/+cap4AGEPEG3letAAFz0qqi4W9Akekb/+h/1C2
	 U4f75T/4DP7bj1r10O0wfwZ/AAHyvLEi4zf8riJDhJESxJqXU//LFpXt9XyMz+3l5H
	 tMkDjsk2FkJ90bcc2QErsHQRr52+bLcGR+F9krZD1q38Vz/Vlo0nleWH7v/7gtmKWw
	 DSq3MIMivNNf1UMj28aEVOJdAPD9KTGt9r7qEkR2nQ2Mfa/3U7BrwEDtZHVoTJc5s7
	 8Traiw0gbwfcT4T1MZqVnOnQ/y/bAy5+XWp3pH80bi/Gq4htshsu4BCiQ16Sc09wFe
	 xKhycegN99xHw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B15517E3672;
	Tue, 17 Nov 2026 16:36:25 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9096480047; Tue, 17 Nov 2026 16:36:24 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 17 Nov 2026 16:35:45 +0100
Subject: [PATCH v3 9/9] PM / devfreq: rockchip-dfi: add RK3576 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-9-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sfvU1MpEHL7ndx8ksFWtSCkUSSvxFRq0F4J1gPe6myM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr8dHjp3z+SesfYWRHjSkGlkvyR5Jb9yAWB7
 lj2/PlJhDbqQokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/HR4AAoJENju1/PI
 O/qa4fwQAIvfRPwO3KU8XRoyHiP6hp6PVvQTIKqyiySp48KigljhgoXygQmv3GJVv9m49yTqIGx
 xU0eII1f3W2IfNuLhgv4wQ0KpCBhI5+aj4Lvr11J8A56m2bdS9ac82ZHpmiO6kMOrDWkeBbkcmD
 Jdp70EVt4mHBooh8hndzuRtvhrAi7R1/3QfKnevpIfS7yLkEXYNskuyqiDzQ+kGQBfsb1x6dQwm
 DFPKdKlPIHv1mCmok5aMYwiGKrX33sNlXwbkjjhb0F5KhYVt7IErag+92qAzOWqusC/Af28vfvj
 6rlNvfDhsMA4/+eUDSsH9ZfhPxGJxey0/6DAKRlG6T/uQtX7XqONWg/GMNH/Un/V+KcCPCYBoPU
 L1Il/+0ddyBqWUSJWdzvMYkjnbE6Cj67jcnEZVGjxc/LjxOZzsTCd5p50u3m+VV6G7HudA1yVSQ
 nHJHm8mgTSrg4rlUu5ouegC1EiD/4c6fH1062qZfMkZCLQEnymPq1aIx8ihEbOGrpOrVc8AhNXt
 HDWp4aWNpfPtdS6J6DpBEsuY8ybiU0jodKBD/LrRgEHbNwPuigz43Mq+6CAzw0Wv3mUU4Wl0zXu
 dhO+miqXokSE6s8z16Yq6SXq5R770T9kk8atrHrwDL07MaF1SQ0Z18R/X4LsVQ8ql1ESFA52H7f
 mSPkS7sxAHNqqKxSDe9k38A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073633_736796_287713BA 
X-CRM114-Status: GOOD (  13.63  )
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

Add RK3576 support to the DFI driver exposing the same functionality
as found on previous chips. This uses the RK3588 init for getting the
DRAM type info from the GRF registers. In contrast to RK3588 it uses
a newer DDRMON controller IP, though (version 0x40).

Co-developed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index ed28dc6446f1..91b6dd01b453 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -859,6 +859,10 @@ static const char * const rk3399_clk_names[] = {
 	"pclk_ddr_mon",
 };
 
+static const char * const rk3576_clk_names[] = {
+	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+};
+
 static const char * const rk3588_clk_names[] = {
 	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
 	"pclk_ddr_mon_ch3",
@@ -888,6 +892,18 @@ static const struct rockchip_dfi_variant rk3568_variant = {
 	.reg_access = 0x2c,
 };
 
+static const struct rockchip_dfi_variant rk3576_variant = {
+	.init = rk3588_dfi_init,
+	.stride = 0x10000,
+	.max_channels = 2,
+	.clk_names = rk3576_clk_names,
+	.num_clks = ARRAY_SIZE(rk3576_clk_names),
+	.reg_write_access = 0x28,
+	.reg_read_access = 0x2c,
+	.reg_access = 0x34,
+	.reg_clock_cycles = 0x30,
+};
+
 static const struct rockchip_dfi_variant rk3588_variant = {
 	.init = rk3588_dfi_init,
 	.stride = 0x4000,
@@ -904,6 +920,7 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 static const struct of_device_id rockchip_dfi_id_match[] = {
 	{ .compatible = "rockchip,rk3399-dfi", .data = &rk3399_variant },
 	{ .compatible = "rockchip,rk3568-dfi", .data = &rk3568_variant },
+	{ .compatible = "rockchip,rk3576-dfi", .data = &rk3576_variant },
 	{ .compatible = "rockchip,rk3588-dfi", .data = &rk3588_variant },
 	{ },
 };

-- 
2.53.0


