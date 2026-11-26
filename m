Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OFwkIQ85;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DZqO8ojU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=; b=OFwkIQ85Zcvq7r
	jwRajt2jTfAejcei4yWWq7Euva3gYy13evX3gG87Q5ynzLIDrTjL4w1Yvb+jhbOV6gUIUnT6QiqOA
	ohJNQ73hzMWg2pfmoHODNM7uXlwT1DOAldE4DQTT/hwX31MBCSioGnTFd97GkXvv6RSZnx/toDVRO
	ogr0kDFV88eEPdD1kN6cHHYfxUgQiVYSeYcE1A+UniMIHPVbnRS4ud2PZZ6SK6CnWdmyY92QK2xU0
	yHsHwRAZ75vaq/wAr+M1XUOsZ47jqu1D+t69LVp1W7jKvNZatlWvS/6omanLh2Zp2aUDGC3ev/ATy
	csPCl5hmgkKTa6qVueNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuH-0000000CAt7-3BDR;
	Thu, 26 Nov 2026 06:24:33 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuC-0000000CAr5-35pM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:30 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4854841c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674268; x=1796279068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=DZqO8ojU6WBZh88gd6ic7J56CIykRTrG0794JAcIXrlary/j6z+U77lhPleFspwMKk
         Mx02WmYsWWWLLacUZRoKNYuTqqDA+te75XgaziiGBcI7V4aaw3IkxNcpYJwlRsKthLQO
         UX6HXCJrnls8GnthW6+GnerBN9+hx2cuKEtMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674268; x=1796279068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=opcE479pEyueBtwyn4ZGBVPkzwqzK8EuVRoUQ7YgBo0/l2Jb50qoxjGog8lSZnzcWr
         rykwufubF6l1p9u1EPVlfqmjBA4Yu68LUwaCGPceJINOD982S6H2lzndUebUwx2UHADg
         o7LVaIfD/3KalCfH8vncHeAFGgrEVPPRzSMFxBRfstisDMr40AAJVwdFfSLrS4KRudUo
         33mlfe++PVQA4CH45YpCh/6NGF2iRdyis3h9DTE0QrYL76wiCgIj/ClgZpL8Jxc+DKkY
         kaonzvy0iArUGMPxVqV7noYHCzPlsbRiRSuMIqdfH9ZQWsPP2reFHsW4XCb68QzpMnR3
         ZP4w==
X-Forwarded-Encrypted: i=1; AL+hErGEZ0n/YWiIQImC8dS8f92zt0DBYZlc5vqMDiSNxVOyPaZ1wasRaJ/BGGqAp4wiOvb6rhqMWHH5CPsnu3BhtIHn@lists.infradead.org
X-Gm-Message-State: APuU4Z+0EBp4+99lhX4WWesS5OKTHbu/zUNFrzwlJZJmNv6bzaF1eGOP
	aziDyyNEowfeAhKpTD8S+/DRlqBlSp6OCbmNqMFi2bVJEuwFdxHHOdbZ01bArYjR8Q==
X-Gm-Gg: AZFdTZdu99CkPXRtL7SaHMBViDRie9cyK9mILyef2avrJOnnnAcRvHOmeg/yL9kd9eZ
	iqpIVvxRW0iKLqmtTgz0vTYpJKYtfQKH8BNml97+9UNMMLqz+gCMKNHyUAR+LpVJuhA91gQJV6m
	qw8xyuxgCl/9t0Ob0pxPhOu1exiOwbccZAdU66J3e4z7fii0Rz40A7bv3yJnZYsE0hi6jdqntwD
	Yt0Lh0kbvNU2uue9a+QdVKZZ4MVvIMtgzAsQGESqN5jagvdrAUTzHqmMaSCV41d2yHnH3/nZqfL
	VbmqMttgiTDOpbr16W7O17VFtRXgQZ9qmis0fVHY0qXd0D31tSphgcxH3wcChu+sRz7SHD9UklF
	vsbEsLvWQ5qogWG6pepIY3Hn1YDF8ceY13XJfmko3qoGg0HGzydGH1n8O3IGgiy8Iw0yyqY6Q9O
	9Aox2xiuv2NcFbLJJN1xx0sls2UOJ+xzBxumeqfsmVPTaA0MgLmjHL3rLTyUX1HOh2Un5VpEPll
	xncF1JV4ySs1Dc7ifdzBvzSunML2Xs63iBoq4sxx2aLwOLqtrVnTci+37iuqN/o9YSVMy0p8kO6
	sUVZpcMDGP7Rc5YAvDUWwzyPEIcwdYPxUh1lJFg2y1Ov68G95lO3xQiY2OesM1cTY/bPSsdBkSS
	sXi/RNujJErcCPT0W+keBNg==
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr19652296c88.4.1795674267942;
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:43 +0800
Subject: [PATCH 1/8] drm/file: Define drm_show_fdinfo as NULL when
 CONFIG_PROC_FS is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-1-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222428_797953_2636583F 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Define drm_show_fdinfo() as NULL when CONFIG_PROC_FS is disabled
(matching drm_compat_ioctl() and drm_gem_get_unmapped_area()) and guard
its definition. This prepares for simplifying .show_fdinfo assignment in
the DEFINE_DRM_*_FOPS() helpers.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/drm_file.c | 2 ++
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..bcc1b47616c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -961,6 +961,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
+#ifdef CONFIG_PROC_FS
 /**
  * drm_show_fdinfo - helper for drm file fops
  * @m: output stream
@@ -1003,6 +1004,7 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
+#endif
 
 /**
  * drm_file_err - log process name, pid and client_name associated with a drm_file
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..6fc3d7060f30 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -525,7 +525,11 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    const char *region);
 
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+#ifdef CONFIG_PROC_FS
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
+#else
+#define drm_show_fdinfo NULL
+#endif
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 

-- 
2.56.1.839.g22a8290db9-goog


