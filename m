Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36481606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3Y0Endk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0a134dRu9X1Ur1sERYIUKdBcEn24h4Yr/weNnFMNKh4=; b=h3Y0EndkGRma4dHhFhpOEqL+A3
	esPpwb6qxpf2/82SkWz7KBsyBjz1TLY9rbaqH3Xp4+xubE4frPlJnuQu1rd/dxeeivAvLDPiOUiqE
	tzNYhzt7DfsI5WIaTfr7x2eWF5KFPnY5k/v4mPUBDap9wBGMwfv0VgtIbWmVsyt4BCQBGMf99bT7n
	lKcWHzISmTa0CMFpt6rMj6AS9hNdxHEZ04zCbMZUz81hk3kBnLyMZ15F/uTdMDVAlxIMfb3Q/VKUZ
	7lnJMc7cmSAGTgDXyDzC6HofIFZsRNOR+7Gf6XP5RxYg3o+CGF/HRNH4UohYPNs6U3+j5CR7eMHzM
	EqGG2OuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuF-0000000Fk4m-1O62;
	Sat, 14 Nov 2026 10:22:47 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuD-0000000Fk4E-1QdJ;
	Sat, 14 Nov 2026 10:22:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAu2-000000003aK-0npT;
	Sat, 14 Nov 2026 10:22:34 +0000
Date: Sat, 14 Nov 2026 10:22:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] media: rkvdec: Fix the HEVC reference picture set
 handling
Message-ID: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022245_405848_D4BD43DC 
X-CRM114-Status: GOOD (  10.32  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes the code the VDPU381 and VDPU383 back ends of the
rkvdec driver share for the HEVC EXT_SPS_ST_RPS and EXT_SPS_LT_RPS
controls. The defects were found while bringing up the VDPU346 of the
RK3568, which uses the VDPU381 back end, on top of Christian Hewitt's
VDPU346 series (last posted as v3:
https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com).

Several are memory-safety fixes for input a userspace V4L2 client can
submit to the decoder, and carry Cc: stable like the EXT SPS RPS bounds
merged in v7.3 (f0b9d7e5be06, 796b5c6d4f16, 052c5ed5a1d9).

Tested on a NanoPi R5C (RK3568) with Linux 6.18 and the VDPU346 series
backported: GStreamer fluster JCT-VC-HEVC_V1 stays at 140/147, an FFmpeg
v4l2request build that sets the RPS controls confirms the reads and the
short-term set cache, and the VDPU381 refusal removes a watchdog reset
of the RK3568. The same VDPU381 back end was exercised on a Radxa ROCK
5B (RK3588): H.264, HEVC and VP9 decode through rkvdec with no kernel
message across the fluster runs (HEVC 146/147), a per-patch A/B sweep
and a 30-minute stability run, at the baseline throughput. The VDPU383
back end has no hardware here, the code-only patches have no reproducer,
and nothing was tested on an RK3576.

An LLM coding agent did the analysis, and helped with writing the
patches. A second instance, given only the code, reviewed the series,
and has tested and validated it on real hardware independently.

Daniel Golle (7):
  media: rkvdec: hevc: apply request controls first
  media: rkvdec: vdpu383: complete refused HEVC requests
  media: rkvdec: hevc: bound the RPS reads by the control size
  media: rkvdec: hevc: bound predicted short-term RPS sets
  media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
  media: rkvdec: hevc: cache every short-term RPS set
  media: rkvdec: hevc: check the RPS scratch allocation

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 52 +++++++++++++------
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 11 +++-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 24 +++++----
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 14 +++--
 4 files changed, 67 insertions(+), 34 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

