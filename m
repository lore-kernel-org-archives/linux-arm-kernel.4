Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96560A2611
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=boPz7vWT;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JYzsWIk3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tbZYxCCGsyWc9FRNf4U1/QeBt8GFl9NvyT2yONDLHOA=; b=boPz7vWTGqzbDk
	LCMogPyhVKt+A4Oq2YWbNlRhZEdGM8jjdRCHJAYKq/r1UM+LPoMcVmVp6rHd2+NFV7BtZ6gvq7k+Y
	u54AOWCvPRQgcPiV5LA738p4futkA3vhtzFZMRmFjgniIwNtNQo/GKObGlNyixZKQX4A/v+/Jwxew
	wdyRGgnlbm2MLXTszkQ2GOK0llImw69PP5KJg5tpkELqxBhcxgIAcxcQM5jtjA18y67NGbK/dpaH2
	7fLOGlXTG9WZjov0tVPKvNNKALEccsWD3fAV4P88yi3RF8P/IwDOwDVFQwlKqJWdKv1kChLJq3WGm
	+yPxeu0BTSpsDjb8WG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1o2-0000000Bxna-27Mn;
	Thu, 19 Nov 2026 13:04:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nW-0000000BxJ6-0PU0;
	Thu, 19 Nov 2026 13:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=9xb7x86w5UsU5/i8QNVRXuZLWokLhdAyNQZ5CcxR0Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JYzsWIk3sLE+nobdWcryMRdhlM+o3Knye4aEqAVtJaN7oYUxF01mV9esV7QFL/dE5
	 Q9rw4gXPrkS3/Azf10x3bpoPXa/pdUydR8jmj0gJ7K+t8o2liYaMDERt6QtQIJcnxS
	 Fg6nmoZ7aPgQpBbhAxo/3oF2NDhe+42yvBUvq3RqeCaIezMVFrUB8A92Gi2FfiyrH+
	 O9UCvKVJdOpXJPqfmLc2FPSrEeDX3mEA6488Gl4gyzrAHyjbeNG99hdI/dqBA0zEVm
	 fKfXathfk0Zp6J3Icmmrw5n7J3TTjOR1rSMAlq504uk0f1jLXuRvU7R33tqgXWyycE
	 op9Wvm/aBaasQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CD0A17E0E37;
	Thu, 19 Nov 2026 14:03:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C10E480041; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:58 +0100
Subject: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/bXhm1qi27RkQg9MNJwsVFB2erICxwcCV3nEAGWDGPg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85rNqguAGXuQ9eLy92Ytuhds/GXCez4zL
 6U9hczE4qbT5IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qakCMP/1wjllhv9LkOZR2icWLpLWReO8ez/XXEXAE1dsPmS6xyBFU/EL4ZB5I/5QJ8Z+qRPtH
 /gmc0P6vQQekzCMuj03ZLnjUHR7rtUQMHnndmzLP+Ki9nENBMYtNwYIteZpdmglzh3amFutHUL2
 +bE2WexzTaT7RTP2CZsKxa8hh+HglymimT8pDO9LTc/FFV8KOcgu5c92iCgJIqWrvbOzVz4Djyg
 Fq9yeF/gEFI2SMRFhTHlsQeKMSsMjzFJEn4k19QXc4WfurAOC0r5A8tyXR5oR1xmfkyhXCuycMy
 rRo8oYSI6qo2LV7DJm5y6U87idCfGNicfoTWNx9p75rb8uKeE/2DmKA+hvUDpMlxF0XdYmM9KZn
 xEgWP5+Mefr3UmRh3vbd1hhw9fE/ZS4hUt65NKdCXYYYHObM+XvsU/KfeMsGPbx70pJkIW9uQMv
 iwz4H1huiAyiEzwM+Hv0GyoZPfDy6YuE0ipJbdhzigXjapsWNQGqNjylHcMREiXegnsRpNMVE3L
 mAJhtRs6zVi+AApYamY81zjVpjk/dlMuKgoNNL8lxPl1xYk6fZfXcdEE7CxM7XAdeQuanByiD1s
 SU2yRhJrJvZeqobH9at4/dgkPs37Y46ihs8DRYrtflM2qnuTGMEdICATjvFDzxY9A4XEoGQQNOe
 OW1QtdgvopZ3J6BaJSh8xkQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050330_382277_B5175831 
X-CRM114-Status: GOOD (  21.62  )
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

So far, RK3588 doesn't have the pclks for DDRMON used in the driver, as
they weren't modelled before.

However, they are now correctly modelled, so the driver should use them
when possible.

Instead of unconditionally getting them for this SoC, add a new variant
member that specifies whether the driver should let missing clocks
slide. This is needed because we want old device trees to keep
functioning, as otherwise we'd be introducing a breaking change for
literally no functional difference here.

Fill out a clock name list for this variant as well, and hand it to it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 2b9d9b26b11a..c51d7eeec394 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -117,6 +117,18 @@ struct rockchip_dfi {
 	const struct rockchip_dfi_variant *variant;
 };
 
+/**
+ * struct rockchip_dfi_variant
+ * @init: pointer to the variant-specific initialisation function
+ * @stride: address offset between the DDRMON per-channel instances
+ * @ctrl_single: whether only one DDRMON instance monitors multiple channels
+ * @max_channels: maximum number of memory channels for this SoC
+ * @clk_names: pointer to a constant array of constant clock name strings
+ * @num_clks: the number of elements in the @clk_names array
+ * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
+ *                   DT binding for this variant didn't require clocks in the
+ *                   past, so that the driver remains compatible with old DTs.
+ */
 struct rockchip_dfi_variant {
 	int (*init)(struct rockchip_dfi *dfi);
 	int stride;
@@ -124,6 +136,7 @@ struct rockchip_dfi_variant {
 	unsigned int max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
+	bool clocks_optional;
 };
 
 static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
@@ -806,6 +819,11 @@ static const char * const rk3399_clk_names[] = {
 	"pclk_ddr_mon",
 };
 
+static const char * const rk3588_clk_names[] = {
+	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
+	"pclk_ddr_mon_ch3",
+};
+
 static const struct rockchip_dfi_variant rk3399_variant = {
 	.init = rk3399_dfi_init,
 	.stride = 0x14,
@@ -826,6 +844,9 @@ static const struct rockchip_dfi_variant rk3588_variant = {
 	.init = rk3588_dfi_init,
 	.stride = 0x4000,
 	.max_channels = 4,
+	.clk_names = rk3588_clk_names,
+	.num_clks = ARRAY_SIZE(rk3588_clk_names),
+	.clocks_optional = true,
 };
 
 static const struct of_device_id rockchip_dfi_id_match[] = {
@@ -885,8 +906,12 @@ static int rockchip_dfi_probe(struct platform_device *pdev)
 		for (i = 0; i < dfi->variant->num_clks; i++)
 			dfi->clocks[i].id = dfi->variant->clk_names[i];
 
-		ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
-					dfi->clocks);
+		if (dfi->variant->clocks_optional)
+			ret = devm_clk_bulk_get_optional(dev, dfi->variant->num_clks,
+							 dfi->clocks);
+		else
+			ret = devm_clk_bulk_get(dev, dfi->variant->num_clks,
+						dfi->clocks);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to get clocks\n");
 	}

-- 
2.53.0


