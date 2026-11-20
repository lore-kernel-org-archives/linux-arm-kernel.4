Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C360A2614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u6qf5xsD;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=sC1GMEwa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VNOkihmfuxQHasaFJdR1bkBsLJOvAyscg1Qc15Sryxw=; b=u6qf5xsDaPGp4KXXSQhUWRBVeG
	FmphtqQVqNQcDNpjG6EwVQZMv0v7NP7vRePOkvgGLV9j5omSLKMUxXmDBM8QO4ta0KHCrikFt+PvM
	TXN7+T6du4FX1Ja65vgLT57ncTQQ34I43lc2b7tlz1cZrCLRd1yaE5fDx/x788tPvlidKI/L2bt3k
	tI0lBhDIf7mMyXQeYka3XqzfqRgtXFx2Rn4+gra3xxftbU/e7KBjoINwqTuAVGLn2qZhrbjr5Bef3
	ZyKG+SLRzCfNLwcMxzW8ekh3GkFJWD0vjNe60hSqZs6d653Cnz7WK3C4Uygr0GvTZ5vxDUqJmYpvM
	5kqBDpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULr0-0000000Eb7w-2kxY;
	Fri, 20 Nov 2026 10:28:26 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULqy-0000000Eb6x-3dbd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795170503;
	bh=l1EI+mpAa57uBbUK8AVL1RHaWOFwGCZ4WQgzuhAVFKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=sC1GMEwa3ijSEUBodg3jnnlp9bXBIUW0AjR1r0vWnyaDOuo2vHwMVFsbjs/2QVQrL
	 USeIT4vB6jVfJIotQ3C4NOPKiuEohoPQt3JiRZct6nm2ajirSW9MpGfpGCxzMK8DF7
	 rNjTnrmk6mf4g4Rrefn03WGDNZnfwGoVCLVmGov4vKt+dh2a/cxc9rth2XXlHWiegP
	 GG/R2vPWtF2WDQQIrS/iJ1wj3doDjbFehySkICMsVNpHCZYE7HOvjLrRUIGQBA8ygT
	 OJyuhRWKJW1mFe7aeCB6+a5G/SpuFlVECwBiQvQYDQzAcoFewO+en7Zt6V/fMtdYwu
	 99P48oGnQEZBA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 785768D801; Fri, 20 Nov 2026 10:28:23 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
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
Subject: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Fri, 20 Nov 2026 07:27:52 -0300
Message-ID: <20261120102754.778283-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022824_952809_27D7E195 
X-CRM114-Status: GOOD (  12.52  )
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

YT6801 accepts "ethtool -s eth0 wol g" today, but ignores magic packets.
This series makes S5 Wake-on-LAN work. My patches here touches only the
glue.

v1 called stmmac_suspend() from .shutdown and Yao rejected that [1].
This is the design proposed by Yao, remove the device at shutdown, reset
the chip and let it arm itself.

Patch 1 just wires .shutdown to the existing remove.

Patch 2 arms WoL: after remove, it resets the chip, restores the cleared
packet-wake bit, enables PME and drops to D3hot.

Changes from v1:

 - Wake uses the eFuse address, not whatever the driver programmed.
   r8169 works the same way.
 - Magic Packets only.
 - D3hot now. No more polling so D3hot is clean.

Tested on a Celeron N3350 mini pc, NIC soldered, net-next at
6964ff21c5d8 with storm fix [2].

  net-next  wol g                   no wake, 3 of 3
  patched   wol g                   no wake on the address in use,
                                    wake on the eFuse address, 5 of 5
  patched   wol g, 15 min off       same, 1 of 1
  patched   wol ug                  same, 1 of 1
  patched   wol u, unicast frames   no wake, 1 of 1
  patched   wol d                   no wake, 1 of 1
  patched   wol g, interface down   no wake, 1 of 1
  patched   wol g, wakeup disabled  no wake, 1 of 1
  patched   wol g, reboot           reboots, link back, 3 of 3
  patched   wol g, kexec            new kernel, link back, 1 of 1
  patched   wol g, hibernate        same, resumes, link back, 2 of 2
  patched   wol g, cable out, in    no wake, 2 of 2

19 patched shutdowns, all clean.

Hibernate on this box ends in a normal power-off (S4 is off in the
BIOS), so it goes through .shutdown and arms the same way.

The last row is a true power loss: So if power drops, it just won't
wake. Meaning: It needs to be shut down cleanly through the driver
again. FWIW the vendor driver does the same: wakes after a normal
power-off, sleeps through everything after a power loss. So its a
hardware thing and not something a driver can fix.

Giuseppe, your Tested-by was for the v1 design so I couldn't carry it
over :(. I'm sorry, could you test again?

Sashiko's nagging on patch 1 of v1 [3] came from calling
stmmac_suspend() in .shutdown. v2 doesn't, so it's gone.

BTW stmmac has an old bug here: if a resume fails, NAPI stays off, and
then closing the interface just hangs in napi_disable().

Changes in v2:
 - .shutdown no longer calls stmmac_suspend(). It removes the device.
 - A reset arms the chip, no more OOB WoL or MAC address writes.
 - D3hot at power-off, v1 stayed in D0.
 - Magic packet only, on the eFuse address.
 - The wake condition is read under RTNL.
 - Added Suggested-by Yao on both patches.

v1: https://lore.kernel.org/netdev/20261116091757.1656602-1-magnusleatti@kernelriot.com/

[1] https://lore.kernel.org/netdev/avsTEglKKD_wl_Fi@pie/
[2] https://lore.kernel.org/netdev/20261113103236.2184751-1-maxime.chevallier@bootlin.com/
[3] https://lore.kernel.org/netdev/179499351041.3136.14889707783816630750@kernel.org/

Magnus Leatti (2):
  net: stmmac: dwmac-motorcomm: remove the device at shutdown
  net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)


base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.56.1


