Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7B60707A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MYV+5L2W;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJRLZm5x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=; b=MYV+5L2WJP2l9C
	zrxAkxv99sR87Awni5V7zoLUC/6ctFDTaFwM+qUR1aemQBw/Gk7EQiUnIRlEC1iwqsVHOdo+uzOEE
	Pr9Jqt377Y83tkFGH5Owcz3QP6zOci4R+zjoBXmdTJzyLzccziMP8GEErzdhcbKoJ81QLRPoOUqcP
	+KsOtW9IeYtla91IfWCLiza/k8pgDd4bT80JH9OsESAE/+CW2pJvZ+v37rCvzuOg13dIyDCasyY4I
	mL48JMuRHNeZ5LmNuKHuX4WMkDgp9cfPpzLv5QbE1SeUA8FYkyHdNTQPzcjnGOAjGaXbDkrEEyhS2
	646n2d7pyG0gM/47i/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlij-000000040o0-0ce8;
	Tue, 10 Nov 2026 13:17:05 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlid-000000040il-15Wp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:17:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cdd89d84521so466027a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316618; x=1794921418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=TJRLZm5xMw+dogq57cCFXsb594mw0cXUZFVXvvg7eDGx/Oa7IxbgO3A/JFtpvfoeFa
         qiXHaZT6SX8rZyPwp2a7C9R5vSQj+A72yjn66B7iVpX2vXgr+ZfseCFYpvFM3nCpQyzb
         8spi0OInK2QTiCKetc6pfzLSmfupUBQ4g5pJfk+eW9/GNHig+FNemjGOt36rmzXyh/hu
         PknDwrW8DSp4dRrotdlfnOLKv2NYViohcvv2UNaL9Z19mCEn0P0OpMh5y8NjvLloyxKZ
         nsdN2DlFe3/uEhdUDxF8F6aVfVs4XyBZDFXLas1viql30D/0owh0GjZCXD0uNTJs2FO0
         irbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316618; x=1794921418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZRtX+IhjKTjKfwch5jHovAc0blotez373I/yEDH7QE=;
        b=0jsUhuUQvMmRmAP4oquiv+fqcCNya533bNlxvYvNrEW1KYFpiMkPbIGgbb1ERY6zVn
         ACTDqpV3vLjFeWtSfDPaEv/g7sLJxO4AxQHjFllxzjbe1k45qi/779fIysUC4jVtHctN
         tBn7G9OXNWeKuWQR2iiLChAzQWk+5gFRpHthyf5IL87sQGFjsjUO8Tr5GMOAf8FUzm3k
         QQiOa0nzuUgp+C8yjxZUe2JIMyIjNRrn1bDAPo/YYuRF0SOON18terF3d+5z53yIWozS
         ZlkRU6xW3Ikv01D9TdUEE+2h3AawAuhy2iQpuJTGU5l5tCWHdAiDc6b0uFtUpuquaIHC
         pWvQ==
X-Forwarded-Encrypted: i=1; AL+hErF9mDccweZVNsYy/oXaXVVLPWUtqaISeN3/OToQq08qpbqR3p4HUEMB7r9hX1HEzUb83WiTChZB6Rr5O4jkVaus@lists.infradead.org
X-Gm-Message-State: APuU4Z8pW3Eo1ppN/zhw2PLz4HIXCNvcQ/NJj7syBWUuwkOEee79BNWQ
	hVMvAd3/1ZE1UAS+Wj+SkNahQIPw/rPW2rIhpJRlTbK2M1lMvjGHpd8z
X-Gm-Gg: AYBFou3sEUvpUBjD4YsJhXW1D4aVmnQC0BHDXFM1lrhJKEaBa1gUZfgtaase5Ent8+o
	1MZbUyTad1X2rEQi4m/LHA2vSU8U8ZwqBsUMTm/R17YPNKzK1uP/3b+uQ1loAlvGPDuA9IoWgzg
	Bkl1HfwWwn911CUyiU4+//n3v8nUkj6bZhoMR/9SMLZB9+ECuPHmjJk3CSgn9c4tcyKnIsC5//v
	A1Tz4t3TTa3rq/5HRnG/rDYiPnGIVqVne9QS4wsY/bWe5Bd277RiDWYmWxN+aLX6hh74XUb50GW
	eg1CNylyMNT9W008yO8uhbsgdePRmGM/hhAncs28pLhItloI01y014oZUv29pSPn3QLNOzmxjmm
	UAJoJC7YAT0e4VbExoaFxvjuCHv48B72cQ7lBz4So0LZBg9aBlAKYbt9DGgzGk5TqcI74arWfED
	+qDkeGkPUktgz2rC+Es3srfpOl5SnnpC09POEUPU265RmIhI0r7Pq6jjTLE+VYzIt0Zf6ryeNt3
	T9Q6d6pLcLOHNmLisqD8h70n3++ecgFnvLlWwcWxX5s67Uq2YBQqtkr1eJlLIUExP3g9G6JGsB+
	uX0Te6qxWAG/osSZqSZknCDMVkyHE2Jg
X-Received: by 2002:a17:90b:564e:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1678cf0a3mr1858564a91.3.1794316618492;
        Tue, 10 Nov 2026 05:16:58 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:57 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 20/33] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Tue, 10 Nov 2026 05:13:20 -0800
Message-ID: <f0db74d4fbe705ad4d50798c20ee38cc5dbc03cc.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_051659_311226_02F406EF 
X-CRM114-Status: UNSURE (   9.76  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index 687fc8ef3d8e..219ba9a63050 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dmaengine_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0


