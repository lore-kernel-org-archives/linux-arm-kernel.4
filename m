Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F9606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AErD2Duu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ECmqalV3vVXhuW7AJJvBBOVkwd6W+mrSEV8Bq0CD+AY=; b=AErD2DuuoSqMVF7X8zgL65NGm9
	b4CgSaEcjVejd4l8IM8WtOwgnGDafYz1VYvcKxwEcnIE7UgT8b+VTqQtjEk+DrsBrHjaUlmuPO30k
	GO77Rd2M+hktNPIbzOOLx9A0w02+FpW1g1v0TsBKH7RwoPCt2xXL1zMJ7TaZlPfspU4byoGFLSjWN
	yynMzCjNTZDURs5p+3f8aLDU3EBjGI78ApcJAYLqzg1Orfm2+q74IcpvS2i3naZBuP4rDf2agBiSG
	mWmEHdhoCSG67Lh58IREK0QMBmH12zMVosZR+UmguEa6GyDZBDy4O5/+XZiWOqLGQ2K4yKTvcReWp
	BAB6DD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuM-0000000Fk78-23wn;
	Sat, 14 Nov 2026 10:22:54 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAuK-0000000Fk5y-1Uzk;
	Sat, 14 Nov 2026 10:22:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSAuD-000000003aW-1gHM;
	Sat, 14 Nov 2026 10:22:45 +0000
Date: Sat, 14 Nov 2026 10:22:42 +0000
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
Subject: [PATCH 1/7] media: rkvdec: hevc: apply request controls first
Message-ID: <0050fba7666592bb95c784eda4013a6054016d84.1794645268.git.daniel@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794645268.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_022252_416910_3E21C3E5 
X-CRM114-Status: GOOD (  12.62  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rkvdec_hevc_run_preamble() takes the control pointers and the slice
count before rkvdec_run_preamble() applies the request. When a request
carries more elements of a dynamic array control than the control has
held so far, v4l2_ctrl_request_setup() reallocates the array and frees
the old one, which leaves run->slices_params, run->ext_sps_st_rps or
run->ext_sps_lt_rps pointing to freed memory, and run->num_slices holds
the element count of the previous request. The EXT SPS RPS controls are
also looked up depending on has_sps_st_rps and has_sps_lt_rps before
the request's own controls could set them.

A userspace V4L2 client that can open the RKVDEC m2m decoder can submit
a request that grows one of these dynamic array controls and reach the
freed array through the stale pointer.

Apply the request first, as rkvdec_vp9_run_preamble() does.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 2b8e04dd15727..c249e3f16f42c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -429,6 +429,8 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 {
 	struct v4l2_ctrl *ctrl;
 
+	rkvdec_run_preamble(ctx, &run->base);
+
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
 			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
@@ -460,6 +462,4 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
 	} else {
 		run->ext_sps_lt_rps = NULL;
 	}
-
-	rkvdec_run_preamble(ctx, &run->base);
 }
-- 
2.56.0

