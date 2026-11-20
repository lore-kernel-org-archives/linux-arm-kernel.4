Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BB606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJ0KXVol
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RmZt+dOqn0yMdTBU3a+SMGEge9ySr1cITzTAAdRqojw=; b=FJ0KXVolNwrE6vstVSd2cdSPHi
	nD4nxxSl6udl8Mpvpj4VHCP47Mc5eWDinyevaHy2AAyngMxssgRMcpJIO2VIV9QKNpjQ7FcP3GpEU
	y8AbrTi/4mDgUj5dV4sq1J7ugzzSdUDyLBbazmaNK9pzi3Ii0eZzIwbmlG1ZTtNbN+uiwhFoYnAiO
	9xjEsWl0ouwnJ71COr4pCk5H8ixi7HUHJ2hNGkW9Zvn0u60qCX3VGmv/jafx1XqZjK4agwfBpfBTt
	nnmJIYgw11vV+3dn+LyoU8oqwGpH7M2PnCcZffaGEMRzU+M/AjmLPId2T2u4J8vLTCpf332mFvSfP
	wIjeFsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR1j-0000000FUe8-3n0l;
	Fri, 20 Nov 2026 15:59:51 +0000
Received: from mx.gpxsee.org ([37.205.14.76])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR1d-0000000FUbq-2vYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:59:49 +0000
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 45CCAB8EC6;
	Fri, 20 Nov 2026 16:59:41 +0100 (CET)
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
Subject: [PATCH v2 0/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 16:59:23 +0100
Message-ID: <20261120155924.5785-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_075945_935001_658A42CB 
X-CRM114-Status: UNSURE (   4.56  )
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

Changes in v2:
- Added missing user IRQs reconfiguration.
- Prevent warnings when CONFIG_PM_SLEEP is disabled.
- Fixed documentation/indent.

Martin Tůma (1):
  dmaengine: xilinx: xdma: Fix broken PM suspend/resume

 drivers/dma/xilinx/xdma.c | 121 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1


