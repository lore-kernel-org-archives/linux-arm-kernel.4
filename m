Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ABB606A6A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f23z8xQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eLGEzNTcKoM/8jFUGygGBt6uX1lUc0G4SgecjM91zfI=; b=f23z8xQD5nroIe08RHxF7ZDnf0
	mjgYZRkkq1z8abhIOejMLWDO42OrRzJ7eODK8Sfby/9pMNVrRCm8PIIYeqt5cNdU1AT+1+/wYu5fK
	imt9Gh96XhEvhHxhvJvvx/WuADlXYgsDWjFX5vfSk7lNgamQU77ButtscIMoSWzG+vs+o6ch5FSMr
	jUnuP8N8zN+NgbmdSwTsKOVPJm89h2Ba6zYVp1RdL+38NzrPDUF7cvIWBWQPN/5ONoMbRLX8ZhTSX
	h+nvptCHKn7dsCMKhsJpUA0bvm0jI5ONNcS7hgmRVVFaaXgWHNlZVhNV8kFoK+kL9vbyPow6ifBsC
	pffS3pNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYGt-0000000GRhh-1lbj;
	Fri, 20 Nov 2026 23:43:59 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYGl-0000000GRfk-3Oat;
	Fri, 20 Nov 2026 23:43:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUYGe-000000002fn-3iFT;
	Fri, 20 Nov 2026 23:43:44 +0000
Date: Fri, 20 Nov 2026 23:43:37 +0000
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
Subject: [PATCH v2 5/7] media: rkvdec: hevc: bound predicted short-term RPS
 sets
Message-ID: <5a7d297bc6dfc93495e16fa4b47eb9f9a31aebbb.1795217229.git.daniel@makrotopia.org>
References: <cover.1795217229.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795217229.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_154352_186567_9200B905 
X-CRM114-Status: GOOD (  12.59  )
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

A short-term reference picture set can be predicted from an earlier
set, and can then hold one entry more than that set. The control
validation allows 16 entries per set, which is also the size of the
arrays the driver calculates the sets in. A set predicted from a
16-entry set overflows them, on the stack and on the heap.

ITU-T H.265 7.4.8 limits a set to 15 entries, and the hardware table
has room for 15 entries per set as well. Skip the prediction when the
reference set has more than 15 entries, as is already done for an
invalid reference index.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v1:
- Was 4/7
- Rewrite the commit message
- No code change

 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 797a16517ed59..3b281c16a75ed 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -223,6 +223,8 @@ static void st_ref_pic_set_prediction(struct rkvdec_hevc_run *run, int idx,
 		   (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
 
 	ref_rps = &calculated_rps_st_sets[ref_rps_idx];
+	if (ref_rps->num_delta_pocs >= ARRAY_SIZE(use_delta_flag))
+		return;
 
 	for (j = 0; j <= ref_rps->num_delta_pocs; j++) {
 		used_by_curr_pic_flag[j] = !!(rps_data->used_by_curr_pic & (1 << j));
-- 
2.56.1

