Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CDF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JabhqwPM;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SvLsGhkT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iIGCznXhTjwwAbtISLd9zxt6KkpRGg6tsCKG2gaFg90=; b=JabhqwPMnAkzYE
	Hy1wNetxz2viwMuTJ7auJbkEEtthCJyDERaD4D0dj9UzTXdJaezvTZu4zX3bGTZGZmkbMJIK5QcsC
	BDSza2uENWub0HmCw3x8A85QEs21RQDLS229IlgtIayWdIX9kULni4M4Rubwwt2Yk46fCAPpDue15
	ztNZS9Xs5opYlu49YV7APr6DPAPQ805I+AmXoq1X4+4AHvb1CaUXKxa7vFpprbJo8e5lrXNX6uOLa
	xDtlggZylAMG6FgQVwG2ed289ydEeatXS1lQnO3JI4ZCqyXzXZB89FbJCK9RDzOYs1WWUWRWJifM+
	zqqGsGfttLH2SBtmK1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRn-00000007HYW-15cz;
	Tue, 17 Nov 2026 23:18:43 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSRi-00000007HWH-0sA7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iI
	GCznXhTjwwAbtISLd9zxt6KkpRGg6tsCKG2gaFg90=; b=SvLsGhkTDPXzAfq3BR
	9/l8k4//D8k9qjpqRh6nqSAT52sbBOOoDZV1S38pDyyER2j/AgTIWZL6jMwOD1sH
	CwstOyXCpV9EwQiVgZB+gbA4YVlyD4r5+KrkJ6Q1pyEtVD/eY55ea0C9I4CINX0I
	7b4hH93gFoHRAHeRsNjYh5mww=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXyQiu4Pxq15exGA--.55935S2;
	Wed, 18 Nov 2026 07:18:07 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/sun4i: report coverage blending for alpha-capable planes
Date: Wed, 18 Nov 2026 07:17:49 +0800
Message-ID: <20261117231751.264258-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117091932.12063-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgCXyQiu4Pxq15exGA--.55935S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW8ZFy3Zw1rAw15ZFWUJwb_yoW8Jw18pF
	WrG3Z8G34kGr4av3WfJa47XFy3ua1fGFWrWrnxJ3Z3Aw1DAFy5Gryjk3Wa9FWDJr4Ikw47
	tws8ur9IkFyDC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0GQDUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RA+cmr84LABfwAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_151838_652223_078B304C 
X-CRM114-Status: UNSURE (   8.41  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
per plane that exposes a pixel format with an alpha channel but has no
blend mode property.  Neither the DE2+ mixer planes nor the DE1 backend
planes create one.

Both engines blend a layer with its own alpha channel and do not
premultiply, which is the DRM "coverage" equation, so advertise exactly
DRM_MODE_BLEND_COVERAGE and leave the register programming unchanged.

Changes in v2:
- Drop the Fixes: tag.  860e748bddcc only added the generic check; it did
  not change this driver.
- Drop the code comments; they only restated the commit message.
- Handle the DE1 backend planes too, in a separate patch, since they
  expose alpha formats as well and still warned on A10/A20/A31/A33.
- Link to v1: https://lore.kernel.org/dri-devel/20261117091932.12063-1-hsyysy@163.com/

Yang Siyuan (2):
  drm/sun4i: mixer: report coverage blending for alpha-capable planes
  drm/sun4i: backend: report coverage blending for alpha-capable planes

 drivers/gpu/drm/sun4i/sun4i_layer.c    | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 9 +++++++++
 3 files changed, 23 insertions(+)

base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.1


