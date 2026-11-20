Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A7606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fXL3JrpM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oTx65kyCa42G6SI64CZNh6VFuumNKrrKM3+P3eJrU1M=; b=fXL3JrpMSWKPVsp6RrjccY10/r
	3WiOBu+lvjem4AV0U51PGFhrwSTur9TgGEFrHGRPDr12NRLvgOLkHHZODQYca03PWeV046SKHbv5H
	MG1i9jEZ2gYbUsCjYCle2BECbfGTJiwDvFzU/xxoeZb+LXY/QfjVuk5m2oCw6X3v26phOskd0WzcY
	vtMymvSd4hJ4Oy8wZ4A6Xjc2HPSemBYmQd00qCS2AKj5mG2ZxGU1U9R6zPI1Ak2TltNdKCAf7xeAJ
	3DTUH8yITJMOvxl5XUK29VDJ27RTip5G3tBRz+RpwjCi4+Gx60RimWuPRS6J0Rjn3UpiPoWSmQE0B
	0En5w3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYEL-0000000GQxj-3inR;
	Fri, 20 Nov 2026 23:41:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYEH-0000000GQwx-3qbK;
	Fri, 20 Nov 2026 23:41:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYE8-000000002dn-3NMw;
	Fri, 20 Nov 2026 23:41:08 +0000
Date: Fri, 20 Nov 2026 23:41:00 +0000
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
Subject: [PATCH v2 0/7] media: rkvdec: Fix the HEVC reference picture set
 handling
Message-ID: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154117_968171_AD8E0648 
X-CRM114-Status: GOOD (  19.47  )
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

This series fixes how the VDPU381 and VDPU383 HEVC back ends of the
rkvdec driver handle the EXT_SPS_ST_RPS and EXT_SPS_LT_RPS controls.
The defects were found while bringing up the VDPU346 of the RK3568,
which uses the VDPU381 back end, on top of Christian Hewitt's VDPU346
series [1], which has since been continued in [2].

Patch 1 looks up the controls after the request was applied instead of
before, which fixes a use-after-free.

Patches 2 and 3 are about jobs which cannot be decoded because the RPS
controls are missing. The VDPU383 back end now completes the request
when it refuses such a job, and the VDPU381 back end refuses the job
as well instead of starting the hardware.

Patch 4 refuses RPS controls with fewer elements than the SPS counts,
and patch 5 limits the size of predicted short-term sets. Both fix out
of bounds accesses which userspace can trigger.

Patch 6 fixes wrong decoding caused by a short-term RPS cache which
only looked at the first set, and patch 7 adds a missing allocation
check.

Patches 1 to 6 carry Cc: stable, like the EXT SPS RPS bounds merged in
v7.3 (f0b9d7e5be06, 796b5c6d4f16, 052c5ed5a1d9).

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

All of this was done with v1. v2 changes the order of the patches and
the commit messages, the code after the series is the same as in v1,
and the tests were not repeated.

An LLM coding agent did the analysis, and helped with writing the
patches. A second instance, given only the code, reviewed the series,
and has tested and validated it on real hardware independently.

Changes since v1:
- Move "media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets"
  before the check of the control size (5/7 -> 3/7). A control which is
  too short is handled like a missing one, and this way that means a
  refused job in both back ends as soon as the check exists, instead
  of a decode with a stale RPS table on the VDPU381 (Nicolas Dufresne)
- Rename "media: rkvdec: hevc: bound the RPS reads by the control size"
  to "media: rkvdec: hevc: refuse RPS controls shorter than the SPS
  counts" (3/7 -> 4/7)
- Rewrite all commit messages: say what is wrong and what the patch
  achieves, without walking through the code (Nicolas Dufresne)
- State in patch 4 why the size cannot be checked when the control is
  set (Nicolas Dufresne)
- Rebase on linux-next
- No change to the code after the series

v1: https://lore.kernel.org/r/cover.1794645268.git.daniel@makrotopia.org

[1] https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
[2] https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org

Daniel Golle (7):
  media: rkvdec: hevc: apply request controls first
  media: rkvdec: vdpu383: complete refused HEVC requests
  media: rkvdec: vdpu381: refuse HEVC jobs without RPS sets
  media: rkvdec: hevc: refuse RPS controls shorter than the SPS counts
  media: rkvdec: hevc: bound predicted short-term RPS sets
  media: rkvdec: hevc: cache every short-term RPS set
  media: rkvdec: hevc: check the RPS scratch allocation

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 52 +++++++++++++------
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 11 +++-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 24 +++++----
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 14 +++--
 4 files changed, 67 insertions(+), 34 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.1

