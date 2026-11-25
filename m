Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BC3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCjjjYDC;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bvNh/6Sc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h9oz9ZX75jLl27zGMU0EZbwitthKgOAuL1pSdwkipY8=; b=mCjjjYDCMDLNET/9PNbPyLIWwC
	ey7b6tmpZI1oj5AKnQlpi19m7CtcsdqVUjLJx+IBay5GXiEfZGG2o0aq2ZRbj+X1xGebpUboIWe9P
	GSQjY8KRtKFZER0pkpX47lvIPxczpFjlDXO8i3iCa5LkxAKJp0R67xT8vLPM+ivBpQgCkSqVXh/Xl
	lLFpWMxMjWjQvEcrBGZU/EXyy3FvWN8Q/gv5KzB/tGnZXmElQg9lNWL0h6lZVb1nZWCocT7W5UpWQ
	glcqqilxmKQ4nxyMiKCY3eb/mYFR8/DpUpplp6/+V/RQjQ7h66xH1BKUBwDjvskYO+wYUcLPkWECQ
	Pt8InjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC7F-00000009pV5-0HPz;
	Wed, 25 Nov 2026 12:28:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC6z-00000009pRj-0WaE;
	Wed, 25 Nov 2026 12:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609710;
	bh=kFutpMOmKxFZ0rBso9Z3YVADXZ3+qT8JE7mDNLDaUVI=;
	h=From:To:Cc:Subject:Date:From;
	b=bvNh/6ScYXMqD3WNN728ILpXI3U5edQ9ZwCqpfcT+IWC3a81qYKwtK5alP5bp/TmJ
	 6CMdN2fljaqvn/U6gElgn1pFHG3YtOZHZ8zFmCU3CuYp+E5OaM8NNdnRasmjTw55PB
	 QqIH1YbgyC9tr8gW/J7/OAROMJISq2FSg2lO9wcOy0fQjvbsMKl7sI7J0SZT5/AZVw
	 YXZskSn2IqNRcNfbpbJWfo71Jy0T1cpa0oGRywiXfDmK7C2Zg3yVdWJSjekcYIy6Ti
	 A1F/Lif4cKHJJNNfB19fHInuNNRUPSJUYEgVX5xdw2jv3zkduJpMc1pDiIKEk/zL7B
	 CUJiBEGBCHvyA==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A13217E0075;
	Wed, 25 Nov 2026 13:28:30 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 0/4] media: verisilicon: Create AV1 helper library
Date: Wed, 25 Nov 2026 13:28:21 +0100
Message-ID: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042837_114549_5DEC74EC 
X-CRM114-Status: GOOD (  11.30  )
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

Regroup all none hardware related AV1 functions into a helper library.
The goal is to avoid code duplication for future AV1 codecs.

Tested on rock 5b board Fluster score remains the same 204/241.

changes in v9:
- Split core changes and drivers changes
- Add V4L2_AV1_REF_FRAME_INVALID
- Rework checks in validate_av1_reference_index() to be sure that
  all values of ref_frame_idx[] are in the correct range.

changes in v8
- check reference frame index when validating the frame before
  calling the driver.
- add Reviewed-by tag and CC stable kernel.

changes in v7:
- prepend 2 patches with Fixes tag for backport
- rebase the series on v7.4-rc3 tag

changes in v6:
- include b84f6533a8ed ("media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer")
  and 367db8b23c26 ("media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity")
  fixes into the patch to not losing these improvements.


Benjamin Gaignard (4):
  media: v4l2-ctrls: validate AV1 reference frame index
  media: verisilicon: Use V4L2_AV1_PRIMARY_REF_NONE and
    V4L2_AV1_REF_FRAME_INVALID
  media: verisilicon: AV1: Fix luma size
  media: verisilicon: Create AV1 helper library

 drivers/media/platform/verisilicon/Makefile   |    7 +-
 .../media/platform/verisilicon/hantro_av1.c   |  807 ++++++++++++
 .../media/platform/verisilicon/hantro_av1.h   |   64 +
 ...entropymode.c => hantro_av1_entropymode.c} |   18 +-
 ...entropymode.h => hantro_av1_entropymode.h} |   18 +-
 ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  125 +-
 .../verisilicon/hantro_av1_filmgrain.h        |   48 +
 .../media/platform/verisilicon/hantro_hw.h    |    7 +-
 .../verisilicon/rockchip_av1_filmgrain.h      |   36 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 1082 ++---------------
 .../platform/verisilicon/rockchip_vpu_hw.c    |    7 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   30 +
 include/uapi/linux/v4l2-controls.h            |    2 +
 13 files changed, 1163 insertions(+), 1088 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

-- 
2.53.0


