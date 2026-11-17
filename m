Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZQdaB3A7;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CsB8GelW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lv7SsxAS+6yBb6Mmrt+KZ3QRvMmSGffJu7fN0uxlhbs=; b=ZQdaB3A7k3tkiPgxIQWrRybC4I
	Uu2p71G0RFbbUkz5mS8JPuVlSHu4iUbKX2ghccyBHxaFk7oRyH8Es9mff5dkcs1gkA+91LxrL2B4f
	YvGsJbaaA3ALSUUX4mxO/JcDESrbF6TlLYhlkwiSrqdrqhuuZZAZRJVrh2HAibBRHz++VKjiGw1+a
	G/g5aQDe/AI5henLTOCFdHUaHqYJpJHfN3vVrUZs76zLX3/n3tBqHfkrkaOq5rv1DlyeVpYvuu8vt
	aWRK2RMoOwXW8tcZVN2d1Reghn5G8R7Y3knmaEt121Hql9FZYEZ6kAwWAOQsbT2dUp8WLFSBwuXHQ
	FC1pECTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKO7-00000006BUg-1IEB;
	Tue, 17 Nov 2026 14:42:23 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKO3-00000006BSi-0SR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:42:21 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e737;
	Tue, 17 Nov 2026 22:42:02 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net 0/2] net: Keep MDIO resources until netdev removal completes
Date: Tue, 17 Nov 2026 22:42:01 +0800
Message-ID: <20261117-571e631490-net-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9f531ac03a1kunm86a7bfd6155fc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0hLVh1LSExMGktDTEtIHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=CsB8GelWBkG1+Zpw+48tVnC1o/L7fUMrmDhGM+hqTeEy4wXgQJ6YJumHiDs5RhHxkpaizQws3Gjfxf3HFH3nAYla750edbPhlaG2QnkkvAIeOAEttxmLRzxKYqanfSJIMDbm4/+9O68H+RIPnl23+TR29D1uD4XwzqRSrByv1cY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=lv7SsxAS+6yBb6Mmrt+KZ3QRvMmSGffJu7fN0uxlhbs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_064220_110494_C14A231A 
X-CRM114-Status: UNSURE (   6.87  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unregister the Altera and Emaclite network devices while the MDIO bus
is still available to detach the PHY.

Guangshuo Li (2):
  net: altera: Fix potential use-after-free on removal
  net: emaclite: Fix potential use-after-free during removal

 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


