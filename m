Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxhpl6AK;
	dkim=pass (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=ETh/jPkM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=34eweslnCjzZk3P3dkb/YboySmeDEbPaEMg/uu7bDtU=; b=bxhpl6AKBQMx+vh2W2fCy/qXEM
	3IoQf6CwGWpVa3q9GzNm3d0rc/M9NsIUYN9/MwMWrFuLcMWVNzYmTQmaeU1nZPX8Iu88Y613O6qP+
	k+zCB7curB1zRBxCknWnnKr8EH7yp6uOflTH/Y6FIb/wzGynEUn+1HynIehuD0CJeinb7igdLrzNV
	H+IArzXDnaJr3+GnAZ8C01DiQhYSqogT8KRSTUkNo9EYRe+cVHgVqbUgUFpyUBaO+19RF5OSBt+TK
	DGa/2OvmUsycR+jj56Bo5QrmQo+/YOg3VTuhyYqYtLiRoVQZ/2YGZB9A+Eyr1ig5/S6utTHRToKwA
	rFY+1Jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoTO-0000000CM9f-44Fn;
	Fri, 13 Nov 2026 10:25:34 +0000
Received: from smtp.ideco.ru ([51.250.56.165])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoTL-0000000CM6z-2JRO;
	Fri, 13 Nov 2026 10:25:33 +0000
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 37E5526BC3;
	Fri, 13 Nov 2026 15:25:19 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id DB0B926BC0;
	Fri, 13 Nov 2026 15:25:16 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru DB0B926BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1794565518; bh=34eweslnCjzZk3P3dkb/YboySmeDEbPaEMg/uu7bDtU=;
	h=From:To:Cc:Subject:Date;
	b=ETh/jPkMCkpuyTeQd9NoMRCMSmMPyJvhxzX8TJuclHoA4bvmDn/X/igsbQMf+16ty
	 uqXnzShJEFYg/oCm9ZP+IplFq6vt2STbQ0vtbtS6o8nbXqLfV0niT3ac7lWsrxfqL2
	 /TP/pRIX2bXQcbrc2fJrkK/2ylyOeGL2rNxm36hDDIyrK6HHFj9Vb4xOq3pYsHkdtw
	 FTfOEqJyNwKbbF3y8ClBDl0tCtz5fJ8o4wLkX/SnR4TiwW/3k2oiz9qa+z18Q/obnx
	 lxPgNZ7rRMzWVNViSheG3kQKWHAKfgrg76xGOeOylUSG0+jWbdlurUx14Z3NIGAEN/
	 Pi6D6amovLGoQ==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Alex Kazinsky <a.kazinsky@ideco.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v3] media: rkvdec: Handle interrupts without a current context
Date: Fri, 13 Nov 2026 14:24:52 +0400
Message-ID: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022532_186843_505267B3 
X-CRM114-Status: GOOD (  16.95  )
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

The watchdog can finish the current job before the threaded IRQ handler
retrieves its context. In that case, v4l2_m2m_get_curr_priv() returns NULL,
but the variant IRQ handlers unconditionally dereference ctx->dev.

Pass only the device pointer to the variant IRQ handlers, so they can
acknowledge interrupts without accessing the current context. Retrieve
the context inside rkvdec_job_finish() instead. In the IRQ path, this
happens only after successfully cancelling the watchdog, while the job
is still active.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: f9c7b7deeffd ("media: rkvdec: Support per-variant interrupt handler")
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
Changes in v3:
- Pass only rkvdec_dev to the variant IRQ handlers.
- Retrieve the current context inside rkvdec_job_finish().
- Remove the NULL-context checks from the variant IRQ handlers, as
  suggested by Nicolas Dufresne.

Changes in v2:
- Fix continuation-line alignment in the IRQ handler declarations.
- Clarify that the issue has not been reproduced on hardware and
  describe a possible test.

v2: https://lore.kernel.org/all/20261026124808.642373-1-a.kazinsky@ideco.ru/
v1: https://lore.kernel.org/all/20261023131124.94116-1-a.kazinsky@ideco.ru/

The issue has not been reproduced on hardware. The watchdog/IRQ race
is based on code analysis.

 .../media/platform/rockchip/rkvdec/rkvdec.c   | 26 ++++++++-----------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  3 ++-
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..1b43f05b0299 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1089,10 +1089,10 @@ static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
 					 result);
 }
 
-static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
+static void rkvdec_job_finish(struct rkvdec_dev *rkvdec,
 			      enum vb2_buffer_state result)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
@@ -1176,7 +1176,7 @@ static void rkvdec_device_run(void *priv)
 
 	ret = desc->ops->run(ctx);
 	if (ret)
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		rkvdec_job_finish(rkvdec, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops rkvdec_m2m_ops = {
@@ -1434,9 +1434,8 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1452,14 +1451,13 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 	}
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1481,14 +1479,13 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
+static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec)
 {
-	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	bool need_reset = 0;
 	u32 status;
@@ -1510,7 +1507,7 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
-		rkvdec_job_finish(ctx, state);
+		rkvdec_job_finish(rkvdec, state);
 
 	return IRQ_HANDLED;
 }
@@ -1518,10 +1515,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 {
 	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 	const struct rkvdec_variant *variant = rkvdec->variant;
 
-	return variant->ops->irq_handler(ctx);
+	return variant->ops->irq_handler(rkvdec);
 }
 
 /*
@@ -1607,7 +1603,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	if (ctx) {
 		dev_err(rkvdec->dev, "Frame processing timed out!\n");
 		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
-		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		rkvdec_job_finish(rkvdec, VB2_BUF_STATE_ERROR);
 	}
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..894c18eeb795 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -30,6 +30,7 @@
 #define RKVDEC_8K_PIXELS		(7680 * 4320)
 
 struct rkvdec_ctx;
+struct rkvdec_dev;
 struct rkvdec_rcb_config;
 
 struct rkvdec_ctrl_desc {
@@ -72,7 +73,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
 }
 
 struct rkvdec_variant_ops {
-	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
+	irqreturn_t (*irq_handler)(struct rkvdec_dev *rkvdec);
 	u32 (*colmv_size)(u16 width, u16 height);
 	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int row_length);
 };
-- 
2.56.0



