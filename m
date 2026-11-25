Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B394606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GSuGHAtV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4zWLVez
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=; b=GSuGHAtV7+CYhgRjLxpMrmet1o
	jiGeqAlLQmI7ykDXbBBmbH6aw9Hgwy5ShROHnRtB/YLlM8bP8JUh33DPAKX5i0K3Y1Uw6HutaywMB
	v9dvLIg6oM5plfB/fDMbQFiuDFD33LWnuxRTtbmubx2oy7kHCbX8FCxI/F29quBDQRtkgCTQdEyc9
	2ihmmSZyGHvZK35jPgf6IINodxPmDBOQ2s5o3BzQ51oX5aIPLelHbF8pRZFebfR5qoBj195QwXDhP
	WPFIc47hBxBbKyimiiKZ6NGlJIfHdVedbGFjLHUW1t8lQDYw822mGbqQryL3fFSRk49QXiwOISShw
	i9EuUNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DR-000000092Hl-37ED;
	Wed, 25 Nov 2026 08:18:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DA-000000092Co-0KVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:18:45 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-48e9476e26aso1979991fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594717; x=1796199517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=h4zWLVez86HCRc+0AEU3vWdiSh8U54U2CCzfFv0wql+xVJTAwz/PlfHkcn3BjVd9fl
         i6CMXascr6z8KPgANMZDUNiaiI2VpOu+QyyetWGwpRryFAHyyJ9/AfPx/HzUdH/m5+sL
         T0v/7jwly7kmF98gXQNlC7fsIzNIa9dxa3e/oSUgwqLbHGU0nkiIEr0NnyNLCC9+xItZ
         LKAZzG/GMCUA4xQH2PCiiVSUQ5UNaVBDKADxaJ1jbVg1Ff13MjL+1aJssSeZfrYIZAMO
         aUShkIAxZnbhetVoUsBVdS5JmNnlfQls3bJKdyqV2hizjEI/bdaNhvNfXpsm/MFsqAZV
         uvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594717; x=1796199517;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0oa6aSqkdEr/b/kG325C6urMw0Actusyeo4Ondu2Ps=;
        b=deuAH5BZ23MKafBzR/pVQcnblAKjvfcpQ2XxuuGDSe5lCOedbgfgzASZ7ocjXvbQCj
         V384T/t61w9Oat2lnpmLeZlI73WM4Ej7I0UbYdulRrCWmZzCkJACOrsCPH71N5PXug/Y
         442s8rVTsSYirt9ZFoogwoliEu5nv808wogZKMo2ZcZ/o2/1IqFndJn34IuZX4PZ3cL+
         ru/Q0L9YyeBnl9WKjmi1/sVnRzFF1AkAbPpCZ0XzDwdZQY43bsbK8t1XLA+raSFUzMUo
         2pBWIi/aJF0DaMHUvPntsRMB6UObKa80GTUUGr0AcHemqq+f7cViK/0CcZdc5JhPXg2+
         33+g==
X-Forwarded-Encrypted: i=1; AL+hErFce3kutwm4w/lRULMu48U1pOd+YDcsDVQd3ofg98Jpq1fNOvPSmvp79rw7SG7rLiXZpE/4lmA+nBlIpTeEZbk4@lists.infradead.org
X-Gm-Message-State: APuU4Z9vUMMd/Uzh+BCJHsFZNlmOUVwe1WzDN3vaSXYlE1PGnqZidvrJ
	lj1U+k8Ay9JR7cOgt/XSGOz0LWJ7FsBxsjZz32sKaUxFvF/4Lc7MjnEI
X-Gm-Gg: AZFdTZfs6KojlmkY4UvW76At7OZFUpT4kI2VpS+UA3ucbxlF4OCsqHDv+WeKIvTzkGC
	P9tYs06Or179tZmyt6x1ig77ezdflo0xJj6MUcQvl6fFKkNIIUiKpKKYu0eJ4nlj06P9gvpGvbn
	Lxi372AiL4COdGaE9uHnhxHqYKDpe7VEHD90AMS07Vv6t4r8dVle6jO2bUk45nQYb1x/OG0qdJw
	VlyOvAr39jsfDvXKxydE4BRJ9JlGhyBVPfsrCpz0jgemwUxwfY+MoHqAkfQ8W65WTt2TpAq0mAW
	/vTSI8OpGIi6vF2Rrp9DOrOzyRivQsMfkoLsk2VWd/S66f9PzEyC33lV3hri6KUddntDgMx7FsF
	KNggJW02qQoX+iOXOmxwp5Y9UWypTl9kG4B6YvQ5g9X23kjvv+ThjUzefFuh8j+8aFI8SKB54Gv
	a9yvKHXUzd5yxEFEYmz+QWzOqHDKw3rqRzQenHlzhNXA05GXPAOX1HxDgt6IclIRAgyC4f+VINZ
	O++yTKKQ3BjS+YThzHn5oe1a3CphlXE+r3T/U1UUbgTmyvZyal86MpnCKXD1dtkl1jK+G2S1D9f
	Bry4tv2zfg5J/cHgR10WOVztCBLy4Ga8G2jYObMUS3wOT16otigqa2W9Ic9Ts+Q2mBCPrr8+4KI
	gUoR4NNYgSZgNjZH3X3kRhH0Sf77xXBbS1CCineCSvuTQB+G0JTz5Do3e1qrNU/OjcVvKUzojrg
	PF3S9LE+w9FKPMG8lUqQxwwiE+N7qZVwB2tqAlsej0LreuuAfhJOM=
X-Received: by 2002:a05:6871:7429:b0:475:a112:1270 with SMTP id 586e51a60fabf-4ca12632e01mr2463194fac.29.1795594716914;
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/3] net: stmmac: support ethtool rx-all on
 sun8i
Date: Wed, 25 Nov 2026 01:18:29 -0700
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WQy2rEMAxFfyV4XRdLGb+y6n+UWTiOMuOSR2s7I
 cOQf68nnUXppiAQQtLVubqzRDFQYk11Z5HWkMI8lQJfKuavbroQD12pGQpUAIg8Le0YckmTCTx
 ubhj4ChyVUt736AQKVnY/I/VhO3Tf2USZT7Rldv7pFIkP8vkh+5yN9LWU0/m50LpE3M9jOdRUC
 tCcTFdrUqY10hBIAxK07MFLUsKSsJ0Gy34jFwcHMNi/wLwnl5cC8cC2oDWZGo20plnrA/AaUp7
 j7fjICgfPP+ZLCK6E1sZqjV6qt8vowvBaHLDzvu/fCvjn5mUBAAA=
X-Change-ID: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001842_493010_7823429E 
X-CRM114-Status: GOOD (  10.13  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On H616 the PHY can count a bad-FCS frame even when it does not appear
in a packet capture. Enabling rx-all lets a capture see the complete
errored frames the MAC can forward. On this hardware, a 64-byte frame
with a bad FCS reaches DMA, but a 63-byte one does not, even with runt
forwarding enabled. Both lengths include the FCS.

Add the common stmmac receive and feature-handling paths, then
enable them for sun8i. This feature was previously posted alongside the
checksum fix and is now separate following Maxime's review [0].

[0] https://lore.kernel.org/r/a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com/

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Drop the RX_CTL1 lock and leave DMA start, stop and mode setup unchanged.
- Align the EMAC_RX_MD definition in a separate patch, as Andrew requested.
- Apply rx-all alongside the other receive filters, independently of RX checksum reporting.
- Link to v1: https://patch.msgid.link/20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com

---
James Hilliard (3):
      net: stmmac: dwmac-sun8i: align EMAC_RX_MD with tabs
      net: stmmac: add common RXALL handling
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 22 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 4 files changed, 59 insertions(+), 19 deletions(-)
---
base-commit: 612848d37e68b858e15815175f1c5e609e09d719
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261122-submit-sun8i-rxall-v1-2666ccf2a020
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v3
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


