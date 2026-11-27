Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76301606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKKcqXiJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6rOglQp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=; b=XKKcqXiJSBmrbSOUdJVECsmEC1
	GP6VlSi12W/n5Rno6bduhA859yRmj6raUNQQxcButdodW8YMY17nX01EufaTlslrETKnE+TwKgYUB
	Ih1Do98VmzOeryf3dtWHCe9i+6O5Nw3CR5/cbCEQwIErVcNFKr/CzAoIZU1nkTobKM7Vu0CVksX2m
	lwJyMAZGFymwBchpCKUkdicmjqSudAdL4VpLoQemrLc0rSW9jrwq7l2PRQjlnSb68H2BSuwgpL967
	KFLyf2IQNf6Qb+gtSQe1qQIvzpCBIi9S5DDsfK5XuEKoXfikzp8dpCq92+m/60+15Wr8UESrMrrAE
	B8Mpxomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWprq-0000000F5Gg-3BX0;
	Fri, 27 Nov 2026 06:55:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWprm-0000000F5Fn-3kzv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:55:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so70123235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762529; x=1796367329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=q6rOglQpf6veG5xikCqc8OQGiqIr8mEiQR48HfRgr+IDw39kD1uK8VXHBgTgIS0pcd
         ghkTQhFEIHio9bVEJhzT7D8hpJfyOG0AvjCFO3ZIB6kY8Z0qaqT/6rNOuovPbExh6Hvu
         2bfwFnk1NSfxdbTTkMbJpaTr81pHS2s5ck5thUQBKMiq8uHv2EFbJgKv0QAe5Msg3bi8
         KMSYBvgp4s4Hk1Q20RsqmGFamMTbo6FglW/UW7DBYdgiZt9QsSlKt+Bo0UvecJ6IbAKO
         sCJnYRIQ6E0RUKKvVF9caAikWsMtOlWEXAmtzkrQo4eLBZucOJF7R2YUryTsZeIHex8Q
         KWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762529; x=1796367329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=H/M2D16Wu5wjNiQb8AzMOBVyMmhz6ZoLiH49bHmIpPLUcPCabC9Vs2AAhrlNYpVbKk
         FAMQvrIXSKYeq7Fagq9XzIV+Imif5hAy+Ugter8DuxdOF4356rKCuzXDM0HRPyRroK29
         Mp6vBWNr6gHZuQq54H8zG0cApzz0iDcWlWilCLT3fx7UYYnMluNb7Qf5L3Db7ouWZPex
         Lmpn3YciIWCS+XFx00a/PgdQQcSx/79gS/V1qX9Hhb3tE8JbwbetHJGhP68NQZI9zSiX
         1KWo0uILKhAzvWjpoJ3Do6jvwloe5/pIOQdn38tKJBSVm0yZUmSJe/WsIoG6tpmKt2eZ
         q7Zg==
X-Forwarded-Encrypted: i=1; AL+hErF5ZSGOOiOItjT8/uL3b0pHQf/8pW9quA9adsGUjGeBRFU8r1Zp5PsjRjb5V9qSf6Bn1fmRamw90VJ9iWPraTcE@lists.infradead.org
X-Gm-Message-State: APuU4Z/poVxewIaf0j1KWvWsC5N1/Jtc2yvjjS/bDV7lGESsx+rU12x8
	ZBbQm545ii3JBYwu33Bg/V9Vbm2xf+bU3whonLXq0ZVVXinfpe4jOab1
X-Gm-Gg: AZFdTZdOIiLIbKuyaGuzUxROog8TXFD/tE0CccAb2OZnqnWfcdUnLLncVpwizArdVz/
	n2CaH7mSis19BPwi8ChXR8UcMAHtulCJ7B+o2ppI9XTHlYWb007XdLPtwazz2xp44WrTM/7nyKf
	l682ADsrwYfYGvuIsXWX855755iQwRB286//eziqS5+aP6aSGqXJU9EZ8pSjI2CS9oN6cWjlCbx
	Iow5DVSDUCULccYoFwRUprwL366VTOc/bTw5xlMvdQ9zJR0kUP5ydrDvy4fR/gckBM+hjd8LBA1
	5IobtxaKy9ADHg08cceRTSSFyA0w/118+SUfTjdkBbwW0LLxwFMDq2l6xoKazdiUWFxbAXjfFk5
	unzzngMew0OoexqZ6AxZIHGdTrtktUNnJ3Qu1GHH5RgEz/dPsKMad2doRU8PRFBeAQcTKQG8MCT
	fffHl7e46JrrdToP1pNQ/0184c+Ir1155pMP8a5OD1HjmHysWpKRdvsp6jC2JlPyLlQykU67TYg
	/AGp+xDhfV3dAWJZcCSX8zAwURd8UtLswadyQWY5PrjrCkukBUn+TwneOVUPBtolBjAL/n50o9e
	mMz493QQhNPw6NZ5S//fDk+Vq283hAEEZh2KTe0XTdcgtONnJhdg8GNfLVPD7FabEzlrfcPfxcd
	Y67EaDIoJsWUkOuY0RJfZATmFApi7Mt8ke0xWuHOCtF1OwOOcl5B0v2I9rUGhSIxPOTpA/kpRyx
	uE7Vs4RNe4jvqApEp/U9ZTe6P89FpxfvUquAd3/DgKJFUx3mETNW3Lwdz0hoIomUYP40q2ULe9y
	OB73qOCAVI6m801WHF0USl6Y2buzIDoohZ+UCOpdvBH/AlrUulEGguUaeXiZ4w=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr501199575e9.30.1795762528879;
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
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
Subject: [PATCH 0/3] staging: media: cedrus: add VP9 decoding for H616
Date: Fri, 27 Nov 2026 07:55:20 +0100
Message-ID: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225530_959352_547B18D9 
X-CRM114-Status: GOOD (  19.66  )
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

This series adds VP9 decoding to the Cedrus driver for the H616 video
engine, which runs VP9 in its H.265 engine.

The backward probability adaptation is done in the driver with the
v4l2 VP9 helpers, using the symbol counts the hardware writes back.

Patches 1 and 2 are preparation: the output line stride is taken from
the capture format, and the format check is moved into a helper.

Patch 3 adds VP9 decoding. Like H.265, 10-bit frames are output with 8
bits per sample for now. P010 output for 10-bit VP9 and H.265 will
follow in a separate series. The decoder core is reset after every VP9
frame, as an H.265 picture of another context decoded next fails
otherwise.

The series is based on my Cedrus fixes series [1], which it depends on.
It doesn't depend on any other pending Cedrus work.

Testing
-------

All testing was done on an H616 board (T95 Max, 4 GiB DDR3, VE at
600 MHz) with FFmpeg's v4l2-request hwaccel. Hardware output was
compared per frame with the libvpx MD5 files or with FFmpeg's software
decoder; the other capture formats were compared plane by plane against
NV12 output, using an LD_PRELOAD shim that forces the capture format.
The 10-bit decoding itself was also checked with the P010 output of the
follow-up series, which matches the libvpx MD5 files.

Results:
 - libvpx test vectors (303 profile 0, the profile 2 4:2:0 10-bit one):
   275 match the libvpx MD5 files frame by frame, the failures are
   listed below.
 - fluster VP9-TEST-VECTORS: 242/305, the same vectors fail with
   FFmpeg's software decoder (FFmpeg rescales frames after a size
   change, so the stream MD5 of resized vectors can't match).
   VP9-TEST-VECTORS-HIGH: 5/6, the 10-bit 4:2:0 vector fails as its
   output has 8 bits per sample, the others are 4:2:2, 4:4:4 or 12-bit
   and decoded in software.
 - fluster JCT-VC-HEVC_V1 (129/147), JVT-AVC_V1 (130/135),
   VP8-TEST-VECTORS (59/61) and MPEG2_VIDEO-MAIN (7/43): same results
   as without this series.
 - v4l2-compliance: 49 tests, 0 failures, 0 warnings. A test program for
   invalid VP9 controls, formats and jobs (57 cases) passes.
 - NV21, YU12, YV12 and, for 8-bit, ST12 output of 12 8-bit and 10-bit
   VP9 streams (66x66 to 1920x1080) match NV12 output.
 - Decoding VP9 and H.265 streams in parallel instances, in 46
   combinations with each other and with H.264 and MPEG-2, gives the
   same output as decoding them alone. Heavier parallel loads need the
   decoder reset before every picture from a follow-up series.
 - No IOMMU faults or timeouts in any of the above.

Known failures:
 - vp92-2-20-10bit-yuv420: the output has 8 bits per sample.
 - resize vectors (vp90-2-21-resize_inter_*, vp90-2-05-resize,
   vp90-2-18-resize): FFmpeg reallocates the capture buffers on the
   frame size change and then refers to frames of a different size,
   which the hardware can't scale with this buffer layout.
 - vp90-2-13-largescaling: not supported by the hardware.
 - vp90-2-22-svc_1280x720_3: inter-layer prediction from a different
   size, for the same reason as the resize vectors. FFmpeg's software
   decoder fails it as well.

[1] https://lore.kernel.org/r/20261109175016.42061-1-jernej.skrabec@gmail.com

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  staging: media: cedrus: take the output line stride from the capture
    format
  staging: media: cedrus: factor out the format check
  staging: media: cedrus: add VP9 decoding support

 drivers/staging/media/sunxi/cedrus/Makefile   |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   53 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   35 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |    7 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   28 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |    1 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  131 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |   50 +-
 .../staging/media/sunxi/cedrus/cedrus_vp9.c   | 1253 +++++++++++++++++
 9 files changed, 1548 insertions(+), 12 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp9.c


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
prerequisite-patch-id: 032ac086f7ba6944b648a3581a1c287ee06c42c9
prerequisite-patch-id: 30e6f5a647b929dcf501225d403dc1f68436079f
prerequisite-patch-id: 309f0f4b5228ee3b0d3e3b80426429a67e238d53
prerequisite-patch-id: a448a9c72886221eb9b1aea1778a88e163d96309
prerequisite-patch-id: c49f2932a2258bcf000e0e4907e9636b2958b350
prerequisite-patch-id: 3c5110c4b6f13079a09733b972de4cbf38d3119a
prerequisite-patch-id: 78a7e370ba08a94aaaf4cbce49f89432151a9089
prerequisite-patch-id: f62f865eccdab559e9effea5b002b227fc0e3bbf
prerequisite-patch-id: 9a09dbecbbba3731dd2518606a02e12d58e433a6
prerequisite-patch-id: a952ffa6ed148ba0f6b9f5253848b7c8fb2f89a8
prerequisite-patch-id: 9879769cc1ed540f2739c2bf8b43b42a41c6ad8b
-- 
2.43.0


