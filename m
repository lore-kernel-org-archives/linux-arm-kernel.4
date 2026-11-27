Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJgXJkBT;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=B4mSTYpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IO9xwt4cKXKK8PZpu5RfFUHHrgFNwh2k+PlRrCKtaq0=; b=KJgXJkBT9xMe1tl9q3TbAzzlG6
	A/C1eQckNILt4ZXIFn/tguRkaOHP70y7WWMesAxKKwzPpic+2/Pkoa70RKB7iDXDP6xafnJRkZA6Q
	Lv/XnQh7KE+h/rwJEDHyI8fPWCkyFFUngM9IaZTbNB9jXPDgqOIMmb0kD+Q7Re2oSDliVMXYLTR05
	luScDHqS+xpUux8lkxsRntY7pR2IGE+16fAGpAS7VqFNLQh6eFsUc2CilN/GqKsCK4huL+vAQ3pRp
	oiEEjOMqBqH0kjvYBJ8vSE0ov+Q7yvYKjgZ7oqKWqDVtb3Fsxv/q1ppNelshHJEUA3VjjbROWT0co
	QeaTD6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkR-0000000FjEA-3Drt;
	Fri, 27 Nov 2026 11:04:11 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkN-0000000FjBv-0160
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:04:11 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c35;
	Fri, 27 Nov 2026 19:04:01 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] dmaengine: lpc: Manage DMA router registration
Date: Fri, 27 Nov 2026 19:03:57 +0800
Message-Id: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cad2f1303a2kunm13da2c70394a7a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSh8YVkIYQ0MdSx9NTEkaH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=B4mSTYpthwGrLD3af3rf/pB/JHs9Nh8ilk/dAtdYdGA7Ua74Fvs49Ier4Tad4VUjoyYir1UyY9/L3tzEbUn8IY0B+MIR+UTV4sNsd9+r1zqtg5rfWODqXNjgDr3WCWw64xvaJwxYlKus16hqtEtlqgdnQhuYp3ab2d9E81jJ5gQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=IO9xwt4cKXKK8PZpu5RfFUHHrgFNwh2k+PlRrCKtaq0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_030409_445717_10A74FC4 
X-CRM114-Status: UNSURE (   4.69  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a managed OF DMA router registration helper and use it in the
LPC18xx and LPC32xx DMA mux drivers.

Changes in v2:
  - Add devm_of_dma_router_register(), as requested by Frank Li.
  - Use the helper in both drivers instead of adding remove callbacks.

Tian Xuechen (3):
  dmaengine: of: Add managed DMA router registration
  dmaengine: lpc18xx-dmamux: Use managed DMA router registration
  dmaengine: lpc32xx-dmamux: Use managed DMA router registration

 drivers/dma/lpc18xx-dmamux.c |  5 +++--
 drivers/dma/lpc32xx-dmamux.c |  5 +++--
 include/linux/of_dma.h       | 24 ++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)


base-commit: 2e02fb103be058cf8b2fb24112a74a2715e090f0
-- 
2.43.0


