Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4160A260F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyxkhTZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v4jJEf6TgVkfG24sVas66atrbl+rzDNqobzHTACKDUU=; b=CyxkhTZ3pemTgK7uC6HAE93H7j
	ZCyayTc3h+iAUGVElLoEKCjGr4viksLMC3BmFKwL4SYIr5n3NWDa6OA44DgRKx24YakorFTgBWTND
	JSeXiv7OvdkDqrVMR9JizZmdFqXwEf4NDbD90Vhuyvc3VuXZ9a5O0Sn6Uso3LelNtoo2RgbyQI0lo
	fHsg398I/dQ33+cR/lk+ec1fHWs2KrPvFAi/HmfOxkL6ReFnDNs7jVK90L+p7VeACTKNC8CbOMtQU
	slKv0R7TpfEbffBa+0ORgID77P08vqOAkK10+lQYkDjXS+30Y3+4LHiDk3KlvpJfi9GVDg1vHgyFN
	D5/kmJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYEm-0000000GR8D-2Bwu;
	Fri, 20 Nov 2026 23:41:48 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYEi-0000000GR6d-1xvz;
	Fri, 20 Nov 2026 23:41:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYEb-000000002eA-2Mzf;
	Fri, 20 Nov 2026 23:41:37 +0000
Date: Fri, 20 Nov 2026 23:41:29 +0000
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
Subject: [PATCH v2 1/7] media: rkvdec: hevc: apply request controls first
Message-ID: <e98082d31607d7474788fa9c76b525ac285b1590.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154144_525362_705D241F 
X-CRM114-Status: GOOD (  13.21  )
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

The HEVC run preamble looks up the control values before the request is
applied. Applying a request can reallocate the array of a dynamic array
control, so the pointers taken before may point to freed memory. The
slice count and the information whether the RPS controls were set are
also those of the previous request.

Userspace can trigger the reallocation by passing more elements of such
a control than in any earlier request.

Apply the request first and look up the controls afterwards, as the VP9
code does.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Rewrite the commit message
- No code change

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
2.56.1

