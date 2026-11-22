Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j8nHGs2m;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtuE8c3w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7CAOiXVjp8Ns3vEuVyhMOAdoin//sr7CcGMy6EJkmTE=; b=j8nHGs2m2jGEkWf/1U6NE368lP
	LsVTygYgz0qJSacrkZKysykYBR+MO0HiJ7D+byWATOW8fIVYVyFn7t9rIRCZJXTYdm364IkvB87WU
	R0Dic6qvEkVlfZOyV/59xFnfBAThIvJwwEG6pObgfvdRRPd/0OdGo0sh6VTh7p06uL44TEOEmIvLY
	bvXlQP2hu/OF03PZgR4/ekO4jkV+WibMeVosM5vQ2XSJdz5s8ZfrJr5VKAS1VPkVRoIWqgA0URga1
	2H5LGvuJ8/xFztNBsyUgqOfAlvZG620iNWrVuh3v6QqAWCloPAQ16FI2/IQdV7q75UxiuPOQ5Wdtp
	QXHxuKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dv-00000000tZ9-0Qu7;
	Sun, 22 Nov 2026 09:13:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3dt-00000000tYo-0Uvd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 465AA60D44;
	Sun, 22 Nov 2026 09:13:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795338828;
	b=eKfCKDdTQ5qoW4ga/gnHguuobS6Ng9HY4VBEqoYXAr4OuSFWYFE4iCA3gTj8i/S/eSr4
	 mdfQSp1jdwMutwaZNNR3LRvhyL4X+HacmSGwRwRlMGqm4VWA3M6Hk31bMUJ9FTqlQupml
	 /Y1ejR4+nhAWHmcoMqY2RgDS4KbqJlw7bzBgs7Mq2FERisOVrybACQQrN7b/6mSqjMjeR
	 Wq02MBUl4JbKuaiZoWF6I7dgt0WBuR9US6j8tVKgLjxRNed8yhGo0MvEhB99yCBkQE45C
	 cbDTLh7BELqpi750rezH2lmavKe1OzbBvzCImr8xULllnzVWUZ1NZlryuFRCCwqOwKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795338828;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7CAOiXVjp8Ns3vEuVyhMOAdoin//sr7CcGMy6EJkmTE=;
	b=OV5daG3Mn5CL5ESbzucHRFgRNxPuQTp76i2Ue87+yM+Pqr2E683yx7UrFb0cEE7ZD6HR
	 gCTqVYlJQwgQFuFTf4V+Eaftq4vd0XDjMxeCnZyRIQ/uRSrFrRNEATrOk5lrL0XFaHayY
	 ns07t3dmZFoNLoIjZjkEEZ5rUkQcf7bYrzh69y42+pPauwopzrK3tcZZjAWIvmGgdY0co
	 MjkP9jOj8qq+41LxVD5lXdDs7TGBhH0eJbwTCkc59YMJ2NG9kGknHBTSvZa7aU1wUwWma
	 A8q5XPcwhibna1/bUtztPS6INPtxiNNzPx/B/Ql5z0sVUMxXAaBFDW7I8BD2uWjJU+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85DE41F000C6;
	Sun, 22 Nov 2026 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795338827;
	bh=7CAOiXVjp8Ns3vEuVyhMOAdoin//sr7CcGMy6EJkmTE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WtuE8c3wBMqv5uZ77G72xiXZZbtWlRnRtRu57cS+ZFYmhIV/gnjEKYuh194CPALhg
	 a765y/U9f9iTA76HH3flkpPyG/vLviHsaPHhqSJk/EUJGqA9e44/Mn7Sz4wC+b5hWA
	 PQg3YFAFgjVppdvAburt1W/aRMib9ck9Amj9Iw1KudsNgZP4ZvpdsX5AInp4Vf1CZ6
	 SZZxBwvvzyLzxZh1MWyzzYnTyWlDgD5+9+UeILAbZvadG0wMvQppsgK6aXd8ebIFuS
	 aczcTKZrxJybjhwUcuPVMTID55QRISwugSl3rCxIzZaSKsc0K36h3W9gq3TrSTiw6/
	 JyFVG1quYBiIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17D434BFBD;
	Sun, 22 Nov 2026 09:13:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH net v2 0/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
Date: Sun, 22 Nov 2026 09:13:46 +0000
Message-Id: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf8Xs2TV0wQY8+R+GQy0rrKHFtIVoC
 P8u4N3jTN68mSFyEI5wOcwQeJIog18DHQ9gO+NbRmnWDJSRVooUxtGXguyMRZdG7MVJQq1Nlet
 MF5U+wzp9BX7Ie9fewHOC+lfG8f5kmzbhhnUS0xA++/mkdvj/z6RQIVFRUVlQk6vy2joj/ckOD
 uplWb5MwuRAzwAAAA==
X-Change-ID: 20261121-sun8i-emac-mtu-limit-66a936064965
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Nicolai Buchwitz <nb@tipi-net.de>, Arun Iyengar <aiyengar1990@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795338826; l=1350;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=kUraPmsF3SOADB98zBKEXqM+wCmjpNaCBs9zDZNC9kc=;
 b=qYu87ckoyu+x7liUiYyq0MXj1k2T7Vca4KtNr/pGvuSjubWuT7K+bG8H2WVr7bcPTUrzmXjrs
 KpaYmvmMxdNDs8x9mNsZ8yqhoeyIclhzmbCokYm9yZ5AKE12rFJBY2l
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Normal descriptors take frames of at most one 2047-byte buffer, but
max_mtu allows 3712 on arm64. Patch 1 limits it in the core, patch 2
limits dwmac-sun8i further to the 2044 bytes its RX DMA fills.

Tested on an Orange Pi Zero2 (H616) on net/main. Without the patches,
MTU 2029 to 2100 is accepted and ping gets no reply. With patch 1 the
maximum is 2021, with both 2018. UDP and ping are lossless up to the
maximum, and larger MTUs are refused. Ring mode and other cores are
untested.

Claude (AI) helped write these patches; I reviewed and tested them.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes in v2:
- Limit normal descriptors in the core (patch 1, Andrew Lunn, Maxime
  Chevallier), keep the lower sun8i limit as patch 2
- Link to v1: https://patch.msgid.link/20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com

---
Arun Iyengar (2):
      net: stmmac: Limit the MTU of normal descriptors to one buffer
      net: stmmac: dwmac-sun8i: Limit the MTU to 2018

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 2 files changed, 4 insertions(+)
---
base-commit: 890f23ba87a7ca1aba97c8320770a686e3b689fb
change-id: 20261121-sun8i-emac-mtu-limit-66a936064965

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



