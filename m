Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF98606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FIT2Pdpb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajyigt6C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UG6xBE/TzvEY3MhvlrlbBBrGXWAVZDRdX08nBR5Xd4c=; b=FIT2PdpbRG4fiEACFLnH8zFENv
	z9NhLFrEYKKu3ZMmMdxeuunmwMDrgYiXm6vMNFlFmL0tjO4/XOD48l+sOYoA5GahBw/aFI+C3i+FD
	T4rgA/WSwIk0gWeXsmvFyyld7JCVyQnsiOg8N+gITdjEXyaetGa2SJwBokvmSJfJM/tMW3ebpGCrG
	R4UgtsSCGz9Oo6BVcIU/f+I9ZqE39pzT5W12godXKQDj2UlCqY/X25dkU45Hlr8mPr2D0GSQlearR
	ZA579/aWlUOZnG0QObn9ulcFCdJrbCMYNCbdAmH2Gvz41hbt9bgx15+fMq6dvqH/SWx2ctouFbUVN
	etgvhhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIG-0000000CgtL-3GBt;
	Thu, 26 Nov 2026 10:01:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIE-0000000Cgsz-3sRA;
	Thu, 26 Nov 2026 10:01:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DBE96336F;
	Thu, 26 Nov 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795687289;
	b=vLYuyN9uGczGB0SFK3pcFwNY8KJEhiWPFqhF3oPt451cFWjioH3gzwwYQA2dOLSLFYDH
	 JQVR5O+Sq8kef2bYrzBe+6LxBj+mMbmCZvO094Kesnbc517Qxs4Dasf4lQvkPhVwZQPD4
	 okyyZIIE+F30pWMnYOclk2S+sLqgiCG0TYXcomrUVDm+5rtMzY5pHZYioXjQHWWLB5Idn
	 Gy3SiMfo+xU3v8dU8kG4Fg0JY9sIG/YBwPoFKXARofUbMkomVSg0/QYC5ou6ZOLRnrDWu
	 TAXX1b0RcFY9zRoeyCOz80APdAiGoUl6rf5evv610HkOvRJt4OUxSiKVEvsnDMN5iLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795687289;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UG6xBE/TzvEY3MhvlrlbBBrGXWAVZDRdX08nBR5Xd4c=;
	b=kgzq8R7oyrJCRSm65+PWZ+X+xJVfBI39Dd09a/4fa9eaZDRBQCQqiP6yVEWapcEHr1l5
	 g33hdgVFfD61FZy2Gr7zkZ0Zma3fcVAc8Tjs8uedXUJCaF3VUe/v8JJBTGJUEkJLpTS3T
	 D6iy7TMsMp2NdoxzcAAjDwyzoT2RvKzSvwKq88m22Gbox5YFdiMgkFhfPR9in1UI+yIGM
	 NJbhczGhwwrVa0ubom1753Fkj1B97qE9ipssbVnG+WdUZruqsgcNjO2pXZgPd3x5tjCGx
	 9WTng25EAEUA6s1Lcq/AGGA6Yirk0AON5vcKDVKOKWaumpVTjcx5tH30xRUktDXPodw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 463691F000D0;
	Thu, 26 Nov 2026 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687289;
	bh=UG6xBE/TzvEY3MhvlrlbBBrGXWAVZDRdX08nBR5Xd4c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Ajyigt6Cez5oBuPExQmbE1IiwzC/mLim1Ax3n42UgS3bGYEW4BX/vC5iRSVWgcZ0k
	 bh7FfV8vNitp81cIp0ygAPgwMZe6T1pz2vBfezobduoquZX0uZvtM9fYO6ZqjTcHxE
	 TXPviuDW2E+m22ZiqflFxGTn2SZd18r/0KvQBBUloAjhfbK5XMy0cYrY40JRQgDi3u
	 scOwD0A2iOO2dmWWTvSOslxBF7lMPZAE1eGX4k0IOOwY9a+K7Pf/zGOESW4eQKn2tj
	 UiggMx/k6r4+yZP6W22C/BKi6PYAHZUFc3PYcd4TZXFz2eE438q69ywWpxKAxd6sl0
	 0WsY2kgqNGpYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C28024D3EA;
	Thu, 26 Nov 2026 10:01:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/3] pmdomain: rockchip: probe error clean-ups
Date: Thu, 26 Nov 2026 10:01:23 +0000
Message-Id: <20261126-pmdomain-rockchip-cleanup-v1-0-a19f5ea7d555@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWXcSYEGDV2m6wHGsUysQUGNiv
 Lu0Xb7F/wcUzsIF2uaAzJsUiaFC3xqg0YcXo/TVYJSxWhuLae7j7CVgjjTRKAnpwz6sCVnZu7f
 OKdcR1D5lHmT/vR/Pv8vavZmW7xDO8wLinfGxfQAAAA==
X-Change-ID: 20261126-pmdomain-rockchip-cleanup-e067a69909bc
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yao Zi <me@ziyao.cc>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795687283; l=1267;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=4CReN9sh8A+J7ZqUTq61tIENXfUM+WOrErsgMQCjVk4=;
 b=VuNfgoS6KjJFhSWsGzmWc+jYE1UsOlganyOXj2Zvyj5macFjgOjT1NhI1nYAB35dU+F8HMd7e
 a1oONNyARcTAr9nP0wPNip9X+RImBxt9B0SRVSXtsMKTNjv/dRyn44Q
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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

Keep the error code of a pm_qos syscon lookup, use dev_err_probe() in
the probe path, and report each domain error once.

Build-tested only.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Split out of v3 of "pmdomain: rockchip: fix the probe error and
deferral paths" [1]; its fix goes separately to the fixes branch.

[1] https://lore.kernel.org/r/20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes since [1]:
- 1/3: the pm_qos part of v3 2/3, without Fixes tags
- 2/3: v3 3/3, also converting rockchip_pm_domain_probe()
- 3/3: the rest of v3 2/3, on top of Yao Zi's patch in next

---
Arun Iyengar (3):
      pmdomain: rockchip: keep the pm_qos regmap error code
      pmdomain: rockchip: use dev_err_probe() in the probe path
      pmdomain: rockchip: report domain errors where they happen

 drivers/pmdomain/rockchip/pm-domains.c | 122 ++++++++++++++-------------------
 1 file changed, 50 insertions(+), 72 deletions(-)
---
base-commit: e9a9fed57b72b811fbaf62673cf56727a3358899
change-id: 20261126-pmdomain-rockchip-cleanup-e067a69909bc

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



