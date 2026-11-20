Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEDD60A263B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b6IVQpFa;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Xv2+TAKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oCdr+PwiWxnHEBHyM6wpXGYbjiWS3gQP9jStR6G63R8=; b=b6IVQpFa9W90GV1t7MB0U6dtY+
	1TREYHD+zQ9kqvf+lBYENxio6IlAKuK2wyAvB/K2HJYsM+QaYHGyTslCExED+0f6h5kpMqufggpK/
	oKqunzsRTdYTrsnU/kSykWDomLbZjOuBFlJSKTm50ayFooicvV57NjxaQRRGIOUuB9xt9ORnlNPfH
	gfAb05kyFhZKfdvAgySX7h1RFSF9j17vchn26eWOavZYW/H/C8lwyZnJzIekz+ytvEyQiA6aqcuNY
	hdSUJ30UHp36BzoPI4VechTgwt0CIZGs+mVCPlhgJC0Gngb7klAKSneJ77vJ5KOFtIFyK4ONr0F9K
	rLBVRLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNF0-0000000EskU-13up;
	Fri, 20 Nov 2026 11:57:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNEw-0000000EsjE-3MU2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175842; x=1826711842;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=nwRRbBo4QR08d+uEn4AGZsszpR6P1gLn0y/z3Dsp2G4=;
  b=Xv2+TAKseb8fumNTQai8XufDXgZhEWrY5jGZjdXePtuXPkvqG5R+jbWX
   Ym18iILoVWZNrcLfEwofYB+00Q3/KtwTArycPTel4kxC767Hfo6Bq8ryM
   Pm3NlP1ayBLEx46BrIYk0wgm1pBtsq62JolkWWeMTayik29/AKy8w+h4e
   e0mjTqQp619EdNk1RuaaFnOSmgT9OwGo2dnIedxItiCsyF18V9l8N8n7D
   zEWP2ASs9dAyqL42pfIa4rUxKmSy7cvXOP23D+2Aduc5hxp79QFYjQ4L7
   fCksoUdznmpttsd4PrAUl4mIQaCKNa3H7o12YU9UsB/oIRMyUEhd7yD4Q
   w==;
X-CSE-ConnectionGUID: x6sG15HiRgSWNyvCIZW25g==
X-CSE-MsgGUID: fdBJd2GDRk+aeC0G9qD1uA==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="77589742"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:13 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v3 0/9] net: sparx5/lan969x: add support for
 changing the MTU
Date: Fri, 20 Nov 2026 12:56:57 +0100
Message-ID: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIk1AGsC/23NTQ7CIBAF4Ks0rMXwI8W68h7GBdDBsihtAElN0
 7uLxIUxXb68ed+sKEJwENGlWVGA7KKbfAn80CAzKP8A7PqSESOsJR0nOM4qLAKP6Ym/B70Eram
 S1iiFym4OYN1SzRvykLCHJaF7aQYX0xRe9Vmmtf+4lBKx42aKCbZMaqXFmZxafh2dCZMZ3Hw00
 1jFzH4USvcUVhTRmY5yIeFs239l27Y3DXufcQYBAAA=
X-Change-ID: 20260930-sparx5-mtu-change-d7ebb1a7fcaa
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_035715_080779_EC893221 
X-CRM114-Status: GOOD (  19.25  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for changing the MTU on Sparx5 and lan969x.

Currently, there is no ndo_change_mtu callback, and the MAC maximum
frame length, the FDMA buffers, the queue watermarks and the TAS guard
band are all fixed for a 1518 byte frame. This series makes them follow
the MTU, and sets the maximum MTU from the 14000 byte frame limit of the
MACs. As the FDMA is shared by all ports, new buffers are allocated
while the FDMA keeps running, and the FDMA is only stopped briefly to
replace them. Details are in the commits.

Patch 1 makes the FDMA stop sequence actually stop the channels, and
patch 2 frees the FDMA buffers on init errors and deinit. Until now, the
stop sequence was only used on deinit. This series also uses it, and the
new free functions, to resize the buffers.

Patches 3-4 prepare for the MTU change, by adding a helper for setting
the MAC maximum frame length, and by making the FDMA init and alloc
functions operate on the rings passed to them.

Patches 5-6 size the FDMA buffers from the port MTUs, and add support
for resizing them.

Patches 7-8 scale the queue watermarks and the TAS guard band with the
MTU.

Patch 9 adds the ndo_change_mtu callback and sets the maximum MTU.

Tested on Sparx5 (PCB135) and lan969x (EV23X71A), by forwarding frames
up to the MTU and checking that frames one byte over the MTU are
dropped, by sending jumbo frames to and from the CPU while stepping the
MTU up and down between 1500 and 9216, and by changing the MTU
repeatedly while flooding the CPU with frames in both directions.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v3:
- Rebase on net-next, which now has commits 81d2cf1c6d56 ("net: sparx5:
  fix RX ring stall on frames from inactive ports") and 1a47bc214d00
  ("net: lan969x: fix RX ring stall on frames from inactive ports").
- Patches 1-2: drop the Fixes tags and the testing notes.
- Patch 2: on Sparx5, clear the RX buffer slot as soon as the skb leaves
  the ring, so that a frame dropped because of an inactive source port
  is not freed again by sparx5_fdma_rx_free().
- Patch 6: likewise on lan969x, clear the RX buffer slot as soon as the
  page leaves the ring, also when it goes back to the page_pool.
- Patch 9: extend the top RMON histogram range to the maximum frame
  length.
- Patches 5, 6, 9: use SKB_WITH_OVERHEAD() for the lan969x DB size,
  and fit lines to 80 columns.
- Link to v2: https://lore.kernel.org/r/20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com

Changes in v2:
- Patch 1: add a Fixes tag.
- Patch 2: also release the lan969x TX buffers that are still in flight
  on deinit, store the length of the mapped TX buffers so that two-step
  PTP skbs are not touched when unmapping, and add Fixes tags.
- Patch 6: reuse the lan969x TX buffer release from patch 2, and mention
  in the commit message that frames still in flight are dropped.
- Rebase on net-next, which now has commit 873363ac591a1 ("net:
  sparx5/lan969x: release the in-flight slot of a stale TX skb"), so
  that a two-step PTP frame dropped by a resize no longer leaks its
  timestamp slot.
- Link to v1: https://lore.kernel.org/r/20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com

---
Daniel Machon (9):
      net: sparx5/lan969x: stop the FDMA channels properly
      net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
      net: sparx5/lan969x: add a helper for setting the MAC max frame length
      net: sparx5/lan969x: pass the FDMA rings to the init and alloc functions
      net: sparx5/lan969x: size the FDMA buffers from the port MTUs
      net: sparx5/lan969x: add support for resizing the FDMA buffers
      net: sparx5/lan969x: scale the queue watermarks with the MTU
      net: sparx5/lan969x: scale the TAS guard band with the MTU
      net: sparx5/lan969x: add support for changing the MTU

 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |  10 +
 .../ethernet/microchip/sparx5/lan969x/lan969x.h    |   2 +
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 185 ++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   2 +-
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 322 ++++++++++++++++++---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  14 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  34 +++
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  48 ++-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 123 +++++---
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c |  43 ++-
 12 files changed, 687 insertions(+), 103 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20260930-sparx5-mtu-change-d7ebb1a7fcaa

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


