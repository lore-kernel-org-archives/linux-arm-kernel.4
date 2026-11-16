Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+mTwx8F;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=gxGryOZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fnv52JTQmf9YujWAiTNm18lN9+0DQKawzTC+eI3Q/4o=; b=r+mTwx8F2FYBKOcrQSdsxbifst
	M/eYMCDJ56OK9b9894GTzPj8RCbNtLC1Qh9AepcBO+eRMGlph18x8BDqfj/OlJjHmNMJCwEAE06vs
	BnSnYNsFzXn2UftiANbMrdjtJ0uvK/5KC2grBwsgdH9n6QZY6/r0ADglY1sDV3odQT9K5QrSMPjvJ
	Fa1C6u0WdN3Ss0SVEudJk7ZziHVPoF1lwqIM3nqagtQAd+hJlx4QT9MwtX6QWX7mjSxDZSjtzTjmY
	uH9YESWzazKvhO6gBv7T6y/qPvNx4mAmLA5HufKZE+MKnKOY53ddDvZS418rqmBTF+embA53Jrw6j
	7ViAsV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsND-00000001f94-0pDO;
	Mon, 16 Nov 2026 08:47:35 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsN3-00000001ey4-0SYS;
	Mon, 16 Nov 2026 08:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1794818777;
	bh=Fnv52JTQmf9YujWAiTNm18lN9+0DQKawzTC+eI3Q/4o=;
	h=From:To:Subject:Date:Message-Id;
	b=gxGryOZcYLNlSdthcwsJPcSNYmyN9s05Fho3C/drdmkUuC3x0Ga9PqIyXnl3AyRzM
	 JYt267GX7KaGnZ65h54twjtC7QszAvmrndvq2ley318dc6YuFCPo3Du15Juugj1o8p
	 JNvVON0Jr3ro8k7wxRWz9m4kikKhnHLjU+kYzUhU=
X-QQ-mid: esmtpgz13t1794818769t20b5f6a6
X-QQ-Originating-IP: nPMpwEBGRZvbgBYDS4Y8JbKuG923vpTWJFg0kyddi/w=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 16:46:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7044055788115629129
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
Date: Mon, 16 Nov 2026 16:45:53 +0800
Message-Id: <20261116084555.1061-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261116084555.1061-1-kernel@airkyi.com>
References: <20261116084555.1061-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NfykWmRlrd2ozjFheyT4vRkgrFGOiaXn/CQOqqErnvHwRwdZpmwVBDrZ
	J1MFfG0ONSIOUQtV7gE3HXdznUqB9h9eGxMqoUuMsqzjE8iiKDlbADBgjIFpVjyRXuGp+1j
	wen2qNj3gfTVpngkYFgXMPXAeHB5dl7OR3fFmRZvR3VaF4V64j7ELVICEbSaqHvYv08X2oF
	r2v6qWUcOBoi9Nl76EhJirRBzReD9QoiNtAHsLCu5DoBTK1NVdwEgBoHJdIDFRPIEHXegZU
	YsAatt7FBd3BSBXw1a87ZpMwgTedJVuafnJdGsgQtI5EaCb1bZAA7wvO+vUfu533EeG7WsX
	qz36Ua8647yoFUb+W6pAeCaVePctey/g8qZs39CSbu9mN0lQQjUf86hFHuHB6t251+cYVM0
	GURM40r5RYxup9hJAuotDEQAJ30FYbXxczYU3ETZq5BDm03ZAOOs8ImXXUlCUrl3enz2ilC
	s+/N7zm+nVSl61T9R8N+rfDXdoweVMcORNt31DYJTntMK9640EhIdciafu7GgMSptXW0qFQ
	2BvuT4TbuEyfmFqpra6jkAFrzyCee768oDs0swoYLlAMsnaRDB+bvhI+ADxsuz9s4UwGqvh
	ZTeSIvP+2VZQ6S72U2plDZVQyvsUOJjcIP87MATa/wE5vmOlAh2poB03sHNNJRUgmHGu6YZ
	Q1GqFTklN7f1PptCuqO7ZUtOrQLihmjdJZa38c2czSv72bY0xoc/8J0/DgoCr+1aDKgL9jY
	jJceQ/ltDqW5OaJUYt3C5pX1aoSAhpH45SsQ1/oaaWk6lZc2WjMqSXGGrYxN3tK74dmwvNA
	l0Wl5ulbVYxxMqXDTxVBktR3y3rfemaYk1WkyzPX+NuUa16E0LgH3dCXVt9yawdC+Bo3sLj
	mj+cO+v//nY7BBSjmJeTgoNuCHFuQCrmaqBU/5poJ4CX7uJkgO6W58CRGuIdJDOPehmtsZc
	gCT+T7i1orXJ02i9gQM5ToodUwRCtXoEN0ZMyCAlIGaNtJtrKo8YMMSqHGAuAUOM8tLDJNN
	FfZwQ88OMf3bACvXFP
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004725_611174_3C18806D 
X-CRM114-Status: GOOD (  11.04  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Use the block aware helper instead of cpp[], the latter aliases
char_per_block and is wrong for packed 10-bit formats like NV15,
NV20 and NV30.

Tested with modetest[0]:

```
	modetest -s 86:3840x2160 -P \
	59@83:3940x2160~96,0,3840,2160+0+0@NV20 -a
```

fb size (3940x2160), src at (96, 0) with size (3840x2160),
dst at (0, 0) with size (3840x2160)

[0]: https://github.com/windowsair/libdrm/tree/src-pos-support

Assisted-by: LLM
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
Changes in v3:
- Cast the result of drm_format_info_min_pitc() to u32 to avoid 64bit division.

Changes in v2:
- Missing removal of the replaced line(Heiko).
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bfb384142568..0de038acb56f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1290,7 +1290,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	afbc_en = drm_is_afbc(fb->modifier);
 
-	offset = (src->x1 >> 16) * fb->format->cpp[0];
+	offset = drm_format_info_min_pitch(fb->format, 0, src->x1 >> 16);
 
 	/*
 	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
@@ -1309,7 +1309,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
-		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
+		offset = (u32)drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
 		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
 
 		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
-- 
2.53.0


