Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8FC606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ba6vUfrd;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MkbLs/QI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=; b=ba6vUfrdrU/7RFxfdurdH78XC/
	xabKxzAL11ccaKGcAEbmQY/U2BmbtVat1wXopge3YXZ5gSk8O99Og+FiZwEKmkY7NoavUcDy9NJ2Y
	XI8p8tiGZKcWPp8a1OPy0W1F8s1RgrXwN13Sc3+jaFumI4yMyBWcrOrZPZ1qrWH6RIXc4qIB29B1N
	zvPGq0e9pb912yXwPcrB8VbLdQfmKjgG47vHBL7dDrzsjMvFgTe8zHVXvw2EL0utTzuHGMBEzLg4D
	hvM2D5KzoFJPpPWDHDxUOHAOLy1W15K58jdSP0/Y3ayF3DIR3Xi9d8QyKDuEh+KzfkItEvKSnOjMZ
	jUZO84pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOV1-00000002SQf-0P7E;
	Mon, 23 Nov 2026 07:30:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOUv-00000002SPh-3RbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:29:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f02ee04378so23534635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418997; x=1796023797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=MkbLs/QIEcccCNM91R1pPbfDUUXbEb6nlzxrp8Jc3Dn5x6n+oeVyq+ee5itcjGpw4q
         UTtP2wkSZAZVAWjkKGUKhuHVeCc9QmOIsxsbn3xIdRW+VV03h+qM4IlghUkNkDdCobej
         y15y0kAij0Q9VgNo58jUgy2wwfUtDZlCia1PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418997; x=1796023797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=brMrSV8VQ+kq7532dgfFjCFNQyrsYrKDzILUkIAxkR7oKrQ5JI3W30XrC9hWgaWBgO
         b9bVeF29IcWAqW4A5xGQOlqt/Iwc+lxbGrNd5LaIfEe20PEAvlU37SGBkOZ+Tn8A+t2z
         1UCb2XGkkTh/wDLNncdkDgM0CaDkzGOSi00K4r4gb+hniYfgU5JQGN63KBkNns8Wh2fR
         NTQPa1staPw419hdJV7UNK4WfVcl+31l6zNEUXmsKRSeY2PwcPG/5LchX92vBkSDbJST
         Za96sJqna3c4ynLb6DIFuR/v2r26rKos6KeDLI00Gnnmt8p4h83bv2WOfO7vCVg/aSiA
         0h7Q==
X-Forwarded-Encrypted: i=1; AL+hErGZCr3CS39Z1oHzzy0gfaGpH2/xANrKXdZ6XaxavvnBZC7Ym1DAv1Fq8Pu3g11QipKo65PPZ5cohgxy2AIda7tR@lists.infradead.org
X-Gm-Message-State: APuU4Z9CtFoeju/g8uUVcRw4MQ+PYsTt7al7GI21L1ZtbJeCjulRp8DJ
	YZMA7m38f2HXMu1CIUuWqYvymq8q1sIY2OL/G/3MIaCMtkUH8krQFEE3f0r1LaC2mTvU0nd4uqc
	TiUIEfQ==
X-Gm-Gg: AZFdTZc16miArMVPO6J13WA0dUKcgiOzCwWTuHdqYAgZ8ZWB+eAxogVhrBl2vyVX0jx
	w107/cF/JkY2NNHpH0bROTmrCV4E3w2KGxE6snfeaxNNCY3dTVAEwItyvRmTUVpk42Hlf13nz1g
	ATqbAfIgmhv4z4Q7xWmnXrHPay95TzU7UJnHqI5EqC8QgwfzapcnQM+4E9Sq/fBltGQu9Bjnnl8
	45OZ1maTkgmVvLA3/f99GzAzI1dioTIacJ39JWGKmgfED5CjRJQm2xgtDNxBtVggxjlSiEeZvbg
	1qMJatz98K7wD6p7qb3mYDLtLVWjwQiNqsZmNI3Y9CnV9RlQP/0ogvyWJ/pOSVDEHj2UtUWAxeL
	MhymkYXQb7rl0DtJu8ynNnUFm7P+w1pYaQQisGO7tIPcAM3VMqJ29KNwtOiHTGkm+/5kWYw1e7n
	/XA1icQpTdUYIAUuYZnix5aj0WjcQ0ngGcqXUZ7qaEkCDcRfqrkM073Y9jsw8SxfP73DMbIFARJ
	DPnS/0XAoR0cMu5p/cN3RVw/S3VqGVkamzwuxv2NUnFZt3PVVEjuUxb2N3OrR+Dt0BOeWtTWcxM
	DDQIThuHfpdnA9tjaPDvmCwFyorGT+gY6htyeg50dPKqFRUCiNNr0Z3OwWeRag==
X-Received: by 2002:a17:90b:4b:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b41c9ba0e4mr9010636a91.64.1795418996993;
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41adcafe0sm17780221a91.16.2026.11.22.23.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH RESEND] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
Date: Mon, 23 Nov 2026 15:29:50 +0800
Message-ID: <20261123072951.2239442-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_232957_859727_C70BD221 
X-CRM114-Status: GOOD (  11.79  )
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

The recent size_t format string fix for exynos DRM driver left the "0x"
prefix in front of "%pad" format around. Since the pointer format output
already provides "0x" prefix, this ends up adding an extra prefix.

Drop the redundant "0x" prefix".

Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 0208c9259572..acb8def747de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
 			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
-- 
2.56.1.831.g720f3f5937-goog


