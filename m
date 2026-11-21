Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2E606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vPHFG/3b;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJiKudU1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=; b=vPHFG/3butlQRVP/SnLgkvctzg
	ql8Qccnmdq2CZ9vRGFoobWYAbOFwivnn/Fz2KsiUOiGMx/79yJHZgBmt//cyJH6N/BzeAQP6glqgu
	wMOd+4eHJioedBfp1xMQxZqjI+q+1wGqqu9zGtjUgVyXnvLnX53UnDmrCFhW8pHT9AOwpVUwn38Vo
	NuzsOPdtfhwAOTXEJEI6NoxtBNDP8HBU3m7PPoWts72ei0l63/J2Lv3XGhxVhAZe5eTc6g06L6JmJ
	Co2HNVlpZjUk9Rw0YDGWNjdOudh31mDYORdk3LFfa0HtP3b+2EoDkjARE22NARXuUsLwQXp1EQxfi
	XwEL1C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUecD-0000000GnSA-1pqE;
	Sat, 21 Nov 2026 06:30:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUecB-0000000GnRN-3ZWw;
	Sat, 21 Nov 2026 06:30:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE982605F0;
	Sat, 21 Nov 2026 06:30:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795242622;
	b=JfHYi1d5I3iT5KGtmZrsjFspRBA1V82BWezXbu2hSE5fpL2SvH+ts0whlXioXiZY8rN6
	 OQAJKzUbq+I1rk9lqTQcSYTR2I9MLHi20cMVGWv24xXeJh2SkP/wW4nrkPbWIZo6Utska
	 /yyy8uapNQJvR3W3rp2D5B0nqSIHWQVlTK8/krqNT4APnPJU+9HIducQBuRBeJJMafsc2
	 eVEDlc6JJZWe5GI7JlEpllS68dM8NOh7dSY++fZLUCIR78bAEjaJBCnFlsfNfu4eECgRv
	 YhzyX+fHkuGNCLSUhavvacwl7jVIVnSVJ+954BpQjgH72DUFTiJCDOs52mkNHqS4bwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795242622;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	b=M3+ZFArPvBKCmWKW4P5TPLMU1kO3t9jBdIob7Vr74i0Nqxpe3A0K2Pufpk0Oj1keT4wa
	 zBsHtYS8TEoLZxmMkET7mTcaDazLWH1gHRlZaqE0lYctNV4piLkPSOhxqrhqXPyYgwOlG
	 0ylc8Pika2RZycAEl3V+a0DmFk1EYP9H+DcCNu+UIw0uLXw4NrufJi+cOcYxJZR0zxbV8
	 9Ktpwem0N/cOuqji+5bXQTGFZLuzVau/Kf9ISa3LEwcBbiGGJ4QTB595qelhftdao8K8/
	 cjNwPCwx80br20lxK3sgBZM6QOxu5F9iPoDFH3C8kYYGTJ/uLsDTTHVzYBxViQyLRDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB91F1F000C6;
	Sat, 21 Nov 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795242622;
	bh=uZkRTJla5CwLMcW9i2JUtSgkCfjOBmDVaDO3vNDdUEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lJiKudU1xaxLC7fUqn6ajC0n7JctNVbDuiPkBMw/KOz78rrpaSF7TYXGf1eDIc7ss
	 PuppW31gM7U/+qaFSyewY4QbSqTocDLzksDbVK1zeBngVrYB9UFoWcPHNUjBJM5sA1
	 Sli5SHFWWx5BaVk2Py3sGUHj61kThbcdusl2PyHrJn/y8bZipRhiwzHR3bcGP+p0KK
	 tR+JLjTGEhHqdQFBKT+Mub7F3NC9L73g6fSyd45RDYG+Q3TERIXAj4f00qop1++F5Q
	 eUx6ApxKSB6WsiudMbLaBXaIRynUlnCyNDQpDGdvlwkFrh55GnGGwnIVSU9inQx9nD
	 YYnq/cQd99XCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6D43B4BB1F;
	Sat, 21 Nov 2026 06:30:21 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 06:30:21 +0000
Subject: [PATCH v3 1/2] media: verisilicon: Don't report VDPU2 decoder
 errors as success
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-vdpu2-errreset-v3-1-073b5e5bdd64@gmail.com>
References: <20261121-vdpu2-errreset-v3-0-073b5e5bdd64@gmail.com>
In-Reply-To: <20261121-vdpu2-errreset-v3-0-073b5e5bdd64@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795242621; l=1243;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pmz+6zoUL7toWQYosmuS4NH+xU1lJuYNQV3oDGrhPbs=;
 b=fZoK2FEoeZgyyOhO9Z9qRzR+Amsd9fpmeMfElCJEh+JucH7z/32Bgz/EyJ8qXIB8gzwM1lPyK
 Mlc6n67J67EBxSAC2rJ0eDT/e5D2FwCHl5jeMkIXi0/tZwCpuxqHWo1
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The VDPU2 interrupt handler completes the job as done whenever the
decoder raised an interrupt. DEC_IRQ is set for every interrupt,
including timeouts, bus errors and stream errors, so failed decodes
are returned to userspace as valid frames.

Check the picture ready bit instead, as the G1 handler does.

Fixes: 879dee56a40c ("media: rockchip/vpu: Add MPEG2 decoding support to RK3399")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..4bc1bdb41c70 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -391,7 +391,7 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
 	u32 status;
 
 	status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
-	state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
+	state = (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
 	vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);

-- 
2.55.0



