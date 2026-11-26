Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o0ZHi3+7;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kCW2OwHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=; b=o0ZHi3+7K/TmES
	8t5ET9gb+tfQjnRdZkGDX7XIGnxhMOyRj1RxFbX7X5zXNtprftgZF3EtKN53oWYFxwx5hVjbuUvPH
	YXKVkMh9aVatyZNyN/8EBKx9luWkSFZ8eqVP0dI7/ljmNFOg9iwcP/rTn8D7OZZITB3qa3Hq56Qz6
	s9/6OxZZph//GJ4pOdvHShTmuTDf3GsYRlb3ZPLX8weAHNAv6UViYPP6/oPpNFnuYNa2cyjeb/z73
	OXiCkXKKSgtbJNutxrF4WrDrYRZhoCO2fBvl/rIIJYpgsSQDWyNEPV3u5Lhj0K42KYiksNzI6UwFg
	cPYkwldauZfPWOtf99BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTgC-0000000CGVF-483i;
	Thu, 26 Nov 2026 07:14:04 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfw-0000000CGL4-39oN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4453052b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677228; x=1796282028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=kCW2OwHWVIQNv06LmEj0dtTWM1Z2y9FvGHbSAx7qA56GhaVZe6k90rwC0v9+/Q4BgG
         Yc36hPgIpCqkt+Eb5U99Pvap8xIis7QK76TS6V1Hv0IfUDWlMlMuvcxSvCjqmjy1NXRX
         8YD9adAQgIDCejy95X40/AC+HbCNrOfMUEzho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677228; x=1796282028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+aLuJucBwaSWJgFUDaZ/eOjRwoee806v+5/S5Iceo0=;
        b=UbnKAcUWxpVzgMRrlZ0rJBIE0Zfq9QyQKhjSUZi1lWwqpDffRu4UedizEWkUq8Tq1x
         wXrGNT5RXqkeLjdQyCMr+KVrNOILRhDlhTFTq0rxFk3Ooo+L5dqVXy12BNXAF3zLJMie
         usemACoIJPomARUvBwGScLL/oSlDQR+5v0mT2S8sjoIrqNOYN3A3dazxjCI9SHiheZOK
         ic43spCxpTUPKmqAPQ66DLGP8+ExlElshgDdZzoXE9qbY9xqk+nu1zsUhE/0cyZqe4ID
         drmpwmvbcDseeZyFU1VTX0UfoQZrbxm1xbaOYU8QR/QSSWPnxueD7aVQo4FK85H20ME5
         RwzA==
X-Forwarded-Encrypted: i=1; AL+hErFlwkrMpMLrEVpX4yxNBJusIRH+XNZf3qHxbYTN/PyHd0emsGL8poyZ8lCX6JUpZo3SzwMIbuN3joAAm51/ydJK@lists.infradead.org
X-Gm-Message-State: APuU4Z+A4e9tIwHxCc40dncHxg2T922JjVddO6hnILlnlO1oVRx5UmtO
	iIotsYg+jQyKC+nCTHjkA5+7pDkEDRXobDEE4sUBMWSN993oDSDGXGdvL0rC/NZbaQ==
X-Gm-Gg: AZFdTZes6VICM5rrt4S17PapSq5IKurTwoewcbgNUJXtdBRNxcmN6UAyfzofgpjszgI
	p338LYnp2k8qzeM3A5I6kvqMJvYP0lE1NjX13R6ohCMY796T0RgFanpu6d6qiSHU9QHgoAC8r/X
	c7ChT9B/KPozS2QYoJhjYzxez89mAa5PUimFVz+xADIBfx9fZgH2vwHABidCKjLnRRfRot/+QNV
	RtDwW2Ixqw9uMo+O4NiZ0QVo0lT2wEi86oopfwQGIV0XhtumhQjn6vWTdlkaYCpOfBKidz/JMvw
	ehMql0WNYFtazdgI+PSZyethNE+1tbltQAGhTqe4OkYMbRp/Je4RwugjezCTJy2YTvfvJljkRmi
	MwH1BnjYre1jnXTqq7bmtu5GfVG3WJmWn8Bi87h+jnA6NwcrThrPkkOEMoXyjv5ZIPAZb05Bz5c
	lailbnadWtwKDg9ET2Saq8qqvfw71GFXLRAQqO8x2AW1hVRKH41rX1RSFZbeVfF+cfAd3yTSG/8
	hMqyu/e3c6VuEsab9b0c9VUzsbZc/Yp4OBVN+5zIolLwCxC9dijLlmSqEJi10Rj0s0jKDY6Lk3X
	PhNNOca3ie7/hB2V8PDdi/7ieq2p9rljLNfwE7K2KzfoXYCucEdIqRbQwL/xPOPyC+INrrPRVbU
	NkfNFBw==
X-Received: by 2002:a05:6a21:3f94:b0:40a:56b8:2551 with SMTP id adf61e73a8af0-40a56b82debmr793737637.17.1795677227780;
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm4664437b3a.49.2026.11.25.23.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v4 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Thu, 26 Nov 2026 15:12:52 +0800
Message-ID: <20261126071314.253890-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126071314.253890-1-wenst@chromium.org>
References: <20261126071314.253890-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231348_814112_2FD10F04 
X-CRM114-Status: GOOD (  15.51  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.839.g22a8290db9-goog


