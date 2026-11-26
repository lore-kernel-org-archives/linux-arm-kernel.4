Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F94606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 05:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCRFhJWm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYhFYajO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=; b=nCRFhJWmh6/EQ/GvuLbEMJhOuk
	4TrrrDm8Hu/7g70m4FZ1zE3/onaMbnBtXNNixKqGCzFYrCYEKAi5w8bHZPpFlTXbewmwtC4D7Gy/0
	Prnu6n3is559S0m/JuAbZxI6ucIXms7mU6kwp6I0NoCDM4BGzPs1dobmSkm+3UYj7qjrHgn/fPz+j
	Dju61FM8I/Gk7oLASaZAzkxbwS/88WvNvPUzS/MDnq2wmLq+6U+PWpyXOqzKOFq10uHIsixYW7XCZ
	7mGRV/6ZiQ/v8dP9ZVMWKJiXhaNpgyF9L7/TrTwpu9wHsFsZN0cJyGT1f+M6ywAkT2c2L79YuVIYB
	D1V6Ad4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSVe-0000000C9T8-15Vu;
	Thu, 26 Nov 2026 05:59:06 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSVb-0000000C9Sk-2UY8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 05:59:04 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b589050416so999153c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 21:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672741; x=1796277541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=wYhFYajOQF0wVq4Wp5qd4p2HmdW+GBmM4dzbOUjVpYPN5rumq/r27b1/IBQhMYSUey
         7+2ZkGZrFQuSQmBny+oGCazFnvEVTfqnb+zZLpw4+/YXhKA3e8YW6fJ67Z+o02rcRq4K
         olzgsDIALqc0eRlyOfxcXaGjl0g5bPzcMiE92Fztt7dqlvqvweein/Cb7s61aJPO8JaC
         tDJZibQM/w1pdwBzlSrLXYTxWs0EcMjwnV5FWWonUYAaDcNXx9mXyQ1tzavR5teWPmv4
         B72OBFLZldYXk8ZQVQTHNo/YeQPzprtFrWhCJ8EgD8zgPEw5dqlXzRXv5TBITj30BTJT
         LY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672741; x=1796277541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=WwMCwYg6BeLaYFj9d2RQLOKRL5YArGvudoEPgVIPhymGIoN7EX1148tKXrgUjbGLvi
         U3cFp7RfgDN61uIABrlE49RaRVXhrseoecp/yQSibxMimMlWBbBts4WgKwUB3gHlHMc0
         j30eL9MxPvLkiLvyDHVuQ73TOo6KfiBygxIMGxTsMAXYpPqBy7OPIoMO1BEH3It9EuYq
         Zi1RuSNMltt8hutTzRls6whjRujEBiiWiqnJxuL6ZgnMU1jns7TwLvEEZWrpVYP9Ro14
         TiJ/MmFS2uV+CGCS14D/KINIrXYV+bB8pEl0jvaLZY7ftMwfw+kpAWOV8KkhDpPlix8e
         duiA==
X-Forwarded-Encrypted: i=1; AL+hErE8WtsVytcbjIjXwqFNSRzyElLdp0od73ZovgaT43bTYxIz/sOhDeJtVQWNpxq3CaRP9YnHXRNmMDtEwL3LY8Ml@lists.infradead.org
X-Gm-Message-State: APuU4Z/5FRJ3zMx/mcpvDKjZtsj537usUAsbp02gpx5yS5cGVtE+CrRj
	dr3LckbD+Vrh207wpWUc6D5OPJYPEqgTzXgs4VniH0cGms/jdXdeJl8=
X-Gm-Gg: AZFdTZf0fbARkRaBO3VRD6/WQ3DWDTuLSBHXAvWg7Lj5utQv9ktDn44h/KeHFQJfD1W
	B3+jAYoiXR294em4zyLEqyfFHgHoFVkQCLQsloCni8hKufAv9+IOhNUrO67WdT9ltTsYjq0TNRp
	puLMMcXJ8mKIGuAERapDirQN3fUj7MefKbV6tjmxLMOoVoMGCzXFdU1bPTiFPAB5p0qt8A4rvUZ
	d6xSUHwiFIl8B4gTgmFumvWrxGVXPl+PkRrxbr8TcwGKzoTzmwMXEu+b14ArBWyU//WGTo/81c2
	2IrlxPIg5eTD8QK+o0FzTQZnn0Ti7LRwgsL7QHbApUmKjjLAt9kOHAltJKLDDPHTxmHzsHnWOQF
	dyrw+penE9Lti4kdfF9fdJ66IMWR76HMsyvqeUSvEJKG5NDxjgGv3FrNGSCg9jSQUC+GhKBe9V4
	OvaVnKhOyPUUWHTjhYQynOAUzRk5yYph3pL1Tgi+E1Lz2j3f9YmBJ4aliH+SxHFquliFkGTKH1v
	fmgqoE1eVCkKB9+lvWIbdCu9mNTYTHvMZTJCviavdMaT4nfhY4Qh2MLxqI/fXylH6tuidbdThsi
	L/8MZB851zyGbiIAhQSxEsdFWyIzGfxK1C+XXI/HLGU5Yd7bX6QCtgSIWkGdEVZGCMI=
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr18022188c88.19.1795672741112;
        Wed, 25 Nov 2026 21:59:01 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm45249439c88.2.2026.11.25.21.58.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:59:00 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/exynos: hdmi: put bridge reference on probe failure
Date: Thu, 26 Nov 2026 13:58:53 +0800
Message-ID: <rc-b1-20261110-vc-19-b220c856ecbb@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_215903_638724_ED670087 
X-CRM114-Status: GOOD (  14.71  )
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

hdmi_resources_init() ends with hdmi_bridge_init(), which takes a
reference on the next bridge with of_drm_find_and_get_bridge(). That
reference is only dropped in hdmi_remove(). When hdmi_probe() fails
after hdmi_resources_init(), including the -EPROBE_DEFER returns for
the DDC adapter, the PHY and the syscon lookups, the reference is
leaked, once per failed probe attempt.

The sashiko AI review bot pointed this out on dri-devel on 2026-07-16,
in its review of an unrelated exynos_hdmi patch.

Drop the reference at the end of the probe error path and route the two
early returns after hdmi_resources_init() through it. drm_bridge_put()
ignores NULL, which covers boards without a bridge on port 1.

Fixes: 2db0d298f22d ("drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20260716132919.A3EA81F000E9@smtp.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_DRM_EXYNOS=m, CONFIG_DRM_EXYNOS_HDMI=y, CONFIG_DRM_EXYNOS_MIXER=y, CONFIG_COMPILE_TEST=y; baseline and patched exynos_hdmi.o, no new warnings.
No hardware or runtime test was performed.
The path needs a bridge on HDMI port 1 and a later probe failure or deferral, e.g. a DDC adapter or PHY that is not ready yet.

 drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d67a493c8fe4..cf570be8fdc3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1997,12 +1997,12 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdata->regs)) {
 		ret = PTR_ERR(hdata->regs);
-		return ret;
+		goto err_bridge;
 	}
 
 	ret = hdmi_get_ddc_adapter(hdata);
 	if (ret)
-		return ret;
+		goto err_bridge;
 
 	ret = hdmi_get_phy_io(hdata);
 	if (ret)
@@ -2079,6 +2079,8 @@ static int hdmi_probe(struct platform_device *pdev)
 		iounmap(hdata->regs_hdmiphy);
 err_ddc:
 	i2c_put_adapter(hdata->ddc_adpt);
+err_bridge:
+	drm_bridge_put(hdata->bridge);
 
 	return ret;
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47

