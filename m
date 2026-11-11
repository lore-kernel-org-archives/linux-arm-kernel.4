Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77550606B369
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VnSJQJ0b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQcHEY4+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=; b=VnSJQJ0bn08g5lftiZOHJQ77wR
	ArFiHM/pPVG/4udliPWd92d9aGDsKLWOei74/ikMsQE+VoaIaPF6mMd4F6LAP6Cx3fY64SSFRZJyv
	MKQ12sGcWwK1jx+zzQvbfNvBxxglT2XRajCFXod613Uwdv1v0rohZwjK6NUFVVPgDKGABvQRMHO4x
	BhDEByQgqPPH93v9NvgZSoIjHM2WiYy4EbL9gxqIhJy3Rpthid+tNu5bKbw8nqoHTyKJJGZ+n/Jfk
	ui2EYlVKVDjGk7L40XHQUWm6x8XToZT1P0YQd5pHY7iorntX4VQDLrMj05fkUTYc4PiktNIofpr5k
	iBev0f8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGPh-00000007tUa-1xez;
	Wed, 11 Nov 2026 22:03:29 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGPf-00000007tTf-0mNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:03:28 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7f84a55cc06so2176384a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434606; x=1795039406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=jQcHEY4+bLrjvcr5LeOYeWy+/WMPwJt5De7tix3TXz3s3YbGztXUalWt0EPlQTAyOh
         SW7hEsudAI1AVaAtsEnrTg/3pVsAqaJqHrQQSa3Y1nFBv47Ebl0uPKrc6bezxnTnqR0P
         ySjVtvQ7EdH9nObQIyQ414/JIoOm5e1pYfRv9EUV73uzbu2E5Ft0laT1+gzDWQFtAI7r
         WqRHzbp423LsyvQim6JNhBlvrUZM6mDr+ozLyRukzw9v86eUtPZbd6JFoxIFxybGQPVm
         /wucM3c+icb8t1iCOoRmHpjmDlevzV1rPntmJ/kqhIYmuo7wFzyxj2QbONtLmWxN/QAu
         UQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434606; x=1795039406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPfQCcrAfCjRkFz6L9qyGHzK9Ch2pW+l+JfxC7qRxyM=;
        b=BWc8xBkkU8YqVm/Soq4Dcy76hiS8y9RFLk5oCY1ACo1xoHvBh6ws8bFlWOep1U9hll
         Tyi2dR2mEg0ux6OIFzJdRzc9tOV+jmeQxe9q05OBXVZM6xNMho6Tkbfg4nFJ5FqAhIxA
         1SS1fWAWNNhlmrFCrAp7luUL40sTq7m0JlwZuHusUDSWyR4hfRlKKG7leKfMjhY5cvQ1
         oAIIPwH2iq/eiF8s6jqFkuZfa6hjsUwqLfd95q747szhQBGDFcHXPc3OrhM98j5BhQDZ
         26kwFH58ltlHsFiEiy5NWiKWpqMeoH8VXCPr0M4ty8R99YEMS5V7gv9C5gqbJwWqdI8O
         ZoMw==
X-Forwarded-Encrypted: i=1; AL+hErHNYwfzJCRk2b7b682xk9N5BTnapcSit8pCRABZ1f5Qus9v3Sd5hDYerFg5+GDdi1qgrgK9qWY8tKVfCcuLVCLm@lists.infradead.org
X-Gm-Message-State: APuU4Z+ghhKB2b6CjrH3fC8GIUYIaVVOPOng1bVGvnfgcoJ6FTPBmiM/
	HUOjjAkrzHhhIBxfoxCzgINkfVwMN/f5onoQZDlas1FpnstclsxH8Vmv
X-Gm-Gg: AYBFou3E6SRs/tIFjbEj0cx3Az3Ang5b2sdD3tcXt6hMKdXnpNEp9jfIj6Ovock6UUY
	GuGpsdaRV/++bD4mfsZNsaB5QXCkBdLSKbdBYRVFDCFtnzdXTGVRUp/h+rMv3a71NtFOePkZ8vV
	RCX6UY1U00Z0F9z9b5gpuQ/9RHIB603k5CpVDDvmZ1wiCI1OA2eLvnFyu/wj+4yvf1j4WIvL8Rd
	3pGXkJEksNeplAuWuY9qs1DwOKA/zGZzwex1vqYV1A3gQAYwmP/xxHCR9eX5/9NqDdBIi5RhKMV
	bXY74Q/tVtfQRZXVdnQNKZVw7ZOEUxOSwQvzjKG6qn7cDT3JxoHi1s1AyrwlYjqiPTUenY6fOhq
	ByDMl+3LT4lHihLfrRvFiGVZeUMhyU3ZCJDSxuu5HzijGUdtEnveC6zvVTS1EVblH+AIeL42oRn
	0RByv4jY5VJXb3019GLujOaZSJzyAjgptRlEoSt1JuDjXzrPhbdoV6LY48K85DzI2pvtgowI21e
	OS57TC71z6HaaHajmDAC/25G0xhug46Pd3/Xv7o9/MW15jsrM8eSnxb93blIRwLt/A1G02EJ/wJ
	Rb1GH3kmv2w0H2/SxnIbMmCMAr0V3D93HFZUX9W2puH+B2N/1UMGID5+4mSJGnWMvCY+5xvbTs6
	4ftlsGZbV+FnGOQ2vA7Efr/WrgvtQgBIyVQa43/bWLHdgq3rPUbQ1Oa2tlEsEer1/Vt5NFfFGch
	K/
X-Received: by 2002:a05:6830:270b:b0:822:b35a:a2c3 with SMTP id 46e09a7af769-860f25eafa0mr3652101a34.3.1794434605465;
        Wed, 11 Nov 2026 14:03:25 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8615518d641sm236715a34.21.2026.11.11.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:03:24 -0800 (PST)
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
Subject: [PATCH v2] drm/exynos: gsc: allocate formats as a flexible array member
Date: Wed, 11 Nov 2026 14:03:08 -0800
Message-ID: <20261111220308.12684-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_140327_253860_D253E6BC 
X-CRM114-Status: GOOD (  14.68  )
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
referenced through the gsc_context. Make it a flexible array member at
the end of the context and allocate both in one go.

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex()
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 4a07deeb382b..303e94df632a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -99,7 +99,6 @@ struct gsc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -110,6 +109,7 @@ struct gsc_context {
 	int	id;
 	int	irq;
 	bool	rotation;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 /**
@@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev)
 	struct gsc_context *ctx;
 	int num_formats, ret, i, j;
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
+	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
+	ctx = devm_kzalloc_flex(dev, *ctx, formats, num_formats);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
+
 	driver_data = device_get_match_data(dev);
 	ctx->dev = dev;
 	ctx->num_clocks = driver_data->num_clocks;
 	ctx->clk_names = driver_data->clk_names;
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
-	formats = devm_kzalloc_objs(dev, *formats, num_formats);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	for (i = 0; i < ARRAY_SIZE(gsc_formats); i++) {
 		formats[i].fourcc = gsc_formats[i];
@@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
 		formats[j].num_limits = driver_data->num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* clock control */
 	for (i = 0; i < ctx->num_clocks; i++) {
 		ctx->clocks[i] = devm_clk_get(dev, ctx->clk_names[i]);
-- 
2.56.1


