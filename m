Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD6606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fPlbMGwE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZPciLk0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=; b=fPlbMGwE+CMQZfwt6fnvDTmRGb
	rFBh+du1U5lyVV+f3UHcBtCna6u/CX3QicyY+uGXGbMxUSP1XGhVhkMua5iwvp86vJ2axBpC1p26s
	vKXA06/2hjQO2UNiMWh5oJgNtcl4ExxbgSnT/OiMEqyWqvk8MH2lzku9etSWcJYcmpOvw0/saUkJ/
	Xy6q3gMjpQKiwBrSuiOFFhlarWxsuAIL2zsFu/KXgMA1kCiJ6BY116ZfiTiHwW376t67tPNU4qSPl
	xUoCM/fKxZAyVUVHSu68Uc7x6uKSdIT7MYT8Oo3YHfYvgofdBQRuwVUV8YY7+DzVUSooQ36/eiM2g
	a4U/9b3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgf-0000000244Y-0loJ;
	Mon, 23 Nov 2026 01:17:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIgd-0000000243g-3T3R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 01:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8272D44FD8;
	Mon, 23 Nov 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396659;
	b=Phwt3RGnVIQYkgBcx6OuJha0tal6kENDycxXYJvni/psvy2B8yYrTeZOq7Iz1ayitneV
	 wcHRLH4xFISan80KmkJX3nwXbywYpWTJTBJBR8GMS7Qnnz199g3UYC5ZmmjM05iq+gBfW
	 ky5LL4eldDfgtc0seCfqqCi+DUW1ZA4WRmM5Cu/sFRSeQvVDaVPF5a0DSSPA2BMH8T6Ic
	 dPsKedNshBILlvLD8zPXrATCF0iANDjREdGAYX8iIGYQF7+Or9+7JbvU8D2QEyPr4RlW9
	 Ktw1rXHZXosuvYzWlJ9lz2EPfeU5aTlRUcMazLo0j1sACvvU++3IUGIqRAaWjHHFp7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396659;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=;
	b=odhIbIMcsxxEqZoQScSXbcudlTluDt0kO3guKXcl8v2rZo12MNMuF38rDbHI8DGFUvBt
	 6GiHfDgv8YuPW3Hu85MbwmYYBDPJXKq3z60gsjQePyELKVN6IXtspuP0lkfu+jExyfyH1
	 ocIUaRXq3k35umy6pvuhuLJ423kTRHr8zHXnaPn7/UG5IDP/CU8d+Z3HVya/yIj9flMM3
	 00JNMFQOzowRLScIP3xjpTpz4F//MXq6GMI/gfl7dk3qesCesY7zhs7NBHtW8IqoR0lei
	 QP1V0F+AxZ6JxESU/Lo44Uy36XbMbCXNaEUYjWihAqz6tH7uG2Jf29YPgjz47WNGL8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90D8F1F000C0;
	Mon, 23 Nov 2026 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396659;
	bh=VImCsGSXzjoMSePXdbr+fMI5jhhaz7O4wSuFYMQmz0c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FZPciLk0UXg4sson+hAN/BkrBtF+pxozh91yK4PiGCH7N8C1+ekxk8qVwKUiexvk5
	 lpeiVPz5bmgwj8gNhcBhmlIVvc3cC4Jfd9apvRrXrF4h7BBbSULcEWTC8kDyghO4hG
	 oouySQGfv15fDqR1f9DbTKsqtHFXda61Q5lhRLDg/EBKcJPtYz+TvXS4vk8T/BDLN9
	 k1ExnO+Lh2OeSBt7BRv9VIFFS4yJoYEyGSRMrQYqd9jV1l3QkJVm2XF86mNL5s9ExA
	 zeEXo09W0XpMTpMZsL9XITLPAL///XacsexhBiTXYpvNwxNAyDGiXxk2lVeOEUuQqD
	 C/xM4GqcgM7AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E2C254C29D;
	Mon, 23 Nov 2026 01:17:37 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] dmaengine: Kill channel tasklets in remove again
Date: Mon, 23 Nov 2026 01:17:36 +0000
Message-Id: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCUA2sC/yXM0QpAMBTG8VfRubayqUNeRS5mOzjKaBspeXfD5
 a+v739BIM8UoMku8HRw4NUlqDwDM2k3kmCbDKpQKKUqhV20eBfjokDEuqoNUiktpMfmaeDzq7X
 d77D3M5n4JuC+H4UEbkFvAAAA
X-Change-ID: 20261123-dma-chancnt-666878c6e31d
To: ludovic.desroches@microchip.com, vkoul@kernel.org
Cc: Frank.Li@kernel.org, dave.jiang@intel.com, linux-kernel@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, dmaengine@vger.kernel.org, 
 allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795396657; l=1886;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=M5gstoa5unIW6ysGcN08lUHOdZ09B3VvbPuhdhXnsik=;
 b=LQs0pOspOgbUIO95yvZexbf4sS3I8++eHStsRQwYgm2jYqaZHEriAT7k94R/Nd/SEVvR1qzKk
 Ztf/Alz9L51DCtlvbeNuOaqeczz3adTd1LScgJyiWWTK6z3k5yjeTHp
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

at_xdmac and idma64 kill their channel tasklets in remove() with a loop
over dma.chancnt after dma_async_device_unregister(). Since commit
e81274cd6b52, dma_async_device_unregister() unregisters each channel
and decrements dma.chancnt for it, so chancnt is 0 when the loops run,
they do nothing, and a tasklet scheduled by an interrupt can run after
the devm-allocated driver data is gone.

For at_xdmac, just making the loop run again is not enough, as the
Sashiko review of v1 pointed out: the tasklets and
at_xdmac_free_chan_resources() would then run after the channel
devices are freed and the clock is disabled. v2 moves the IRQ, tasklet
and channel cleanup in front of dma_async_device_unregister() and
clk_disable_unprepare() instead. idma64 has no clock to disable and its
virt-dma tasklet uses neither the registers nor the channel device, so
patch 2 is unchanged.

These loops are also touched by Allen's "dmaengine: migrate channel
tasklets to WQ_BH" series (v4, 01/33 and 04/33). The two fixes don't
depend on that series. Whichever goes in second needs a trivial rebase.

Found with a static analysis tool and checked by hand. Compile tested
on x86_64 with COMPILE_TEST (W=1); I don't have the hardware.

Changes in v2:
- 1/2: move free_irq(), the tasklet kills and the channel cleanup before
  dma_async_device_unregister() and clk_disable_unprepare(), instead of
  saving chancnt; add the Fixes tag for the original driver (Sashiko).
- 2/2: unchanged.

v1: https://lore.kernel.org/all/20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com/
---
Suyuan Wang (2):
      dmaengine: at_xdmac: Kill the channel tasklets before unregistering
      dmaengine: idma64: Kill the channel tasklets in remove again

 drivers/dma/at_xdmac.c | 19 ++++++++++++-------
 drivers/dma/idma64.c   |  4 +++-
 2 files changed, 15 insertions(+), 8 deletions(-)



