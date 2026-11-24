Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C5606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=omRzDcnM;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gyDidKN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hWtVYr3EPFbm5FPt/2PvWHxmtKWC1YaK9F5RGTOmkh4=; b=omRzDcnMSAzuHFenUEzh2bFGRW
	AwXuXKqKSVjuV0EqckupGNYcFzlBL6nNV6BUahPkQgCA81cp5qfyPj7QzrTdjFdKB47MHNN0nB5Ue
	LDTP1PO36JjKj2oAQXu0+AS9Yx8yZt7j+0Wy8bdmbyYL2qAbOcHSM135AfKq8Dya74bw5q5/DxLuo
	TcmMRcM+cCWv37eQ4M6tu57zzQre3uTe61DD8Y10U1YgVGdnBjkJT9AlDJWBByt5R6FNBfrYBnl6T
	GIhZEaiaGhgpNruC0ofHxfGtHxqjvX+aST9VF2SFt5bITaXzpn3sDvZEgXFqA3oo2K1KG8KtpyyEU
	9fB4OLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPk-00000006bmf-2cWU;
	Tue, 24 Nov 2026 13:18:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPi-00000006blD-39XZ;
	Tue, 24 Nov 2026 13:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795526303;
	bh=moP8vv2wP7RX1Y1U0tW7Ss00Ce8Mu0E7W8FXoYpANng=;
	h=From:To:Cc:Subject:Date:From;
	b=gyDidKN2dOXtWDmMtA66VdhSFhW038OZigyRLYV2d8xzwxrQlBL7yoITK8W116gd+
	 JAoNypsTpA9khgIBOjCUidPXbdmjIcTn7sYkEYLM3mxqhCUFckfcXkXyK/ggnP7Y34
	 jedo0lyuC9yvHg6digpCBqswyzZ/1UaqH/dirMoRo/rrb+vLt1jkGDleBVzoNKoqkp
	 Ivsf7AA64RmevAi49t4na1IsS26v5VQLj/R93EwNXp97xFXgqwE6bCGbgcItlxh+ac
	 PTxuDdrPhMv85Kf05RX/a4q6gmoicjwi23URi8+KU+Y0kAHcuKhRH83VTDDArhfISf
	 xg1LiPLTS20cg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D11617E09ED;
	Tue, 24 Nov 2026 14:18:23 +0100 (CET)
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
Subject: [PATCH v8 0/3] media: verisilicon: Create AV1 helper library
Date: Tue, 24 Nov 2026 14:18:13 +0100
Message-ID: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051826_968037_266D93D2 
X-CRM114-Status: GOOD (  10.77  )
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

Benjamin Gaignard (3):
  media: v4l2-ctrls: validate AV1 reference frame index
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
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   20 +
 include/uapi/linux/v4l2-controls.h            |    1 +
 13 files changed, 1152 insertions(+), 1088 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

-- 
2.53.0


