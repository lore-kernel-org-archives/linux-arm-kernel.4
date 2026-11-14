Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74AE606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3F8oDUK;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lGnfAU/O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fi+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=R3F8oDUKGCSXp8
	gPiU23TQOwrZXud9BPQns302yzd/0OaVRgz7DZDzOFYGDMYdagd8Xoi26hJfAOuQWNmb6EunTFW9e
	Da9gEG0CvOexLqRlhNVpKgtKI5EFEM94GWO99cs2tKI95n93wWHlpVH7F3boLe8leghq45euPtE22
	eqc+Uiyg1YhP578JkHZCJZI0odf8VaEkKZzaY0J75QhC9mV72ubHQkRqcNLG0Ofc3tZY9UQ7unbft
	1fd6OjpISZkOKEyx+IXAsDPTtwrma9LQTKFy5rU1k8+qpvbGQ9Fqr66ZTLRtIoobNuKcO7S+a1vCn
	P7fsiLAwTGaldfpGt2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9xs-0000000Feic-0nkv;
	Sat, 14 Nov 2026 09:22:28 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9xo-0000000Fegt-2Q3U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 09:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fi
	+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=lGnfAU/OV3PP8RhSPw
	/dXqtLo3u/42oT2Xf1xgYshdz3Fki207B2r9Rp4w1lDMhsb/qS2B3sMp8/z9v6O3
	tFhva7qH2mOKQ3G+5hw5NYUrLAQ7n5iZx+hEx3fvh4R3hGfUMTyuFvirR9xQBlC5
	6c1OlKdd10FDkwlKWm4o/Ja2I=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3r6IRKPhqiIvzHA--.51340S6;
	Sat, 14 Nov 2026 17:21:40 +0800 (CST)
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
Cc: tommaso.merciai.xr@bp.renesas.com,
	dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net v7 4/4] net: stmmac: restore the XSK TX pool on resume
Date: Sat, 14 Nov 2026 17:21:16 +0800
Message-Id: <d24e63cbbe11429e6a51e4a14ac1e6828c4d0fd9.1794646294.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794646293.git.dinghui@lixiang.com>
References: <cover.1794646293.git.dinghui@lixiang.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3r6IRKPhqiIvzHA--.51340S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48XF1DCw48JrWkAFy7KFg_yoW8ArWxpr
	Z7Cayqywn7tF4xZws8Gw40vFyFyayftF45ua4xJanxZFW7KFZIqr1YvFWYvry8JrWkXr13
	trWjkan8C3W5CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6YL9UUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wTrGGr4KCSjPQAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_012225_107747_8B590BF3 
X-CRM114-Status: UNSURE (   8.81  )
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


