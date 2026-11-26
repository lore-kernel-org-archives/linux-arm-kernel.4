Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7791606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BfkZG0rX;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eH/6iqG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=; b=BfkZG0rXJWaqEe
	s7nErChg9vJPP3m6XwX7gWkw3+qosmv6T9LfoUjvW5LlyX4TsFqXlrlony5pm/7NFgfSwiFp4/4V+
	8Ht6JEnrfwpaxLNhuWfxe64266F0kJlfvW4euib6y5N6/2ZGVn4HHoWSGczoGG5BZL4/JlHH1nevc
	cHfYNfke5vd297tzbKKGNfe3eWrBGRezR/tCclEiWb3NxuQDoZCTd9i7FaSBq9KFtMitCTzpkChWN
	HTTUHCifuam0q+HcUJrq+lMZGf4HTkHMoSO5n7eGYNP/fJ53SLx41/aXhlFnw179u2kEs/TNY/+qU
	db+1VuN0/9JUFwzcH0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv1-0000000CBJG-2nTA;
	Thu, 26 Nov 2026 06:25:19 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSub-0000000CB4P-1OHv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:55 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890165c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674292; x=1796279092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=eH/6iqG27nNX/lMiqRJgtpabMRnKd9mcsUEBySIkQqtC36pRg3QXjx23pyE2j6B6OI
         pOMiAEw/WSQb6Yb2YE20/FES76fCfWZCkjwcqvxMsjpy/XK5ejlyt9HE8Bm2E3rO1UBE
         rQPRefOAE7sWMCY88if5RaXmUb1n4UcFfi7Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674292; x=1796279092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=L0H6jqkF91a2G8/tFNCmpniDdDtIijAo00ymJ5D7Ifpqilh8jTJA6PXdL7p/t8RBSn
         XeKDd7sxaxH2s4r39TFoHcsq7bcTZ8EVpX/oGyHvaMhPVz7fR52EVf33V4Q0ie1/aN2K
         2/LjSfbutBi7gOVF1oMn4aBUxoHS7BAAemwJnO1L5eOEyc8tVE7CjUjn918HfkPXfy5k
         7wzv60vKMMrrOp3DyyrShAWUq4xQ8gUkD9ctwccXpiYW6xVFooZ1Nf4c/oCKBD6Et09C
         grWmBpaJrTD2aConbVPVHzqCuejBA31e8dUXUSEMXzTLALTet2iiXjc1NmFNemH0sa8U
         ZlkQ==
X-Forwarded-Encrypted: i=1; AL+hErHZg+HApQ6987rKh1I/gNDevETR8YkagPitftzlaHiatEP1GkX8NSCiaMiC35GGU6GFXEcyqM8yfpTs09yDXTrO@lists.infradead.org
X-Gm-Message-State: APuU4Z9+HYzMaGvK3L8JyRJZnpVtlcOSrY7d0to8j2gAqS/CaYVAtAes
	smoO5tyhP+GL+p5uz+YaVbIjBpm+cFv83OrMHolyKPWkzVT9fzY/zoehKoBWU+/+Fw==
X-Gm-Gg: AZFdTZeZMzjGa3Hp0LKkM9xjXnrOvo8300M6FQlKeIk31YADizaQd/CxlPYewg90UQ4
	26OGoqcQE8amm2viPppRFG7zFoE+AaKMm0ki5E9tP6U3DDxaFMXWPOP/gNUBxDRcsZ9zVkWTNBW
	CO5Ox4JZStaMpBPkhzLI19Jm+//0pPShAYBxLq2MGCIilL5JZeQ0JeaLPSbwBSeICDHAg7ojcsc
	9d8DPk5bIucm32TW3XlxRgtvIt2UaQvKoXgzH2tJHuBSOTKJegJfY1EDu7lXaONvUqqIS/V0AXc
	roydcmeXYDw1HJNykM35tzFsdmW2qrokDFbUJeYCso5rlydpjfzog3AegaHP9/PePhlhYTBwfg2
	7wC4XEZzqXHs2Hqi65PFXkGm7C6y3yg0P/Hkw/t8gyrNKQZApu1duNLMSw08OiEmWjq/Vs37hfO
	sykt0EQQZFMQA1oXzqvzNyWNYplEdzmQCxpeYYwwCEiYpvxwAZPky2Tbf1X/cVig7EyYyuznXEJ
	rmlnXaR2w7/+LHG1WPiP5hTGOYrcyJNVwZiig/YYYj92SMRzbHtKQh5OaTCTsQbkFcTYT6bPj1r
	2t2Mfy5gOIrkokwCU+iTp0ukcXJ4KqrU6wCyqPoUYbBwgnPnoE74HIFIUgyi2o3glM/0YK5aAkl
	ctVqdGjiMykLMeQNvXFrSAw==
X-Received: by 2002:a05:7022:28b:20b0:1ac:f84d:4036 with SMTP id a92af1059eb24-1b55686f9bamr17794762c88.9.1795674292446;
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:46 +0800
Subject: [PATCH 4/8] drm/msm: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-4-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222453_921935_FAF3F9B3 
X-CRM114-Status: GOOD (  11.21  )
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

DEFINE_DRM_GEM_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default. Migrate the driver to use DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..06d997a7a237 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -898,11 +898,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 #define DRIVER_FEATURES_GPU ( \
 		DRIVER_GEM | \

-- 
2.56.1.839.g22a8290db9-goog


