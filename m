Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B27606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pe+AUwW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p1kmO1Re
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=; b=2pe+AUwWfFIr8N3LFqMOkGKsSo
	LfhC7bL+rCXBhCIM0SEC5329U9YhdZii4+/kPeeIA9j2vhtj7uCP+XB2Nc+GqGlNJ4mR3Zysk+WEv
	Vw2N0M68uUHb/aOW6Gf/QsA2LlU5bXpT9O8vu0rLvxXTqzYV78DdhtZ5JhL4Gjws4s+Nf3hesl6/3
	mU0PuUphj1KakJE5KBz58JqMOCQN2FUnnrkeV0Gxdh1rGBRILv0udrLGHuV+ROKepqQQooc95X24v
	YGfetFnH4G4Nr1qMVuEMeLPdxysobY02zABis5UjweslJ+ziEj2hvCC2KwNpMsF+eGVjKQFQZ7/24
	jfTWLT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Si-0000000694t-3PXt;
	Wed, 11 Nov 2026 09:17:48 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4Sg-0000000693p-2rNp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:17:47 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36f6295304dso3791945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388665; x=1794993465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=p1kmO1Re6vhA3st9e2obakiUmrtuBMqaH1m802JaCjq6iDGh2RvH22hBP1e2Mvwebm
         ufbNtun5kttsIb8ShaQAiTyAlwieQVbpKDp80mO7eF8X07kQthTavVjF1cXjAOLAprnd
         rQJArASXWCastMqcnO4UldE7rLfq3VMeDI02KULGj/zagDNGOQd6RIDU7pHi8Xp2tsuq
         n/VzXpVGbqVxwcrklcQyJ7B8ed3otqCwE3N/lye9nUV7TGfgBO7THsX5DZTw0ccyK8D4
         D7JZulVccu+B0YcMPxjOIFWbDFw1AkCd4HM/C9qmrQllFohUTWnbLi2WI89fVwwMpBZ8
         B7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388665; x=1794993465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPNp2WgpgPHRfZu0DFCm+CGOWcM+7olBPXi5wHu617Q=;
        b=LMkJiRc8hyDL4VQ0wIJe3RSvQls1ApAdmi3sU+iwopFgLPaVBPuZdIa8tA1Th/TVSs
         5BAvDDMcku6d0aJMbBuuW12j3J/6mYn3z+9JRM5+2i/GBrPglGbt6QHYQYhFLda68SR9
         w5mVWbEOOQkAMJCgRTPBNnS1k+1cPL4YXNsybdzc2PKpnaFAGIUUA6c6+Sr4epf73z9E
         SHoR12kWfHjuaWNOc12Antw44odN7aLm+LxifQ9bGF6g9zQ0gMnYaNS+7xDDut74aEHm
         Wxoeg5odlTgUvrL9A5TmMASzfsKLRNEknnCo7Ris7P4CwT0Q/cR7bWqyo15bwCXFt06w
         wU4A==
X-Forwarded-Encrypted: i=1; AL+hErGiMcnQmeWJ0Cfuj6V8v4i9sXUSHyUg6Yxznt5GlOnsrEw/PKNZjxS851lZPzaetTWEdCaKUtLgWdM3eZ5cMOTn@lists.infradead.org
X-Gm-Message-State: APuU4Z/tsh5R9KtJGNdrPB/539qZCcKytFmjKnYgtjSmjc4Dh+np86K2
	xTetPjRWUb/x87oPZ71us4u4fDixLXdae1NOqsHXGxzZ72J49LYKAzm4
X-Gm-Gg: AYBFou3JLhYm/+zLHLdx/JuQRxOJO8CUX9QT8UrWov0vCO5yCSRK/nb/4QrStdelFna
	M2WmCb7TwAK9P0jrfrrzrzzhkwzJpEk56yRxKmiUt+wZ5Y/s3wgL6T9ug2+dMarDcjqLAY6e/z6
	PJKzE/em3slOaRwaHnry2CxkkelQrftBxSBFk0aFbDNi1qgIuRZC9nDOac9nwSPCZfnQ4LjDBSO
	d9aHQX+abTGlF4mGgLeMUVBSx6RqhGrqMif/rbxRxlMoWiIuoyR76LUchhZpltYlb4wnDGrkBQV
	mGvLaI7v/+TtfWYdIx894UC7JzCsj4I5lF2YuDSR5yeC4xydDiZNfIhT03QtQc3klU0qbyBEsJB
	5Ilg0dKrB5mHNgIAcdTQu/xHZfzkXxgtzIkGymdCOpQk0IbkpA/HBF2PqPMPvOaZEG4pyscZAim
	zDuHcoAN93wfPSw7L1W4hSeaS49u54FLSHLmOIIqyOdZZ8q4rAuG/ahGLug2b//ULluBd/I91er
	CbRzbRjQVKWyE3oazJwf4/iFBv6A+E1J0TAhkKeHKw3NthNZTaT47+mgVoKF29K/mL9Pfzp6Ua7
	mABsEqPk15w0WL2Oe6PRIt3DbOiZe6tUThlEk1SUH50RtL/F5mfsUNAfS/wxcr0lSkih+tC3q+9
	ZTEdRFH647EfqF/7Pu/SGWiq9sy2LcoDEaOu+6n+RV6XrEAWh
X-Received: by 2002:a05:7300:d94a:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3768617ce1bmr2715415eec.18.1794388665237;
        Wed, 11 Nov 2026 01:17:45 -0800 (PST)
Received: from DESKTOP-DIIS71I ([5.18.141.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm13540869eec.12.2026.11.11.01.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:17:44 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Belin <nbelin@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	deeb.rand@confident.ru,
	shda@confident.ru,
	lvc-project@linuxtesting.org,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] drm/meson: fix NULL pointer dereference in meson_drv_bind_master()
Date: Wed, 11 Nov 2026 12:16:57 +0300
Message-ID: <20261111091657.598-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_011746_724801_D81C50B5 
X-CRM114-Status: GOOD (  12.51  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If the allocation of priv fails, meson_drv_bind_master() jumps to the
free_drm label, which calls meson_encoder_{dsi,hdmi,cvbs}_remove() with
a NULL priv. These functions dereference priv, so the error path oopses
instead of returning -ENOMEM.

Only the drm device has been allocated at that point, so put it and
return directly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Compile tested only.

Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 38bf2811d..a9b707062 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -204,8 +204,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	priv = devm_kzalloc_obj(dev, *priv);
 	if (!priv) {
-		ret = -ENOMEM;
-		goto free_drm;
+		drm_dev_put(drm);
+		return -ENOMEM;
 	}
 	drm->dev_private = priv;
 	priv->drm = drm;

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.39.5


