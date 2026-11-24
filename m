Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2B8606A68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P+2GMYoJ;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y3Q5uxSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=; b=P+2GMYoJLTZ4buJklXq/Yo9w3+
	PgaCvssgErv4au2MhTRzvUv4Ps/A4UY0ZwKhVI7uEwGcO7uSbF4UUi7Ai/PsF5ZwVdoup4ny/IX9+
	F5IbTj9mmw8zyjtDCXVQv5IsAchyX/tdG3+hwFqb///yJS37Xj+s8e9CqfQd7f7iyhtHzHgj920NN
	QlaUzOHO1LnSXUO8LHfxNARm/w3tPref9hzo5xD9H4gbFZB3Jf+ybWfqWhgjQpL1hl/4n1zITN5fB
	JLavT9RMpwMcn2LQ20Y67HWim0coy/uirTgsQHOsR68NOB7MnvbtOfmWnbAWRvVjVhZpyh2B9PJGS
	/CIzxWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl97-00000005n6d-0Q0g;
	Tue, 24 Nov 2026 07:40:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl94-00000005n5k-3UqO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:40:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f041f88577so22993605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506054; x=1796110854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=Y3Q5uxSLW2d2TYzEUUZcKs7IyElju3/DF+bRG5xzHvmfbXWjO3gtraHQATxkE55V7l
         xZXIEZM146crOvayqKLEoOI3Js/SYtDXK6jKfxq5rd9MAVv7NaxhB5E1LS15X+KDvMkh
         z2ZVALyxx9pw5kX80lpcYCJ/7okbxUN+GyUZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506054; x=1796110854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=E36z9VcptWM/1ZCjUeQ+K2S1OHINHgn4og81iiIuP2tBE9DUf8JsWU9KgSylNbl22b
         T+2rUKmfPRbNTq5UWekE699IcAEkEbSxDPHSijFhFzdt1yAO3PYFp3SloRljwoA8CnmW
         gANobxMTKgQTehn95AcdPzlLDbYKLPu6k7BnCr1jks5HRiEMSClBRQ1YD13wXWztYaW8
         Htxw5hfgT6ft4t5nOIwSetNQ2TR7mT2d1PGp64/vqdRh0epxlK0qHL0kWe3hB6Gs1LTh
         1kgW/BL27LzMeiApkxhFCeawm9RlSrS3XFLAc/XHATdEYTjkCYnrGCI5dsRZv8OgahI8
         s2Eg==
X-Forwarded-Encrypted: i=1; AL+hErG+u5ZWgKCiyjbiO/1nBqhP5nYLMPMCZux0T2QjvXtOPLFSy5sp2IU1wFOhhA9q6wiXJ4W5VQznsxxQPGSxGNaS@lists.infradead.org
X-Gm-Message-State: APuU4Z/S472jvMhaDEy5xhPlO63WsnmP8EaQtdDVweqyNMZlw9dVFZDE
	AdIdQW11rbtx7faZX82SNyDKrBSTK28wtMKkJpLdEwAT2byeb+ce0mjBjDk1NYLurQ==
X-Gm-Gg: AZFdTZdujzbBoi4d6aGM/BZ4UY3L9h1eKizWaenG0rhP+cwZ3wg/mxMS5p1OWi4TJAi
	WLJDd1U7tTKLb5HJ2dbE8dlwQX1RgxZLkFUfEZCAqOXP6erXSdJoGC/A3gvwTGrdVX6TDI6khs5
	9tadKezudDOvu2cO9+iVcjKryfR/zR0HeCwbv/Fxib6o+fTKOIuiqR6MvvSIxu5x5SCsKGYMypH
	YbejMBbCOuIJ1Vwk5ZtoCQLxwWWSi29DbhPRBlDB89UhW0JiAoPThGVdpT+M1HnFeteKl618r84
	3K0dcW10/OSw115x5BU2OS4BoXZvR5M0gvV3MF9YYtdW13B0jhsdr2VFZeNpozFvnFlLHyTSS+Y
	SwdaZfivuPjySwuRUKJSwYRjIMFE+ILoki+ZG7k5LttcaDgnPxgUMguj7yp5/+m1FLHYu7yyD/M
	1sFAba3MTO2xgEBsAsP1JVWwt+X81O9p20lhqQm8M/Kihi8RzoscraZly6HfUsSqqGsM1SNyKL5
	FDzgsB/Tviiiolm4QGT9tdFB+cEgBobMZpuv/RS57o8Q3u6u1U12AyboUbvlyztGwmzb/FHdXUR
	Xcz4w1/lEseVuel4+zX9cnx6mIORaak5kMG5imxTlfAnykrC2uGMkJMHTxYT
X-Received: by 2002:a17:90b:5289:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b41c9080bamr13617140a91.32.1795506053661;
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde84cd5ed8sm3771777a12.10.2026.11.23.23.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v3 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue, 24 Nov 2026 15:39:28 +0800
Message-ID: <20261124074041.115251-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_234054_904808_8A0B3C51 
X-CRM114-Status: GOOD (  16.12  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is v3 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v2:
- Change drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and use mul_u32_u32() to avoid 32-bit overflow (Thomas)

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
helper was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 46 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 119 insertions(+), 51 deletions(-)

-- 
2.56.1.809.ga0b61035b5-goog


