Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91299606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=juyPzm5z;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=HXKkzAI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=; b=juyPzm5zQqr7LD
	cxZHcAqsuYHBGsKWvEj0Wc4HbN5qYPCYgmuu8CXzKPi/0vmdkFNA5ExquUtbXKapi+jGv6u56PnyI
	U1cAu1UIzCm3SkxHBSi8O6yuBH/2d29UOiTX9rE44AFV2/jybfvjj2r2jVEFN89XIAb+99W3def59
	7Qr1UPxNtIZFFConwn4V2hldgTazJFo90gYxa3fUK3/mKMmr/vn+dZ9CL/XcHCoXCYbEB7z76YzOw
	M5F240f8uxf+i89CrFYkrcXn7Sucyo7JEuG4/elIap14Bk0qKL8VJVvcC2mfZoKrOkF5eCiHgGtdm
	21cZOtXKcXRJVibH6OCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDw5-0000000G87F-1Kdy;
	Sat, 14 Nov 2026 13:36:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDvz-0000000G83v-2Z1X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:36:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso739418f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663406; x=1795268206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=HXKkzAI7y59jAHCx6L44MIcJQVI1TQRmo7bMyaec54Ho+aFc2kg3nhu0OoJWHv/YQY
         WHbhpzlsf1JrLtBE9/a0AMkb00ewm0ELSl6FnUCdgUyldFdznhxNuO1+ki+0f3u4JMZM
         +4/B/+Z6hp9sIkz6fa8pEm9bdc5dkz/B7gO/3J8pKO/68pp55xc5/CI2ZUWSxT8mQ9cQ
         ax2kTc/BdfjNgwx4O7/tL8rgX/T34DBqqcWoBqo98rQW/qg1I7+t+wpZdU2LXdwXDDiu
         QVuGfqt38L9O3Jm32kaLS6FEXGqJIalxLC5hqZZMf7SW4r7yfH1eH07zZWZVSD7cTDq/
         klEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663406; x=1795268206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=EGN6gf/QZX2sylQVzQ5TVw5JTGAkC0AYQ7RW2n1tfiLUSnaQ0s1mxGAEQcOVGFlYlV
         RZW6l1UI4Cu3XZbl6HcOt0Ye54SN03nf4fUh5eOxA/u8jaFFBg45S3TA3xfDkNJBxNSn
         Ra4isQeKCpeMP9olpDu9IsXdZQiR7VitDX2vMONSVW6bqxX8/b/8jzzRNliUkiVuD0Tq
         2rWkF+NAe9Ld3jZHZqrTLNM4KJeWBoDl5LnM9hyc5zX+bf5hFL4RAZFx5exdzDSZaGPY
         Ta1k9pGOCtAfPUB9eYc7YwtR8sVTgyq+Wzf9KRpfoz1ZZHLhG6B9BcVDnfzuLHtu8zLO
         +Ddw==
X-Forwarded-Encrypted: i=1; AL+hErEU/H5afr9wuJ+2PqD9itz3ZvfXRTAFQxabmz+K5cxUg0weN9/roF6aeGWMaolZ66ZASRrpHBAVU1ohIFMFD2cH@lists.infradead.org
X-Gm-Message-State: APuU4Z/aFKntiU69w+V9gZHTuAOuveJUHQWg8gbE0yrB8tFrrOBjLxF8
	LDb24PXbh8LgvXVt9F1CBQL1Mkt5fUIcjVkUcDEXiogv2XF+pJcyNqQw6V2HwgtzDew=
X-Gm-Gg: AYBFou2UqgFHczXynrNx88Q558O4lxRyV9iWWIYC6WonQBTnjYkKiDj3umGyajOLira
	t9LREdI3oQIuM7LjzU0LtLKxSb10UxpDAQTdyJ2Z3qmq8gQ6DLmpTM4A+oX1SYY5vWESWGAU5CF
	DXaWVh0T2t8Kc3nfjD+yH19D450StipVs/l7VaNT7eh6pVWCstKLAlGJJhAG5f1UwHZiwqxFAdO
	YEJf7dkHTzxoWvHL+akFP0bC4kk7Ml9GD5o4SqGCmLCtaFuDAr+Oc7UPyv2ftozMRdkqz2JjJoS
	TqYu09+I+ukLdkthHnTqJ/oD0HJuel06JzXoMDnDLX01CDV7L4cnFD/D3oSZh14KrksmathNCzs
	JFjPjWf7E7AJsCUVwj2kGLVtB+/HGpiAMiAdZVe4RAfV7ygCaKbA/B/l/k0hdMkEUxLaS6tTexJ
	wMo3SdTSLaNfA7Bkl/F74VQmU3wi4K/aSDaD1r8+imVtvy/Y0K5UUCaVuaQF6SSAhxMbrMH976E
	msVIozimgaF7bUxVnCkei21WuRSeFBhzO8XxzPRcd6zSvKOHEfreFIKJAU4jzMzLpyW8JqcGNZq
	DYiNCmLyuYWAGu5BjO7+bD8Irw==
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr10850377f8f.42.1794663405564;
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Sat, 14 Nov 2026 14:36:38 +0100
Message-ID: <20261114133640.3285413-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_053647_671864_31B4BC4C 
X-CRM114-Status: GOOD (  15.28  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FROM_SUSPICIOUS_NTLD,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On dwmac1000 with enhanced descriptors, the hardware sets the Error
Summary (ES) bit of the Rx descriptor not only for L2 errors but also
for an L3/L4 checksum error. enh_desc_get_rx_status() returns
discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
stmmac: don't overwrite discard_frame status") the checksum status is
only evaluated for good frames.

Return discard_frame only when ES comes with one of the L2 error bits.
A frame with only a checksum error is then reported as csum_none and
reaches the stack as CHECKSUM_NONE, so the stack verifies the checksum
itself. This matches dwmac4, whose Error Summary bit does not cover
checksum errors.

RDES0 bit 7 is not in the mask, because depending on the core and on
Rx checksum offload it reports a timestamp, an IP header checksum error
or a giant frame, and enh_desc_get_rx_status() cannot tell which. In
threshold Rx mode, a giant frame that fits one buffer therefore reaches
the stack with a verified FCS.

Also remove the pr_err that enh_desc_get_rx_status() prints when bit 7
is set. Once the MAC stops dropping checksum-error frames, any host on
the link can flood the kernel log by sending frames with a bad IPv4
header checksum.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
v2:
- Drop RDES0_LENGTH_ERROR from the mask of Error Summary bits. The
  length check further down already discards such a frame.
- Explain in the commit message why RDES0 bit 7 is not treated as an
  L2 error.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 7ece8d4157a8..d0622f2605aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -216,9 +216,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -230,7 +227,10 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0


