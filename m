Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B57606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aAChz7ag;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ck6/iRYO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=; b=aAChz7agCXUaqE
	bVNdWbzzzQlFxgXj9J6DbSdMOFmOrhhizpTP4UxD0QlI6VdVw+91gHZVKvjqfpWbrFbOJUE626hxx
	+SvH9m/goslLczoNqaiRyGAm/aTt8M1N7HXTI8SaO0DGpNOqafnu3aDUJOT4SanzqvW0J1ocsW1WO
	u5YoQQqR+wUijA5wClKAP+UcA6+cW/9RlOIw3hkSWqfbane+/odw3IUqbOWkRFyfSWUKp88CSTDxk
	ZcwumMqg3VvksRSJ2wxHc+GulgtKoejbKDvGG8Ah6XkasDBO+A4ZHl9NAivJQzCk6nmpYdD1bK8/r
	tvqV7hoXlRsaqVRmVB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuh-0000000CB86-1ajy;
	Thu, 26 Nov 2026 06:24:59 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuT-0000000CAxa-0iu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:46 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890023c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674284; x=1796279084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=ck6/iRYOZ2/S4xwsA9R5+VCGXc4xUeGuV1aonI3DpX3wc8hQgk/1y2gd5QblIwZOnq
         BSsdKW+NpeqiKR79FczxgNKY43ODttjJnZFdQTG3YNA+7zWErhuMpO9IqmY0wxphwWUC
         hASQ+d5UiGQvLsfqigaGCgqQhgzZtP7vzNIhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674284; x=1796279084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=m9MKxw0lt7sav6RLvAUvTpQXi9f/HCzJbz1fQsaaNpFGpduGy1v6m3Z4I+bgJFVIe6
         bwQmctxmnJCG0Zbi/sxG6gZwDzojBRihtYIoOJXzVJJG5BRVuGY4/o/6Svmg0OKkPgvy
         nZsQfmq70cuNu8Jyj0Skkp4zfUBLRdcM7bHrvF1tOEgnlTBH7mY5mk7LgyMsI+XidnN/
         q/OyT0zV8ResBnaw2E/XkpPQav2ubiL2O9SZer2b6U1QJ6jgPvKEiYajLQf5aAir3Jbo
         1O+LiDtrcTw5T62B0iFKHy0k51PvDMv5WXOrjw/cOus3J33SZCIKPs/V1tpKoZ2bXvAV
         b10g==
X-Forwarded-Encrypted: i=1; AL+hErFKC5RyyT5rFJ0Tjfd+P+gF9203wd/kOfZ/4hlK0swXpkGNhgE2hD/44mwrB0IxCdbruODjt+WIp+PdoS1q47Wy@lists.infradead.org
X-Gm-Message-State: APuU4Z97f6GIX8UeLerII4ohlR59Bhb102hgcagvtQFebItFk4xDQVpl
	+bhjqIcfY0SJYWv44dVjFptR78XJ2kGxkwiu4ax8TNE3Z5zEqQ894lCPDecD0HCRjA==
X-Gm-Gg: AZFdTZe/CipoAFOaW6SlC9E6N1RuhcCNQ1zc9ewF9nQC1llLh0uXqquGQHQKgjaKk5V
	8XJIUoJVMt2QIiDHq0AaHl5s/RJK3IYSyus+6ul3YAT4xeTNysVhJ8Gko+JxS9qm0//fbt1CsX2
	z6612FMwBvag5ZJFRvKOuy1/ZRXIC1VsNcq3JzFoU1r/m5Rk/mgxMRgRvbvSQ3SMAY2UoQUvpE+
	eLL2OxoxZxfvnaHV28tRWmproQOXW6Evgf402hjDpSgDl89sFtO/9cJHRFx9Hj/5XtrxTc/Nv1j
	OWL8QAnBPY5M7wdHfTqe4GvDoIMy0aPAOJIS1oNS1vJOUXdQWU9uZ1/ovvTrEHxDV8It50xMIxp
	Y887YhGLG7cPZXaAlwDww4Thxa377PQVMJuZvMCvcvFEwoSH+T3A5uglaoRYD7bWfsD2Yjj6x/c
	Fe9bG++5eIxZhyHThDqdgkQpZ+8jzI6uR2ramIn2PeXKDv0HRP4MCAcIV78vFsArdVf4IJC8HVz
	JMFzwenJ2tCmP6M72+eIC3CDP5/AWeUobkJG/bFO0kQCaQOJPCAO8fLr0+j7kiaYftRWXjccSpQ
	3onUU8NnzyNhCMk8HSbbzuR71jI8V7mhA3I+9NsCJ1g3PxYlMj9jPNxVOcbaLg09mU/JlzNQKkJ
	rug+1d944Kib1yDcjU5SOEg==
X-Received: by 2002:a05:701a:cc82:20b0:1b5:5a81:d388 with SMTP id a92af1059eb24-1b55a81ddfdmr16361341c88.4.1795674284302;
        Wed, 25 Nov 2026 22:24:44 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:43 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:45 +0800
Subject: [PATCH 3/8] drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-3-7cb1d1a5d6ef@chromium.org>
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
X-CRM114-CacheID: sfid-20261125_222445_214710_CA51738F 
X-CRM114-Status: GOOD (  11.22  )
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
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ec1352c1b09f..93869e8f3f96 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,11 +494,7 @@ static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,

-- 
2.56.1.839.g22a8290db9-goog


