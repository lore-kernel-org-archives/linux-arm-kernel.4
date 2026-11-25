Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E76606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=473+Pugs;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E645YLk8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qdmFqie+LOrd1V85imiYgzqHYT4TnBZbGY1vS7eeizQ=; b=473+PugsGSL5r3
	7Rs9RT/0TB1cWbK/tnpuX+iKeua1wvBYXs3n6u+Q47jmZ1EMeuTP7q8dcxzk+azcHKykFxQ8hqPYq
	xAS/hbEPRpAz9u42iXT6B3wCJNLEExVXF/AlKlspsfvOPZQZQHK3pv+D5BsIMPaNZOciKVwMMRluj
	hX11rLSc/p2yqVK/XbZ/CNDeyOco77yRvav1wBEH7ssVTxqAgUAVdMmMi6uIkJ1+bgVaCZoMTAzZ1
	zupiErwZGV53Yqp+HyKCqUVH3FO0jowYWAFN7tfPQK19jMpYl0k0QSCVGM3lIUXcy1ZYVTGqE5JKS
	iq5la9W8UVURxi77mplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC7E-00000009pUv-3byy;
	Wed, 25 Nov 2026 12:28:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC70-00000009pS7-1nnU;
	Wed, 25 Nov 2026 12:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609711;
	bh=g00izwTwgCeq9Gr7RcuHIq/8Y3cTVgp+ooEPGe/N+eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E645YLk8TrBk4rleM1W4b7lnGkPHdGZXRmX+gfcTi5aVAuZx82pBNi269KqNzpOJe
	 7avv3Ur5sd5s2+zG54gXKqQq2E1iJQibCMT7uGEAhTw3oarRaCCCo0WdKtFokX1RyQ
	 vk7ou1xZH4YZS0y8j9KbiH9pD1A4vs7AmZKjtvXbqPFhEdxY63k82naDw6dDioNLRo
	 YsKPQ/daEeC/j9WN4xAEJTDkY/T37S+q1lXpng4Imkmj2l3pE52/hNeAEjkZ/+j7+V
	 mEQ7pgr7cEDPhA0Pp7MC6/s/cQ7Esf/+fcGJ0i+lhM07VzpUFK6fT8uoEU6q0c5vT7
	 N/E9PFiIk9zVw==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0227C17E0309;
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
Subject: [PATCH v9 1/4] media: v4l2-ctrls: validate AV1 reference frame index
Date: Wed, 25 Nov 2026 13:28:22 +0100
Message-ID: <20261125122825.236422-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042837_110012_D713A2DC 
X-CRM114-Status: GOOD (  13.61  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
to find the matching reference frames.
V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
that there is no primary reference frame.
Iterate over ref_frame_idx[] to check if the indexes are in [-1, 7] range
like described in AV1 specifications.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v9:
- Split core changes and drivers changes
- Add V4L2_AV1_REF_FRAME_INVALID
- Rework checks in validate_av1_reference_index() to be sure that
  all values of ref_frame_idx[] are in the correct range.

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 30 +++++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h        |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..e707897e36fd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -817,10 +817,40 @@ static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
 	return 0;
 }
 
+static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
+{
+	int i, idx;
+
+	/* The valid range for ref_frame_idx[] values is [-1, 7] */
+	for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
+		idx = f->ref_frame_idx[i];
+		if (idx < V4L2_AV1_REF_FRAME_INVALID)
+			return -EINVAL;
+		if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			return -EINVAL;
+	}
+
+	if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
+		return -EINVAL;
+
+	if (f->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE)
+		return 0;
+
+	/* If set primary_ref_frame index must be valid */
+	idx = f->ref_frame_idx[f->primary_ref_frame];
+	if (idx <= V4L2_AV1_REF_FRAME_INVALID)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_reference_index(f);
+	if (ret)
+		return ret;
 	ret = validate_av1_tile_info(&f->tile_info);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..f21f00fd5a84 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2940,6 +2940,8 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
 #define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_PRIMARY_REF_NONE	7
+#define V4L2_AV1_REF_FRAME_INVALID	-1
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
-- 
2.53.0


