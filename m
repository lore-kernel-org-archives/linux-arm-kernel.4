Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dySBKE+7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH27dU4F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=; b=dySBKE+7pnzE1KcC9xDiJEDJwD
	GlVKC+LevtyCTMTNJSyxtZKCQwVs1mLaZjYdZC0WDe/eQCjDtWaVAL5epkFyOAb05t9FonAdI7Nvt
	+u/T29nZQGyrvJkhEqAlJ31oc5fcZ0S61qpPw9MBggRUPXDehgVuEa3BH4EEMRQpZW1pfYYblRu3N
	0s13VKSuG7j1+QU0eXC4afffpNXREUImKNX6UAbtOnDoHlU5iXWoOCrOnuJz95Jy0gxzi9dxnxkzi
	AZlyik7Y7gkqLgxt8gM/sy/bEHehoXM66VbtQOetUqvNVVLmPmQXODbJYcHGufJQdNJ6fN9hZDAjG
	IF2aMKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRSw-0000000C5aY-2Ld7;
	Thu, 26 Nov 2026 04:52:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRSt-0000000C5Zx-3v4g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 04:52:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2f04fab527eso50781785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 20:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795668731; x=1796273531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=;
        b=bH27dU4FmXysjQi52lrX9THfwNKArwfBrctnGdPMTeV+ulUotsfHzprF7o1bwyNWUq
         nsC7T0GXlulBu3BlBNojysqmWDMVy0X1ItHpGz5OiPUP0ww5H8niWsBcKMg5EwNE17Gi
         vdO1+gafkYU4qGGotpalx5hxsLdG42vASf/nfIDhkoGq3m9u/B153xijJ0cSUV2JuJiJ
         zH6S3Gg7eVxqAee2+c8kUtj2sHtkPu42Ww5SGiUJEiXxNxsfGBx1hmatF6N7jy+Dgnk5
         IC/sSPl5Flw7g+x5B/qVhlvKB3NXMCX06PEdV5d7tamb6hLypDiz3B07BnMQs9pzTijW
         TEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668731; x=1796273531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3q8xfPDIBkp3Q9114uqxEU+8XToiBPIWTZl/xj0hLw=;
        b=vfm6RFHmDolwAYGdT2kis/zNN6QUpmVfDhOMawgEOu+pFZTQD6A67xxB6Mc50CFvD7
         Jmt6lFO4hqtzvPHjtprhmOFvlcmTcmQW4FVQrxSbxxk/eCc7qdKY8XhX1z4nRhhy2CIs
         yTrNm9M+XiEsnDaU70RWrdv+/NeDSXcn4JTESpypnBiOeg6+HZazVTK0NJnuAvCixPwC
         igLN5Ifp//3H4pqUIoR+ILV6uaA14fR+vOzQsAOMwu46xjlV8dWqUyy9wZblet9LvIbP
         PppmrIRRVc+XEfxNLWtLkgNmIURBgzq3YVhQCGYxDvG9Ad5Uz46NNXGpdDHxvQOauDKC
         Z9Iw==
X-Forwarded-Encrypted: i=1; AL+hErGzYxvhkp58VgT7Bdi/CGOzlfq+63MlwvK8r/Zv1YyS+RGcYeFc4UEDPIEhNHCAunCEvIEI3EI4hEcT9DxDziAe@lists.infradead.org
X-Gm-Message-State: APuU4Z/3ip7194mhgyW3vFT5LT1XmYC5gAPkHtKK0/qDwlJnIepetV5L
	g6z+hCSDBP1CWmi8SCGFIMdIzPTSNhxB/Op2t1ywnWaaf13d3W28XLKQ
X-Gm-Gg: AZFdTZekQMMmS2sBDujXGxQumombJ+PoWdjCMg9lsj99fsMgWuEv0wzffrWoCkPqhL+
	WEOS8MECdtqiegKvyNnPvcf5TwoZD+Bq7k/lukeqjh7SS876cjTUdbrQX9TGYt26DJdwhVLtWuU
	9OH8JsyW3RKfphKnDsf8D6EVm5A4UcrjfslKMY8qbeJc1FRmqFuYQwAA7TTF8MNJBFH8JGL3fwQ
	QFpvi4fv3VNsNahqBvIgjIe/JRQfqWRs/FSAHdhyAOsi8AP590uH9mYAUT1qXPXGGzLQn5f5X3y
	B3/gqadLPNgQDYI6YW0TAvGmyrh1ycXB/nb6Vdyq0sJIWkhR4gqL6DL0eWogeFc81cnZZFTgd3n
	u5a6o86WNa0+MxHW5r/FHcXy7/Yavk7N9+a1grqfmX8WFtvSznymgDNT0HHswhNB+1+K+LWEqSr
	qPfr1y0005/ndmoFsnzKT/ATtbC0V3w2kkgwY0zIEePR1lKZGRDegcn81tZfabLoyYbwI73ZODC
	IzfE6anrzd0XNXoBhV9ggyoC0aEyf/+DSWOSrUiVnC5IiopWbgh7kz/hmn484ZYCEC+4h0NXRxF
	sw42bAd+1V/1SUcNT+hyWP8T7RAe9DwsyocsQI0tdl976FtQ5i3sR6tiGlzSPSC4/Cy6Xwl4/tt
	DunJea5W6CiXpKyfmwHMt70Wyp4llpTc4l8yqMabdjw==
X-Received: by 2002:a17:902:ce85:b0:2f0:3e44:4761 with SMTP id d9443c01a7336-2f03f25e801mr210179985ad.54.1795668730721;
        Wed, 25 Nov 2026 20:52:10 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad0:1caa::2db:4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120830sm96700655ad.61.2026.11.25.20.52.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 20:52:10 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iommu/exynos: Disable runtime PM on registration failure
Date: Thu, 26 Nov 2026 12:52:03 +0800
Message-ID: <20261126045203.62181-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_205211_972893_87917DA2 
X-CRM114-Status: GOOD (  13.45  )
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

exynos_sysmmu_probe() enables runtime PM and then registers the SysMMU
with the IOMMU core. If iommu_device_register() fails, the error path
currently only removes the sysfs entry before returning.

That leaves runtime PM enabled for a device whose probe failed. The same
path can also leave dma_dev pointing at this SysMMU when it was the first
one to initialize the global DMA helper device, so later domain allocation
may use a device that never finished probing.

Add an unwind label for iommu_device_register() failures. Disable runtime
PM there, clear dma_dev if this probe set it, and then remove the sysfs
entry as before.

Found during static probe error-path review with help from OpenAI Codex.
The fix was build-tested with ARCH=arm exynos_defconfig and W=1 using an
arm-linux-gnueabihf GCC cross-compiler.

Fixes: bbc4d205d93f ("iommu/exynos: Fix driver initialization sequence")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 7c337ba96..18a536008 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -844,10 +844,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 
 	ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
 	if (ret)
-		goto err_dma_set_mask;
+		goto err_iommu_register;
 
 	return 0;
 
+err_iommu_register:
+	pm_runtime_disable(dev);
+	if (dma_dev == &pdev->dev)
+		dma_dev = NULL;
 err_dma_set_mask:
 	iommu_device_sysfs_remove(&data->iommu);
 	return ret;

base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
-- 
2.54.0 (Apple Git-157)


