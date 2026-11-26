Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95310606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nFUra/s0;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=al0wZWTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=; b=nFUra/s04GrUI8
	VhI6H4s40e1OIdZq0xOHKhKLFcnI/gt1jVnZYu7yK5V62rQYpZwmPBOnqrbrAnflgGL1vXi5GR32R
	umfWxeU2kNTVRz7U1LL7TaJEzLs8eoyxOoKb8VwclPuYW6tLKtQR7ghEiDBY1m6ubd7vd+mkkJrtd
	ZtN+deLRStDqnssy0qgLXNn4y2Ue1EJDWxFqZac3H4dXUvVAS1ift3wdWDDOgLVkDjVa/3L/pRphq
	iUvRTCS5Ob72fIwhLi6ZGRxGC6/16hLo1GjitkXeNJUjN06kHfFslbCKHmKZv5AUMu3gjavRAvHgR
	3A34RHaSWOrzc3rOpRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvS-0000000CBaE-3BBW;
	Thu, 26 Nov 2026 06:25:46 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv0-0000000CBGP-0A3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:21 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1b589050416so1012642c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674317; x=1796279117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=al0wZWTRJCjBBm2ZOljQeFEPIawGgGwEIOUTUyxuut7CSup939KfuRITNl7OGBJ5zE
         Dn+hqsRGy4LD7BzKXeJ/bwYMTrSdyYCbwlnVBzc3/XUQenU5YDTlovHqgIKGqF1llYNm
         ilYfgXPqYK/hiRbXF3oKeqE/AsJOZVR0prg9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674317; x=1796279117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=NM0yBtn7xL6CPOjq0tygM/R5hS+81WNXQykkckxLiWsjQ2IuBB329QfK1H2nkP2HGO
         Q+z0RWcDCGPc5zULCbm/xeQ/t3mzkJQNP0fRXhr7+FIh+MG5NBIMNdAtsaMqivmksowg
         TjRf7kbp9LFIkoctBSQTKpjiIh6QsjE/jZ9ETnz1ItElO0AI26DsEbcJJp4TpeoPTtlz
         tawmkt+5VNQYGbONWNnEEBuOAP4pDwrX9BNjZRYtUSFpOqIwj/NnRHhUsUQ08/X92Qgs
         qEGEymZkcHQ9BZoMeEx+TorYOGrm4ZsqtvmnNrDLvun48CORoI8+jVs7zefH4Wgskk/7
         dvIw==
X-Forwarded-Encrypted: i=1; AL+hErHlp0RJQmMd0zf/9adNIodaQltZccQjcA8hdLY870EnP8vv68fh4Q+gEREjmMzeDQDFlunXRUl9PSsoqnlHre0W@lists.infradead.org
X-Gm-Message-State: APuU4Z9Iel95CspZEvgi958GqNlc6LeR4KfE/MdJK42HsQ9BtG7GKFR/
	g9uF8wkAaK+yzFkM82YkhrnWeytnMFXj1B6K0sp4Ocm7dQStQe/OyikkTVlMsAZ6cQ==
X-Gm-Gg: AZFdTZdkfb1Uk9QRaHHHDYWc+/hSAm9KBviO7yDEOguFZWoDy/gJI7vGfB2Z/0bupo6
	y5ttiMrmjp/NJ549nJyGtjTfKsT9Wy/VP5hX9ILXF1od8PMvFptrDgUgD0cAaZqMAOYXOCcThtI
	RLDJOn8jCqTpDQSdASHBjSMrXiRXe2h+/AIMC5vS7jJt5fEaw/Ud5CSFjPWSGDdHQ9NqilHCN3w
	l3c1vJTqtMJIvdL6KBO9s8S1tZgb2OyEGJtVyM4sBhSveAEEtkFEuFQdo03N2jM4rPzz1YUiTkv
	xXsTJr+0rgv+V/HLTYFLs1SfVWEP9LYeTjqHvtnDyANNcvPDloPKWwC4QWSJMBnxegp3DB/fxmm
	wxsmZy8HXfNzofFwiL9x7dGivpTZxWBPew4VbNj2XroIf3EoORD6pb7q3CmN4XJ2JVdBd/Qx96l
	XEHtVAkpPf0Tt/YcRvMLl9DVQHVKMIku5IbSelHAjqTdXLTPRczTa2gy6o/Z8qBH8xJsJ+n+lHj
	jd4XJYlf7QvgpRo4C1yAVhs4z3a7de4WRmkV8C9xEw8Ep29C7uE5KH4VDPOgfRq/VmfD1+Z2MFb
	h0dk1Nx7sGRxXOjmSq/bdy1ewa/bnrqRUcY7Ok+wkIEFbc8oIF6d0+lyS+dttpJ31rMvdaknKoC
	V9WguXUnP+XvWNXrG5sD2XQ==
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr20072859c88.34.1795674317094;
        Wed, 25 Nov 2026 22:25:17 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:16 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:49 +0800
Subject: [PATCH 7/8] accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-7-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222518_542015_76EE5B89 
X-CRM114-Status: GOOD (  10.58  )
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

DEFINE_DRM_ACCEL_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default (evaluating to NULL when CONFIG_PROC_FS is disabled). Migrate
the driver to use DEFINE_DRM_ACCEL_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 28cb18dcfa9b..933edc272f05 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -609,13 +609,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 	return ret;
 }
 
-static const struct file_operations ivpu_fops = {
-	.owner = THIS_MODULE,
-	DRM_ACCEL_FOPS,
-#ifdef CONFIG_PROC_FS
-	.show_fdinfo = drm_show_fdinfo,
-#endif
-};
+DEFINE_DRM_ACCEL_FOPS(ivpu_fops);
 
 static int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
 				       u32 handle, u32 flags, int *prime_fd)

-- 
2.56.1.839.g22a8290db9-goog


