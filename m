Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C39D60A5BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HfZmVBml;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtTe5Ofw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=; b=HfZmVBmlwGT7bi8KS9i6h5SmNX
	+BTyXrM3d6RBbjT6BtUfp0k5BuiRCSpOXmVY/sXjPuBu2+3eF0JFKKqcgxOgII61E3qMzgHkNWii+
	LHMqDTQP7fIUADDRVEt/ae+VpiZJcOFNKFbWsecflfUz8gbMAa3AqZw5dkOclfiNJHW+LRBZeuxWN
	i/Ej3JJisBEbnYdS63W7gMKrq5IyESKFddopMMUkqTXpasB5olh6VChygKzTUUn2aSvTfwnR7IFda
	A4nvPg5NRXMi5jAn/fGsHP6KwQus+5M76cVKPjjr68r9bk6DPUaqN1jvkpVgcD5eF6TlxFQxOVMy5
	OcjW0nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8q-00000002rWX-0V8d;
	Tue, 10 Nov 2026 07:19:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg85-00000002qFF-0PRj;
	Tue, 10 Nov 2026 07:18:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6862C637BD;
	Tue, 10 Nov 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295132;
	b=WwBJE39yOIbwof5m/EK7fxafobMf0rmc43vyPRhUWpVAVYAdPUnwrsHgE1pbDo70+4op
	 mOWgupaFGaZqR7BNNvFkBBCXHgcVoOeyXPYqc3yDPyZioShUxVcEFRbP0aAh9tUWy43wo
	 geSSLd8xADb1/1qg4pm6qe/Kaw1Avj1octQ3nfjr6EJQRjYvCNHrepbV0y5CXlmmJgTXj
	 qaFuZ2/ebs03gVt0+bxNDEXIxJ7CuCbCvym8/+/HMswckPoErX80zIBlGQsF972mb5wF1
	 nH4elqIe3/GvOiEucQBHUmqiza12QLHzb9ZCKC6lF7QDuZUk0GYIgEN5PqdJ3WrAxfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=;
	b=VRKPCv6PikhzStZZf/YpK6sognT8RfFlmyUpmJHiEcseSAYv9AQFt/jaJFuutJZq+StK
	 g8Gl1zv8qb20uHfazwIJ0xpxbaQ2H/iibTkPPF5GUjtleuMXaENgP1gLy9qC49rOncwcc
	 Ji+X9mUBz2kQUrbrHYgFrn/9hCwMHorMYFYussRireB6dwVXoiDkq1djOQjv18k1h0CGy
	 c1hSNYINlLuHmx2ohBdt/Ooc380Fm6JeuCYB9+zUd3Q+ts3+BhNb4oe1kqwQpdjKJ4c0B
	 0jBBygBbyNYIvWuCPGxX5y2WE1LiP/YDxYDNv6CeHAduS5ztBSaV4mgAsH2HYxlL7kQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C9661F008BF;
	Tue, 10 Nov 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295132;
	bh=dXRtwq3eD/NFK8IgPBhgp/7A0pFkznKtBS+ZOXdYqTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PtTe5OfwJoXiCaUY1JsRgUwo9oS8T7WBVd2J9sb110Kpiw314tVAthNwmklfFirMV
	 PY0UBXQ8wgyDM337Ryp48vog9V+QXOJARuFdOPdJ4V7MwV9edxLktlzOv2HAHYCLDV
	 3tnL7n124V9kUvAPbpwIjx4LJArPkeyNJpHLfOVT+xmFTCAAsecDqMs5DOGaXAiiCb
	 irUux6nD7HtUcqT2uaSm1DgWoikl31C1VJo6c2LNhnCqoku7UArHOZRJRrRrUGHVso
	 f4ZxJCsBZ8ETxidvmEwbQrnlBfogzk4iEfBHRTgJ2Ya29XrlePI+ZazyoDtxdOyLUO
	 SzRNKwI3M58Sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BCAB489C9;
	Tue, 10 Nov 2026 07:18:50 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:54 +0000
Subject: [PATCH 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
In-Reply-To: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295129; l=1329;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SPA5csf/bAh0B83cKoZHeqtof5v0uoSMoUIlfdJ5VbM=;
 b=i+wS43YteQlCqC153QQbNpaUW9KYpgHXaMG3J+LGfX0EkNm9iK+dlaut6m4/8oQ3xynCZDNX1
 5gr1Z+2z7P6Cqe7qW/WBCv9w8qWQfP23ve9Xq9XwUN+ZBKtHQ4+U8qk
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

vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
window of the video port, but for_each_set_bit() takes the number of bits
to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
is never found. A video port whose bottom layer shows Esmart3 then starts
its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
only window, past all layers, and programs mixers of other video ports.

Search all window ids.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 83203d18865b..2843bfb36341 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 
 	for (i = 0; i < 31; i += 4) {
 		match = false;
-		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3 + 1) {
 			win = vop2_find_win_by_phys_id(vop2, phys_id);
 			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
 				match = true;

-- 
2.55.0



