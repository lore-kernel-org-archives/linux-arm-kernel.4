Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PpmqMp4v;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRLmGpMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UvCn8QYH1wFV9fdIIhLnz86KR/yEzQGClFZbRaOTEFI=; b=PpmqMp4vsPkDtC
	rTKhwnyFfqWfzZDJXtQsI2O66ARZ6hcIlQe8IvKepOALtLPUSLx5Ji38FD7guouRgl6+rw+IzlIAD
	hEWGk90fjKM4VBcPB33gA5R696NfcfbaJbkhsX0cXVbim8GgGsHnsa0L2Ac0yyAchL0/jUr7X+XT4
	1WRFKXEhQunMZhEdmr1IKSVvwusDaQW+jbwHnp+0ADIfFS2TYpmtf0ssRmSY6/xWJeqhBMm0dPZAf
	eXkGqaROtsHEUusdvDM3HWlKtqZiCbQEaP9yuJMJm3gvzufg98X/0CONnj9oK9mROswUCuWkS2F9L
	QkOPEQeykXgZn5qRUS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKPI-00000006Bo4-2roB;
	Tue, 17 Nov 2026 14:43:36 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKPD-00000006Blk-1ffW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:43:35 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e75a;
	Tue, 17 Nov 2026 22:43:27 +0800 (GMT+08:00)
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
Subject: [PATCH net 1/2] net: altera: Fix potential use-after-free on removal
Date: Tue, 17 Nov 2026 22:43:26 +0800
Message-ID: <20261117-571e631490-net-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117-571e631490-net-0@mail.sdu.edu.cn>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9f67c3703a1kunmc292039a1560a3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTElOVkkZTx1LS0JKH0gaTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bRLmGpMnxPlg4oBfB8QNGEFxYca0M+A2Bm4W4johpcFAuNQS+FMpbySiRoPOMWH9rTCiC4cS8QRuNQgf60QvaAx/KnFOfz0c7cox5jkEzubGXpFZMSGiFcCmTujlsoKODvWeoc1+CUR2np6GB5QAFHQAksxU4miXnGItXfZ3lHg=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=UvCn8QYH1wFV9fdIIhLnz86KR/yEzQGClFZbRaOTEFI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_064332_155564_25E51172 
X-CRM114-Status: GOOD (  10.64  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Destroying the MDIO bus before unregistering a running network device
leaves its PHY attached to a freed bus. The subsequent shutdown path
calls phylink_disconnect_phy(), which can access that bus.

Unregister the network device before destroying the MDIO bus.

This issue was found by our static analysis tool under development.

Fixes: bbd2190ce96d ("Altera TSE: Add main and header file for Altera Ethernet Driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 9eed0be4411e..e203f9fcb5d7 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1461,8 +1461,8 @@ static void altera_tse_remove(struct platform_device *pdev)
 	struct altera_tse_private *priv = netdev_priv(ndev);
 
 	platform_set_drvdata(pdev, NULL);
-	altera_tse_mdio_destroy(ndev);
 	unregister_netdev(ndev);
+	altera_tse_mdio_destroy(ndev);
 	phylink_destroy(priv->phylink);
 	lynx_pcs_destroy(priv->pcs);
 
-- 
2.43.0


