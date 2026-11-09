Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911460A2625
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SMLx5WR9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwAbm3Pc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=; b=SMLx5WR9FeW+jF4Rr1cRLi+hVQ
	s2sneM9o4Z1HLVMsAZMQ9XolwzW8ObKi7us3vT7Ha8r1aXn26BGT987PTJy4q7SpuAxal8FyUoRmM
	IKdfOSforaROD8r0T+JeLEMmM2BGtaqnjR1RgZ2YZI0aELmxa4bYdQMggfggXJ55u2P2OjJUM/y7T
	j4ysuv+6KFTpPXqVfJt9d4swi0uk/IlySSFA/PF+T5swO39nBXCDHyHIV45/gr706llvHXXgT3lGl
	RdAf4cbqt2yC9UG0IUPwVZU4gM/TxOxitzhW6TzkU5a88TqbEc1m70+AXWe/eDSVercEaE+N+OUAv
	RO+amgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OLf-1IOC;
	Mon, 09 Nov 2026 17:51:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWN-00000001OIA-2bgr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b001cd92bso581418f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246665; x=1794851465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=OwAbm3Pc0kXved6ZYvfOCXZjD0hDmhcI/AAPdNRkGbfBsOJXCN6fw5A/FgvuVNf8hx
         ZXDU3bknm/LTUa6ExI6hi/Mdn2cwNh1kCqGdk8s1w9TGgbl3k3qVOahX5P4YMCSprd+k
         ESm7tZGfxM3gnIDZutr0QZJ6foEOWvtabqLvfTXLMabKWtYekYx4v9hjop6pjNTOxkqf
         WGyj3jS0Fr0xnJi/BV/8qG6jkxuQljBUCP55DsCic9Q3iXMfruA9iLobT0z/J5X0kT1A
         2nwMa2H3n3bkh10edb29jb13ywRQAigFULlyDq16BuRmVyTxV5rzhvdK9a1gK2oPPoNK
         vQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246665; x=1794851465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=AHodkJ+KmILZDvzmguhctFwchM/bNqIL53uO3veAlVj7dEE6FQ8i/KR7/lKIBNvn6H
         2fNCKvzrYVuOvqardny4jw1d2b3mi/CatxofYwYlzUI203sJ7gqx3xhdI41DB+uc7q9w
         tTvyTgsNZw84cFJPVReRmBuY5+27FN3qpPHdQqhNIDRGkGuDkspismaOME0yr2MFwgsh
         00AeTKtAWF4uyv2CVI9JSy6/xh+YtMOTATLBvT+OyCvS4JSc+SgX0kBiU1e97PrX4nnf
         ZSDkoX+uh/OJQWe43sEJzQOlLLTQJWGsMO93w0j6mp6CHxAt+9w0Pqh8PsynB7HEXk0y
         ZqXw==
X-Forwarded-Encrypted: i=1; AL+hErHshCP8EwebZCRc22OV4O1PQH58e8IUAx3u0NI5zdcRBVG85E08gDZVNYtghuNyyKiXElsPKXcqYuZ62yTg6001@lists.infradead.org
X-Gm-Message-State: APuU4Z87WcDu4H8o34yHgjLewS0y41T9E7UiyXfdjSO63BTFP9WNoToN
	v6h6i7goytKhAhx6/QL05L4phVeBCBGpvqLBVTeMxp187FbESmLrAGCd
X-Gm-Gg: AYBFou0a4HXatTpZHhHo3m1hfCBUHd/IDNac0qlBzyTWUvqRHkt6tUA2m6hnfd5zAdT
	XV0pj3okJ3fPq4Re/xFtHa8UYktjgcNRKj1Ip29FblEDP2DQE5YbP512ZPIc1rq3bMmEVdCu+0S
	8t1CApnBN3gKctRcbZx+slzdZaPuC+7QICFcUMcG5MVKIhmqsQKkk16ZYE/CqITX85fUxT/eDKF
	SRcZGNYcy0rq8ApIY4xPSKhvjyK6EuqXOHG/B8bk1Au8W4cSzngA1ZzmeCrl99Eeb3rdbVtrF2K
	IP6wJ09cSdMURfRBS04pD/OQqKew8YFFCycTyQSvH/7A6UR8dyVST2IJcTCRsOkcMlMBTWtmA4q
	TK+uaHpwZybhVi6SLaOtr0YgglXev6pp9SsnnCoXgOlnCP8xWND1ElN0WDH34scmfyv8NfIuh5L
	clstp8PSEVHoyYJUm8CGBH5yrHZIuhgy/EbHkaGqEKejG00mnJpbKOjcHIvParqQgIUYBqwTAdT
	ELYs3PSnKDo+PqebEMLKspdde7niYZ+Kp/PERV21kxOzqnwrxDk/idYDR1xEuZiTL6u67rvq65Q
	URWht1VgSNy+ohfOnkdlvi1KUwp6smJmJb5CJFruOHd9MtIJrgaPDrCUfuS7BPqR34bINAQLesg
	ZKb0+ryDYaZGGgGvi/Wm27rNqFEaMBqRAZzeMIzWnNgqwyFbqhEyB6v2i+Yjv0HRnF0leAuNyBP
	ByN0bkkT6L09n0yUtOZUlcGUhmDsvyIgeGibm/+ZDf4k3mgsAp+wuew3GxF2iPWAF5CN0plsp9q
	GmilC5b2JBz3GWJziEGNcGaXgaPtEW3urC9
X-Received: by 2002:a05:6000:3c5:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-4982e641f54mr399339f8f.17.1794246665055;
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:04 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/11] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  9 Nov 2026 18:50:05 +0100
Message-ID: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095107_685300_0394F928 
X-CRM114-Status: GOOD (  18.20  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-10 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 reject H.264/HEVC SPS and VP8 frame sizes beyond the
  hardware limits, and fail jobs whose picture doesn't fit the buffers,
  preventing memory overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8,
- patch 10 clears the sizes of the H.264 DRAM buffers on start, which
  fixes a double free when a narrow H.264 stream follows a wide one on
  the same file handle.

Patch 11 is new functionality: VP8 decoding of frames wider than 2048
pixels. It depends on patch 10.

Changes in v2:
- patches 2 and 7: check only the hardware limits in try_ctrl. Check
  whether the picture fits the buffers in the setup callbacks instead,
  which fail the job with an error buffer. try_ctrl could be bypassed
  by setting the control before the buffers were allocated (Nicolas,
  Sashiko).
- patch 2: describe what the HEVC decoder takes from the SPS.
- patch 7: limit VP8 frames to 4080 pixels in width, as the frame size
  register holds 8-bit macroblock counts.
- patch 3: pass the reference type instead of a bool (Nicolas), and
  keep the reference type of the first field when the second field of
  a pair is decoded into the same buffer (Sashiko).
- patch 4: halve the macroblock aligned height for the boundary of a
  field, like the vendor library does (Nicolas).
- patch 10: new.
- patch 11: set the DRAM buffer sizes only once both buffers are
  allocated and clear them first, so that a failed allocation or the
  data of another codec can't leave stale sizes (Sashiko).
- collected Reviewed-by tags.

v1: https://lore.kernel.org/linux-sunxi/20261102170303.1973892-1-jernej.skrabec@gmail.com/

Please take a look.

Best regards,
Jernej

Jernej Skrabec (11):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: h264: clear the DRAM buffer sizes on start
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 +++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 49 ++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 66 +++++++++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 32 +++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 +++-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 74 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 72 +++++++++++++++++-
 10 files changed, 329 insertions(+), 46 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0


