Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD50606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=usYWKxHJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GPMxLtZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3EuKYU1V/nUAnDXv79PPh/iSTftFFLoG3EvfW9crCwI=; b=usYWKxHJT/1xvo
	gNifupHIHjN80l0CtW5kMWWyzKvwx+H+mlGbZZFHNF5Qj5iTF4FKLsSNljQu6uluaf2dm2LakPg2f
	IxBj6hKq+DcoL2D10Rlw49yApHVhg6OQAGaefAHSA0nT3cCnxYnBRtg+YJDZDe+fziMw2ox4xyGFL
	q441QjazxPkJO1h7uErAR9caKCIy1l1ipsWMVTKZ/rFrL1XaJqnXwEgUFNZwD2ghiBUMyfTIU7cb3
	UB0LysIHPSHVOCsCcgblQLvhneOS+JzUkojIvC6is3cCY2PbvYlUQMEue65svR0iJR2JlxXWpV5AS
	RE+9xNnaQo9bn+zExfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPek-0000000FFz9-40S9;
	Fri, 20 Nov 2026 14:32:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPeS-0000000FFrD-1ywl;
	Fri, 20 Nov 2026 14:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795185101;
	bh=YK/k1fZJBJ7Ho2aRUWs/6q2KowLDTaMyFWDZCUHSuK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GPMxLtZJeYIvB0K8CA/6DuwErAe+OJF1hU6+qnMKH9AfMzhtA1Efxpd0RUMEfbdrW
	 P1oI6zhsbNKSoHcDQsUSDPBJN26vd1cf+ghhan2vlYBrP5c1vBVS4U7joyIGwa2Zq0
	 yjSBVzDL4bL1yb1aoRFIC1iXfnoWym8z/a8sPB29pdVds5VyfVHdWAhe38G0TUi/TK
	 hJoJrOgfoSinTP4ihsPx1St0COTJEOt0YSA4UURE7HGcOaUVlganEfDCq3I7/DKtmM
	 Mng00isuAem7euYzS7Olpu78gJb5uynHNqnlzgOhZeljVEme5UlEX9d8/JvuPBp1b1
	 fS3FPlxmAcmiw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E365E17E0883;
	Fri, 20 Nov 2026 15:31:40 +0100 (CET)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame index
Date: Fri, 20 Nov 2026 15:31:33 +0100
Message-ID: <20261120143135.71134-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_063144_708410_C26802F0 
X-CRM114-Status: GOOD (  10.79  )
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

Make sure that reference frame index is valid before using it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..5da59104a966 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
 	u64 timestamp;
-	int i, idx = frame->ref_frame_idx[ref];
+	int i, idx;
+
+	if (ref < 0 || ref >= V4L2_AV1_REFS_PER_FRAME)
+		return AV1_INVALID_IDX;
+
+	idx = frame->ref_frame_idx[ref];
 
 	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
 		return AV1_INVALID_IDX;
@@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
 						 av1_dec->cdfs);
 	} else {
+		if (frame->primary_ref_frame < 0 ||
+		    frame->primary_ref_frame >= V4L2_AV1_REFS_PER_FRAME)
+			return;
+
 		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
 	}
 	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);
-- 
2.53.0


