Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E657606B2F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ugioBYtc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7EkfguC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=; b=ugioBYtc13EOsU
	Z4h+JO7M8IJLq3gQAwSqZjJd4PgtQrbN4r8hNecUq5Z74NxkZ3ISooQT/oHEapiXbOZs1n7m9hZWe
	2cx6pGD9TNNmDK+0pm93TBIA8TfmOzBVs6GwM2dqF/3Uu8VmboEaE+mPvif4aW4ngTjNQOB7KBATd
	MRZuUMPgYCj7HSL2KtZhfDAbCbbSArlBY8Ob7vuvV9c9SkDqf+bB6loCQ8E8vKFGVZWBgDL4loCYp
	JrWjSJiFxU+kHoaIrl619RPPTPsdqmISGCjCBEDeXWS3ZFYnaNmtd5QZqmpCp+0TM197pNzvtYXnX
	Pt6/JRGO1JEBaiyVXQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQljA-000000041Al-3mV6;
	Tue, 10 Nov 2026 13:17:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlj9-0000000419d-1Nqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:32 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1474117a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316651; x=1794921451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=X7EkfguCy9f11TtANZ20otLXGP8mstiL7OAbNX+g0km60S9ONu6Pzqzyd8VHcR0AB0
         sFmfo5o2gCHQJdhzNZ9QOyiO/0UudWpNHNEeKZHIhq7TozClKRHqtZ5gqi9eEtuolx6n
         gnymV6GjzeEhK51Q4UIMF2PSxNgSfcqB4bb/KCVZyKZXlRaUJRbxfM1f0+kgAR8Y2px6
         0N+It/fmEZgRb8uwjh3zGGW/0rqgL1DxKRCUffKDANCmAO6TCwb5KV2wsv/sQ3rvPybt
         /+TZP5vzBsojqnKzwPj7pSUCT2FLPjDlk4DUZkMDktmI9mS3DqLI4aoXR7KNZnVMNlPh
         KR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316651; x=1794921451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=oG65n6r12nlintP/WGfYWgVofLh5OMIZyZfhx+9ITO37XXFCdmfj4qBuvXVhpahFMK
         L9lXTt4gObTqvlSKcdzok/zIB/6hTu4dMBXKZJJENIbWNyAVm//3Xoy7WI+ya0N5epCu
         71IWxKpEile8Eoo45r/aGtaWJtLZ+bKmtCODlIaZMlyCBwR4Hxt/qvhoDV1ItOaxh4LY
         tf+GNRkREn8d4w9K77SXZeETNd7nVwRMzrp5EQzb8udKL3x56/DtVpSB06sBWTCtbA7t
         wrT2R3AeyCMikEHsYi+h6ptvvxh4QiWXQGj86MqJGvrDf/1X6m4LJw/Z/2Y9tGxHpyPz
         b4Kg==
X-Forwarded-Encrypted: i=1; AL+hErGWiUqe0JkMnRu5z6NV0uARt8TCzztWCg32NDvnqwwWrCMFFqrIl3o5e3Lu3XFzoBWo3v5BCTluGMmXuFcPutjO@lists.infradead.org
X-Gm-Message-State: APuU4Z8YuR9Zxz8vDNUQdB8ERTctsw1vgdgz/5mxF+tIM1UL+5stsUMX
	sVY2oieZu/9dvfinlXqwtxaE+kAYCVfP6+QkrPxJIb2N9cAhT7CFgjbY
X-Gm-Gg: AYBFou19Lf8cBr58A02Q/Qp4k72HEJ9xK3bYEdTA0Qv+DUlj/UR/vkRCFIsovFniIsJ
	LymWKr7t3Dvv8PS0uIKMMEV0UYY5/l/7cK3MoB6Debbk0loHnnvdpMjWAAWZXApT1EthqbVulvI
	J3aaahJy22rbalw9mh+0H/Fr4d7XFsK9Ca0+Zx+GSLhfzV0QMEq/JNjxsGQ7UtrNsAZ5pya0J9L
	SyKDjdv+lPHcpixUClK7qeQxdYl/qh20tFT5nOyPXX1viqD1L0oU/ESyl1CoeepdNWdiuWaHCk+
	kgNsgew8p6l+GcDwwMafsXkHqU+KN5CZJw1i3TjBuntggQgrTX4f9NNl3+E58hJWS8a2d97Hr1U
	72GwY0tflBX9LCREbs+5W0+PrWjlOnG5hsfpvWjJHXT9Y6EiP/S3TCEeNH6WU3uX9GaY7X0sCXb
	OgxgkyKuLwjBSLvxBIdKiPG0k6P7hW71P7LCXNWHYYUmzANBxROpU6Gk8zl2ylyraKo1G9x1e3E
	XA5XitdrGB9eUlA2ExYQoh/XemrXDeJntePXl0qNAo9Bnvh5VDrqP3n1pmNA+i73IUFxMsV9mhq
	BgXTSVUXEhIbyv6ciUvp+eNUvbcVqDFi
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2747340a91.52.1794316650614;
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sinan Kaya <okaya@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 31/33] dmaengine: hidma: defer callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:31 -0800
Message-ID: <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051731_388838_3B0C86CE 
X-CRM114-Status: GOOD (  14.91  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work.

Since callbacks no longer run synchronously from hidma_callback(), drain
the BH wherever the driver previously relied on that ordering: provide a
device_synchronize() callback so dmaengine_terminate_sync() waits for
deferred callbacks, drain the BH in hidma_free_chan_resources() before
the descriptors are freed, and drain it in hidma_remove() before
hidma_ll_uninit() tears down the TRE pool that the completion path
reads. Kill the low-level completion tasklet before that drain, since
it is what schedules the BH.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 85844965f0d8..2cde0cd08b1f 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -155,6 +155,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +188,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +210,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
@@ -529,6 +537,11 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	return rc;
 }
 
+static void hidma_synchronize(struct dma_chan *dmach)
+{
+	dmaengine_kill_bh(dmach);
+}
+
 static void hidma_free_chan_resources(struct dma_chan *dmach)
 {
 	struct hidma_chan *mchan = to_hidma_chan(dmach);
@@ -540,6 +553,9 @@ static void hidma_free_chan_resources(struct dma_chan *dmach)
 	/* terminate running transactions and free descriptors */
 	hidma_terminate_channel(dmach);
 
+	/* drain completion work before the descriptors go away */
+	dmaengine_kill_bh(dmach);
+
 	spin_lock_irqsave(&mchan->lock, irqflags);
 
 	/* Move data */
@@ -813,6 +829,7 @@ static int hidma_probe(struct platform_device *pdev)
 	dmadev->ddev.device_pause = hidma_pause;
 	dmadev->ddev.device_resume = hidma_resume;
 	dmadev->ddev.device_terminate_all = hidma_terminate_all;
+	dmadev->ddev.device_synchronize = hidma_synchronize;
 	dmadev->ddev.copy_align = 8;
 
 	/*
@@ -913,6 +930,7 @@ static void hidma_shutdown(struct platform_device *pdev)
 static void hidma_remove(struct platform_device *pdev)
 {
 	struct hidma_dev *dmadev = platform_get_drvdata(pdev);
+	struct dma_chan *chan;
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	dma_async_device_unregister(&dmadev->ddev);
@@ -922,6 +940,10 @@ static void hidma_remove(struct platform_device *pdev)
 		hidma_free_msis(dmadev);
 
 	tasklet_kill(&dmadev->task);
+	/* the low-level completion tasklet schedules the channel BH */
+	tasklet_kill(&dmadev->lldev->task);
+	list_for_each_entry(chan, &dmadev->ddev.channels, device_node)
+		dmaengine_kill_bh(chan);
 	hidma_sysfs_uninit(dmadev);
 	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
-- 
2.43.0


