Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E639F60A262D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPLSNKd3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4VwE87c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=; b=zPLSNKd3qOfg0bEqJJUhONlt+u
	oK5QysYa7zf45nTSHs9e66Bq57XZZ9JkrjdtTXNbo1V2Gab8xv3Kfv658WhkQ3d/uAo41bUJmjnGr
	O9fSuCRmusbhqvQUndE90cpJsw3yRHlbu/USLbauWWT9yN6LEU2hFN+9Rdz5P8RsHXuQJiqPT/KI0
	ZouMNp192+UZLbQJXc1qBp4PBS39HQvaIn9bX6UkUfaTEEL6fveWqQs00uGokwXLeWikbVHrRBj6H
	ZlcaBgCuN0k2HaLOc70RU00VM8XF4y/PU4ZU81EuRYJwoAg+O346nWl9wpipvX7U5alSKwMnPz9oS
	cWNa6ykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSX-0000000H6bb-2k96;
	Sun, 15 Nov 2026 06:11:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSTSU-0000000H6ar-2yaz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 06:11:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so1247615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 22:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723081; x=1795327881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=d4VwE87cp9JotJcc+jTuKE9D4iDqhkD+9zDOWRxSfYrmrKJXVLbnyo1tYiY+8O22o8
         PGYG6uJvqcm9yYymSYK5zGHwDzie4UTtzxfSW9PYG+fDyrCIzb0EAEq9M8VVDaZRA/BJ
         i1EGWnHdd/tVWOyZzN1SXD3V1/WvIWTePW2RekqngCml4ahNal8WJ3TDI77ZannJqLsZ
         wz3i0iiTLFQc/d6Lt9csR+OvjxMXsXaSWBhLRDePPLwEwayECY9UGYx3rnbQo6faHXjd
         5KNkNLUQknAESzAehBD+uEt8Ny9SBpVIxgoD8te6v7JxVy3FskjmTBToPd/cMEwlDNPv
         4Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723081; x=1795327881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jucsGGsP4A94CkjewiCz+sSfRnTZY+EbzcNS/u6Mk/w=;
        b=UkYIKVe1JwXjbMxaj/PHDKdUF1bqYalYIGjVTWRZJ9DfV5lJo/dEAetAH9kjBLGlxw
         dIT+H6mDy/DA1RLF4ShXYuDswIJ/l/1iwNli5DsWYaTnBe3YBPq5TMlZLjuWAMgsrZcv
         3jV9Zb5O6hcPY5334Nrhe3xE/SLfA8qCvk4mgRTGVYtTFy42+Q/GJEXt+DExNHXjmFjt
         bOZTDB2dc6c6+YiMcyroQBuPAxPAMSTa2o+lybks8p3MSe7PkZ5FoEXr+bkALrQq4sSl
         +NW2OlyE/WG4zroBhRICMvQ0wrtdtH4vGFfAUYiOa5FZUq+UWjOB421Rh7wefrc2YMsM
         BE2Q==
X-Forwarded-Encrypted: i=1; AL+hErFrwoqsDixzJN0d2ahVUKLPpEBXdrFb302UeN5m4ERZs6lMj6FpeyCm0jyC1GFLUDRylpa6V8CGyN2dvYw07Otm@lists.infradead.org
X-Gm-Message-State: APuU4Z+QNclaL2JF/PNqeHunWwyav3pX/O7VtWseXWo8WpPvR792XMpP
	aX7aDgSjWTnOXonW7W7qtJvPCF6LIhKsgQg+55kR4eO/AYhmSSTWzfq9
X-Gm-Gg: AYBFou2PKmT62sk57owztfpiSiQsh/vG8ULpETGvsqx7XsqLLrGPGYvyq0UqnF+btY5
	VdsLcxDjUm55pQKN17iwhpWga/tRHmofZ4Acpf5RuShjS11VZYsfaj23O5hX7shRc4ZD7tYgXgC
	521hzgGDXiraLLjwf7B+bk0xDyuvcXC/xICeQgBoc8oGeAeB+eFNCNrVxupoj+R3lCWePZ4Sqck
	hBCpTKYHawDBSttR7V0K0Ro7V5octz0ovbshRL323xwRxr5/+zfqnZb4uEj0LN/xKbfUFnwyce0
	iVAplr2Q44tLB8dVQoRZMi41sI6AFsI7arS8W1LG14Fp02rkM7+PVj5BxuZZ0ffWKBkgRmJO7mz
	8hb88prZPotBYJuwUG6iGqYH2q9a6X61HuRTKwFnd8qfaYrblzq2fVvg+p+KSNYhxjm3GTuWYx4
	kuphWHQlWbcIOXwqP48A0KTO+wrYCfnUEHDDnOEbWvpqZRd/++WuR1GEd7B69Sq7qfNwhVnxh6P
	i9BP4n1no4ABrF023pe2QowqP5HApdvcw3Wz2RScyAu99x4Rn8Uj3a5c79v0KcdaohVTkxYNcqt
	2bgZb3sIYcNN9Ki5Q0GFh4Utqmif5DTkz4Gc0xn1miFBUzTjIrWVmDaCb3vOVknKnsw0RRGqavk
	9sQajpIEptOB53Ip+YCgE08EyFDBSozFpiOJHrP2DLwXrFslsVHhCM89JUTtkTqO95RXTNb/Vyc
	c1r3BgVrk9CbCiOKqTmdaFP6hUEpXgpEDO4LOupsBeTddxzvsaMwT2VnQ7DE6Rb+GJXyjuZmoxI
	02qsnMOK6CTjw==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr148514035e9.13.1794723080596;
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] drm/sun4i: update DE33 support
Date: Sun, 15 Nov 2026 07:10:54 +0100
Message-ID: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_221122_800809_05639CCC 
X-CRM114-Status: GOOD (  15.85  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Issue with existing binding
is that it considers planes as resource which is hardwired to each mixer
as it was done on older Display Engine generations (DE3 and lower). That
is not the case anymore. This series introduces new driver for planes
management, which allows doing proper plane assignments.

Note that this series intentionally breaks existing H616 DE33 mixer
binding, which was released in v6.17. Old binding can't describe shared
planes, so second mixer can't be supported with it, and it never had any
user - there is no H616 Display Engine node in upstream DT, rest of H616
display pipeline is not upstream yet and no other known DT consumer
implements it. Reasons are documented in patch 7 and driver prints error
asking to update DT if old binding is detected (patch 8). See v2
discussion for more details.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

Changes since v2:
- rebased on v7.4-rc3+ (mainline sun4i fixes)
- patch 1: explain in commit message that DE33 has only one bus clock
- patch 2: don't register regmap with syscon, drop preset plane mapping
  and reword commit message
- patch 4: don't expose YCbCr color properties on planes without YUV
  formats (kept Chen-Yu's R-b)
- patch 5: collected Krzysztof's R-b
- patch 6: renamed, get mapping regmap from display clocks device and
  add device link instead of using syscon, defer probe until display
  clocks are bound, set drvdata only after mapping is initialized,
  register driver from mixer module instead of module_platform_driver()
- patch 7: explain in commit message why old binding is incompatible and
  will not be supported
- patch 8: renamed, initialize blender pipe modes for DE33, add device
  link to planes device, limit DE33 display regmap to its 128 KiB region,
  print error asking to update DT when old binding is detected

Link to v2: https://lore.kernel.org/linux-sunxi/20260509190015.79086-1-jernej.skrabec@siol.net/
Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add DE33 shared plane driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: Switch DE33 to split plane bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  82 ++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 215 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 193 +++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  72 ++++--
 11 files changed, 663 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0


