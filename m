Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E260A2609
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=az0mAJHA;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=L7ZlpVoR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=; b=az0mAJHAymmCWH
	/RwE/FBShCC4/QwYg8EhKiN4swfdAaG42eN7QGvj1ORofQ+dw0hVDAF/Q0F+zHo4fCrPh7UvokmNW
	OA4sQHDOGDQm42TxtJ+DfI0vCCIDHFH+Zb51KYQt0AEeYlZnayNBe3QzqbCX5LrKhYk2KD9s3dLVM
	Om5vAgH9tmZAsjpmlkcnI8xTHlDqtbAvAjbbP0Yo7339SFvQiZ5sByMnI49oOeR3TNlCvLoq9mrvx
	Au3X/ybjd/A4VbihPke++atibnKc79OBK4OcKYXzmJ9WCG3FaFDyenzLvvzUsZglf1KGVTm3+UOIj
	1IMz7AsZVyQAikiwDehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDw0-0000000G84e-0prd;
	Sat, 14 Nov 2026 13:36:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDvy-0000000G83j-1bdA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:36:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b467581b98so15110495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663404; x=1795268204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=L7ZlpVoR89JwFexwM+DmtOtd+hKTNLvCwke+1rb71jAMDXLvnpPDkcABCVhOSs4jHn
         UwtoHX2k/v07dq6Ayf5uguPhKlOEtmDEIOheSlPdXa2ZwzvjRUY3AX97U2GqtX/lwwej
         FHBR4NNn/EQibfLkv7Lb3GdLZ8+SOU1U3sJddkXUpmQTQZtAsLXU0EcjXSUQUJ7I11Z7
         MFeXm9wG42/xLN7dF0XjqlnV4XybE1wBwz/xw5sF0u1cXT8n8fnr2RMtkg11sqitlJ2T
         V0woeqjyCgiaOJU9klXdk02WjZbVv6OZfsUY/1BzhFcgbO5SD1NmHnXk5lz/xrCP5Fzj
         yqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663404; x=1795268204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=emQjiBqVWGEVz9Isuqe5ewy3I8tlMVq/X4mm0NVcNvXVESFaNY6dHkaHnFN2AOPgr6
         o/1jnmNfOhdJL9p5rDpmnfGVZZanPCNuVII4EuzXTIzR2PpljWQyDVjJPVu8dcEiVDF0
         YYhda+JSmAZxo67f2++FenU9nYFfe4Hdc4Gq4RtqinXFgcmxkHl7VszjbCQFsAq601J6
         ixG7pIMRxieXnm2iS7uP05dCxGiNmIr+vjkKEDtDU5bF94+S/eFdsWnn/EgFsvWzLDFe
         x1AzyM86VNIj1idwa9e/DpEXCkS8b0Qy3u9COPRCd2kHm+lB1mDKhp8Ff5l/BzbcY81n
         sy8w==
X-Forwarded-Encrypted: i=1; AL+hErFsB8Z7XXSK0/EFX3cVBKEMvj12/HTsHc9+vMUKUc/VVf0sQ3TVUJGDvRfhyeMmEXv8hRIqaJwvghXvAvC//2kd@lists.infradead.org
X-Gm-Message-State: APuU4Z8/Z72dpmLnF9WT4cx01uugu3vRLvwTwewC82DoNR9CrIdfuJ0A
	hYsXIO4ING4sDtGOyJyQ8G9xY5R2EECirgWzcatb81yl56ZNQHOmRvf6YWchq0grPBg=
X-Gm-Gg: AYBFou1mk+uH6TJ8sM/tT/J4tijySPe9zGKPO9Pa6YDZ5HS2XntAOeLXcugZeLmphGx
	CVTQsbk9BVnTJrKRrBsFIhVylHo97wfpRVVNMqH3e+EgtQgH0kBRpEdrQPLDI3vQnSRh+NbD5kR
	0nPcs2EwCyI09LdzW5bBRBKQNF1dc1vJzJ4WUeNJyCjXahMup3giBEXVl+PID/VmCJ7YAs3wcZl
	hJbYKk9nEv4qHFbBAwBUthdyup8K1S0i+8Cv00g8p/fOOY3o822DlrIjKJfKt4uV5nx85kIWjq8
	Pr14IWYGWwwSZvnBP+YTrru3l+fM7LS7k7ym9mhR970AXe4AsoLNcREsabC+gnd637PBNjJSu94
	nSRyoPxO6Ow2YEAIhXFpjQnrcdW9csLt43MWq/HdnrMES/ShpQiGZJvtFuHhF6fKX1QM5K8+iT2
	j6KDOXN7FUrimAKXpGxSi7kZyQEE/Dws9Bp1V5Ecg950XVTt4T4Ijz9s5b6F3IIbkhjkXJ4yk3p
	wMe+VTnckA26MW9EndD+dv531Jch3uvkJRw4uUQ1zxPpJ+f+Crslb2HRVoxvPx57qiLJzc2sb86
	9gX+l0hEkLnJ0dHg8nl7G+de7RSK0ctDJm0C2XIGW92ygaI=
X-Received: by 2002:a5d:5f03:0:b0:491:e062:383d with SMTP id ffacd0b85a97d-49c7390fb5emr10908010f8f.57.1794663404019;
        Sat, 14 Nov 2026 05:36:44 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:43 -0800 (PST)
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net v3 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Sat, 14 Nov 2026 14:36:37 +0100
Message-ID: <20261114133640.3285413-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_053646_440462_8D71D27D 
X-CRM114-Status: GOOD (  12.13  )
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

Commit ee0aace5f844 ("net: stmmac: Correctly handle Rx checksum offload
errors") taught stmmac_rx() to honour the csum_none status, but
stmmac_dispatch_skb_zc() still ignores it and sets CHECKSUM_UNNECESSARY
for every IP frame whenever the checksum offload engine (CoE) is
enabled.

Since commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") dwmac4 delivers such frames instead of
dropping them, so this path receives them.

Mark the skb CHECKSUM_NONE when csum_none is set, as stmmac_rx() does.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ffed295eb14..3e5803db19b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5547,7 +5547,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5575,7 +5575,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5789,7 +5790,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		switch (res) {
 		case STMMAC_XDP_PASS:
-			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp);
+			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp,
+					       status);
 			xsk_buff_free(buf->xdp);
 			break;
 		case STMMAC_XDP_CONSUMED:
-- 
2.54.0


