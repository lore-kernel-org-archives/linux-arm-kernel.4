Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8574606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N0hxv9/g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CyQ0o9WVz8accDZel3cTFGEBMTNvH811X58qSZJHyvM=; b=N0hxv9/gvy2PdQGNOw9YWLkwRb
	WzODB2AhM9VXD31fsf+bxYRffWT1hzlwxcm3iZkv1AzACr+quaacM8HFGqD15SxfXCPntRZTACK/J
	meQr7ogy0wlAykc/ly7fRJOd4jQrRZ98j3UX1GEd9xWRiloCQuknS19eaVZOr+5OTnYRqEbg/DZpQ
	87+xq7O1vpC6YKLQhzZ/7rdv2pJITL/B/7NOyEvKFoMqtvxGmp7DmkwRHUbjd9tCCxCumprCquyk2
	RWT/Pfp46iVN8ElOFtPG9E8zL+OTQFLHNKeHFFslhetmri2Csvm6iXRsGqdjPJSgj/domQiL53pVt
	9TfuGE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT4Z-00000003LER-3xE3;
	Mon, 23 Nov 2026 12:23:03 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT4V-00000003LAs-0m6Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:23:02 +0000
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id C6A4FC11F8;
	Mon, 23 Nov 2026 13:22:52 +0100 (CET)
From: tumic@gpxsee.org
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v4 0/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Mon, 23 Nov 2026 13:22:35 +0100
Message-ID: <20261123122236.5460-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_042259_385376_C510A7AB 
X-CRM114-Status: UNSURE (   5.64  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Changes in v4:
- Fixed parameters documentation of xdma_reconfig_channels().
- Removed unnecessary parentheses around chans[i] in xdma_channel_init()
  call.

Changes in v3:
- Reuse the HW IRQ configuration code in init and suspend.

Changes in v2:
- Added missing user IRQs reconfiguration.
- Prevent warnings when CONFIG_PM_SLEEP is disabled.
- Fixed documentation/indent.

Martin Tůma (1):
  dmaengine: xilinx: xdma: Fix broken PM suspend/resume

 drivers/dma/xilinx/xdma.c | 146 ++++++++++++++++++++++++++++++++------
 1 file changed, 123 insertions(+), 23 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1


