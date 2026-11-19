Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D78606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4YCTi25;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cP4qZpvl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fi+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=X4YCTi25Mj+8Jq
	3vf6xkseBpn86c1gZE7nLYzkqX898o8Y2gfa0+TRxJAsPrhpfItLLYcvYwJrB7ywdi2wFgjEn8VFw
	K53mnfyXis6epVYgR2s476FrU4zlFWJ3ibS/BDINVW8GyZHY8Pe+xkYzA18OIatgivF1dEn4FAewQ
	97KbBJZyKkVQpJo4Lr/RKLaZlLnt+zl95hRN0LeG6unOXYbFURquNgLJ9FRs5xkmBGGqUWELCpNR3
	+7IbH7rYleXVHmJgxoIJfJ1PITTotXIdD5BeCoft4TAw3i7mjUFAvbw2iaTKoz0e8Qh1ucbWmH2Ny
	VeOJ4N3M/AC8TqOKh65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2q0-0000000CB1l-1etn;
	Thu, 19 Nov 2026 14:10:08 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2pw-0000000CAzx-1VGp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fi
	+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=cP4qZpvlPQHEOs5cBR
	+fooBy8dOadAAELbPLG85uj6SCENDsAt2MBXmQdqVP5T8fWqnbudSBBWfr/9Gjje
	HTUbaX/KA6pNiDOaJmzhqhrED0/vKhpwRX9ETJzkFnacA33kDHPGHyiYQqERgM9y
	5EFH2P3WjXfUQuy5M6X2yfSEI=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3Zjj_Av9qQc93Iw--.13924S6;
	Thu, 19 Nov 2026 22:09:32 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com,
	fujiahui@lixiang.com,
	zhoujing3@lixiang.com
Subject: [PATCH net v8 4/4] net: stmmac: restore the XSK TX pool on resume
Date: Thu, 19 Nov 2026 22:09:00 +0800
Message-Id: <5874b73b815d2385bbbf5f6988d50b3772fa0ce0.1795096430.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795096430.git.dinghui@lixiang.com>
References: <cover.1795096430.git.dinghui@lixiang.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3Zjj_Av9qQc93Iw--.13924S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48XF1DCw48JrWkAFy7KFg_yoW8ArWxpr
	Z7Cayqywn7tF4xZws8Gw40vFyFyayftF45ua4xJanxZFW7KFZIqr1YvFWYvry8JrWkXr13
	trWjkan8C3W5CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jCpBfUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8x1ijmr-Ax1JngAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_061004_804472_5B7EBC7D 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

When suspend interrupts AF_XDP zero-copy transmission, resume releases
outstanding TX buffers through dma_free_tx_skbufs(). If it completes XSK
frames, that helper also clears tx_q->xsk_pool even though the socket
remains bound to the queue.

The resume path does not run the TX ring allocation routine that normally
sets this pointer. Consequently, stmmac_tx_clean() skips XSK transmission
and a running TX-only socket can stop sending after resume, despite the
link coming back up.

Restore the TX pool from the queue's existing XSK binding after releasing
TX buffers and before restarting DMA and NAPI. Keep the buffer cleanup
helper's behavior for teardown unchanged.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1508cf08f03b..550a0bd647e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2277,6 +2277,9 @@ static int stmmac_resume_descriptors(struct stmmac_priv *priv)
 	for (queue = 0; queue < priv->plat->tx_queues_to_use; queue++) {
 		stmmac_reset_tx_queue(priv, queue);
 		dma_free_tx_skbufs(priv, dma_conf, queue);
+		/* Buffer cleanup may clear the pool; the socket remains bound. */
+		dma_conf->tx_queue[queue].xsk_pool =
+			stmmac_get_xsk_pool(priv, queue);
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 	}
 
-- 
2.34.1


