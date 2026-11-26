Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CBA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u2qyasFS;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fjvsRNs1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=; b=u2qyasFSbURpWpQ8w+pZdM9Dmf
	17GwsnD7PH8QJ+GPIwlrSsCL5XkeI+iNdnQWJFDM+LXxU/2XQr7Py9MegWS5vLwk15hE/K+QYoRIT
	wJ3+uP/oBJSqwNo/R7k6Hn0izk1Z/97gqa9VSyFZlxSYKaAHhaQ2FmNLQIY6+1zOBbVQhgEnr4S0W
	Xvt0nBdzkPqUWP3PhviubgfPH9AF38pGkadqbjffSvgMeKs3btcNvScJ9K3lOXNR4shXuCJ9Xw0ck
	wJMmPFqJZ+0w6GqOZzSI9DlSz7mwGnLg/m3C92pqpub6urm+TccX12Nxu3QpIm9d2gBO8+M7UNqbp
	7WJDa+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfb-0000000CGAV-2EEr;
	Thu, 26 Nov 2026 07:13:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTfZ-0000000CG9t-0zqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f04bea9a93so59400705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677204; x=1796282004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=fjvsRNs1DUlMSUtxB/lg3vzQ5C8LjmVjUt0eK357uh88h2Kk73DE36EMDSVvhySWNU
         iN7FLOLbSVOVGut8LqeN17en1z1Dibh0tTTpld5/s/iDwbUZTi78iXhPla/vjbMIr0PG
         FIYZwHyCi5f6bSEFlzZx3CnAWg0nKFOVxYrq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677204; x=1796282004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=1Scl1kr+vcrHpyurtl2I16Zt5XcTgk2q+kVQyETNQp5qdoQ8xtr1FuyxjoFFUeuvhQ
         FkciRDY5kYxNHHU/BgtSpWJ5JsWyBw0wrDT8vb1I6hJ3SGa37ZBZMjWNRDBq96BZQPO5
         7JVJs/nhMXGgOk2jcENLMusv4rfU3ACr6myN/zg7H+vjaQulpkUbZVjOH70bVXqSQdHo
         u4r/RAimsuCyHcHoyoA5rfPcOyApM0ES8W6PB6LgYCt6VrS5WaBsLF7QOnsaftKUkjtz
         x+noyHyOvY32C4u7jaeWQZLfD1iuCXC8aMB3yG4uRnuB4AI4+8Sn8RYUhlpZhMCUNIDX
         fZ1Q==
X-Forwarded-Encrypted: i=1; AL+hErGYWaZeB91QhBBJSd4gK4aW8y1zgrxScoNnFABKsalCMy4GDjapi1OdRg7Dd3Ci+SN+Hfs9Rldy9JigyWAuFdHP@lists.infradead.org
X-Gm-Message-State: APuU4Z8AaPrzLVUFVAyORfbuR+dPC5h2hdvWhxatjKxQYIN/IkcoNWWp
	zSxsWv/6AtGVsOWqi910u2ayY1NxfISMfDnQ/TQQgwb3J/jUHr2n8Vi2bfHxUf+Wzw==
X-Gm-Gg: AZFdTZfNY6mCQsPszP7A3vjMid2n41GrLPuib8nw7Q8G7Fn050xxiQGC+cw7mOWyMlu
	vWqcaCW4Kpdjl6T5z0PmWBp5YNP8sSv8WwWf0o4h94m6zrq43Es1whgv0Hv05YBEhpfcsJ8k+Ek
	F+GPQSCtc6/tjbijJdMesX/L0D+PcrRfm2d8mDis4TurrEozQecatmmyHgLoTcsnLy9mSfgv6Xk
	d86RJ1K91lJXMNdNg+Dqi5HLm9+ll/7ik2zucXg5yHdJCmorWl6PgSbQesD2Sy+gF+Ap9zeMz28
	edHvIxIQ6mTEq0EUUnmPzRKlqTjV2O5BWTItKROR2j10oQ7j3SylXscZ5edPFu96tptGEG8zGVb
	k3EtpqzTXasYd6ZBTTH4VXtCpdVGCHpEf9fGD6T/ecYr1kXtCujWaXgqkiPQKkYWJM5kgTpxpC0
	VdJGLkNvzKxJi8NR/mywXwcYcOqbfZGaXS5b4QwzLuj0IqcjcD/T6FEZzCQjYsLryLXsaN5ONXH
	5bq3eLajhHaJ9bIXrgCI8uXGPmj9qoBwq9o5DccLEczxbzglS3O5ASUDELQK+zJXMV8fDFaXgJF
	7qG/jz2ybGL993LVO++BkOqrTXUaZ0ut2N6Mi/nm8Rq2Y/5PCiTfKdLP/Ri+
X-Received: by 2002:a17:902:ef45:b0:2ed:8bce:aa38 with SMTP id d9443c01a7336-2f03efb1064mr209959425ad.3.1795677204222;
        Wed, 25 Nov 2026 23:13:24 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120016sm99270965ad.58.2026.11.25.23.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:23 -0800 (PST)
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
Subject: [PATCH RFT v4 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Thu, 26 Nov 2026 15:12:48 +0800
Message-ID: <20261126071314.253890-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231325_310381_7748888D 
X-CRM114-Status: GOOD (  17.23  )
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

This is v4 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v3:
- Expanded drm_fb_dma_get_gem_clipped_addr() kernel-doc to explain clipping
  and added an inline comment highlighting the clipped source coordinates
  (Thomas)
- Collected Reviewed-by tags on patches 1-3 and Tested-by on patch 3
  (Thomas, Jernej)
- Link to v3: https://lore.kernel.org/all/20261124074041.115251-1-wenst@chromium.org/

Changes since v2:
- Changed drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and used mul_u32_u32() to avoid 32-bit overflow (Thomas)
- Link to v2: https://lore.kernel.org/all/20260916033327.3054126-1-wenst@chromium.org/

Changes since v1:
- Added and used new drm_framebuffer_get_block_offset() helper (Thomas)
- Link to v1: https://lore.kernel.org/all/20260908090745.1089143-1-wenst@chromium.org/


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


Patches 1-3 are reviewed and the sun4i changes (patch 3) have been tested
by Jernej. Please help review and test the imx/dc and imx/dcss changes
(patches 4 and 5), which are only compile tested on my end. The imx/dcss
changes should not have any behavioral difference.

My plan is to merge patches 1-3 in a couple days. Patches 4 and 5 can be
merged after they have been tested.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 74 ++++++++++++++++----------
 drivers/gpu/drm/drm_framebuffer.c      | 46 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 +++++-------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 132 insertions(+), 51 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


