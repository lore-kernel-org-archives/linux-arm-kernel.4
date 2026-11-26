Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F041606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=chqHPHqr;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=STbFTdMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=; b=chqHPHqrz6twvi
	mSe/r4GkAzfa8KdPM337L5BwuPif4VwwbGrpVB2gmlPyZ6BTMolg74uomXjwXDh4XpqIubpWmL4Ec
	ee2nQ3uPr6uKyAfrwAZdJYo3NreQXVoaDVgjujZJ0yihKsdQ0hNzWWJ9Owy+Dy54OJnMT7wvk8ZC7
	IgG7XOgpICUwG/u5IvXobPZSj7OHpBl4Uuip61RKJAOEx9qAanLo7bMqISQ5hT7evvbZH3kZR7UKE
	q8FtQS6g5OLcEaJ086DJf1X/3hW0a8nZpNz5ulWs6TJeQsdpL+LQG0TSaPR8Yxj4lfrKMuZ4on4u5
	uZQh8T7cBvo/02fQXvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvS-0000000CBaa-3m0n;
	Thu, 26 Nov 2026 06:25:46 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv8-0000000CBOL-0YPU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:29 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890733c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674325; x=1796279125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=STbFTdMgASb8Ai8A9R/1ILZQkY0kOOqJVZ9hZZUq94Q0mDqnT1Ui0+E3arSzeNdwfl
         aBsDc7QFOhu5UVfSWNaV2DEUThSH843w/AivT5DVNIuDSWT4XLaKOyZ73r9wjIKQXG7Z
         lZZIJyD3cZksFu/56ZgZ7F1aTlECM7B3iGR6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674325; x=1796279125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=F2hAuQMKLwcLFjGt3usA6UpsxjpNpzvE4kLvwmynV9WjtBRD38f9SDgUTi/MoOM10A
         Cu5XBHN6NUVF6igAnkCcpVmvd2ksajPduLms1ivNQgTF+YYg6QiV+qA7Ha5MSY9pzlUn
         bzKEnpxVsYZh7Bzqp8ksPQ9IM2ETOmHXh9Wx7/cjF8CEtpMHCTfu6++L/p6UmTp6KDn1
         43IMApMl8jZUETrK9c12HQ9Ou1qinEG5fkZTtUdCRuS5LNognuzP4zxzfSupKoZ4/ziq
         OXFD4OrADRDG9DNYpRyUPcvSxUxZWS58uJoITc05hsExIeuO/Av8H6NpaEOghZIW6mjd
         Sekg==
X-Forwarded-Encrypted: i=1; AL+hErEKuuLUhkv8i5kuQkERuOgAMIGs2iCBcL7yFwfammef6Vs7KcHMhuEFlP5F76eWEP7xTbRVkBzLsHzD4HX2LlHv@lists.infradead.org
X-Gm-Message-State: APuU4Z8Je0mpcMrgXcnVOph89pNtjOgAmzb12oCbX5zpOfSR3NUYET/d
	h3qbbhvl1iPNE2Fy9r9kcAz/6/uhpJ24cm6jVe1NwsHdie9fRQk3vjgt4v30wEV7mw==
X-Gm-Gg: AZFdTZet1ZooPrWZbF+4sp0yaygVOodtSvSg008lgj54tjwGeIT4t+xfA9pld3Jpjcy
	YUo4jtf5MJn0c+pMKzYjUStWogdstivQ4h5jcobFoZneB5+IRFi8BFeer/+9efuO1OmXy4PmwuX
	KXVeKNJH/alARO/vRF3j0QOIPpz16HM6oaN4ODm6BPO4WGmGLh2JXCO0vwB07iscUoBUcw4Wpod
	57pDq96gNlTp90TBT1EdDv5tUl2Xl70NjatZwf2FTbIQJkQDMKehCxdSdomrgkU7cXHR89RWQC8
	mK8j+WYoRXomqFC/y+q+EevyFSi3fkXl9T3W00vT5UwwKHx/u6Ra4zS65B/qR2+f8NpDN//V5+t
	OpQXP7MkDlr9SxeTN96jleiAfsXDSGE6m4j6H/eHq5WJXeNNf9jMv/3vkd45muP7oddH/zBSYZE
	QqirLsL/wm3e3bJ3gQoLciC/I7zcfrOtFC6g7yJvufdjXiPapEcxKvCH3/cGYIb48xCiZIuhCNc
	Mqo+l9iX1nMll0fae8q1UML2rF+4hAUK+98GUJJN0MQv0DoLYJPQOobhtAAIfyfhcITVpBlj/os
	Xj10uGoTkh8/NQg98zk0cqf1hwXKnc6u76ZtEd4EUZpeQfMgrgQ0QL1HrKb1koh5rHs2BhRHUJI
	T4zOgThWvP0OUAvmAKEOvSg==
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr17922707c88.29.1795674325489;
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:50 +0800
Subject: [PATCH 8/8] drm/mediatek: Expose GEM memory usage stats via fdinfo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-8-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222527_776175_B96970DD 
X-CRM114-Status: GOOD (  11.19  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set .show_fdinfo to drm_show_memory_stats() to report standard GEM
memory usage stats in /proc/<pid>/fdinfo/<fd> via DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..9d646740c468 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -607,6 +608,7 @@ static const struct drm_driver mtk_drm_driver = {
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &mtk_drm_fops,
+	.show_fdinfo = drm_show_memory_stats,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,

-- 
2.56.1.839.g22a8290db9-goog


