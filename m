Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB8606B5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xTKamfb6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5xqkIVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cOZOcx0Mu9HyNEyLOdYNEnsYBK2dtuXmhg8/FXfAGjg=; b=xTKamfb61EicL0P5QnGBK7B+hR
	NOP7fWyCouiQXe9rMDOTMCgy83QNwwQEDMELJsvgsJe6JiJDVqRK5jPGBBMjHAB2KADZ7nYdxSCqG
	G/ubBjV4DkCBe7ICgPTNo879g+edmcg/ytOlL+h1EBUWVTMeVSMGKLAmixtnK5dplbigDqX1EaG8F
	z176ZXF2yB0ZpddUM/cJr784ovF8+jSpkv96vGHz8pxIqioyatBN7s6fRFTE3XNDqG7w2/+N5VqW5
	/vshSnBPN/1Y1CkZudNP9wXJwBtU2Boz4Th5s5CwLcjTk768PIraitQpEgHc7v8nlxvH7c8DZXyO0
	tyF7QLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQPE-00000009D9B-2vcK;
	Thu, 12 Nov 2026 08:43:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQNR-00000009CTB-0Xi5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9201860D14;
	Thu, 12 Nov 2026 08:41:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472908;
	b=IyRk5o3fdl2Mkm3fODFjLtfEztDpa5yabMmiaMDbou56QgUEA2Ozm8jcPu7P0yJ7C+K3
	 hTouAO5bN3DiVmyIAEKXcmU/Ya/KecBrofNzZPptNnKhA8+4vYnPd4F+Qzqq5rjWyNwtz
	 wI6XPwJ0ANJcs3lA10O5yitAP3/KsQDYlqIarLbGSJ5lJnaydrIVLcfxE+enk83RV1N5E
	 iO/+5xf2V5yaB2uDmuBsc0Ygd6ZJsVRQhT6th9Ss6sIE8Dnhsj5qUwU++1SaLci0hoX8J
	 aUGMEpkOtuuCKmvPLFG0Aj79O4OZIYFZYqt+CW1aBZEZzEd3Hi47AQ7GPxnyRMGcKwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472908;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cOZOcx0Mu9HyNEyLOdYNEnsYBK2dtuXmhg8/FXfAGjg=;
	b=QiF3GPUEKQOa9FhrIolusbGbHn6mRtLBdQdgZNHDgOxyu+IkNEe68foYe5pkqZTHisuN
	 xAtbXgLJqKlxY/uwdce+F/oxWyumBtIpdbJr84rA9lAehS67ZR0P78+UG2IhLVDh6scRj
	 ZSrKqjSngDP06sqmUeOcgs0GTQIKtE89ImnSjVfcL4igxUeoT1fDSTWy3KX+8YEKSKA7V
	 rJ8TPRjBXBt6d60lsymkv5bdj7hCLDTj4JOiZ5k40LKJxE7U8CcUlgn3S3uB6Rhtbjw11
	 +cjp/uR/eHcnvvwLsDPJju4CWJvO3o66vYV14wf/+p/bjJYkFQimoHv+hzRRM9fx1sg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1A8B1F00A07;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472908;
	bh=cOZOcx0Mu9HyNEyLOdYNEnsYBK2dtuXmhg8/FXfAGjg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=C5xqkIVFcXa2Er8OpXLp0CrJD/qDyPZbRPo2JhNEr75D1dslMHGuaAVoCixhq8sqj
	 UwCKmawRJ1qUWuUgqIF8P8XXzM5oQmrZBRpcxxyQdiYwZz7mQfXu1mg1nmvg5LGrJL
	 tzJ5dFaR6LOXjZP4UXgDN8wfSeG49TFLWoqUwJF6oSax670YdetQwyY4M55zGgk5E+
	 hOmTD8QgANWd5iu/rI+Lw82WrFtrrO5hJyVKUujf0ZXZz2AWkmBmq7xsL2+lNcbPhb
	 pe9WY2IsGnxoo35RKYQQN6r4DUQsNiVPS4vKiFjqqEmxOPfR6a6FWxQo+ZTa4Cjb2h
	 hh2LwTK5M69kw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 10827493CA;
	Thu, 12 Nov 2026 08:41:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/2] net: stmmac: dwmac-sun8i: Jumbo frames and
 an RX_TH fix
Date: Thu, 12 Nov 2026 08:41:46 +0000
Message-Id: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBREr2L+ur8BNQa66j0aF0g/iinQABob4
 92rdt3ly8y8WSFRtJTgVqwQabbJBr9DeSlAD8r3hPa5M5SsbDjnDNPkhUVySuM4uS5gLSpppKh
 VoyTss3ckY5dT+QBPGT0tGdpfkqZuJJ0P49EdbMohfs73mZ+L/0czR4ai7gxjJI1R1b13yr6uO
 jhot237Alda2frMAAAA
X-Change-ID: 20261110-sun8i-emac-jumbo-4839f984a6a9
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472906; l=2223;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=4lSOCGIxuhr5scVSNymqWxWTq8eeBYQM5ER9DID9Zyk=;
 b=8f+Qdim9xm+qJ7Nqsq62ye44HOsAZgiddAr0jN0CQpUvgGKZYonOGdxtlRWyHja9k02ORMRlz
 1VDwiIjldWeC16DzPzfuMVXbGC6rEq1jOCRMrrKL1v98YFevFuiQsCz
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sun8i EMAC advertises a maximum MTU of 3712, but drops every frame
longer than 1518 bytes. Patch 2 sets the receiver's jumbo frame enable
bit and limits the MTU to what fits in one normal descriptor buffer
(2018). Patch 1 corrects two swapped RX threshold values; no in-tree
Allwinner board uses RX threshold mode, so none is affected.

Tested on an Orange Pi Zero2 (H616, RTL8211F over RGMII) at 1 Gbit/s,
with a 7.3 kernel carrying both patches:
- MTU 2000 and 2018: pings with DF set up to the full MTU pass in both
  directions, iperf3 gives 955 Mbit/s to the board and 905 Mbit/s from
  it, and the rx_length and rx_crc_errors counters stay at 0.
- Setting MTU 2019 is refused.
- At MTU 1500, a 90 minute run (bulk transfers up to 256 MiB both ways,
  iperf3 853/873 Mbit/s, 1000 pings each of 56, 1472 and 8000 bytes)
  had no loss and no new error counters.

In that 7.3 kernel, frames longer than 2044 bytes were dropped by a
local norm_desc change; v7.4-rc2 does the same through commit
834ec9530832 ("net: stmmac: drop split frames on AF_XDP zero-copy RX"),
which patch 2 now relies on.

These patches were developed with Claude (Anthropic) as a coding
assistant. It investigated the problem and wrote the code and the commit
messages; I reviewed them, and they were tested on an Orange Pi Zero2
(H616) as described above.

---
Changes in v2:
- Patch 1: add the Fixes: tag, and correct the commit message: RX
  threshold mode depends on snps,force_thresh_dma_mode, not on RX
  checksum offload (Sashiko AI review)
- Cc Corentin Labbe (author of the Fixes: target)
- Rebased onto current net-next; patch 2 unchanged
- Link to v1: https://patch.msgid.link/20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com

---
Arun Iyengar (2):
      net: stmmac: dwmac-sun8i: Fix the RX_TH threshold encoding
      net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 29 +++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)
---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20261110-sun8i-emac-jumbo-4839f984a6a9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



