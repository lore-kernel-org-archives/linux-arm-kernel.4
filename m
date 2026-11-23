Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VlNwwMAL;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=CPYfRbcB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uTacps4U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IybjlPb0LVZ7QOrAFKKCkNNJ886YmIr8unCCc4l7uQU=; b=VlNwwMALO/jNfAXskXOszfdWV4
	swohqQCOb4FHfzNIpyeA4e2qKeZXWivxRsyd4Q53+/84Aqud9vtcqyx08DQ0AzwRRaK0uEvzgxyWM
	NNMNpEde2tlZS5VCA/mStw9mnXw0s50rVUwqhVlSDp8pr4xL6c0jJO5qcQcD0Y5ROnmQGPfLlpLU2
	68wnyZYcdYRYmWxIdLriCjVM0VkNRQszDo9o9uMq+qnu/+kBcNUQsM7Bbfj5iJJdnVVvSmoKXzqL/
	TdOYctZ5/Zh3w/WjkNU0Rski0uleFFHGBxD574kVu8qLMHURy4I+PTP6FCzM6bYYxQeGWAGNOgMJU
	F4GJpO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdpT-00000005DNw-1yl9;
	Mon, 23 Nov 2026 23:52:11 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdpP-00000005DNE-0ij1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:52:08 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 447FC1D00638
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:52:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 18:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1795477922; x=1795564322; bh=IybjlPb0LV
	Z7QOrAFKKCkNNJ886YmIr8unCCc4l7uQU=; b=CPYfRbcBBrg7/V9O3wjaPCSf5J
	k7ahECh+Td41Nh3WV874GvdzmLJrXDD/OlBAXv8e9eLflbum4+/Dx+jYK2Ql+IZo
	ntHexnWr8jTjyTDPFL79OqXvUCW8zSvPic8moGM1uIK3iXo9eHFOcaZWxK1woHcK
	GhkCz763bnkmfJEl983rsOBp2ivPYuIw+srDOeXOVzHbDqTkZ9ShpN7uXD1hieRj
	oUKVIdwMcSmqQPX7G0bTKUFx82u8pLcCduzJjZql9QWlkrm3C+mwEH4OqGPlx2Y3
	izD/qOjcnDp1wZJsLxt6RfYQWboBVyPJvbBv430vTMk743FJoekPCohP3n4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795477922; x=1795564322; bh=IybjlPb0LVZ7QOrAFKKCkNNJ886YmIr8unC
	Cc4l7uQU=; b=uTacps4UBTdqNXSA/ZYq/EdYMuORnzKAjwshymbVPFPMZeiLpsO
	mjBxTVc8GbLrHQjKqtoWMsAYF+UNR+w02vIHtcAjQyDxyswD/koZJO/dDaz3ScHe
	8rTpL/g37zcbmrwhdWNy0/1gUE2hVD3K7BgjWX+e0d3lgpF27wIg9CI9jQgbkLBY
	jd/wHDLDNt3/C6vR0C2xJ18LS57b4Sgapm9vzaVlgwPbcCw06pPnlvSa0L+RVLBx
	fyIY/+GkA7epr8FoTCRReFZP6j5WgIdhvytF8UA5mSh9Nu/CqUPJmHcjZWpuoCX0
	uKekc0czs23FP+aZUyezKwberEiPwiomwoA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795477922; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:VSMwSwUey9pncvOzWD2B6fs5+QcMaOMPMiy0VL4gTTBT8Jw
	7q8derNGhOyJLNJV1iH+6yAMPu5GGj6RApAr7pCuDEAr5oHrL57FI8CmdOA0uGil
	zjFQgI1sF8+oNkup7jghOaY8M1f3SOSM8F4VB1IJhsnRlIo7qYNmUKJ94nTMjugu
	1x1OHUjVuDvoZPsRcURtSh5w2CnKz7kMRyBG41Rnx9cTyoPstB5ndaluubx0gJtt
	Rn4+i24Mib0e2wdwI8xy4Ih9s6hgNo2owklERcyTuFHzIoOfNND5HhnxspR52l+v
	lDyenw+4Y0OBeP+KDHwuakKcV1LS4htdXC3JYSA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:snLsPNsbCz4VYOV2yj47o6aRDOxjWYqyPbozGNNs8VY=:P1o165xLoA2qPuWrWFB5pBAq5tFyty/t5vGj9pxnMhE=;
X-ME-Sender: <xms:oNEEayNBhIsU1UsD4wcEKvo0F7MVcHuRFBk7UpQ2QN0e_m-K_rFQdw>
    <xme:oNEEa9Wt-eCR0KFCQfpEhkNvInUAZuyiqoWWNKM09uQfu_Bc5yFMli7BFEpsIbvpJ
    pijCkXMummPZerpiV_S3AU-fOMt_VJCNnVTDJ7N72szWB7KVigdK7U>
X-ME-Received: <xmr:oNEEa9vyk1XhCip0WNq7twhcbfXgFs_dXjNlOTmLOOFXifPBa3VIt-6z5WOys9_whlW3fzKY>
X-ME-Proxy-Cause: dmFkZTGJb1GdD04PLpCAwZXXn7KZFUQpgvhFpeiMNWdTsgQSXg4su9r1wkz1eWzPIWOfBk
    FJ9NY1WQK6z+GMRPOeRa/xAcpLpGhZ3i3rHu5zB/D89kM2qY3MxfXxhF110D0CRcXEf2fs
    4MN8MAYO53DHxq/1TxDxLsW5l7z73MpX6FTTFOLL15TnPkCKO8+O8eTU+J7YY12pzpLN9D
    p/Kfr1ryp9Wgd2f7QZubaklTf0nB4k6SUJquczvZb3B/7xgpFlcJ0khWtpNl6yBmu4hGTG
    rRsYCFoUn1baSUqCSDWvFHpznLOQrwKiCna74wQ9/Gjj2KmMpF+aQXmxNWCHIUGenuXuJh
    7S3H+o9zDSJGKzoghBTYfKDpTcrMP8uXEMuxALYb/6VCSTKN566GB/8nyz/Wod6HIjG1RJ
    ggCKta78hvrnZZZmTSy5AjuBmN0Z+eCbSKfT0pxpOhQol3WDC/xm0duisMs4leMcI2X4bm
    vElPhLbZwcp8fFyfcud8QwdbASs/s9OHFa2l34KCDcDJoVV73h7OYUsJMoCVtX8tY4kYra
    YBGMqVPC1naNhEqezi3z9gcD/pzGewTMhtrXBkjPD4czMToAIjEwz8zslcpWt72BD8ThG+
    s4aY8/tdWsw96+Mj9zvaymtCPXiBR2ss+/GFpYC+3lTl90JY7qAdmQgEvcMw
X-ME-Proxy: <xmx:oNEEaw0-SK_YQXOqR6vG6JDwO3SMTOonxH7AI6Qkpj3Jt0T5AtOmfw>
    <xmx:oNEEa265RLCMuUWeLqN_Et1li24zw51GNx9ZNrpsXJJ8mKxMmU3XUA>
    <xmx:oNEEa_XrqjxsazoJvxACg2og9xgDzysaS0fyq_8BQ0efYoVFd_GZLw>
    <xmx:oNEEa2iay_QGchCQCamWbZuZRRbbAd7njZtZxz1iT-B5qsHgXdVYTA>
    <xmx:otEEa9IbXmXQVeWTV5gWRzJeSD0Si6hsRP_FhIDNSdEyRkWZo8GclPrN>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 18:51:56 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	heiko@sntech.de
Cc: tomeu@tomeuvizoso.net,
	ddrake@baylibre.com,
	sidong.yang@furiosa.ai,
	anton.sovetov@gmail.com,
	chaoyi.chen@rock-chips.com,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/rockchip: Disable paging on banks that still page before a force reset
Date: Tue, 24 Nov 2026 12:51:54 +1300
Message-ID: <20261123235154.315460-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_155207_547913_52780DDC 
X-CRM114-Status: GOOD (  13.64  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After an RK3576 NPU job timeout resets the core, the banks of its IOMMU
can be left in different states: bank 0 is still paging while bank 1
has been reset.

In this state the existing stall and paging helpers do nothing, so the
force reset that follows fails as well. The IOMMU can then no longer be
enabled, and the NPU stops working.

When the banks disagree, stop paging on the banks that still page
first, then run the existing sequence.

Tested on a ROCK 4D with repeated forced job timeouts. Without this
patch, one in every 2 to 10 timeouts was not recovered from; with it,
20 out of 20 recovered.

Fixes: cd6438c5f844 ("iommu/rockchip: Reconstruct to support multi slaves")
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Not tested on the RK3588.

LLM-assisted.

 drivers/iommu/rockchip-iommu.c | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 1fa3110b142a..5eabefb0ad14 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -507,6 +507,64 @@ static int rk_iommu_disable_paging(struct rk_iommu *iommu)
 	return ret;
 }
 
+/*
+ * The helpers above only act when every bank agrees. After a reset of the
+ * master, one bank can still be paging; stop it bank by bank.
+ */
+static void rk_iommu_quiesce_paging_banks(struct rk_iommu *iommu)
+{
+	int i, ret;
+	u32 status;
+
+	for (i = 0; i < iommu->num_mmu; i++) {
+		void __iomem *base = iommu->bases[i];
+
+		if (!(rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_PAGING_ENABLED))
+			continue;
+
+		dev_warn_ratelimited(iommu->dev, "bank %d still paging, status %#08x; disabling it\n",
+				     i, rk_iommu_read(base, RK_MMU_STATUS));
+
+		if (rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_PAGE_FAULT_ACTIVE)
+			writel(RK_MMU_CMD_PAGE_FAULT_DONE, base + RK_MMU_COMMAND);
+
+		rk_iommu_base_command(base, RK_MMU_CMD_ENABLE_STALL);
+		ret = readl_poll_timeout(base + RK_MMU_STATUS, status,
+					 status & RK_MMU_STATUS_STALL_ACTIVE,
+					 RK_MMU_POLL_PERIOD_US, RK_MMU_POLL_TIMEOUT_US);
+		if (ret)
+			dev_err(iommu->dev, "bank %d: stall timed out, status %#08x\n",
+				i, status);
+
+		rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_PAGING);
+		ret = readl_poll_timeout(base + RK_MMU_STATUS, status,
+					 !(status & RK_MMU_STATUS_PAGING_ENABLED),
+					 RK_MMU_POLL_PERIOD_US, RK_MMU_POLL_TIMEOUT_US);
+		if (ret)
+			dev_err(iommu->dev, "bank %d: disable paging timed out, status %#08x\n",
+				i, status);
+
+		rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_STALL);
+		ret = readl_poll_timeout(base + RK_MMU_STATUS, status,
+					 !(status & RK_MMU_STATUS_STALL_ACTIVE),
+					 RK_MMU_POLL_PERIOD_US, RK_MMU_POLL_TIMEOUT_US);
+		if (ret)
+			dev_err(iommu->dev, "bank %d: disable stall timed out, status %#08x\n",
+				i, status);
+	}
+}
+
+static bool rk_iommu_banks_disagree_on_paging(struct rk_iommu *iommu)
+{
+	int i, n = 0;
+
+	for (i = 0; i < iommu->num_mmu; i++)
+		n += !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
+			RK_MMU_STATUS_PAGING_ENABLED);
+
+	return n && n != iommu->num_mmu;
+}
+
 static int rk_iommu_force_reset(struct rk_iommu *iommu)
 {
 	int ret, i;
@@ -947,6 +1005,9 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 	if (ret)
 		return ret;
 
+	if (rk_iommu_banks_disagree_on_paging(iommu))
+		rk_iommu_quiesce_paging_banks(iommu);
+
 	ret = rk_iommu_enable_stall(iommu);
 	if (ret)
 		goto out_disable_clocks;

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.43.0


