Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EE606A8A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDdNX8dX;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=CI/3Rm9B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ffya1PyP3rVgK3FKUJMeUTOknHVDLAS7rmXQhoJQICA=; b=hDdNX8dXhURhdCzyQHPRdWpqyG
	h/v9kqkoLlnK8i2zYZOHQhWjKHfZtkDH0sKFh9Fj+tybDiddLcDsIwjR36NN50KFX2eM3+vdpuZl5
	fs23BkRTt1CGTrU52uhz7txUrehHRGpXGxystAqLVKPClml5heEJx2Pq9SnnGk0braoKAUQ3Cjb0c
	Vcj/6ob2VHjV/YtYAazvE1hKubAvN8KEWDysEyJjD4rVZ5Hl7xlIKhqpptUp09qZlJ01Vh5D2pKX6
	o66jQRM3pPMtMc096cIPkbR1S99DqPER69a4RcnQxgndiT9DaVA5drpm4cldRX4wIauXcvCnNMdQq
	+u258F3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MJ-00000006x9J-2lyG;
	Wed, 11 Nov 2026 14:31:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9MG-00000006x8M-1aLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794407488; x=1825943488;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ARf6Qy9+lKPIUIodkBHNGoX/Amz6H0JQ2oSXq5Hzxl8=;
  b=CI/3Rm9BxO2wWI+lonsgPsKzZzOEC7f+dOCB8auwCbrR8wmTABu5J/1T
   XezkbDzyl1bNk6WCz/yQ9rZUhuUydgFkln7kmXDI3oNikP0n5aofEb8ET
   FsFsWWauIcek89lVQSm1AEr8BQJ3mAGoUfeHqq4v36xSzT19nUyboo9FJ
   e79b9nnQz26B4e8+8INu5Xk0lGtbKUbNe6vdgPqU7ZYXxapQalA/trGgG
   cB6E9HC/UhD8j7RasGCLY1ezAigx9dsKLV33N8P1+IjCLAwSjTV7foclb
   5L+0S8n7D3YaobGy+dRHJ4f1XBKLGU/4EYWw2LrWEe94B8pdFzUFjQb24
   w==;
X-CSE-ConnectionGUID: xPdy8HDdQ8WgP3ZgxhmbiA==
X-CSE-MsgGUID: txKp6d8FTIWKTSByyUbJig==
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="66598085"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 07:31:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 11 Nov 2026 07:31:26 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 07:31:23 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v2 0/9] net: sparx5/lan969x: add support for
 changing the MTU
Date: Wed, 11 Nov 2026 15:31:10 +0100
Message-ID: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC589GoC/22NwQ6CMBBEf4Xs2TVtEVBO/ofh0JZF9kBL2kowh
 H+3Eo8eJ2/mzQaRAlOEttgg0MKRvctBnQqwo3ZPQu5zBiVULW6lwDjrsFY4pRf+Cn1DxkjdDFZ
 ryLs50MDr4XyAo4SO1gRdJiPH5MP7OFvkwb9eKUX1x7tIFDioxmhTXcWlLu8T2+DtyPPZ+gm6f
 d8/e3qRBcAAAAA=
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
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_063128_740379_5692395C 
X-CRM114-Status: GOOD (  17.83  )
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

Patches 1-2 are fixes: patch 1 makes the FDMA stop sequence actually
stop the channels, and patch 2 frees the FDMA buffers on init errors
and deinit. They are routed to net-next rather than net, as they
fix issues that are not regressions, and the stop sequence is only used
on deinit until this series uses it to resize the buffers.

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
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 193 +++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 321 ++++++++++++++++++---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  14 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  34 +++
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  48 ++-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 123 +++++---
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c |  43 ++-
 11 files changed, 693 insertions(+), 102 deletions(-)
---
base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219
change-id: 20260930-sparx5-mtu-change-d7ebb1a7fcaa

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


