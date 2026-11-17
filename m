Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MLzoNFOR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySTGqo/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=; b=MLzoNFORYT1XYoSIDE5Gwq7wwy
	mmkH+xCEvGUvOkp9f2t79/NpyVekwU3PmYHPfxTd2MuPpNdI4Q3E+9Codjv8Xhcpl8dSPWKBEtfZR
	G6984Ra0zOgsM1saEMsr817+N7Qh0oSpmgEpqX1wpxnynDelTHha3vqo66CCP1OvVjWPokpUWIMeh
	/D+wH8sEPZtuBgVq1SLdTd4LJS0IRIVg6hAs16/GLTdAoyyzby5F/QsTk+9ZG78Ov8GSKaJeEGi1S
	68Y44HXUU3JoHSEHJ+C+X3J7RE2kQ+TfWme1FxLHBPMDDpxWC7u1/EpIcp2jrBiCO7ekCcHg1oOIw
	AmcwZFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTME9-00000006SBC-1Npz;
	Tue, 17 Nov 2026 16:40:13 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTME6-00000006SAb-1mZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:40:11 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-4aff682aadeso2790415fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933609; x=1795538409; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=ySTGqo/NBZvRVexSC+POOtgvbiLVn9gzKiMIiY3OZbghCQYRP8bkoKbrvCE78RbltV
         lzVv84mgiEl80plzpXpF1oxdMntmJ5UzL93y/8VBke8a90jq3QSmkvI9swClYh9Q4OCw
         SRgnb/304vvIUkY6Ya8D8oOsPLQizWmsI7wGfGesc10UbzthWgUCCObfjingvJ5v6sHE
         ZaSUEsG/F8R95OK6K1LKe9K4bjhC4DBKPQ85BdLxV8hro6DXkwXSgEBTzeaD6BJrpgIl
         p4jbU8/VjC5Z1bvkwh0Xbl39rvwQ7huAz97nhBLlD10bw5/jjF72ivUHoyT97sRF3z2S
         GKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933609; x=1795538409;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=NP03lITTvSLnkaOIElFObLJE8G5u5iBdVoPEUKtQMEL0SmSH16tdAF+YJnezxZAru/
         8GQgxCBsY0pu47iv8WCZg6SFvsmZFPC9lOG45Frof7OQR6CinLCb181+7Rl/Vtu32+sZ
         h+lY6jzhacS72MXJJcpjvYhAEhuFGjHJG5/NawMNqgQpfL1SDPd+BApl6iFSLoPm5JtS
         Tbv8EsQtn7TDz69jdjPq9Vv1ugJlgo5QjagAlaNDVNQDlrHMKBQ0NiIUxB4kcw6nrFDN
         /eyk0xFdW3XeEvD6ZSWM/+CQY1/tFOtiXoFP98U2xBBDDsI9H7hIU0YFqR6RN+bxoJlS
         c7Tw==
X-Gm-Message-State: APuU4Z9FpD1vkKOmkIwubL6kRCfbDt9GAg3M49nok5WdRfEawftYhWx1
	dYa9xTorY37rN/XJXZ2sXe8JJeEPZShsO48fwNDUiR6O2CnaHBAJzpOe
X-Gm-Gg: AYBFou2kUkQYFtHUVBl93q8rUOJvBbQZ8IqkD4/shI6YeTcmf5LiNlWqvdqFiie1LvL
	e6ej0Xul6NQG3VE9EHfvRTh4ioLB2yn0TUWiLGkJNugj6MdCxwlKyWl64GZBvBTgyDpo2CHMq51
	DeL6j42a7ZtGE5mC/kMW4Cxd/+E7XVVUqYeeqkyoDEhe9TM+3Oumijvaz3YrUoY8Gm1NWG5wQ9w
	x82n1NkCuf3e30Bel8oLQEbSGeeyVShnsEjfABtqzRdfzF/VyHgNTnEyVnqdeJUFNp43tFpyNIb
	YO13qLmOZMalkjHKDCeuXLQ4VX00OnSr/SGNl1+je7rRBrcNh1+ms0JYeBapl/9HDbBFRQnykwP
	gfTsDhH2q/dFa07htAD3qCCwBrMAoOYqtYa7GDZFFjlFonk3gr5g7GRJDNiQQppfAgBpC8OsZAR
	qu+tKSsZWMVtfc7p5/FG7dNxWqcSZLFK1EQ4aq+QztURRQN6VrCwM8Yf7otg+b0Zto1ege2XFmO
	PuAC+P80ifBqBV125S29jR4s3lDnHpb84xWxa+NQb1vi3hetGqrPIkMTQu6HdtZAcGnu2O2VwA6
	1F3vr9z+H3aXWVHx/f6Xd4M1+MqYroM9v8GNuCo+4e9FLyYBPVOxvDbBbmzpLxzFO7G+Dw8EITc
	vL/0AujvnU9GbaLQi6adYo/Geg4sa+CLU4iVlzh88cTcfrViM6ARC6pTP1qoiBUx7dGRoW3aPAt
	I/MkTX4djfw4qVv0TTfiLgdwLyc8hVM8LvCRM/slZiQ2T9qNsl1GgThQ==
X-Received: by 2002:a05:6870:392c:b0:485:d31b:775b with SMTP id 586e51a60fabf-4afdf3e5cb1mr12548756fac.25.1794933609320;
        Tue, 17 Nov 2026 08:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70e175c93sm36148fac.16.2026.11.17.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 09:40:00 -0700
Subject: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBREr0L+2m9slQquvIdhUeoHvlogbSEQw
 t0teAKT2cxkMm8W8OSYPNySBRyN7Llro5GHBEyj25qQn9GDPEklhEjRD6XlgD5Yqw26CU1D5u0
 Hi0b3uuQPhxlHgVQpdUmvWZbnEuJa76jiaSc9oKUAxS+Mey8yYWNstYZ96Ny8/xnFXv4bHRX5W
 qpKn1WWl3SvrebP0XQWinVdvyK8tL31AAAA
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_084010_471870_80B103A0 
X-CRM114-Status: GOOD (  16.61  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
is enabled after programming the requested state. A zero return is
therefore expected when hw->rx_csum is zero.

stmmac_hw_setup() treats every zero return as a lack of hardware support
and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
then reopening the interface loses the saved capability. Subsequent
attempts to enable offload are rejected by stmmac_fix_features(), which
uses plat->rx_coe to filter NETIF_F_RXCSUM.

Only clear the capability if offload was requested but could not be
enabled. Keep calling rx_ipc when offload is disabled so that the hardware
is still programmed with the requested state.

Found while investigating RX checksum offload behavior on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1 and verified that this change fixes it.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..e162976be2e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_safety_feat_configuration(priv);
 
 	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
+	if (priv->hw->rx_csum && !ret) {
 		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
 		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
 		priv->hw->rx_csum = 0;

---
base-commit: 5e9b2ad9b8384cd3c417cd5e2c3bc7eee4a72791
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


