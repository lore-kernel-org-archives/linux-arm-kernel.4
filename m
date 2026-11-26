Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9B7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WVGSe5dY;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECcTmIJN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=; b=WVGSe5dYxFkKyh
	5xMt+yH9C1r6CjMt+g8ZtdunXPv2xIIbT+zsCDjFbsrJobPeAw4OVYdmimiipwqSraJJwsXhGCQve
	txms+jTrAVOhdnfWAVwk2OJ33y8zi0KdLmXxIOttdn/8AbSCNYJc08mNriy81Kn3VlWlv38r9mFFU
	0bN8SL/k6riCiiz96M8PWa0VxCHG0UlfdoodE4LflX9zztX+A6bJDVhu6jvMRn4BsaieVITKJKZ4t
	xRODqSDtZHQPekmAL9JmJOGT05MK8xsioUuu9ZhEFyKEiWovSEMjb0ikNEolr7MewYJzFC2r1Q0kb
	q3dYdNyw7N1mwtmdsz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvS-0000000CBZi-1k2t;
	Thu, 26 Nov 2026 06:25:46 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSur-0000000CBG6-2Jjm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:20 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1b546061d58so15284996c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674309; x=1796279109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=ECcTmIJNM5zeBNzdBLUXqLgl1tcPpvXc63siNs0dbT7vF/AxUxBxmJlZXmsRqncn2y
         XBnRbRQMcT9a43p6gUJ6oXZtybFmfBZxUTJ1eZv1hKobF6fi5jTIZoe0FPfezPqgkkFz
         1/R/CTgWCQtMVABvxUu2ofMDWiQ4wWn2bHhNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674309; x=1796279109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=DAk31XEpf3PW4zH0RAxO+ZeTPwn6zAwBN9rHKRai4+eJrc/kIejj4zbXd5IfjSBF2j
         3ZbNOyigBTEIRf2PQn6v+3bNYO4YTFs6KPBxOYsP8reBpMDtk2jO2gCJAHcbw/oHZVSv
         AM179kG17wfrHCvQhpuaterOrB10+e8H2F+YWa2+cAsD+1xDGyXVZFn+Mlt8nW9Xpr1Q
         zRg7oKgHfZATgtHYShiaq+fRvPmFjqhMukoOlfmFF9SlCbkjB8kJJAZnQbOtVpqycEWn
         2J9o/fxbASJQmXLifHyF1pW+EDO5HLqdbNbb+UlUsoPiYdRnGlwGjza8+eCP02MSiXo9
         BEcA==
X-Forwarded-Encrypted: i=1; AL+hErGkDjJhSKesh31UTwwIzPSqw4dQfRQb5P7wKZ6PZ2HK6gZ7Dxnl52CPnOHpXj3Ro9IP0Wa7RS7us2z+SXXZ24Iy@lists.infradead.org
X-Gm-Message-State: APuU4Z9sF/HN0H+jZpR6XFEvdxOArEwZC0i+yCCGAJ0cFvl6KGqWGCgb
	ENReGVN5umzHrIYXWm3srbG57S9VUrEGg2Ut5pZaBFiTqGJTR/RxSkztWYL72Kl80Q==
X-Gm-Gg: AZFdTZc02fkgKH+ro5H6HjGfI03+aJlpCBYCd3Y1lJ4YdMUm9jBWbPZU/8KMkfyxOaE
	8RexRx/6lCMTbHKebu8mH90VGlvXNWow3DznNZS6/7KhvDTHBY77dj7W28axwD5wrUveVaAjjpQ
	wDGEt/Zkhy8ky3xYAUpl99mmYZrhTYWGpoy/XqC2Rksu4FAVcNYKFHJF8CVPJ1sLJvAy489Qt1w
	TCYdPi3JHlwXoL8NlrMqkEsf8bjJcqCde0nlaqR4EXxcIHN2ujJxAX4whRX3B7UCWw7pqtwhPn2
	tzGBSR5AYgQAed+sY6tSRdnGUFeSDJkFRt+xpIVfYr2xmuYl0rbTLLi+VYLlGcdhs1exu9EmNPu
	AvPM5PI0WHkgRyQzAh5FFEPVxuQ8jwmeKN0fm3ScYDPXLDAtv9+pUGyV3Fda4hz115QcOgQ4xVc
	XMiZE+Z0YC4ubay6KGZL7hikBbZx6j/cyW/tkXWAzwsztmRJiZOj4zFMCkBTKRVNzwduufvhnQj
	3A5gKGzZCcPSrgNGCRKVEfSgzc/nULdaYdLpshuZWgW3zNvNI6LwJWrqh4EbROm5xyCqw9B4IKF
	01q5SeWP+XBvvaAradGzplJ6kHdfwoKfQjVMOGwRzsY13TRbV1XlG86Dau5PbZKHZ3HbLTg/Gbf
	FLr5MUDMu2c4qtkuqy4khVw==
X-Received: by 2002:a05:701b:2918:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b570d52afcmr11431758c88.40.1795674308955;
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:48 +0800
Subject: [PATCH 6/8] drm/v3d: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-6-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222518_527177_2E3C4A35 
X-CRM114-Status: GOOD (  11.51  )
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
 drivers/gpu/drm/v3d/v3d_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index b790be8a7fac..bde3561c0e69 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -240,11 +240,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations v3d_drm_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
 
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
  * protection between clients.  Note that render nodes would be

-- 
2.56.1.839.g22a8290db9-goog


