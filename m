Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0F606A891
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhgrISHe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ndpdHJphGTxw6Zav2QmvJAHca0FB0X3iruS8oSVZXNE=; b=VhgrISHeanGF+xrcfQdm2cEYFR
	xTP5adZh+y7sj79apMbHKydVBnTwuQMtuX1VPvPSQmhyTTtSFqTUoPO7qOPZivQJAhLBdjOAwHsK8
	UvTb2EuHgXroE2FHhwYukeo1vHwLiLjHfFPof7vkjSts/KbubGatXWN0WaB2ZkX8d4sX94p97O1st
	C7xnhin82OwowHdgySS/9+yDdYVcnlSkv9MhipiVkFTC5zYOufDqky85InIKp1Ur9DX9NzaBFMbtg
	Mra+7ajcZgmzKnk7+RQrDnFBsThmdwzpypio8TyqAfrZRTaqXwmvCcqVlF51o8t8JiV2OpT89XMSg
	Go+sccQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBe4-0000000Frnk-06JD;
	Sat, 14 Nov 2026 11:10:08 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBe1-0000000FrlQ-0MTU;
	Sat, 14 Nov 2026 11:10:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBds-000000003yQ-3YrY;
	Sat, 14 Nov 2026 11:09:56 +0000
Date: Sat, 14 Nov 2026 11:09:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: rkvdec: vdpu381: Program the read caches
Message-ID: <c052b9e59c9871315a24bbf129457b4dccbe3030.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_031006_141373_592FA4E0 
X-CRM114-Status: GOOD (  15.43  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "cache" register block of the VDPU381 and VDPU346 holds the
configuration of three read caches. The driver leaves the block
unmapped and the caches in their reset state.

The vendor kernel driver, in rkvdec2_run() and in its link mode,
permits cacheable access and read allocation with 64 byte lines and
clears all three caches before every decode. Map the block and write
the same configuration before each H.264 and HEVC run.

On the RK3568 the HEVC conformance vectors RAP_B_Bossen_2,
WPP_D_ericsson_MAIN_2, WPP_D_ericsson_MAIN10_2 and
WPP_E_ericsson_MAIN_2 and the H.264 vectors CAPM3_Sony_D, MR8_BT_B,
MR9_BT_B and NRF_MW_E decode with wrong output while the caches are
in their reset state, and pass once they are configured.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c      |  2 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c      |  2 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h      |  9 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c    | 18 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h    |  2 ++
 5 files changed, 33 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583a..40db8ba3856a7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -445,6 +445,8 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_schedule_watchdog(rkvdec, h264_ctx->regs.common.reg032_timeout_threshold);
 
+	rkvdec_vdpu381_config_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45be..8afb13866d0bb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -617,6 +617,8 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 
 	rkvdec_schedule_watchdog(rkvdec, hevc_ctx->regs.common.reg032_timeout_threshold);
 
+	rkvdec_vdpu381_config_cache(rkvdec);
+
 	/* Start decoding! */
 	writel(VDPU381_DEC_E_BIT, rkvdec->regs + VDPU381_REG_DEC_E);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
index 6da36031df2dc..b23b47217d43b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
@@ -41,6 +41,15 @@
 #define VDPU381_STA_INT_TIMEOUT		BIT(5)
 #define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
 
+/* base: "cache" register block */
+#define VDPU381_CACHE_COUNT		3
+#define VDPU381_REG_CACHE_CLR(i)	(0x010 + (i) * 0x40)
+#define VDPU381_CACHE_CLR		BIT(0)
+#define VDPU381_REG_CACHE_SIZE(i)	(0x01c + (i) * 0x40)
+#define VDPU381_CACHE_PERMIT_CACHEABLE_ACCESS	BIT(0)
+#define VDPU381_CACHE_PERMIT_READ_ALLOCATE	BIT(1)
+#define VDPU381_CACHE_LINE_SIZE_64_BYTES	BIT(4)
+
 /* base: OFFSET_COMMON_REGS */
 struct rkvdec_vdpu381_regs_common {
 	struct {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ba61e373b4342..5673c5205bfcd 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1249,6 +1249,20 @@ void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold)
 	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(watchdog_time));
 }
 
+void rkvdec_vdpu381_config_cache(struct rkvdec_dev *rkvdec)
+{
+	u32 cfg = VDPU381_CACHE_PERMIT_CACHEABLE_ACCESS |
+		  VDPU381_CACHE_PERMIT_READ_ALLOCATE |
+		  VDPU381_CACHE_LINE_SIZE_64_BYTES;
+	unsigned int i;
+
+	for (i = 0; i < VDPU381_CACHE_COUNT; i++)
+		writel(cfg, rkvdec->cache + VDPU381_REG_CACHE_SIZE(i));
+
+	for (i = 0; i < VDPU381_CACHE_COUNT; i++)
+		writel(VDPU381_CACHE_CLR, rkvdec->cache + VDPU381_REG_CACHE_CLR(i));
+}
+
 static void rkvdec_device_run(void *priv)
 {
 	struct rkvdec_ctx *ctx = priv;
@@ -1910,6 +1924,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 		rkvdec->link = devm_platform_ioremap_resource_byname(pdev, "link");
 		if (IS_ERR(rkvdec->link))
 			return PTR_ERR(rkvdec->link);
+
+		rkvdec->cache = devm_platform_ioremap_resource_byname(pdev, "cache");
+		if (IS_ERR(rkvdec->cache))
+			return PTR_ERR(rkvdec->cache);
 	}
 
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b7..54e6f50c0ff9f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -136,6 +136,7 @@ struct rkvdec_dev {
 	struct clk *axi_clk;
 	void __iomem *regs;
 	void __iomem *link;
+	void __iomem *cache;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
 	struct gen_pool *sram_pool;
@@ -180,6 +181,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run);
 void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
 void rkvdec_schedule_watchdog(struct rkvdec_dev *rkvdec, u32 timeout_threshold);
+void rkvdec_vdpu381_config_cache(struct rkvdec_dev *rkvdec);
 
 void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
 
-- 
2.56.0

