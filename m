Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XG9ApMmw;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A4wVIF3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=; b=XG9ApMmwHBSXhDzMdFQhVJ5ZF/
	wdUWs5aD70WrLob15MLtqLAdVuNucFtDliuIv3cl/i6jx8LbieWYOCcWTRldN6VwSCKTttVcgDVHI
	8IEh3BrxfkHw3PvqBuEl42XhzJ7yirPYoVvArJugf9hX8SdR0W9WhVc4OsZ6xN9vR+7ZIj03md1nZ
	B9oIQ8RjVF9LbC74dTJNadeSFfXmAMJ+XF6sBc2ox1bpAWVfxs/cFxpnbsP0HBuSxYML3qZHxReMA
	Tw+DCYRfQOf475U0Yg1L12snVzXOL5pRY7+up73/PsPaC0xHLU/m/IJxisx5p9VQJ/6Wx1fLSKIn7
	+iaqgRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSu7-0000000CAp3-2Nxz;
	Thu, 26 Nov 2026 06:24:23 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSu5-0000000CAnx-21th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:22 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5976190c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674260; x=1796279060; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=A4wVIF3OAsVDg+0pSpDz7028fIbBoKPy/hvqhh0Fvn8N60glc4pnux/iFWKo4qrtRu
         OCwhD7eqPBg4uhKieG8OC81cULIXsJdZM7SI8dEzS3v4bRAdNtx+PeqiAcLbksvvp2TX
         9njSr78HllpbgVzT/7pxS1nCXfjWyUnbz60pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674260; x=1796279060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=VyJeghDqEzDBigUd2EM/hZPY2dYxsEhLafaPplHUCYzRDagSH3tqXfOdK715f5qZXE
         OQOOGstv3vaTSgMx+ZOYCgE2AKKD3KZEj6bxuGiDmtUuOt1BmJBhf9I2Si4ju73sUmTR
         wNFjCrbTtmSz8ndO3xf1CEs9XeUffskkmLRT48pMP8JlFl28W5puTyJptl4afuajDr7z
         wjFOWQ7/MERK2jhbQraA+u4HYPMaWyUyxaoh4YJcJbrLV+VUolFVuNOFHKK4Jhq6UC9r
         53uaSH4nIoDtgD5fiiUl265Mu728mYzwcAot1M3mlg/9o55DrNwEp/jvVCQ7USFLFfKV
         Slgw==
X-Forwarded-Encrypted: i=1; AL+hErGjZhT9EELts6zck7KwdCnMUEUTNcKJ0I+b9ISOtjV7ag5/WZ8ZMyk2qBFepne32Y2Cnxn25hkdtNXemiy62+WJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+KZTewLNnRVTfM8RQoKv2DWyeOr4/tc1wu+sJgmgMDsUMHcZd6
	6iGcexSwCL0VfEHnh3+VNOhIpDCWybjLu/taavC5uSHwnTBL56vLkMi7FUjPcp8lOg==
X-Gm-Gg: AZFdTZd/kSMJO2nTXiXeu/HaqI++KHQXeWest3zz8t4qA1QNaQ/ELS3EVZm09c1ccoo
	uI8iMX0CvsTuQ93qVBVt7QT92sAFG19z7sEcMpFW7vz2dEzPyEBx5cX8Zf+v0+ZjOE4YsxSHRzL
	EmCQPdmm7NObeFxQ+JaEBbKxvs/mnS7Q8E53NALKJRonckznbgNejbhiL/EOXcVwVQzWwIRoyRu
	ltACWh8CPqRq/vAQppuNMNN/PdvF693MbZywOEn5+t1pSC2Mncpi6CSHopbuObuI08XcE225WyU
	4n+NjuqrBkzFvclywKtT025Pxrhe5j5S6MAyDidoJahwVE66m/7W9R4kyWecYw2qsta8VxwaJVP
	DRjg9nzHyxyl669M5n9sdcOUn/YEXJIyeJoFBQRwtFXI2u7D/qNX+tSBJmo1pFMbVZu+VOzswSh
	hqKwghGzRbSxMw2ADmSjtq/MfVMffGceUD4MEL0J7ttF7FrX0hekOg7+IhpY7AdBgHdgZzv7eym
	iamZgCx8qy3nhsttPd4w5PkarSJXrFrNj6vkawEFhGToN9VqxtPo79rfC3/3PMcNdXUP9dzXFsO
	1Q/jxAADB36zb+XJ8Er6J+/5OMnQrh5g00Q2fTfE7uqPhI1RRntuhTvPTDeOKXjy16WOJjGOROM
	u24aebpaBwz/P4aWpz8Bozw==
X-Received: by 2002:a05:7022:b902:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b556877a2bmr18501590c88.9.1795674259793;
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Subject: [PATCH 0/8] drm: Attach drm_show_fdinfo() in default fops helpers
Date: Thu, 26 Nov 2026 14:23:42 +0800
Message-Id: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/QB2sC/yXMwQqDMAyA4VeRnBdYgzjxVWSH2SYzA1tptimI7
 27djt/h/zcwzsoGXbVB5q+apljgLhX48RGfjBqKga7UOEc1hjyhpNnQxrSgBI2SsGmlvnlyLUm
 Aks6ZRdfftr//bZ/hxf59vmDfDwYnpUF4AAAA
X-Change-ID: 20261124-drm-fops-show-fdinfo-68f47c2182fd
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
X-CRM114-CacheID: sfid-20261125_222421_560608_F3E84FAE 
X-CRM114-Status: UNSURE (   8.94  )
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

DRM core's default DEFINE_DRM_*_FOPS() helpers currently don't expose
fdinfo, so any DRM driver that wants standard GEM memory stats or client
names must declare custom fops to attach drm_show_fdinfo().

This series consolidates that into the default fops helpers and migrates
existing drivers for consistency and simplicity.

- Patch 1: Guard drm_show_fdinfo() for !CONFIG_PROC_FS builds.
- Patch 2: Wire drm_show_fdinfo() into the default GEM, GEM-DMA, and
           accel fops helpers.
- Patch 3-7: Convert existing drivers to the default helpers.
- Patch 8: Enable GEM memory usage fdinfo in drm/mediatek.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Fei Shao (8):
      drm/file: Define drm_show_fdinfo as NULL when CONFIG_PROC_FS is disabled
      drm: Wire drm_show_fdinfo() into default fops helpers
      drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
      drm/msm: Use DEFINE_DRM_GEM_FOPS()
      drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
      drm/v3d: Use DEFINE_DRM_GEM_FOPS()
      accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
      drm/mediatek: Expose GEM memory usage stats via fdinfo

 drivers/accel/ivpu/ivpu_drv.c           | 8 +-------
 drivers/gpu/drm/drm_file.c              | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 6 +-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 6 +-----
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 drivers/gpu/drm/v3d/v3d_drv.c           | 6 +-----
 include/drm/drm_accel.h                 | 1 +
 include/drm/drm_file.h                  | 4 ++++
 include/drm/drm_gem.h                   | 2 ++
 include/drm/drm_gem_dma_helper.h        | 1 +
 11 files changed, 17 insertions(+), 27 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261124-drm-fops-show-fdinfo-68f47c2182fd


