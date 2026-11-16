Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A0A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wy4NmL0p;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=5yV8kMQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=826ov78qP2Q842fxa0PM5ff12xaor6OwKbs+ThG4sQU=; b=wy4NmL0pZ5aRRRYXy7tKbWQXz0
	TYRrhYsm+THMwGwgESSbOO3M8v8FGHlpbHkF4ibTtu1eg0i89jB3oNHXK+d0RC+cQb+DHZpyEMOlC
	gnfcbju1li71v2wYoJvL/+lQo5iD637IdAIqqBsBxvNGnsaOb+EGxow6FCMuAP1Dj1KnrB8/EvtAT
	Ls94Cz6GFUpDfnRV+yLPplJeUkB6aQkHG8SjkV9vFYDXwamI6ALEI4vHCWoF2SIV9SFTesAQAtOeb
	guDyd0zslBGNumWqtHWkiBlS7mmQGwzatq8sZfoBdIUAOvqvK838Ke5q+RmTgHv4TGadiq10Z9vOU
	4qxl5Xcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsqx-00000001kKe-0smS;
	Mon, 16 Nov 2026 09:18:19 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsqu-00000001kKH-1ysu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820695;
	bh=hb1SHra0c6oIUSjdOL0+vPjC+s/ft/oax5PM5+83JJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=5yV8kMQv/8FxyufwLKZ77hp0BU0b1fkPO9lw71ihg8vRK/3gcLrJtYf9e9Yg343di
	 /LXbwuJYo5FQKZm7Tbueio+q6svMS9Pwuee8Q2QpxDQieo/nF0Wat8f5sHQnHmwaAi
	 8yW1T8t2Jc01eg25WF4AhS5Azb4SmRjBuS4nMhOPd1jhFBOJUg1JK5sX34fk+qmtV2
	 uX5o1n+NJL6PGIOBh40am7WmBGv3KRy8/PSTvZoLtSiW8rZLyviIaye42GJYJIcTGp
	 5aLc9qKIu/7D/SoV6pHwOHy2GQ5+8RecuaPPSWyU0FZomsK3xucol/O19XB8bcroxG
	 GWWTf4veYllBQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 19C268D74E; Mon, 16 Nov 2026 09:18:15 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 06:17:55 -0300
Message-ID: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011816_558343_08DD5555 
X-CRM114-Status: GOOD (  11.18  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The YT6801 accepts "ethtool -s eth0 wol g" today and then ignores magic
packets once the system is powered off. This series makes S5
Wake-on-LAN work. Both patches touch only the glue.

Patch 1 adds a shutdown hook that stops the device. The glue has none,
so the MAC and DMA keep running into reboot and kexec.

Patch 2 arms the chip when powering off with Wake-on-LAN set. The
sequence follows the vendor driver, with two differences that come
from measurements on the test board:

 - The function stays in D0 instead of D3hot. With MAC Wake-on-LAN
   phylib keeps polling the PHY until power is removed, and in D3hot
   that poll fails with -EBUSY and warns from phy_error_precise(). It
   happened 111 ms after D3hot on a normal power-off.
 - Bit 9 of LPW_CTRL is not set. The chip wakes without it.

Every write that is left was removed once to see what it does: without
OOB WoL or the packet wake bit there is no wake. Without the MAC
address rewrite, or without the 2 ms wait before it, the chip wakes on
the factory address only.

Tested on a Celeron N3350 mini PC, net-next at 6964ff21c5d8:

  net-next  wol g                         no wake, 3 of 3
  patched   wol g                         wake, 8 of 8
  patched   wol u                         wake on unicast, 1 of 1
  patched   wol d                         no wake, 3 of 3
  patched   wol g, interface down         no wake, 1 of 1
  patched   wol g, power/wakeup disabled  no wake, 1 of 1
  patched   wol g, reboot                 reboots, link back, 3 of 3

A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.

This series does S5 only, on purpose. S5 wake is the important case
and it is not implemented. The change for it is small and stays in the
glue. Wake from suspend and hibernation has a larger blast radius.

Giuseppe, this is the OOB WoL enable you and Yao discussed in the
s2idle thread [1]: it is only enabled when powering off, because only
a chip reset disables it again. If you can try "wol g" and a power-off
on the Slimbook, a laptop would be a good third board.

[1] https://lore.kernel.org/netdev/apSDPwF49Z1Zd0kJ@pie/

Magnus Leatti (2):
  net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
  net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.1


