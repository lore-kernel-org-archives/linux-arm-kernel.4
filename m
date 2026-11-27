Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ai3Tq00P;
	dkim=pass (2048-bit key) header.d=cesnet.cz header.i=@cesnet.cz header.a=rsa-sha256 header.s=office2-2020 header.b=La4Cgz56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0XGypaCJ7EJQifKr/qwYwdAUFvbJAWwik5NXmXNQWeA=; b=ai3Tq00PoGy7UbxUJtNtwOL8op
	Fqvjyixdj1cvBEfpZNKvvgsVaPPf9joF6nE+CzFN09mM0HXI4d/8HjJLATRdL2IpgbuiNVX9pHDQd
	LbY0d+sPRFOlfgD4+Cer6wqEzB+1jK/s7iVTvOKlw21g8QTNhhr1908AE/uI80KMuWTk6SkZVZ3dI
	34DtN85FwrtNVYwvwZOtbY30Q/IcddMLNXBHaH5OrBlhkhW2Y7htqJAAscTJc5HTX6jII80o65jk8
	J2r07Zj/mAgV5Qlt5/qAOgH7t9t9gmWPQ4gtOfvQP+Dqvg/+8o7Z3qoNUXRzREBqWtc3pUHvlIftb
	OIfiyOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuKz-0000000Fry2-2N2w;
	Fri, 27 Nov 2026 11:41:57 +0000
Received: from office2.cesnet.cz ([78.128.248.237])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuKv-0000000FrvN-2eL4;
	Fri, 27 Nov 2026 11:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
	s=office2-2020; t=1795779704;
	bh=0XGypaCJ7EJQifKr/qwYwdAUFvbJAWwik5NXmXNQWeA=;
	h=From:To:Cc:Subject:Date;
	b=La4Cgz560/hs2fK1204gQgoWc7x5S+YHF5BOLQvwmEqDXVHMojdu5d8dn8MXsh/Pa
	 xnC3K8aDavr6nnLbiSagymIADfBNu5w0+aCr2C12JPmiGprqHz/tgowpYC9z2KYf9u
	 I3M0DazwcRDJvQhZ7bUxm2UIGiao5Kcl8Jx89AsbY430kdH9uRn8R7PZ5jIrgG459g
	 GLYGVgOxBMDYMXwe7yaLRbxZfY9OIOEu5fN5bMMQPLMI6Gl+G+k+FO5SpTxujoyxu9
	 D9EqEnhrc4dBg6bn9JFODq/GmlrBxPruaHKohYccXn8yF6k3CAjgBmkIFrCl9W6gBv
	 +F792sd0dPl7Q==
Received: from localhost.localdomain (unknown [85.255.90.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by office2.cesnet.cz (Postfix) with ESMTPSA id B3501118007D;
	Fri, 27 Nov 2026 12:41:43 +0100 (CET)
From: Jaroslav Svoboda <jaroslav.svoboda@cesnet.cz>
To: linux-media@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jaroslav Svoboda <jaroslav.svoboda@cesnet.cz>
Subject: [PATCH] media: rkvdec: Reject 4:0:0 HEVC streams
Date: Fri, 27 Nov 2026 12:41:30 +0100
Message-ID: <20261127114130.1680888-1-jaroslav.svoboda@cesnet.cz>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_034154_133520_D572935F 
X-CRM114-Status: GOOD (  15.13  )
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

The HEVC backend of the first rkvdec variant (RK3288, RK3328, RK3399)
accepts an SPS with chroma_format_idc 0, its comment reading "Only 4:0:0
and 4:2:0 are supported". The hardware has no monochrome HEVC: the
RK3328 and RK3399 datasheets list HEVC Main and Main 10 only, and
Rockchip's MPP library notes that its HEVC decoders before the RV1126B
do not support YUV400.

Given a monochrome HEVC stream (x265 fed gray or gray10le pictures),
the RK3328 and the RK3399 decode every picture's luma as zeros, with
IOMMU read faults at addresses near 0 and near the size of one luma
plane. A 2160p stream hung both SoCs after a few seconds; only a power
cycle brought them back.

Reject chroma_format_idc 0, as the VDPU381 and VDPU383 backends already
do, so that setting the SPS control fails and userspace can fall back
to a software decoder.

Tested with this change on v7.3.1, on an RK3328 board and on a Pinebook
Pro (RK3399): a monochrome HEVC stream is now refused at the SPS
control, and 8-bit and 10-bit 4:2:0 streams still decode bit-exact
against FFmpeg. Not tested on linux-next itself, nor on the RK3288.

The problem was found, and this fix and message written, with the help
of an AI coding assistant (Claude Opus 5.5 in Claude Code) during
hardware testing of the boards above.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Cc: stable@vger.kernel.org
Signed-off-by: Jaroslav Svoboda <jaroslav.svoboda@cesnet.cz>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 88e90c438..97466705f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -487,8 +487,8 @@ static void config_registers(struct rkvdec_ctx *ctx,
 static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
 				    const struct v4l2_ctrl_hevc_sps *sps)
 {
-	if (sps->chroma_format_idc > 1)
-		/* Only 4:0:0 and 4:2:0 are supported */
+	if (sps->chroma_format_idc != 1)
+		/* Only 4:2:0 is supported */
 		return -EINVAL;
 	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
 		/* Luma and chroma bit depth mismatch */

base-commit: b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4
-- 
2.56.0


