Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEAD606A891
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wx0EYI7G;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IfLpwo4i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fMa1F596zZeCN4DtEvr02egD3NFnabU1nIZffJ3y2Fs=; b=wx0EYI7GteKjqQrfkBcqINdqiW
	KIBxKZO89zQyYDTugwb4HnpJU5VYoXUXGdN3kzgR7sYkNxiFTb+h4eWBtRcUbwxhliJz5aXvlJ9i4
	a+QVDO6//tUPRZseiNeI9NIsO5fVfHfaa77TlOOcv8ZYkaO4Zfpq8Zpc1VCkyc1I9frTeGzrbIcu9
	8A3vhNRqLcEh41yz5hQUMEgk2E0cq2HKU5cCYFeHBUflu//5b2VBmLGGMMJ0o0Z4S/8ImPOLm//F9
	L1q8Siw0KvV6vWw++PckNfR3QOhmYIMSMzNdvOxLdgBUcjLSd18/kU+by0iF2GAc29MxOa9yhKEhN
	E1kNwhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKh5-00000008XUi-0rwu;
	Thu, 12 Nov 2026 02:37:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKh2-00000008XUA-0L3v;
	Thu, 12 Nov 2026 02:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794451057;
	bh=lUDmKjtljGQw127/vFvt2r0JrBvNqetevLUcJso/6hs=;
	h=From:Date:Subject:To:Cc:From;
	b=IfLpwo4ivjWYLXGC3jzRWCcE78/65qO9rAG9w2IqBclGvj561Li5P0T0X1Fe73pwr
	 eHRN86E43Mbapmo60lpHTwp3OU9E2oYDz9MwrAzQDW1T8jYQLMYMkRnXV+VyUjn/6U
	 TlP2Y0MhBzksj4hfFOmnJARMAphqzb7FJmNpS/oVDc0eq+SyhV05ZkG2j8/UfFX8Ig
	 /9pFNGAa6IkNUgUWl1Vo5FsEs1NaIKCalA8TIWwHkc/OD9gXxd6wREY8UuOktIovh2
	 BTRDg62qO6mWijKFFI5/ToRvnmfMQA+IFbGTtORKqZG52iepVSO6IiSv04dl6k+2EC
	 i4P6uH51iQTFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D6417E0240;
	Thu, 12 Nov 2026 03:37:37 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B87D948002C; Thu, 12 Nov 2026 03:37:36 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 12 Nov 2026 03:36:40 +0100
Subject: [PATCH] clk: rockchip: rk3576: create proper platform device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm1CS4DoVYiLYeho5TcdICaEu
 zvq8lu8d0AUU4lwyw4w2TXqPCXQJQP/dNNDULtk4JwrImK0vijrCv3Q4zK4Ncw2YpdCL0jsAud
 lfW05QBosJkHfv3lz/ztu7Uv8+j3CeX4AnojzKn4AAAA=
X-Change-ID: 20261112-rk3576-clk-platform-device-12af20579b2f
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 YouMin Chen <cym@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Dragan Simic <dsimic@manjaro.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4298;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lUDmKjtljGQw127/vFvt2r0JrBvNqetevLUcJso/6hs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr1JnDFs9N+ORoHA/zkD4paMpzY9YFK/0oca
 aypg7XvG9a81IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9SZwAAoJENju1/PI
 O/qapGgP/3JYeHHE33FqJeXoA82rbh5VSH7oTa/FIq4xjf4mwBhcFMDYgd735i22DjNDHjct9BD
 RakcG3HSMNLVymfiAPEGtWFP9IgXDwwNJo4EU1ixpKzXyVLKn1jaL/ylpkhxsHzU+vjUCZTlhah
 2j7LgwQ4U/yg0NK6RVTIT+YAUYx9fNxVDj+SfAdBFJaB/BjDRClh8Y1oKOVj3ju0RMRlVLd9+kY
 eWGR3c3QpMKk08SjtHSu881mncwflJm+eIM8IHzqiEN8UG48U6elwtoU+an/h4r/q7gdf36KNTi
 Hl2wJaD84fGquOkiIpVgh3eM45/gEZhIrpIl0SZ1bL2M7n8yDAxqsA3s1+dKFJr21xiLw5ZeUwc
 /pnscgSnLLQfMkWTgqcjP1ogxve7ylFCi+eU/GK0gmhSW7ub3oDcJpyhaEfllCO9kT0qKakNbdU
 PLWK5/dge5IigT4jhCboWewhJY7FAdSeuDNJPoxOeJgzXbFJwf/+39WVs9royCGivZ14g/5Z6zr
 jEz+walFZ/Dl9IEDYQ7qwHO0pqSRVxbIgMaGMB1mEVhMRLzVGeDUCAfHgxzQ/d8T6fewtKIRm8x
 1wMlx2vg1s/FsyQ2HvYfJIB93vc3LdL4LZ21dH960hFbxuI4kA6cJ2J/rcRgl9nPIEjsZParQk8
 QBl1/jS73SbMNciNYXfUoZg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183740_304799_9DB785A5 
X-CRM114-Status: GOOD (  24.33  )
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

When RK3576 clock controller support was upstreamed, it copied the
vendor kernel's logic. That code makes no sense as it contains a
bunch of unused code (clk_rk3576_probe is never called as the DT
node is already initialized; if it would be called, the clock tree
would be registered twice).

Let's switch the driver to use the same style as RK3588: Continue to
initialize the clock tree early via rk3576_clk_init executed by
CLK_OF_DECLARE_DRIVER before the device model is initialized, but
don't mark the DT node as processed.

Later the device driver is probed for the DT node and registers the
resets as well as the restart handler. It also officially becomes
responsible for the DT node, which fixes all device link messages for
power-domains with a clock phandle:

Failed to create device link (0x180) with supplier soc for <device node>

Note that the supplier is 'soc' here, because there is no device for
the clock-controller before this change.

Ideally at some point we move the clock tree registration to the
device driver and get rid of the early init completely, but the
upstream kernel is not yet ready for it on the Rockchip platform.
This gets us at least in the right direction.

Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
That's 16 scary looking error messages less printed during boot on that
platform while reducing lines of code and modernizing the driver :)
---
 drivers/clk/rockchip/clk-rk3576.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2cdd667f4004..577100659593 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1733,6 +1733,8 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(59), 5, GFLAGS),
 };
 
+static struct rockchip_clk_provider *rk3576_early_ctx;
+
 static void __init rk3576_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
@@ -1802,12 +1804,10 @@ static void __init rk3576_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3576_clk_branches,
 				       ARRAY_SIZE(rk3576_clk_branches));
 
-	rk3576_rst_init(np, reg_base);
-
-	rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
-
 	rockchip_clk_of_add_provider(np, ctx);
 
+	rk3576_early_ctx = ctx;
+
 	return;
 
 err_free_pmu0:
@@ -1817,35 +1817,27 @@ static void __init rk3576_clk_init(struct device_node *np)
 	return;
 }
 
-CLK_OF_DECLARE(rk3576_cru, "rockchip,rk3576-cru", rk3576_clk_init);
-
-struct clk_rk3576_inits {
-	void (*inits)(struct device_node *np);
-};
-
-static const struct clk_rk3576_inits clk_rk3576_cru_init = {
-	.inits = rk3576_clk_init,
-};
+CLK_OF_DECLARE_DRIVER(rk3576_cru, "rockchip,rk3576-cru", rk3576_clk_init);
 
 static const struct of_device_id clk_rk3576_match_table[] = {
 	{
 		.compatible = "rockchip,rk3576-cru",
-		.data = &clk_rk3576_cru_init,
 	},
 	{ }
 };
 
 static int clk_rk3576_probe(struct platform_device *pdev)
 {
-	const struct clk_rk3576_inits *init_data;
+	struct rockchip_clk_provider *ctx = rk3576_early_ctx;
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 
-	init_data = device_get_match_data(dev);
-	if (!init_data)
-		return -EINVAL;
+	if (!ctx)
+		return -ENODEV;
 
-	if (init_data->inits)
-		init_data->inits(dev->of_node);
+	rk3576_rst_init(np, ctx->reg_base);
+
+	rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL);
 
 	return 0;
 }
@@ -1858,4 +1850,9 @@ static struct platform_driver clk_rk3576_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver_probe(clk_rk3576_driver, clk_rk3576_probe);
+
+static int __init rockchip_clk_rk3576_drv_register(void)
+{
+	return platform_driver_register(&clk_rk3576_driver);
+}
+core_initcall(rockchip_clk_rk3576_drv_register);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-rk3576-clk-platform-device-12af20579b2f

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


