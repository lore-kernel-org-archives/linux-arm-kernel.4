Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C912606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uojCMKzK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaEmztdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=; b=uojCMKzKOrKZUCzV2OEcTVed2G
	OE4uA42g6qkPcSmEoZ5oDBIogF+uFLWLaQeDZsmfFJajEW5B2rNzOYUR+z5wMJyprKmcyXjiRauuO
	cRNj4b9QfZni2VvrfYGCuQXs/1FAmx9aalSkLB5hJfT2M6BJZK5D63+YqxiMyM4IPPAetg2tQRkDY
	F2s2ireNpxx0HlXK3JWJGKwcSKaLNj2wb5FN4MCLYbL007mqVXhAgUSqoKsGtQDOA2N1N9yZ9W/Xe
	CRkLNKJxqgOUmRRw/Gy5TBbLzsQGTBIP0HupP5O9DaQkwK71otBkmcu8o+GiCJL1bvYK6Hat3yXVz
	lwXNVVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSl3N-00000000qLl-1oUB;
	Mon, 16 Nov 2026 00:58:37 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSl3K-00000000qLO-0yvW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 00:58:35 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-845788309b4so1863615a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 16:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790713; x=1795395513; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=eaEmztdR5Djw9KD3weeLnXxh5n1KKGSkl/I5FFq9fSvEcQzeEDkUhMSj39FoNJNXgw
         6Vaeiz49bbGW4Eaue84uoWgTVNxU7ziyTmhyynEgFUbVbUPBORcrrmeLabUNdJSRYakM
         q14dwtHJW4UlbIwM2BW5lkdce2SvSTL7/rSlNGTawuL0qwJIvP/DXkEnKPQ1xXUGkW3x
         JBDXo6KR+AOu+1MI4Q/+3iqSCw3RD5Lh+ceiMCkweR9QrHRQgZimE/FXv0LY2QQF9AcA
         ScOgKUkbXLpPEKqWxM316TabQZIHuMfkgyE5v6ulhyyphauZL/xYe8Zpecm28Eh7ZMRj
         g4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790713; x=1795395513;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=HLv4NpYhavcB5qeGIee3ZuHrdzJu+CAFPHVG0f6MccFCT/gKVE3brp5N5fMuDfrTec
         IOy4811o+pcfvUYJtjmPV2ppVR2FMc2MVrvRLqbqY6F0vcjLbrwjRfgQI2kC2gVQzBL2
         uAlv+TWRm+6rjlr8cBAcQMY9A7j8KPvld+JMSIRHUrPa+KAC5RX05hJtthhfsNrCHuR6
         79L6TaJftQHVvpW+ZChbAH7WUlfTZqxpwWOoa3QjAyIPUjClLaAmYA3nKjDNLOES0tBG
         mpwzTzNO0Bv56NpVMXrKS/fXIo9nf3IjgDl/6G8RklmZGiujO2KULi42YAM7uqLtLog/
         FJAg==
X-Gm-Message-State: APuU4Z9F642QEEg2ej8myqZyhN+wsuvHIDCpy8u5nHIANa9kG8tqOeEs
	06TqymWnO66QlM1jVshvNzzrPgljpnq4LjW6+hkXVf+BYCMnlGdkBscw
X-Gm-Gg: AYBFou2BH65Ld82fj48U3ywgC1h6N4GF1ymrnImGLuth0+Aqbc5+Q9gzut1UOjB6mlF
	PgbBHpbkj0e5vO5zwNmABUhbLK7NllAxskpZGPGEzgZCYkHWdlnCSSlke5FmWSBdUB/ms9jJUJu
	pME/6fvinR6ChVs6u9CgR4NSUArSlwN/SRxcgWJJJYWbD4+7jlNRTPTss+NG31Sjtv1/c2lwwUx
	vbFsXpC1yHlrQci15l7eRg47+b7NN52v1SUpnHvbj7gBbOjMpdUBHLha3ipjSrqpIit65/KCkpP
	CSJ/NrzYAWAKAN8ZdSXhc4WrehU2hmo+Xi9oEO/3v1Z/wfW6kFFTSxrM7EAnWqNskSZ38MkrSpK
	epqbtGRqDjIoquRhgUUHe2iZKt3R+ISqoA9UZWa6A/wHb6vzzK381oT2/CRwYwb20FxhkY+njNA
	KD9kDQShcYAehVBJ98drh1weUr76zrJJnqDkXKYx5vNGRxO9G5C0eFjNXArkSt0CFyp9IOlt0K1
	URquFV50pVabSIu6oix5SN1Qf3XLaeatwDJjr4+l6TR2wSIA2aJvCg9PTf5Y2aRnZloDfwXOryF
	Yi9TI4Bq/zYTZx50aZ9zUqpjulZsZLqpEeyC2HYuGvzz0TdLuFcpaEahOtv2ra3BeDFnoOPqqCc
	DH7VM9yn8A6qysFBjPeO3gUMN9iTPJ4mCqfzLdItUuOqRHmQ3JdHEpxxKwjdJLLEXBmn4FKFASl
	rpQMPI17w3I1g6kPjj1vkbeDYWb1paXWyNFv29xcXxs6C3iT8VO7Q=
X-Received: by 2002:a05:6830:43ac:b0:862:af88:e9bc with SMTP id 46e09a7af769-862af891402mr4387234a34.7.1794790712901;
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm9545673a34.2.2026.11.15.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:58:26 -0700
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UCmkla8irhIx6kdJVEyaSmU3
 t2oq8/7i/c2MMkqBudmgyyLmr5SBTo0wFNId0G9VYbWtR0RebR5iFrqpJOixMCYV+RJ+GlzxIW
 QR9/50B/Z9Q6q5p1l1PWXuECSAtf/WUUP4fKVw75/ALUwtB6JAAAA
X-Change-ID: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_165834_311806_F53E0533 
X-CRM114-Status: GOOD (  11.86  )
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

stmmac_set_features() clears hw->rx_csum when RX checksum offload is
disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
hardware checksum engine. The MAC therefore keeps dropping packets with
invalid IP or transport checksums before they reach the host, even after
ethtool reports RX checksumming as disabled.

Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
offload leaves checksum validation to the network stack. Preserve the
callback's existing success return value.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..98cc7503bdde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
+	if (hw->rx_csum)
+		v |= EMAC_RX_DO_CRC;
+	else
+		v &= ~EMAC_RX_DO_CRC;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	return 1;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


