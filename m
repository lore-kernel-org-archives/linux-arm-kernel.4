Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E895606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZJvl7h7y;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ioW90EkY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=; b=ZJvl7h7yiuMS10
	wl5V6IfgBjj93j8wtQU7A9S3WmZ5HdQvUSBAZmF32kicOPWBiL6xWzfaZS0EEt1WJMwiI7gDkrdi8
	ZXsx9+L1cYlsgGMuOz0kzW6odlTZKpx4kUTJ0YwY8Ub4vNAfrCQ2gTkoYBZ/2U0xRSfgVMGyMDb5j
	VzP8fmVRstpU3l97T3Xkm8c5Biqnt2kbZtJFBSjuZEyZ4TezAoeR4PYLqVOVb0mTokFG+CSnqhDTF
	j2PacT8bcvr8xe+sjwfvysCqgjHFy3Uo4MDHlRRlxBJtZw5U7j9KXNaH7/zraJSEbtQ9iRYHgaTHl
	dP90a7ZlfVeYR2toGs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv1-0000000CBJU-3rlW;
	Thu, 26 Nov 2026 06:25:19 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuj-0000000CB9m-1zAL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:04 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3477929c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674301; x=1796279101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=ioW90EkYK52qsA1a8e5QE6AV1ImFFlalu4pGFZoGzUhqXT0g+ITwbeepgQmsFdgYlO
         FSWVApBWzLExmAPSv95Zucnu2uWEsxVqZHnRMp87Kp395Ieko+9B2lW+ubJsVmfZ9xjH
         h1L9lN2XEhP5eS2CI3o0TQzDkF25eAksUvsMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674301; x=1796279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=MA5sXpCaxtcBB0+xHfWBqfvjoWDV4TyWm8rOHnGu40JhuLSslpBjmCUPIkFioN5XAI
         lIfaAyFh42Hhp6CSSuT2DbzetCV3UzRTAYw5fyWQ3MZf+5ZE8WT7+DIHi4a/+ndvr7+m
         YYzGbN1Nzpdls3DGgH2trtGVNrJicVIWjoBjhYB7e02Kp0CQqGFhyI34j3lQJr0dI7fg
         bvgzAvsluNPnpeZjZWir7kA7+YmExvevFy3JgnrHWZFMy/GmEMxZFMRqwFkzorx7Kxtg
         e1hAtuu2vjTf6EMVneoWpZTvnTJzCig40Klgy09z66vFcLtLUsGLl2kWUAL0jc8JcCk7
         0/5Q==
X-Forwarded-Encrypted: i=1; AL+hErFyVgXBgGK8nqtZijWcTLhEut64Zi3DrpggmPzFV/FQe0lxTo6NqK/j0lm0j6xtHmVtFcmF9uCieRxDVtcMGzfW@lists.infradead.org
X-Gm-Message-State: APuU4Z8JsiHiTj4Dg5TYKBAat/rMzL/+Tocs0Wjowu45UYILIGvmXUGD
	ZZPcxgXw5IWGzcXQEPKiEZGCUIhBm3FJ7T1K5vteYibNSk2qX3ev06G9bQ44LSM/5w==
X-Gm-Gg: AZFdTZdQKtR/6AQvJvMim0RySDaMf3oyih55F/l+iI5LpKl4GbdxwIND8LnkHpksf1v
	wZq9I9MfVk56edAvccOUVDyHnktfH2j3/Y0PLpbeCj+aA+5eLzbAMOH3asbIQNQfdec1RmQ+UYk
	st87YCImkKnlZgceFt2acecjclPB5YDZUtVH+ImzyEE4IOvfB1leQqj7fZtEtbQj2RSlvCel2uM
	Bld9/lnDV+k2mIMlWy5U87Luonq+TVsz4qebCFJcQY4BNsGAwvhYn8lB9nNdDLWw2vnelEECTD+
	EYknpL6FNMxB6xZMNGMMn6NaH8pqdpbnPynwe13ilZRoR3MCd6bbtOrWlwWdR5qHLSK2IY2liWS
	n3CgIrpkCIMxuIrobIBZG2dlDONpGO+rj8TjzcGQPE5tZaiua54bdYitBGOJHUhVsUE2vvXA/B8
	zjimR4NDfTbnQnPeAQO7xEgg2mgWoPYgZUr2uuVNX7IchK28inqf/M2k9SbC2EIw5Jx06dv/rtY
	Esx3X2aJ1UkYn0VrJPYh1Hhdhv8YTmCeLEQWZzoe2zUtygoPaUkT4/ohCEWwswB0NlRnwb7wXWX
	5EZBwEozZj+eYKFNnT0a2xi7QrJ8NBNqURHrHxfauXVsPvhfYXK9lOpFWDRIzG6IZjQRv8DMR9C
	wpLy6c8TtJovh2+6VMIAhjw==
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b55249484cmr20664343c88.7.1795674300778;
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:47 +0800
Subject: [PATCH 5/8] drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-5-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222501_604305_BE9BB80B 
X-CRM114-Status: GOOD (  11.24  )
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eeda113037fe..205838513379 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,11 +789,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations panfrost_drm_driver_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
 
 /*
  * Panfrost driver version:

-- 
2.56.1.839.g22a8290db9-goog


