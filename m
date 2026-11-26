Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEC606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RJ7r16bd;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P9ShnWq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=; b=RJ7r16bdemuDz9
	Hl1DB35ml/4CeeAVLbqZLjPecXhN320ASY/biw4Y9FMK4j45lpZWSqeVaiPXWbccRqlDoE2bKw7DZ
	+xu/hAzsLwEk+rNgSgS1PIJ3eO1rbfjeoalVNQ8/k5OCywGiBHtb/4LpxjTys3DkzUmTHYOotSXNI
	JdrnnvnXIXUOm4E1pT+EO3QpKYMq2ExlQSux8xrqbzi/tinqTg5Eg31NO2GFt2uCLO2DPeC4dHymD
	6g0e21anqHz0NBDb7HukEuliplLnXjVaOcvsT2qC5vGrMnxwXJEdMggxNMdgcBC8yPUOS0LcRFf1V
	jiHPjCHPCpQJH5+2kpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuT-0000000CAyU-3e6j;
	Thu, 26 Nov 2026 06:24:45 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuK-0000000CAuJ-42Dd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:38 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5039752c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674276; x=1796279076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=P9ShnWq0bQd/KEir1StgDNH1tRAF+3V4oixYdLWeUyHSJdHTLtEWcmbJ0e0G1ZiwxH
         Qf870k+SUwn3Tu8uZx+N+FSUDOh3l1ZBTOdezVlDZHSCo9bwtf/cb383kepzQJj14i1s
         I29nsydi1i/VSGr1Ij2G7OAlTEa12gGdNb1W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674276; x=1796279076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=xlwWomyo6Ue5yFmNdJnUY1rUi3AoggP7NmIHRlel/fGvDf0mq1URujmBG2NaidXT4s
         N0VBdCoMUpohsQUEJNR80cLJUfAeU85TI4iYhZru/b4czxUZETRbSiMy7YPIr2WFJqnW
         hXEVjjIHENfi/l/A8JxfCxkdKRKwne/eAyc0oOcDmgitOfnF5NRUssc/5aiyiKdXFEqU
         kU4UkcdM9VQheMu3WeClKQLt9lhWFHlKxgMgqacnqpuLKBMtdsrdRkJR/cJ+D26dEgZI
         gn+53U/KWiyxhYqsvQNcFWBnqUsmN0+jjKhKPZs1OcnglxPrVipF3+7lnambV/hrNK0s
         0yeg==
X-Forwarded-Encrypted: i=1; AL+hErEnL8oU5mmiuMeMFAmMTYLT5vUThYHbfv1hMKoFOvIobVzBeNCiFfAR8GfxNBr5ZpGnrxcwFyS3xpQqZUmhz8rK@lists.infradead.org
X-Gm-Message-State: APuU4Z8BUxgMVXOjrLjBcEhG3GBBqMJOVgYjwsJo1ac880juafEyE3eQ
	+o5Q5vXw2kA+Goo6SdSfwoVcatsmENyBxIXP83UUpcpHVtWPpYZRigd1GV2tePlxpA==
X-Gm-Gg: AZFdTZds7otMtDXgtElvGy6GwJBVdJXi20yKdT1H6MFL68Z5iDmAJ9QBYdR2drqAh8+
	BeWEvpZlz6WEvFqVWo6egQuSdSaOskBWoOCY5aOoVJvRpbrDm2KlXXXqkQhsdSzQdPPpsMIG+Sj
	ZjzAIufoBuAxrUMpR7Lf2ylWWvCk2o41GFNOIQV1IVBZz/pKmKjRRIEhk3JaJ7JC0bfCn5S2rEU
	WZZFsXEe0hv3CBGYvxxHXTJhhDBxGHk0WkxD30Y/ZjhKiOf/ckkX4C+qdPp8oXkQWLWRRYE6jhs
	Ac6vZK23pUur6GX6vUJizuKJjlRf/9C9zQoGCjmbntQs8JqyUWXj0eTsdLXTjMAF69oy2GbFHKz
	DfmyLnr6HoV3G93gkEY7MnWSaTZtJsTgV4spP3qBdnH6aCszadTSTszqf7f+QfJzgprh+Vm4h6b
	8EKvo36x4WAeRJRqS2eulmq0TBCWRRqpwBti5Y95dakwBoCsIXLNPJ4NBVcjnqVmLzTwPAXRE8L
	QRMIH2hJjP+SD2c8tuYtl/eue0xC2LFznlx2oHw9Zp7geWDKK57Eupq0EpeygPQJBBoRIJGZUb1
	kXwPT3c+/a4H5IU+/oN1TDKcXX5l10Kufulu2122CJvHn606oyt+mc5n2jDU+0sT1AIbbNF/tFM
	fFGHBvD/6wttNr+taQtowjA==
X-Received: by 2002:a05:701b:4585:10b0:1b5:8f22:9803 with SMTP id a92af1059eb24-1b58f229b6bmr2042435c88.1.1795674276127;
        Wed, 25 Nov 2026 22:24:36 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:35 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:44 +0800
Subject: [PATCH 2/8] drm: Wire drm_show_fdinfo() into default fops helpers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-2-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222437_211006_14018CBA 
X-CRM114-Status: GOOD (  12.64  )
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

Wire drm_show_fdinfo() into DEFINE_DRM_*_FOPS() in the DRM headers, so
drivers using the default fops helpers support showing standard fdinfo
out of the box.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 include/drm/drm_accel.h          | 1 +
 include/drm/drm_gem.h            | 2 ++
 include/drm/drm_gem_dma_helper.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 20a665ec6f16..1f3088002e52 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -48,6 +48,7 @@
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_ACCEL_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 56dd15921c7a..d0c30bf23e58 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -43,6 +43,7 @@
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #include <drm/drm_device.h>
 #endif
+#include <drm/drm_file.h>
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
@@ -501,6 +502,7 @@ struct drm_gem_object {
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_GEM_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..3fc22b426070 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -267,6 +267,7 @@ unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.show_fdinfo	= drm_show_fdinfo,\
 		.fop_flags = FOP_UNSIGNED_OFFSET, \
 		DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
 	}

-- 
2.56.1.839.g22a8290db9-goog


