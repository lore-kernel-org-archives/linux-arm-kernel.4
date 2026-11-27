Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SnngY97T;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a9N5+ElG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QaA61a5Ljaj5zpNYbTEDLRZbuFgDrcTIN7gKffSs/6c=; b=SnngY97T7y6cWi
	MsthWesRuJ6cTl6Sk4cOlLjdJUZZCnhTDWFyhNhd6R5/z1DSk0CD9jwZnfVnyp6/uYQA/gTYj35nn
	0o1ib/IY4u3p3BdWeNsISHowsLvI3dWcczWFJK5QBuREF0DKG/qh1ef66DLQH9UkmCQfzdlX76d6g
	ybjWT93slnW899ZDwI7X3WPGMkoKTg7weTkaLfO314+Fl/+lxlEQw/90yb/gR1pr7MC/Bu9ZVebwz
	r7iKAwf3q5GR0ZyxCwdXSOUYPFPoLuN7un+TcFALsp2OGoe9CNha9OUFacch/HsMPgH5Az7wmXOeV
	OSjOSReiVsh2X3MPOoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzZ2-0000000HEDS-0mXU;
	Fri, 27 Nov 2026 17:16:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzYd-0000000HDtd-3xEc;
	Fri, 27 Nov 2026 17:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795799782;
	bh=66hGCABbiQ3DeRYxQJtLOA1BolbPouQSk78SkAlID8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a9N5+ElGOFzG/2CHrdixAYjz3V49C6fidL+wF3izkn4LJ4OY+9HmfQiNBOzaGzXiU
	 Mni7HlP8N7zxN7rD78WuoajQmc5rU+21VrbqIeZAckpcyYB3VJxvm9zhssUkWAY+8M
	 vQ8R+1UlxAQBEx7+Hf7DPQ7XAF4A7AnnxU2bJF9qsJQi9aA/F8m9hRAnqIftizcRP+
	 uJPzs7V7c36Z+qZU7CMdr3h6AnIba3KXbZw1+qsjugQsx9wiRa1w4mvZHjkYDYP7Wq
	 2VV4WQlW+u9XTa1bdJ4yjLIGplpUFmLckgC4DmmCSRMydNFF7aB1QGYUfZWsUmwdXs
	 dpDEGJnC8CWQw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7311617E08C6;
	Fri, 27 Nov 2026 18:16:20 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 12:16:13 -0500
Subject: [PATCH v2 4/4] media: rkvdec: Switch to tracked dma allocations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v4l2-add-mem-tracker-v2-4-73b0494260e7@collabora.com>
References: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
In-Reply-To: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091624_332420_9424217A 
X-CRM114-Status: GOOD (  13.80  )
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

Use the newly introduced v4l2_dma_alloc_attrs and v4l2_dma_free_attrs
functions to track all dma allocations and have them exposed to
userspace for easier debug.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 33 +++++++++++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 +++
 9 files changed, 100 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index ffa606038192..e2cf28d799eb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -11,6 +11,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -358,8 +359,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -383,8 +387,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 88e90c438eb9..fb8d6fcff09c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -14,6 +14,7 @@
 
 #include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -514,8 +515,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"hevc-priv-tbl");
 	if (!priv_tbl) {
 		kfree(hevc_ctx);
 		return -ENOMEM;
@@ -535,8 +539,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index 3828e2a5c665..3ab83b1a2bbf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -13,6 +13,7 @@
 #include <linux/genalloc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <media/v4l2-allocator.h>
 
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
@@ -65,10 +66,10 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(dev->dev,
-					  rcb_size,
-					  cfg->rcb_bufs[i].cpu,
-					  cfg->rcb_bufs[i].dma);
+			v4l2_dma_free_attrs(&dev->v4l2_dev, dev->dev,
+					    rcb_size,
+					    cfg->rcb_bufs[i].cpu,
+					    cfg->rcb_bufs[i].dma, 0);
 			break;
 		}
 	}
@@ -150,10 +151,14 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(ctx->dev->dev,
-						 rcb_size,
-						 &dma,
-						 GFP_KERNEL);
+			char name[32];
+
+			snprintf(name, sizeof(name), "rcb-%d", i);
+			cpu = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, ctx->dev->dev,
+						   rcb_size,
+						   &dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   name);
 			alloc_type = RKVDEC_ALLOC_DMA;
 		}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..b0cb6963c8e0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -387,8 +388,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -412,8 +416,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45b..84a266240df5 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -557,8 +558,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -582,8 +586,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 5ec755733916..00fe81749587 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include <linux/iopoll.h>
 
@@ -380,8 +381,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -406,8 +410,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d4cf..8139d50fb8af 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -505,8 +506,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -530,8 +534,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..9f41f6ca82d1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -20,6 +20,7 @@
 #include <linux/vmalloc.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-vp9.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -979,8 +980,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	ctx->priv = vp9_ctx;
 
 	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&vp9_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vp9-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -989,8 +993,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
 
-	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
-				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
+	count_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					 RKVDEC_VP9_COUNT_SIZE,
+					 &vp9_ctx->count_tbl.dma,
+					 GFP_KERNEL, 0, &ctx->fh,
+					 "vp9-count-tbl");
 	if (!count_tbl) {
 		ret = -ENOMEM;
 		goto err_free_priv_tbl;
@@ -1003,8 +1010,10 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	return 0;
 
 err_free_priv_tbl:
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 
 err_free_ctx:
 	kfree(vp9_ctx);
@@ -1016,10 +1025,14 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
-			  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->count_tbl.size,
+			    vp9_ctx->count_tbl.cpu,
+			    vp9_ctx->count_tbl.dma, 0);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 	kfree(vp9_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..0dfc689386d4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1208,6 +1208,8 @@ static int rkvdec_queue_init(void *priv,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &rkvdec->vdev_lock;
 	src_vq->dev = rkvdec->v4l2_dev.dev;
+	src_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	src_vq->v4l2_fh = &ctx->fh;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
 
@@ -1227,6 +1229,8 @@ static int rkvdec_queue_init(void *priv,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &rkvdec->vdev_lock;
 	dst_vq->dev = rkvdec->v4l2_dev.dev;
+	dst_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	dst_vq->v4l2_fh = &ctx->fh;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.56.1


