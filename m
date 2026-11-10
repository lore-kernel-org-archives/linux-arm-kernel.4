Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB46606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKsAHZEY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNJx1zTs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:From:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=; b=kKsAHZEYlA+BsKZxAWICBtB2Tl
	ymgmJySWdTddaD+vNtJ0RVR3jg7uTZNLTPsawP1BmgsCCYirB4dRTjrVofxtDhGpr0V8DtJHUGX8f
	q0k4Q+KLzhrDcxWxf6JIkU0k24xUpMT1aPizpG+fvbNbliAf7sncPAFrhinexsNVjJXMDgbV1ajkz
	L9atwPkqqWTdfFDCoMT9bunaC/tBIdtg7ba2CMmztMA6ZwJVMQo+92E91H8FbyehBDw0AIw9HKcid
	m47ZIWa81bpEjnWKFPB4uiPKLtzxYbQ/cOnvfvoEJcwxM2keq/F8HkCDSvQmSaO6lbX+MNyCjQbyp
	Ogw31GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaIa-000000023M1-0o16;
	Tue, 10 Nov 2026 01:05:20 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaIX-000000023Lh-1RB9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:05:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c49b431f022so248625966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272715; cv=none;
        d=google.com; s=arc-20260327;
        b=kim5pw6K7J24y3rfbU1NK3cC4xFk+9rkmnchfdyBkFZuSIKg3P3sv0GKEMiM8AT1UG
         gXpZKC2/Q/SIAX13MHd4ar7nvCoPlv3eEzHr/h8eDTkX4k23QQLu/5zWFHMDj3yYtFM9
         D0WuOf6g7K8649EXjwFnjJMUKqS76Gd+pUw7ieRqfqz7/A5X6CAnxVnWWHgU/8jJJn4H
         O5RoA1kX9L+eGiCQQZgTygetEQhfLRYcUN1H8qRwdV/X5jBdGS1PqnsLmytY1Yc4u95F
         7VBNyZiw0+VcbIz+lEheJldy/OcXi+xqxARsQeMxfaM+Y8clO/P2aKt3xz4xz95eqrwK
         Tkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        fh=yBJJ+fJSpS/vkuv7dHHVLs47iUFxjIQqRKQ83FYK4sA=;
        b=TbMjPaW/8T0Yvwmt9XOmAQvr0bPDWwsBUEbcRqCJuI5WX0+YfkiRFKXmxSlYOX5Zi7
         Pyg4MD+GMwPrAULYYLgu6HQOoYlWb1qUdyClid4fBogUhB+p0MR7If9vL+jkYTURckOC
         //3fJr4czu/FUfozhkFLBbeg0tGBExlS7Rp6t+nuRJvO0JOlvuyue+VyjaZlqNk5XLnk
         lBXkUGX4TQNQiYiCj0jJ83/UDxN9WWIq60x+ZocedFC2RoOpeaHsLtSKazGEhuSR5W5m
         gkDBYsRPcw6uSTaMZiBP7NNbfQan2IBRC/p+MEJiaLJ065P0fFECzcJTeceuvXryXQTG
         V8LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272715; x=1794877515; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=fNJx1zTsjr7ConA6qNPezYekNwGyY6e+u5grXYk4qavmRMHq8bkpJCfWjrMFrAqc14
         wCgyu+NBysgTErOay2Ed+oMw9hgqc8e3iUHTGZFK7C8vZRp28eIN2+mdwZOayApPsBaQ
         XmBieuoeN6HBQGo3Bv82gIV/esC31FcI+p1lZmr0wurL73IbasdRLXM92GoDP5HE/wfx
         Cq/k2VlPqoWo+6vLtmi44DmIk8R+1xV3Zj/+LbAcNkuxdqQSwThPuNA7kyhHVBO/Q9z2
         DwD285c9wXG2LgE6IC7X1R52Vf+0J3NGOOVS4rNaxXKlP096xOT+l15HGZX5ri3nHuvS
         I9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272715; x=1794877515;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=2I1lGN+QJkwRiZpXeNNMIEfmdYpCDa/l+1Bf7oqPlPTmvmjzsSL1prDwvo6+Bw7U6d
         vRmf3hDPf9i4u+/8DPQHPmb3Lt9GsSDvy7zTV7wk5GMDxUZ1SHcGnTiId2BeqJAhOER9
         LWeB2UDTmmQ1UFPHtLWMA5JLAeLwNyc6TtHt86IwTvFKD5bVMUwAGNGff4TLI0E2tD8i
         WmCEJnwTW+r2OMBhYG6zkLgMoOm5BJk6JxTSRhYQUw7FNLbEdmpkvH09+fW/v03TV9Il
         aQ3b0OvBdpxXi9dDute150cu6zcOqgBhACY2Hcm6GalhGEklK4gSlDot1efzUVJR1hq+
         DBWQ==
X-Forwarded-Encrypted: i=1; AL+hErG88YK7Fgq7hND6yQ6y9O02Ye56Xo6pMgT2IkVAuIWFRyrSLJbVdQi4I6yd25XYa6Y1m4ooQ2HBDsrOg7iE3YMf@lists.infradead.org
X-Gm-Message-State: APuU4Z940C+AVynESjJdL6abTBtKG5v/9JW/45JYrmONwTZqQs0K30FL
	BBlBg7KnnyuyOQNn2Pbt17LAl/1k+LTdagZ+ezIx8v9YB7TpbVRT5Vp0Y7FN81pvXme1oq47hVV
	NGsBgB+V+uErboF2BzTYrR1bqNbHA6A==
X-Gm-Gg: AYBFou3k3wmFwXFt42H6eU7Y+Hj46bmD0rxsdfj2qoweSPWhgh3Sjbq1S0cFKMPrIgc
	MuNqb+IWC2vE4o26Sp4AlPYsaMj8vNANTZIX4qoe4sCR14qfMRnWrYUjsJeTyGybZUVo9u3OBSL
	FxzW2qLudiyyNTX+oCfwFH4uYCU2SOXk1njJmZHDcIw9PwVNzIey6mfanA79EHOZiGiTqSQNGpH
	HwihjFwJ1gzWcNfue0P4r7Iw9N3+w89pjJoIujly+04iE0FfZ85Rk0Jj7rAyNgRGlfcIXg+BNk8
	1kuAkrlokTvxQLVAX6yNgGk89CDVeycGgNZdrScQ16u1uvKRkVbi7Gnby5rn7bWOEfFGtW5GUfv
	8Fdmm1g6lQjGWGFg2TKW2MtbFAmxM0wSKzURcv8Wc07LmDE/+/F7rl0yaEQLPUZSgkcikd3PShM
	uUx70pzp/KPyKRUK2Igrz+yZVpF6hSv6LldeYsW5JvUUQ=
X-Received: by 2002:a17:907:daa:b0:c4c:c997:8711 with SMTP id
 a640c23a62f3a-c50495fe4demr79667466b.38.1794272715279; Mon, 09 Nov 2026
 17:05:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 01:05:14 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:04:55 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 10 Nov 2026 01:04:45 +0000
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Tue, 10 Nov 2026 01:05:14 +0000
X-Gm-Features: AclHuK-Tz10TtmmbetQzQohzCKMVdVOkQRARraFioJZyzZB0RQCUaNN_wDp_oLE
Message-ID: <CAGEsz8Hrng-rnKE8hVKUo0RZD484HuSUGc5rWWeGNa6JsdaKoA@mail.gmail.com>
Subject: [PATCH v2 2/2] dmaengine: stm32-dma3: defer clock cleanup to managed teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_170517_415117_A023E5D2 
X-CRM114-Status: GOOD (  14.43  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Probe enables the controller clock, but remove only disables runtime PM.
Disabling runtime PM does not invoke runtime suspend, so removal of an
active controller leaves its clock prepare and enable references held.
Probe error paths also disable the clock before managed DMA registration
and IRQ resources have been released.

Register a clock cleanup action before acquiring those managed resources.
Keep the existing remove-time runtime PM disable barrier, and let devres
release the remaining clock reference after the DMA and IRQ resources.
Skip the clock disable if runtime suspend has already released it, then
mark the device suspended. The PM stubs also cover CONFIG_PM=n.

Set the initial runtime PM state next to clock enable so that probe unwind
can distinguish that reference from a runtime-suspended device. If setting
the state fails, release the clock immediately and return the error.
Use direct error returns once devres owns the remaining cleanup.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1721,6 +1721,16 @@
 };
 MODULE_DEVICE_TABLE(of, stm32_dma3_of_match);

+static void stm32_dma3_clk_disable(void *data)
+{
+	struct device *dev = data;
+	struct stm32_dma3_ddata *ddata = dev_get_drvdata(dev);
+
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(dev);
+}
+
 static int stm32_dma3_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1755,6 +1765,16 @@
 	ret = clk_prepare_enable(ddata->clk);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk\n");
+
+	ret = pm_runtime_set_active(&pdev->dev);
+	if (ret) {
+		clk_disable_unprepare(ddata->clk);
+		return ret;
+	}
+	/* Release the clock after the managed DMA device and channel IRQs. */
+	ret = devm_add_action_or_reset(&pdev->dev, stm32_dma3_clk_disable,
&pdev->dev);
+	if (ret)
+		return ret;

 	reset_control_reset(reset);

@@ -1831,17 +1851,15 @@

 	ddata->chans = devm_kcalloc(&pdev->dev, ddata->dma_channels,
sizeof(*ddata->chans),
 				    GFP_KERNEL);
-	if (!ddata->chans) {
-		ret = -ENOMEM;
-		goto err_clk_disable;
-	}
+	if (!ddata->chans)
+		return -ENOMEM;

 	chan_reserved = stm32_dma3_check_rif(ddata);

 	if (chan_reserved == GENMASK(ddata->dma_channels - 1, 0)) {
 		ret = -ENODEV;
 		dev_err_probe(&pdev->dev, ret, "No channel available, abort registration\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	/* G_FIFO_SIZE x=0..7 in HWCFGR3 and G_FIFO_SIZE x=8..15 in HWCFGR4 */
@@ -1861,7 +1879,7 @@

 	ret = dmaenginem_async_device_register(dma_dev);
 	if (ret)
-		goto err_clk_disable;
+		return ret;

 	for (i = 0; i < ddata->dma_channels; i++) {
 		char name[12];
@@ -1878,12 +1896,12 @@
 		ret = dma_async_device_channel_register(&ddata->dma_dev,
&chan->vchan.chan, name);
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to register channel %s\n", name);
-			goto err_clk_disable;
+			return ret;
 		}

 		ret = platform_get_irq(pdev, i);
 		if (ret < 0)
-			goto err_clk_disable;
+			return ret;
 		chan->irq = ret;

 		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
@@ -1891,19 +1909,18 @@
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
 				      vchan_chan_name(&chan->vchan));
-			goto err_clk_disable;
+			return ret;
 		}
 	}

 	ret = of_dma_controller_register(np, stm32_dma3_of_xlate, ddata);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register controller\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	verr = readl_relaxed(ddata->base + STM32_DMA3_VERR);

-	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
@@ -1912,11 +1929,6 @@
 		 FIELD_GET(VERR_MAJREV, verr), FIELD_GET(VERR_MINREV, verr));

 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(ddata->clk);
-
-	return ret;
 }

 static void stm32_dma3_remove(struct platform_device *pdev)

