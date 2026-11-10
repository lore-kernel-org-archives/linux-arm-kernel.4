Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0CF60A2606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwJp+XUD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLHIgL5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ELDlNP9dTk70oCndJTimekUghDs+HluEsfOYLW8hsGA=; b=RwJp+XUDkHDQtZwCCMhZ9YlEeR
	UAtgk4gKPq8toRkSek4EW1gwApPe+1aS/ZDP+aZIg58GIX/RGDjIj6tivuJ6HzfQpN7pxwLwirH8y
	MKGXg7noTdVLuFBoVH2y5r1/Rd3X/Lu+EQkOfpqtbuZjmyz92YejUN7E0Ut0uOqD6G1BCjNXwOAAC
	Q02wi5dRuxOGhwYtPLKO5XWtdRByqkwhoVsbNTxC8565BuUdyffPszAEjsdf+uNbOWRcZ25JFIQOz
	t4OkQX7BTdjs3Mr9x+Y+dkM98e0imZOaZv2ngLzyKVqGaTq4yp6uw8ylVHmIrzdTGRadQeLcaup86
	eFTg6KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0e-00000002lFD-34Ya;
	Tue, 10 Nov 2026 07:11:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0X-00000002l61-0Kbp;
	Tue, 10 Nov 2026 07:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C70861358;
	Tue, 10 Nov 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294664;
	b=AEN0Gv9K/uznQld4Kz9lMLSW5raBGjSgQ91v/0kSq2ZtGjcSGrSwbzCqJR56asf5ufFw
	 ypJLKZvAQQHMnPg5uCAslCIpBf1Godl9uCBXflFC5ffFFHyt40NX1YNOgxgB1oD6LE5aN
	 6HwXAn401PRs2AhrzXBuo/si4CZkftQjtdi9P2Bz8+d+CBjvckUr0N7feRdcYZksgqVp3
	 FmC5iWZFKznKbJuTJqSPx8LHdoJFW9wJAke4Q8+Nktd0dwo7toboWTxj+iQ8o2BsW+XVN
	 eZ31bjkWCndDej7w1J+VC2lHkE4S2gYnTexhfc/of42eSwojsrQo3Wj5zjzemWQYEpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294664;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ELDlNP9dTk70oCndJTimekUghDs+HluEsfOYLW8hsGA=;
	b=njqEeQnDCmTIUzs3hex8sseOurlOK0ixthHRUEm6lSHcEdPFl/qxiURopYKtScyBcS3j
	 0n8sDm0S4Mh/3lBzaTDIVMlqLiYrTaWJKjq+PYg+nCCosslYgjJsALAfoc/FW7Hm/k9FY
	 4LQ68bd/wRsHwh7PXKnI0tkvXIuJPVS+5u7Ljo2W19vK2jTOeunrH1l22s7zPhk9hHjE+
	 eX63go/OSYDMcrQdr336AkKPkwI1MP+inHfuhSz4NgqMkFpmLBakw4QB0glgktOnDJpxW
	 MvhutdZ81xabf8m+5hGjNZzHbc6nXLkyATQf6AE+IoKIvBbAYpFpePC/caDA5DpEQhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4F871F008A3;
	Tue, 10 Nov 2026 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294664;
	bh=ELDlNP9dTk70oCndJTimekUghDs+HluEsfOYLW8hsGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WLHIgL5DwyftcyFdvkKho93QR8zXouCpNLMGSkcpOWOM9pyxNbJh9O7d89s4OWTl+
	 pei1S6nGkXA27+lVgM1lrMOLErhx4VcUm+qsiAyaolp4ziCk1qCxVqwidEPhgoQyPr
	 5sanYKgYqjECKC+I7FO8LDDwArYQXV/1PVlynzdWNILaHFaXeF6DkUY+i7XQO5Mb0E
	 LLaBGxcyjpDFtiXUdYmta1WZenBvovQPYKH847rU4a+nLoPeAK95uEkyM/ZwMZjGK4
	 CuafM8oCio0TQox1ogc52GievsL1KadeklFgVQXJBRG5ZlhgmpPyoDwXqCIZB553v6
	 Sd6ve+/ladsFA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 737F34892D;
	Tue, 10 Nov 2026 07:11:02 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:04 +0000
Subject: [PATCH 3/5] iommu/rockchip: Fix the poll period and timeout of
 FORCE_RESET
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-iommu-rockchip-faults-v1-3-b1dda574dbb8@gmail.com>
References: <20261110-iommu-rockchip-faults-v1-0-b1dda574dbb8@gmail.com>
In-Reply-To: <20261110-iommu-rockchip-faults-v1-0-b1dda574dbb8@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Jeffy Chen <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294661; l=1742;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=nPVNHDZ+CDRxiNb/IqnaxZQXvvuV8CI49hLDqkwewpE=;
 b=WzWCv7WLGixEoP4OJ7zV5BgW7MvrXj2jmuzY8q54KYytIqKY9SYiHiFkKtedF1rmd1wefiwuK
 w6yAOC/svD4A0ipzTeyHxRsCoue3hxg4J3ZNppWf9KMWclGOU9lCHrz
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

rk_iommu_force_reset() passes RK_MMU_FORCE_RESET_TIMEOUT_US (100 ms) as
the sleep between two reads of the reset status and RK_MMU_POLL_TIMEOUT_US
(1 ms) as the timeout, the other way round from what the names and every
other poll in the driver say. A reset that is not done at the first read
makes readx_poll_timeout() sleep for 25 to 100 ms, read once more and
give up, so the reset is both slower than needed when it succeeds and
not polled for the 100 ms the driver meant to allow when it is slow.

When the reset is done by the first read, as is normal (rk_iommu_resume()
of an RK3588 video decoder IOMMU takes 9 to 18 us), nothing changes; the
swap matters when a reset is slow or never completes, as on an RK3588
video decoder IOMMU whose master has not gone idle.

Poll every RK_MMU_POLL_PERIOD_US for up to RK_MMU_FORCE_RESET_TIMEOUT_US.

Fixes: 0416bf6479ac ("iommu/rockchip: Use iopoll helpers to wait for hardware")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index c3c3502db27d..a81da8115085 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -535,8 +535,8 @@ static int rk_iommu_force_reset(struct rk_iommu *iommu)
 	rk_iommu_command(iommu, RK_MMU_CMD_FORCE_RESET);
 
 	ret = readx_poll_timeout(rk_iommu_is_reset_done, iommu, val,
-				 val, RK_MMU_FORCE_RESET_TIMEOUT_US,
-				 RK_MMU_POLL_TIMEOUT_US);
+				 val, RK_MMU_POLL_PERIOD_US,
+				 RK_MMU_FORCE_RESET_TIMEOUT_US);
 	if (ret) {
 		dev_err(iommu->dev, "FORCE_RESET command timed out\n");
 		return ret;

-- 
2.55.0



