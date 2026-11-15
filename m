Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4619606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HAEfUjPu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YRLNTMXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cIRRH0DaCFDYPcExE0sOQlYcNb7utp+2evRSM+ZndUA=; b=HAEfUjPu4GEVFnRdxxE5idua9z
	wR8uYDB6aaW5Tcv7oXrcj2bUZYRod52f9Cmx4qQyON/hrLW6sRoncGlmajhQRkXv6v76vxElS7FRn
	YnakuWaceUI9/eoGO/DShkjpRXZzZMtJ9LTdHeHB8hLWTMBPrTyzMbR6hbAa5lP9cbmcS2Qh3hUqK
	4T7cqqzyYk+WCwccDi794RPFuAevaQfRBm7u40UDm1shFwtJSIMvNLGegmddMDQgfad1k9vz7pLzo
	GdpmDWijk4VcVGll7BZ71OZbzAjvrEvZSh+I4pAsd9chRqjlC1cv/Rh6U5P6vg95jbP61npb8p9Gi
	yec/9erA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSirc-00000000g6L-2wQ4;
	Sun, 15 Nov 2026 22:38:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSirb-00000000g66-1w4J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A0541934;
	Sun, 15 Nov 2026 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA241F000C4;
	Sun, 15 Nov 2026 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782298;
	bh=cIRRH0DaCFDYPcExE0sOQlYcNb7utp+2evRSM+ZndUA=;
	h=From:Date:Subject:To:Cc;
	b=YRLNTMXgmt2oJMA4V7rIIJZi4gR4X4RMyudzb8/j7pAzcoEQN2tqristf/NKbLrUE
	 65/OTt/Q79jxUe09lwAwMmlK0bzyaQX9d97+mDD0UVnm525SBYP3B1tNWobmCN6mcA
	 zcmm6VZSqzbFW4QmrTO2BKUC0uBTMGVX4IvmwsbwGfDL1+1bi6wqjDZ4mii4LfioY8
	 D2nCwt8FSTPwFNXFMDwu2JsNN/eYftwRNpc1FWYs1/QsNIdjSm9SQcsNdOF25x66vs
	 N5jVPrCRwnws4W4QzWkUTEwoMgnlq7ysnqOcSCGRLOhXT53nyJQe2iZq3s5XuTPDgs
	 YZ2ajevXrV74A==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:38:14 +0100
Subject: [PATCH] ASoC: ux500: Drop the VAPE regulator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ux500-asoc-drop-vape-v1-1-46315e14642d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqEMAwF0KuEvzbQKI7Qqwwugo0z2djSogji3
 QXfAd6FZtWtIdKFaoc3zxsiSUdY/rr9jD0hEvrQf0Rk5P0cQ2BteeFUc+FDi7GsmnQaNEyW0BF
 KtdXPt/3O9/0Afy+ThmYAAAA=
X-Change-ID: 20261115-ux500-asoc-drop-vape-1fada73a07ed
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

The MSP devices now describe their VAPE power domain in the device tree.
The platform core attaches and powers on this domain before probing the
driver. Runtime PM remains disabled, keeping the domain powered while
the device is bound.

Remove the obsolete v-ape regulator lookup and stream enable/disable
calls, together with the regulator handle and error cleanup. This avoids
requesting a dummy regulator when the EPOD regulator nodes and supply
properties are removed.

Keep the existing clock sequencing and VAPE OPP constraints unchanged.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
The Ux500 genpd prerequisites have been merged into the powerdomain tree.
Please take this driver conversion through ASoC.

The genpd, binding and DTS prerequisites are kept below the cover letter
and excluded from this submission. These include the MSP power-domain
assignments in "ARM: dts: ux500: Add power domains", which must be present
before the driver stops managing the legacy VAPE regulator.
---
 sound/soc/ux500/ux500_msp_dai.c | 29 +----------------------------
 sound/soc/ux500/ux500_msp_dai.h |  1 -
 2 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index c135a77766ca..df3c9494698e 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
 #include <sound/soc.h>
@@ -350,21 +349,13 @@ static int ux500_msp_dai_startup(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter.\n", __func__, dai->id,
 		snd_pcm_stream_str(substream));
 
-	/* Enable regulator */
-	ret = regulator_enable(drvdata->reg_vape);
-	if (ret != 0) {
-		dev_err(drvdata->msp->dev,
-			"%s: Failed to enable regulator!\n", __func__);
-		return ret;
-	}
-
 	/* Prepare and enable clocks */
 	dev_dbg(dai->dev, "%s: Enabling MSP-clocks.\n", __func__);
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret) {
 		dev_err(drvdata->msp->dev,
 			"%s: Failed to prepare/enable pclk!\n", __func__);
-		goto err_pclk;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(drvdata->clk);
@@ -377,15 +368,12 @@ static int ux500_msp_dai_startup(struct snd_pcm_substream *substream,
 	return ret;
 err_clk:
 	clk_disable_unprepare(drvdata->pclk);
-err_pclk:
-	regulator_disable(drvdata->reg_vape);
 	return ret;
 }
 
 static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	int ret;
 	struct ux500_msp_i2s_drvdata *drvdata = dev_get_drvdata(dai->dev);
 	bool is_playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 	unsigned int configured = is_playback ? PLAYBACK_CONFIGURED :
@@ -408,13 +396,6 @@ static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 	/* Disable and unprepare clocks */
 	clk_disable_unprepare(drvdata->clk);
 	clk_disable_unprepare(drvdata->pclk);
-
-	/* Disable regulator */
-	ret = regulator_disable(drvdata->reg_vape);
-	if (ret < 0)
-		dev_err(dai->dev,
-			"%s: ERROR: Failed to disable regulator (%d)!\n",
-			__func__, ret);
 }
 
 static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
@@ -701,14 +682,6 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 	drvdata->rx_mask = 0x01;
 	drvdata->slot_width = 16;
 
-	drvdata->reg_vape = devm_regulator_get(&pdev->dev, "v-ape");
-	if (IS_ERR(drvdata->reg_vape)) {
-		ret = PTR_ERR(drvdata->reg_vape);
-		dev_err(&pdev->dev,
-			"%s: ERROR: Failed to get Vape supply (%d)!\n",
-			__func__, ret);
-		return ret;
-	}
 	drvdata->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
 	if (IS_ERR(drvdata->pclk)) {
 		ret = PTR_ERR(drvdata->pclk);
diff --git a/sound/soc/ux500/ux500_msp_dai.h b/sound/soc/ux500/ux500_msp_dai.h
index aae582030d95..7ca7144f5652 100644
--- a/sound/soc/ux500/ux500_msp_dai.h
+++ b/sound/soc/ux500/ux500_msp_dai.h
@@ -34,7 +34,6 @@ enum ux500_msp_clock_id {
 
 struct ux500_msp_i2s_drvdata {
 	struct ux500_msp *msp;
-	struct regulator *reg_vape;
 	unsigned int fmt;
 	unsigned int configured;
 	unsigned int tx_mask;

---
base-commit: 7a98d525145a130fcd86f1519e2b9317a3bad27c
change-id: 20261115-ux500-asoc-drop-vape-1fada73a07ed

Best regards,
--  
Linus Walleij <linusw@kernel.org>


