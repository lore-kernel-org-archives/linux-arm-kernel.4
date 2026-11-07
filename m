Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B6606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqQuz6ab;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=FV9/e+DD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E0aUa3hDU1kr8wBZk8oZBIWIwJyImWt2F40Ntf0+M8Y=; b=xqQuz6abjoReiJNGE8hhcaQfGK
	G6k1G1bve4kvL4FiqAxYJMki37d4XQN6NSYaeOD6hR+e2rCTN0PN+Mb7TmeD2zvaIfqn9pFXlQONm
	c+AEfUNX0EGrpXhmUHW32HONi4zUlc7klzrLkEC5tL/FMjE4e3Aicc97foZzjSQ3p9KgCCZBuElZ+
	Xfs+Z91oVPFXfE8VH8wdDuinE9d+VybVSLZr02o2Zb70/h5M5PnyoFyrtXdSQzYUJOZsJeLKwa3rE
	kSE9zxUfNE0PQTieQAcxj6p7S2WVrqA9rbF2f/qr3gMgWYjyJWfQ7rvQm4Oa0Pkuydqr+NkS1vd+Q
	b3Ks29hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaKB-0000000EI0d-0F37;
	Sat, 07 Nov 2026 06:54:51 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaK5-0000000EHws-1JhL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:54:46 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53d65d8f3;
	Sat, 7 Nov 2026 14:54:31 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: coda: Fix potential use-after-free after VDOA removal
Date: Sat,  7 Nov 2026 14:54:30 +0800
Message-ID: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1b4c990bb03a1kunmeb5d581082b4d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxhDVkpLThpLHUkYQ0MeTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	1DVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=FV9/e+DDCp6Y53QuDBlChI1sS0VjP2qCvk64BSfSRGzrcxc9byubICv3Ko0qwCpHpcAbTnVV/74u4crvb76WgYDWFVMUoQIEJO9FhdqKSORqMi9L4cWOfEyHhN4eDCPhu/JgSwKytPeGcJBs9ZXeAdQftPwH7zNXMT3qMKC/SYg=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=E0aUa3hDU1kr8wBZk8oZBIWIwJyImWt2F40Ntf0+M8Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_225445_588763_44985EB3 
X-CRM114-Status: GOOD (  21.45  )
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

VDOA can be unbound while CODA still holds its driver data and open
contexts. Their next transfer or close then accesses released state
and device-managed resources.

Retain the VDOA state for its consumers and contexts. Serialize hardware
access with removal, stop outstanding transfers and balance the clock
references before disconnecting the retained contexts. Also release a
VDOA context when opening CODA fails.

This issue was found by our static analysis tool under development.

Fixes: e7f3c5481035 ("[media] coda: use VDOA for un-tiling custom macroblock format")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: x86-64 GCC W=1 changed-object compilation passed. An
extracted-code test with mocked services reports an ASan failure before
the fix and passes after it; this is not a kernel reproducer. No
hardware test, ARM64 build or full linked-kernel build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 .../platform/chips-media/coda/coda-common.c   |  14 +-
 .../platform/chips-media/coda/imx-vdoa.c      | 133 ++++++++++++++++--
 .../platform/chips-media/coda/imx-vdoa.h      |   8 ++
 3 files changed, 134 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe..b519cf8541de 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -396,7 +396,7 @@ const char *coda_product_name(int product)
 	}
 }
 
-static struct vdoa_data *coda_get_vdoa_data(void)
+static struct vdoa_data *coda_get_vdoa_data(struct device *dev)
 {
 	struct device_node *vdoa_node;
 	struct platform_device *vdoa_pdev;
@@ -410,9 +410,7 @@ static struct vdoa_data *coda_get_vdoa_data(void)
 	if (!vdoa_pdev)
 		goto out;
 
-	vdoa_data = platform_get_drvdata(vdoa_pdev);
-	if (!vdoa_data)
-		vdoa_data = ERR_PTR(-EPROBE_DEFER);
+	vdoa_data = devm_vdoa_get(dev, &vdoa_pdev->dev);
 
 	put_device(&vdoa_pdev->dev);
 out:
@@ -2721,6 +2719,8 @@ static int coda_open(struct file *file)
 err_clk_enable:
 	pm_runtime_put_sync(dev->dev);
 err_pm_get:
+	if (ctx->vdoa)
+		vdoa_context_destroy(ctx->vdoa);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:
@@ -3220,9 +3220,9 @@ static int coda_probe(struct platform_device *pdev)
 	dev->iram_pool = pool;
 
 	/* Get vdoa_data if supported by the platform */
-	dev->vdoa = coda_get_vdoa_data();
-	if (PTR_ERR(dev->vdoa) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	dev->vdoa = coda_get_vdoa_data(&pdev->dev);
+	if (IS_ERR(dev->vdoa))
+		return PTR_ERR(dev->vdoa);
 
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
index cd085c1c73f4..d9249c943dfa 100644
--- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
+++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
@@ -9,7 +9,9 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/kref.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
@@ -74,6 +76,12 @@ enum {
 };
 
 struct vdoa_data {
+	struct kref		ref;
+	/* Serializes context hardware access with removal. */
+	struct mutex		lock;
+	unsigned int		num_contexts;
+	bool			removed;
+	int			irq;
 	struct vdoa_ctx		*curr_ctx;
 	struct device		*dev;
 	struct clk		*vdoa_clk;
@@ -126,7 +134,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
+static int vdoa_wait(struct vdoa_ctx *ctx)
 {
 	struct vdoa_data *vdoa = ctx->vdoa;
 
@@ -142,17 +150,43 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
 
 	return 0;
 }
+
+int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
+{
+	struct vdoa_data *vdoa = ctx->vdoa;
+	int ret;
+
+	mutex_lock(&vdoa->lock);
+	ret = vdoa->removed ? -ENODEV : vdoa_wait(ctx);
+	mutex_unlock(&vdoa->lock);
+
+	return ret;
+}
 EXPORT_SYMBOL(vdoa_wait_for_completion);
 
+static void vdoa_stop(struct vdoa_data *vdoa)
+{
+	if (!vdoa->curr_ctx)
+		return;
+
+	if (vdoa_wait(vdoa->curr_ctx))
+		writel(VDOASRR_SWRST, vdoa->regs + VDOASRR);
+	writel(0, vdoa->regs + VDOAIE);
+	synchronize_irq(vdoa->irq);
+	vdoa->curr_ctx = NULL;
+}
+
 void vdoa_device_run(struct vdoa_ctx *ctx, dma_addr_t dst, dma_addr_t src)
 {
 	struct vdoa_q_data *src_q_data, *dst_q_data;
 	struct vdoa_data *vdoa = ctx->vdoa;
 	u32 val;
 
-	if (vdoa->curr_ctx)
-		vdoa_wait_for_completion(vdoa->curr_ctx);
+	mutex_lock(&vdoa->lock);
+	if (vdoa->removed)
+		goto out_unlock;
 
+	vdoa_stop(vdoa);
 	vdoa->curr_ctx = ctx;
 
 	reinit_completion(&ctx->completion);
@@ -192,9 +226,44 @@ void vdoa_device_run(struct vdoa_ctx *ctx, dma_addr_t dst, dma_addr_t src)
 	/* Enable interrupts and start transfer */
 	writel(VDOAIE_EITERR | VDOAIE_EIEOT, vdoa->regs + VDOAIE);
 	writel(VDOASRR_START, vdoa->regs + VDOASRR);
+out_unlock:
+	mutex_unlock(&vdoa->lock);
 }
 EXPORT_SYMBOL(vdoa_device_run);
 
+static void vdoa_release(struct kref *ref)
+{
+	struct vdoa_data *vdoa = container_of(ref, struct vdoa_data, ref);
+
+	put_device(vdoa->dev);
+	kfree(vdoa);
+}
+
+static void vdoa_put(void *data)
+{
+	struct vdoa_data *vdoa = data;
+
+	kref_put(&vdoa->ref, vdoa_release);
+}
+
+struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *supplier)
+{
+	struct vdoa_data *vdoa;
+	int ret;
+
+	device_lock(supplier);
+	vdoa = dev_get_drvdata(supplier);
+	if (vdoa)
+		kref_get(&vdoa->ref);
+	device_unlock(supplier);
+	if (!vdoa)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	ret = devm_add_action_or_reset(dev, vdoa_put, vdoa);
+	return ret ? ERR_PTR(ret) : vdoa;
+}
+EXPORT_SYMBOL(devm_vdoa_get);
+
 struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
 {
 	struct vdoa_ctx *ctx;
@@ -204,16 +273,26 @@ struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
 	if (!ctx)
 		return NULL;
 
+	mutex_lock(&vdoa->lock);
+	if (vdoa->removed)
+		goto err_unlock;
+
 	err = clk_prepare_enable(vdoa->vdoa_clk);
-	if (err) {
-		kfree(ctx);
-		return NULL;
-	}
+	if (err)
+		goto err_unlock;
 
+	kref_get(&vdoa->ref);
+	vdoa->num_contexts++;
 	init_completion(&ctx->completion);
 	ctx->vdoa = vdoa;
+	mutex_unlock(&vdoa->lock);
 
 	return ctx;
+
+err_unlock:
+	mutex_unlock(&vdoa->lock);
+	kfree(ctx);
+	return NULL;
 }
 EXPORT_SYMBOL(vdoa_context_create);
 
@@ -221,12 +300,15 @@ void vdoa_context_destroy(struct vdoa_ctx *ctx)
 {
 	struct vdoa_data *vdoa = ctx->vdoa;
 
-	if (vdoa->curr_ctx == ctx) {
-		vdoa_wait_for_completion(vdoa->curr_ctx);
-		vdoa->curr_ctx = NULL;
+	mutex_lock(&vdoa->lock);
+	if (!vdoa->removed) {
+		if (vdoa->curr_ctx == ctx)
+			vdoa_stop(vdoa);
+		clk_disable_unprepare(vdoa->vdoa_clk);
+		vdoa->num_contexts--;
 	}
-
-	clk_disable_unprepare(vdoa->vdoa_clk);
+	mutex_unlock(&vdoa->lock);
+	vdoa_put(vdoa);
 	kfree(ctx);
 }
 EXPORT_SYMBOL(vdoa_context_destroy);
@@ -291,11 +373,16 @@ static int vdoa_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	vdoa = devm_kzalloc(&pdev->dev, sizeof(*vdoa), GFP_KERNEL);
+	vdoa = kzalloc_obj(*vdoa);
 	if (!vdoa)
 		return -ENOMEM;
 
-	vdoa->dev = &pdev->dev;
+	vdoa->dev = get_device(&pdev->dev);
+	kref_init(&vdoa->ref);
+	mutex_init(&vdoa->lock);
+	ret = devm_add_action_or_reset(&pdev->dev, vdoa_put, vdoa);
+	if (ret)
+		return ret;
 
 	vdoa->vdoa_clk = devm_clk_get(vdoa->dev, NULL);
 	if (IS_ERR(vdoa->vdoa_clk)) {
@@ -310,6 +397,7 @@ static int vdoa_probe(struct platform_device *pdev)
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		return ret;
+	vdoa->irq = ret;
 	ret = devm_request_threaded_irq(&pdev->dev, ret, NULL,
 					vdoa_irq_handler, IRQF_ONESHOT,
 					"vdoa", vdoa);
@@ -323,6 +411,22 @@ static int vdoa_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void vdoa_remove(struct platform_device *pdev)
+{
+	struct vdoa_data *vdoa = platform_get_drvdata(pdev);
+
+	platform_set_drvdata(pdev, NULL);
+	mutex_lock(&vdoa->lock);
+	vdoa_stop(vdoa);
+	disable_irq(vdoa->irq);
+	while (vdoa->num_contexts) {
+		clk_disable_unprepare(vdoa->vdoa_clk);
+		vdoa->num_contexts--;
+	}
+	vdoa->removed = true;
+	mutex_unlock(&vdoa->lock);
+}
+
 static const struct of_device_id vdoa_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-vdoa" },
 	{}
@@ -331,6 +435,7 @@ MODULE_DEVICE_TABLE(of, vdoa_dt_ids);
 
 static struct platform_driver vdoa_driver = {
 	.probe		= vdoa_probe,
+	.remove		= vdoa_remove,
 	.driver		= {
 		.name	= VDOA_NAME,
 		.of_match_table = vdoa_dt_ids,
diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.h b/drivers/media/platform/chips-media/coda/imx-vdoa.h
index a62eab476d58..e0ab414ddf5a 100644
--- a/drivers/media/platform/chips-media/coda/imx-vdoa.h
+++ b/drivers/media/platform/chips-media/coda/imx-vdoa.h
@@ -6,11 +6,13 @@
 #ifndef IMX_VDOA_H
 #define IMX_VDOA_H
 
+struct device;
 struct vdoa_data;
 struct vdoa_ctx;
 
 #if (defined CONFIG_VIDEO_IMX_VDOA || defined CONFIG_VIDEO_IMX_VDOA_MODULE)
 
+struct vdoa_data *devm_vdoa_get(struct device *dev, struct device *supplier);
 struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa);
 int vdoa_context_configure(struct vdoa_ctx *ctx,
 			   unsigned int width, unsigned int height,
@@ -22,6 +24,12 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx);
 
 #else
 
+static inline struct vdoa_data *devm_vdoa_get(struct device *dev,
+					      struct device *supplier)
+{
+	return NULL;
+}
+
 static inline struct vdoa_ctx *vdoa_context_create(struct vdoa_data *vdoa)
 {
 	return NULL;

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

