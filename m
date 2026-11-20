Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0BB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WN5S1n9y;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=6g9dtMgV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1JfPmK1yn6pui7HGEcUCJpESlVMMPdHeni16EmQ9iEQ=; b=WN5S1n9yO41paw
	64V/QwKqUADheWhwrmjTQIun1pY2tgJG27nB1+lo0PL8AxJQ5AaiT4+gx/w6+tyrkHJ/uXlQnB1Lw
	OLyCNMNLkhmpAHhFiHlXnw2M/48IxBESM5ZNK+5CPJoOtTZItJ/O7QQFRTjsaiBZNaTEjrWqFjV/H
	EZj1yEv8o1Dwfz8W39rtpoT7ApouWrS940SNFbmqK6x7Mi64kNpxKFSGIOsVR92Npt1ibOf3sR/SC
	jOGZw2NqzUQYiTM3XjSGSWa1Pzkgi9ufbSrn5m4mQ2aVcMJWu7WO2IEW3zBNkXjLA7fIBIpc8mXEX
	KXoOcSi7S4D5AKxSHkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULr8-0000000EbA5-36By;
	Fri, 20 Nov 2026 10:28:34 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULqz-0000000Eb6y-021O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795170504;
	bh=9Pq5Y3RNHqDCQ9HoKS8CL459rcOwXtJCZyScXxSgXCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=6g9dtMgV5KNsmxCd8Rm8eGPcl/6Ees6YQA6yNfscOndpkqx1ABPniuy+7AGpQi9oa
	 5tAgX6wPBAoqTQoW4Y9dTDd+rendmWguAkyijO0+ovdvRZvhKzSplXiw+/4kb3sSQW
	 kAI5QKSPfH5S9FDoMHXrrZrJJNc/KamDXDkv7525OKuR2kc44/CUAFfqh6Z3cEoeK9
	 jEidGEy9Riu8xbdC2vGqkJyGCYfJHShLqlMVyfuMGUbeBjRJWJ3sbTdnXFx69pxp0C
	 4U5ThMuD8zE2I3QvXIasefdPTEzB5EuFeIdSj03qU6yvYvrQypQnhUSzKtcqmoXMs8
	 mFEup3OHWMF+Q==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 7A97B8D803; Fri, 20 Nov 2026 10:28:24 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the device at shutdown
Date: Fri, 20 Nov 2026 07:27:53 -0300
Message-ID: <20261120102754.778283-2-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022825_085912_806496CB 
X-CRM114-Status: UNSURE (   8.59  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No .shutdown here, so reboot, kexec and power-off leave the MAC and
DMA running. This chip keeps its registers through S5 too.

Hook .shutdown to stmmac_dvr_remove(): interface closed, DMA and MAC
stopped, PHY dropped.

Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 42f0b11a7b60..63ce2301a0f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -374,6 +374,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
 	.id_table = dwmac_motorcomm_pci_id_table,
 	.probe = motorcomm_probe,
 	.remove = motorcomm_remove,
+	.shutdown = motorcomm_remove,
 	.driver = {
 		.pm = &stmmac_simple_pm_ops,
 	},
-- 
2.56.1


