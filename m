Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A736606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ilJ/w46P;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5PAR9Aq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=; b=ilJ/w46Pp7HyQm
	P8vwWonSbInsLltgE+lJOnOUdwXfV0dDEKUafCy7H0svSClR/vRsF9NX1oUD3e6uK2YB8p2AtyiZe
	c/tRMwxCO71ZSEuBeg9elNElLzg7UulW3qi0xxK9yy/0fKXgb1zQVGiirZxIiYrmtgm44dUUtq2zy
	0166I0BeZODSj5DI1ChXAaT7ES9bGblRyTaffz43GoVlGTxmhumHZAfJ9nZ3eNuLxjxHInAvW4qm9
	8+0yNI97LtdKjCwBQkMTzBSTVabclaCfwjcNxyskfbsDBC+0LY0OFuh3z0oJg47/Rxfoe22ZfavJb
	iLZAhwSG3SzkcRHll2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPgt-00000000sAn-1GvQ;
	Mon, 09 Nov 2026 13:45:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPgn-00000000s7u-2ReE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:45:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e946155442so6698085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231936; x=1794836736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=l5PAR9AqhmbNDXlgs5xCs8D0GWW5YAbag7Q6gG7aKJxSOLz4LHTybjDTBhAEVn7p90
         sg4efVZMFhKrlot4vRzQq0lHJe3cUZoaGGs94s9dyuATzTOz7p/c1EIl0/9+cX1ZDo2U
         TkDEmrDXUBizmzC+p5fE/vT8id+LQTRdbpqPTm2HWzOB8QgFIoTpjw20qFsb/GgT7rWg
         OYz1puNzW06joNDOqfcg5y74w0DGJ3huG5UDDzDCZirBHnO4KUky+8vixBju1gW7PiQJ
         ku2V2jsSqKzdR1cbgBYwbGT8wF6N4gc0Fqiwy4ydC2HE0M8b4uxe3X00lJZOu7QXitDy
         9L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231936; x=1794836736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXHNHwyHqZyMWvC89h3xRMVsL0F7PlcQnNFtH9sdpDM=;
        b=QyGTcCebeocN+1ZesH0k7TxWBEFnZls1Kq1B2lTLrtgKcjHYszb0PY6GWB0OpDXTJR
         51o6vmkiJ94mQ5+1F7VasCdISlhdmn6jmcxLDRZBu2HVzAjTHJbRFrxdOERMdaBhScxU
         1dTjunnnFPFGtP+AHC3ypwQcGghjSmcbH7HT8Cy2eBiwLAjX9MqlSP0KUJnVqANfTXAl
         hqvD/SUG+hyOT7skVavJyUwMH4rxWEX/0enp19bRI8SZiA4xJmbQyIc28wdPIZvsjXVi
         WdMBSplLSsjQfLLFfts9YT2OTyLxmA49zsRtZhvxESm9gshTvhuHnOoly7ySWIqBIU98
         KaCg==
X-Forwarded-Encrypted: i=1; AL+hErEkRWVM0GgMIPz31aaKmFLwfSU46pX2o0VOVWLjhCohbYDQWOyoEFNkDCeOjjVMsmD08JqZ6sVp0U+tL/sNIbFv@lists.infradead.org
X-Gm-Message-State: APuU4Z+TUoBSuhb+Dw46EwDEf4zscxgrCFVvecmC+hbyhNd4/ufCOU+L
	8BkQIYlJEvMKQ/9BY7TM2XIW8Kw1uVq7aS39P4W5rQhv5cd1zgAmxBiw
X-Gm-Gg: AYBFou1FpQNSeazDW9mBxYUzf6JiRJGrUQvIloRGmnU6qZkXMGfQN39riRXDnYIeHUl
	v7M5X8ZZJmd/HCNhun0PRv/xszvlgVHMVe2JKw8Dl+DXJ1fbPZpq00vamE0a119XX2Oe9ZqEL0C
	uoTSre03SaV/RvgHcmIXw+ZMOwsoSAwP8AK9EO1ZCFb2GLcOy2MJTTSmw57DbhpbOHjutPIdBz/
	iF3FqVT7+5/vH2tVs44eAWNOizKFYaDpbLnwy4gR7yTmv+ygVY4eH8PB9GQBsWNWYecr2VjUzbo
	rArzTi6rHitxAJc0TVtUIAjzhVQ2jfQQYJieca0/r4ZOVAIUBnVJjNgiz0ZltWjyJ/u4u9+UI2O
	nQB9Bj8mujFlZ0WX0jJN9Lf03A43MIq3UJgUaWffMQfD5IjdiTwwm6pMhMOR4rWT2jvM5oJJKuD
	9LdSMnXeJKskKq67QyX+A7TmF5bUdNbXt2jSrrc9g3KFQjhjoVdG5xb8ULgQKxpCQjrTt0spioM
	BcTgCjl/6hPCJerTKD8Hbl0NCd1QfztN8YfACGabxGY3mK/oeF4baLFW8afkM3rUDUoLAeRQ1fF
	IPo6TN8ypA69VYU+goG5g3NrXDrL
X-Received: by 2002:a17:902:e949:b0:2dd:c100:a5df with SMTP id d9443c01a7336-2ed837a98a2mr40597565ad.51.1794231935615;
        Mon, 09 Nov 2026 05:45:35 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81727f9bsm11014285ad.57.2026.11.09.05.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:45:35 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	rmk+kernel@armlinux.org.uk,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v10 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Mon,  9 Nov 2026 21:45:05 +0800
Message-Id: <20261109134506.2794160-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109134506.2794160-1-zxyan0222@gmail.com>
References: <20261109134506.2794160-1-zxyan0222@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054540_935763_5D7ECE08 
X-CRM114-Status: GOOD (  12.97  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 870c740b4a50..fd1142344950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -245,7 +245,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1


