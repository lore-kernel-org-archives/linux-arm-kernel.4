Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27123606C2E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xL5u6rKB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBtrb0sE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=; b=xL5u6rKBlhZ1MpiLnRvMz+JYQS
	t3KOqwZJZzJ0pB2WsE4NbSGtWbCbe3K04TQ+tmlosY79g96p9d9i9/6ypSFkQcoAmjXcW3Z9PoSSD
	tv52C8Flo1wSNDpqePEnyF4cjjVSDlRc2qeu46UNnhNYkXMRrmizErRpyOgHrBeV3ggDD4k4tKRnp
	EoT593cSRIQ+NTmcgIuvgf8khbRpBhk9oTX2U/lXr/1zwRyaqRibrxLPndLHyw1VYLPCePkI3eekb
	LbE2e869J9k3qi5KfoxgB5wz5ipMIkyv/1+Ep7WvDloAXmFEOnP49sXFhP9HT8FiU0sRyD6kydKgA
	ANQuCuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGO0-00000007t6W-3vcP;
	Wed, 11 Nov 2026 22:01:44 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGNy-00000007t64-1lZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:01:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6f5a0893610so2269244eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434501; x=1795039301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=FBtrb0sEGnKSjoejyi2ZGeYDDdX1mPy8HdMaJT+iDM5z4vzoBSv6PgaxbxjBxAHYfn
         5tipgyO+EIQ9IxshK7s6OUH/Tbm7LDl+yfesm4OK7PH+Jxv7dFFkG98MGpR+dBg8NuwM
         VD0cfTCLlrI9w1pWI30xmmnTc7waWv/4NB7/9Zxn/CnFvp4P6txdzqu6VX76l/eEVMqJ
         77UV2x/RXn7bFIea0aiHt+TFiyug1R9qY6jYcxbqWzDZrUtyKTqxsnTrVkfQkNcepy7o
         LImIMf8cJ5lSIQTJTfddYjqQUkO6Z1vJXPU1lFzk2O11fYkQ1PFlrETQ6RgdKjTH+PBt
         sMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434501; x=1795039301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOO2h5QK8CfY8Gg/3IS9sOkN8AMCYlWmi2Pn5OTG2Oo=;
        b=aHG0wsa++nSBztE7v/1iA+ttPxPlQ5M4cLV/1m0PXkPIyOTZc63MO9QbjHmAedRGHw
         g7TG9c0A73beQstSCKrPB+TG861k7pZ5/lrPm5C7m5RWkkiGmzSsuc5ipGfBahwhM4kM
         5ep/a4TN2tvX+xWcot08JpF+jpEj3536rtTvA2yeW8OdM2ZdHqGDs0xokBJv6LfL6k43
         kmEFJ8iMFHhRYKuR3JvXZiSWAHEMdxhb5HlXfG9LVFfRuc7VR65U3Gk9cEPTIEkoHn7M
         Mnfu1UKvX32H8SX9RQzmD/gzxRA9aKvUiEma6EwV0a81dn0PCi1Gx2Ueo2mKQeegD9G3
         gksA==
X-Forwarded-Encrypted: i=1; AL+hErGuT52+57YZ+YwPQ47db0xQtWOHHjsKqrUT6n75XB4VP+sawN513OZBdf1lYGIClf08AQz0AhjLmeXBxRY7NJS+@lists.infradead.org
X-Gm-Message-State: APuU4Z+FfhfoGCFE1JUh3pZ6s4TykM446wYQPDqJWKWc5Tgk2eka/GPj
	ohQydddAh0vlCh55/9Cc+Mb89mGpyMUonke7x3yS7veEqYH+qUzDs9f6
X-Gm-Gg: AYBFou3JoA7mQg9Y+E4ZcttvxHd/mlOhd9GXGY4l6RgnxzSHMXxCBQj06OVBKRgHLDz
	f+T7vATiZ3Ca9vyJiNv1vQg/wq+jUS6FhXPDsf1hAYeiTeEAlRD96OWd2Idhr2I221sJhsjdWZq
	NzLIPY6g9c1dK2WSX7AWOHSTHBU2oNtTS4gTv4cv5cZ/jYvNnlg95pDGO+n6n2TGbBc4/VUSAvL
	Rx/Ns5yh2mK/bBDc9ucaDmUy4LpiPwoZpl+ZQgbt2yOdpSOHKeQ6GADnBZ3DNSfiwBUcTa7Ny2N
	T3F+XIhI+4/jNJGyCvZQH2OLKIcNfVd3w/G0P+aZt1zzMMN1GmNIPSJRYFBZByZrlSMf3qhFiyx
	ki6X5To86r0JzMYZrmMxDiOxA3FLj2wcM1utzZVGkM5HRJH7HEB0dRGJ8X+QyvzIld2XpS0auhR
	eieH7pxCbg+Hl6WHRBX7RRhNDcawPmaSeJUdGCY0fq6CrfCq0myW8w3WmPoxQ9Tz7x1jIXB9iox
	vo5GRZXU0JshmnNkd+iyqKTlIYrRTooDID3mFR32WRp7L+w4jgcQ8E4hUvyRHYhj4yuDXIK52QC
	avkRxtly1cZ2HVuK5xc/I9vvV6AXq30dnZyni/u4QOU0gTI1tn3EacirJw2qoFvNU7/6LGNLq7j
	/TRq4xD0hiobfe8safYY8jScpMT4pX+NCgkiWwZQMWbz6h9QknMP1jUQJQTEwQGH/cIXl9t/p7U
	gmPQ==
X-Received: by 2002:a05:6820:1ca8:b0:717:866:abef with SMTP id 006d021491bc7-7191789058bmr2582841eaf.34.1794434501099;
        Wed, 11 Nov 2026 14:01:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm4206140fac.16.2026.11.11.14.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Kees Cook <kees@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] drm/exynos: fimc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:01:29 -0800
Message-ID: <20261111220129.12128-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_140142_484624_7EC1AC35 
X-CRM114-Status: GOOD (  14.51  )
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

The formats array is allocated separately with devm_kcalloc() and only
referenced through the fimc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex().
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 9c2ad95799ee..9233cd3b2f04 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -99,7 +99,6 @@ struct fimc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -108,6 +107,7 @@ struct fimc_context {
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 static u32 fimc_read(struct fimc_context *ctx, u32 reg)
@@ -1273,19 +1273,16 @@ static int fimc_probe(struct platform_device *pdev)
 	if (exynos_drm_check_fimc_device(dev) != 0)
 		return -ENODEV;
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev,*ctx, formats, num_formats);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	if (ctx->id < 3) {
 		limits = fimc_4210_limits_v1;
@@ -1319,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
 		formats[j].num_limits = num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* resource memory */
 	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
-- 
2.56.1


