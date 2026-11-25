Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3894A606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oWF633Ra;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ERGcCfCU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NQp51liHmYpWiIsC5iPGTHmNNO8ZHyt8Nx/cyeBgMm8=; b=oWF633RaAAiGHYaulr1ltR7WS4
	NLVdyqI8jhsuCkBMZOA7KsavwgzOyl76XGM6JK3st3iJJ20F32XVQNp/svyBq0DYuq7vNZOTbutpK
	yGMGcj2YhjYQRPv167q1FLe+I0rQSDXVYNBVT+QFazfmb8bOMz5zR47nfpYlIqflOF/+piNmADFtY
	9j5KHtL+gfIFjwVIxjrzvjXotG11yFZi8fSMPhyChZSFbg7grmsM0/pLxhrMi7r/wJ9ATZQV2vWMH
	Ebkl+TLOdP3ndk9/xcbkYDTjQNcOhfTRnXhVhiDZNawNbM0FHQHn28dPNXhJKreTzcAxK/Ao3qIq9
	0dUj5bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD9n-0000000A0XM-3B7U;
	Wed, 25 Nov 2026 13:35:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD9k-0000000A0W5-29Lv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795613728; x=1827149728;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Txjup62vWuwXBbpPq+9a0ZGnVGpiUgDc5L/hZ3rQnrU=;
  b=ERGcCfCURSks8ktuT2e/BMymJrdKKeG6ha9cgXXqPof15brrrgILFJ4K
   XvUrnj8zGzRacj/euaiEsZkqYpb3DSX7NUMrHQxvvyvFVdruocM9X3Lmg
   +8ovZ2FPiEwgk82ZtoMeKMlIj8s+JzXrDf8EOHttbETfgLaQ7n29BymSo
   hvcoXHuaa7nvY1YkUpMooS/FmCbZIFjswxJFPhob5WBlfFtqspBUb9yMF
   zpsaiaDjeo1mbIZqeDqYhys0qKsPweuFQppx7agYG2HjWLcUUJ56vbuel
   hgzMFIvsgmyewXn/WWDjH+UFIgaeS9uGKdCVSoG78H8ivinEY3yxP22oV
   w==;
X-CSE-ConnectionGUID: lRMufyWDQ7iQiM+bz9qwMw==
X-CSE-MsgGUID: eCyoESBEQwmqsLB7WoIDbQ==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="77846903"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:35:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Wed, 25 Nov 2026 06:35:25 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Wed, 25 Nov 2026 06:35:22 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH net-next v4 0/3] net: sparx5: add router legs for L3
 routing offload
Date: Wed, 25 Nov 2026 14:35:05 +0100
Message-ID: <20261125-sparx5_l3_routing-v4-0-86a9bac28fcf@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAnkBmsC/23OwWrDMAwG4FcpPs/FshMn6WnvMUYJstIIVjvYm
 ckoefcZH1ooQaefH33SQySKTElcTg8RKXPi4EtoPk4C59HfSLIrWWilrdKgZFrGuLXXH3ON4Xd
 lf5OD1U3bU+OMG0XZWyJNvFXzS3hapadtFd+lmTmtIf7VYxlqX10L+sDNIJWc0CAosGpqhs87Y
 ww483LGcK9i1i+lP/wu66K0A9kesS8zHinmqQBAd6SYohRDkesG7By+K/u+/wOGWR1ETAEAAA=
 =
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
	"Steen Hegelund" <Steen.Hegelund@microchip.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Robert Marko
	<robert.marko@sartura.hr>, Eric Dumazet <edumazet@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_053528_562545_29F06DE8 
X-CRM114-Status: GOOD (  22.49  )
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

This is the first series adding L3 unicast routing offload for IPv4
and IPv6 to Sparx5 and LAN969x. It adds the routing registers and
the router legs, the hardware interfaces where routing happens. No
route is offloaded yet. Routing is enabled in the chip, but with no LPM
rule a routed frame misses the lookup and is redirected to the CPU, so
the kernel keeps routing every frame in software.

The chips only route in VLAN aware mode. A router leg is created for a
direct VLAN upper of the offloaded bridge when it gets its first
address, provided the upper qualifies for hardware routing: a non-zero
vid, the bridge VLAN protocol, the bridge MAC and no master. Any other
configuration is routed in software as usual.

Patch 1 adds the register macros for the L3 routing blocks.

Patch 2 adds the router legs, their lifecycle on address events, the
global leg base MAC and the hardware enable sequence.

Patch 3 keeps the legs in sync with the bridge. A transition that would
leave the hardware and kernel routing differently drops the leg instead
of being refused, and the leg is recreated once the upper qualifies.
It also follows bridge MAC and vid changes and the upper going down, and
recreates the legs when a switch port joins the bridge again.

The plan for future series building on this one:

  2: track FIB entries and trap them to the CPU, with the LPM VCAP
  3: main and local table arbitration, FIB rule refusal and neighbour
     host routes
  4: forwarding through a single nexthop, ECMP and blackhole routes
  5: routes through nexthop objects

The Super VCAP shared-register race reported on v1 is fixed separately
by commit d7a8d500d7e4 ("net: microchip: vcap: fix races on the shared
Super VCAP block"), which is now in net-next.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Changes in v4:
- Queue the leg reconcile when the first switch port joins the bridge,
  so it runs after the bridge MAC is recalculated.
- Queue the leg reconcile when a vlan upper of the bridge comes up, so a
  leg lost while the upper was down is created again.
- Tear the router down before the switchdev and netdevice notifiers on
  remove.
- Publish the router only after its workqueue is set up.
- Link to v3: https://lore.kernel.org/r/20261117-sparx5_l3_routing-v3-0-e680ed79c7dc@microchip.com

Changes in v3:
- Split the series. The router code is now rebuilt as smaller series.
  This series keeps the registers and the router legs. The VCAP
  preparation moves to the second series.
- Tighten which device may carry a router leg: a direct VLAN upper of
  the bridge whose ports are offloaded, without a master of its own,
  with a non-zero vid, the bridge VLAN protocol and the bridge MAC.
- Follow the transitions that would leave the chip and kernel out of
  sync: enslaving a leg to any master, changing its MAC, and disabling
  vlan_filtering or changing the VLAN protocol on its bridge drop the
  leg, which is created again when the upper qualifies.
- Destroy a leg created from the address validator when the address add
  fails afterwards, and handle IPv6 address removal from a work embedded
  in the router rather than one allocated per event.
- Keep addresses when a leg cannot be created, and route that upper
  in software.
- Disable a leg as an ingress router leg while its upper is down or the
  bridge does not carry its vid.
- Flush the legs of a bridge when its last switch port leaves and
  recreate them on rejoin.
- Program the leg base MAC from the bridge MAC when a leg is created,
  not only when the bridge MAC changes.
- Enable unicast routing only on the switch ports, and restore the
  routing registers when the router is torn down.
- Carry on without offload when the router cannot initialise, rather
  than failing the probe, and skip the router without CONFIG_VLAN_8021Q.
- Remove the blackhole leg and the IPv6 link-local trap.
- Link to v2: https://lore.kernel.org/r/20260810-sparx5_l3_routing-v2-0-59e68cc8c8ca@microchip.com

Changes in v2:
- Reworked neighbour lifetime: anchor neighbours to the router leg
  instead of the most-specific covering FIB entry (matching
  mlxsw/prestera). Fixes a neighbour-entry leak (memory + VMID + host
  VCAP rule + netdev reference) and lets the software LPM be removed
  entirely.
- Fixed a heap overflow in the fib6 nexthop prune path.
- Fixed a leak on the router_init() error path.
- Hardening: netns filtering and offload-ownership checks on the global
  notifiers, and a NETDEV_UNREGISTER leg-teardown backstop.
- Fixed do_div() misuse on a 32-bit value. Added the missing RCU
  annotation on in_dev->ifa_list.
- Zero-initialise the actionfield data in vcap_rule_mod_action_bit().
- Updated the sparx5_router.c header comment to describe the
  leg-anchored model.
- Link to v1: https://lore.kernel.org/r/20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com

---
Jens Emil Schulz Østergaard (3):
      net: sparx5: add l3 routing registers
      net: sparx5: add L3 router legs
      net: sparx5: keep router legs in sync with the bridge

 drivers/net/ethernet/microchip/sparx5/Makefile     |   2 +-
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   1 +
 .../microchip/sparx5/lan969x/lan969x_regs.c        |  11 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  13 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  36 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 528 ++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |  11 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |  11 +
 .../net/ethernet/microchip/sparx5/sparx5_router.c  | 920 +++++++++++++++++++++
 .../ethernet/microchip/sparx5/sparx5_switchdev.c   |  30 +-
 .../net/ethernet/microchip/sparx5/sparx5_vlan.c    |   2 +
 11 files changed, 1560 insertions(+), 5 deletions(-)
---
base-commit: 612848d37e68b858e15815175f1c5e609e09d719
change-id: 20260210-sparx5_l3_routing-962458e4d3da

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>


