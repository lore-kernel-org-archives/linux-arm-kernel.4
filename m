Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMxLZBMG;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Y8ATpE9W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=; b=lMxLZBMGUzwZi8Q9JniDIPU9Iz
	YSdNFuX9VuxnIIK2Sw5eiiS7VrkZr9Ssz034dm4zon5eqjNtbp7o8XCyT+My2PbMSUybR5YTjeM2N
	RGxfzlP56rW/KvxeJZfwBJNxVE87fVtPLNtdZ4IZ0J3kBIYglCgkYDlL8DnXJl4B9iiKgNxPKVpv8
	ZYLXvK/GeCNPrhlaqr99D4uRMIBIy0drqQYNbamgMfqPz8uUB41Ej73a0lbPu9ktoHdEofyPaaOlZ
	OE1qr42qXMBcDSb7e/zXWb40keaU1dEn7kZNBoM3mVvpr18Mi1EZuZhGWnIXFhrTbPYpq0lEQRsJY
	54qTfX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Wk-00000001Ger-2CG1;
	Sun, 22 Nov 2026 15:30:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Wg-00000001GeG-2Df6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:30:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a210470b49so22488395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361444; x=1795966244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=Y8ATpE9WPpk0PtYJEkvwJ4hpeQGc5H6qKgaTwO+tuZri3JvfR4ti8CLGYTX0BRouHT
         6f6YCdvLbozit4MKP5r6oqVcYN+4Q0iS3UrU4XW8RChgPmjaFMaK5W1kUVnBh6CQgJBz
         hVkuaPVZfVBeEakcWZ67eSxCMMiYN17Fr/1Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361444; x=1795966244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcE23n4pwXrPvICR/OBmKOqECG6PQtTg4meGhVNm1yI=;
        b=xX90InfXEGLMv86044VbhKs3ujuKefIfyxln+DdvvMfJDZ3ZFvlkFOL1ChbGu422mP
         50pdHhxpR55EeWVlaGyWw6DE/+grhmSjAwoZ2i3TzFIcCciA7PufbmXpi8XnzffCNI0p
         vh5AfZrwupcs5sbLi2tkcAHqvg3wyuWv4HJUZkiTaVh+AkiZFlOlkWCy9D2hXRwDXltB
         Vq3nZ4qtekdKCNqEw3hX0sTE++XCUD22NcTOmCyIU/jQ/DlYJ9E3gbQM4/VERDBAxnEt
         bCFEHcWwzfw7Tbhz2v7obR5wMlORrLbVaQKIJcBBNRknftmlRDhsTv2K3exNvkooibDP
         a40w==
X-Forwarded-Encrypted: i=1; AL+hErFTlABU7OUl3BFUZezZlYD/XiNyHEjjEEKofd+ER0fUZ8iMmmeADzX4CvoaZYbcANDT/VGAoJCRijscTc1ZUza8@lists.infradead.org
X-Gm-Message-State: APuU4Z8fuQM+kFqYSGKFJfc3QJUO6oHwGZ0OlNGy9W9EaZl7GJMT58vy
	hlJTc06yrusiNENhz2xn71ybQJ9okMrh70kyDE3BBvVF/qxaIGcBQJHwNHYWLMCaNw0=
X-Gm-Gg: AZFdTZcKGjSHdA13v5RWvtl4waPT0WBMq5izlv98Eg3z1VymV5phx6QbwF22xYHuxzO
	X8pgZTaKIDnHfESkKQVcPq9L2ogTMYbt0jTT3dGJRV2til2x9saG5ph89nyM8aYftrHI3yzxn5F
	LBHIEdgJgfYBkQZLc6QpvRtUbpxuK5EgOz2nQLvaC9nMWmcMVP8YV8vz3WV5KKw/jKC2r9JwPKn
	xi/rCRBKmtB4raOepualcz/sK1hdBtnX9Bn7RuZOdmh1vpAQznEubczqXNKq78j+9iq8h8M9dFT
	zMpPrukxrICqLNknhmYh6mc5szSQzoBiFkFCiugjmkFT8SccW4VYd+zXJEMWX4HCNwZIvgyxguD
	5JAizu9+bm3MByWO2/LEde31rbKdgb8SqshxSrT2jMsyRnQUYB4mzoaMbC7+T69I8JlQlhvYwDp
	2OJ3EarJRRQIQzy8+IJIlbp6UU4Gj2RF35PSaOBGRGMVpcVSKGKBmU+kH0iDqPAvh4mAn1e3jyH
	ywh1m4J8TlLJDThKaS2rVGtFsNzmifzU10XhvfT2dPb4vIACEbI3Nex3D0pPGUhzDMgLN0AlOGD
	ZuoJl9X82LgM3SIPGCtrmNLGWoausRiv4IZfxxxq6zyVlohvQRvqhG8mj9lSwTp71fQXQTK07p1
	NMAHX3vswcQcU3CxsBf2Sk1HIvUnm09CRsnYSoLuD+w2fbt31b0zt3JoHPVX5i/5gDFMWsalTdp
	hENZmC1T41kOK2SQL96NgtwIeZRwpupo7DROivni0EXz5vkf0=
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr182002275e9.35.1795361444382;
        Sun, 22 Nov 2026 07:30:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:30:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Vasut <marex@denx.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/8] drm: State readout for the i.MX8MN display pipeline
Date: Sun, 22 Nov 2026 16:30:00 +0100
Message-ID: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_073046_596191_639B84EB 
X-CRM114-Status: UNSURE (   9.98  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series implements the hardware state readout [1] for the display
pipeline of the i.MX8MN (LCDIF, Samsung DSIM, Synaptics R63353 panel),
so that the splash screen shown by the bootloader stays on, without a
modeset, until a client draws.

The first two patches add the hooks a bridge and a panel need to
acquire their resources (runtime PM, regulators) when they are found
enabled. They are a proposal, since the drivers converted so far
didn't need them.

The series is based on [1] and needs [2] to keep the power domains of
the display on.

Tested on i.MX8MN (BSH SMM S2 PRO).

[1] https://lore.kernel.org/r/20261106-drm-state-readout-v8-0-cbe78624e1bc@kernel.org
[2] https://lore.kernel.org/r/20261122095927.2631909-1-dario.binacchi@amarulasolutions.com


Dario Binacchi (8):
  drm/bridge: Add atomic_sro_install_state hook
  drm/panel: Add sro_install hook
  drm/mxsfb: Use the bridge connector
  drm/mxsfb: Switch to drm_mode_config_create_initial_state()
  drm/mxsfb: Stop the controller in hw_reset
  drm/mxsfb: Implement hw state readout
  drm/bridge: samsung-dsim: Implement hw state readout
  drm/panel: synaptics-r63353: Support hw state readout

 drivers/gpu/drm/bridge/samsung-dsim.c         | 125 +++++-
 drivers/gpu/drm/drm_bridge.c                  |  41 ++
 drivers/gpu/drm/drm_panel.c                   |  16 +
 drivers/gpu/drm/mxsfb/Kconfig                 |   2 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  31 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 394 +++++++++++++++++-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h            |   3 +
 .../gpu/drm/panel/panel-synaptics-r63353.c    |  33 +-
 include/drm/drm_bridge.h                      |  20 +
 include/drm/drm_panel.h                       |  10 +
 10 files changed, 642 insertions(+), 33 deletions(-)

---
base-commit: fe97bd8df0365f5aa27ea88b621e3f475bdd544d
branch: drm-sro-rfc

-- 
2.43.0


