Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666760A2620
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D67tbxpO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KVKQkHtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qpLwxWpXV7jpyie/JzY05PkW7uqT2gzRyZBD+Zmwxw8=; b=D67tbxpOhw89ri0a7GnN8o1WeS
	tKpIkepq/qQzeiYIskvl54EQuc0/C5opEPlY84g/oEdBHld4bPwBcCnBFvSDWnAW4fsUGyFvhOqTW
	7ZFUolFWgk/c9RNjFxbQTC326Se6M26aaQI0eZa0pD48w0T3vJUHSGNUPlouIh9RDS1UAzr9UVQD3
	P6uvrRAp0k/jsd06GARk55val2jNKZ0XtkutYAmQtENFHtMxMepEOA/+YcV3sz2AhTSL1g/HEak6Q
	UesTsgKKFGaYCR4dbtZTEdqPoUTEXzpQ3smxSE+kmr57tJuLtWqEbQ6vWBvWe/L/g64UMFhbh2P1j
	S+54OMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQexG-00000002aoQ-1arA;
	Tue, 10 Nov 2026 06:03:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQexF-00000002amj-09yh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:03:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4184F61855;
	Tue, 10 Nov 2026 06:03:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290616;
	b=we9oAa1WP6+ol9Hf3MU5HqBn1YrEZ3yGYsZTx902n9bmihz4PJTsdeH/bFCT7BmoC4JV
	 fTDJbxS3KIIh9fSvjZTe0JOLeObsMxzzk19AGKzB/v+bBefUBIZkpzQeqYXLl5+zom/qm
	 jeUhFS+T5rW82/L6N7nlvZiX/qUsBYzkYu5sYcalJu9T8KmCMrF0RZd3E5QWx6l+LdXxG
	 VYM6chfl3Ye719cwaWYDNLPE3ZG9eN1G7pJZ5OzKSfPDHc9JlmnRaYFr/DmGRHuFCriWk
	 2Gbl7EGNlTx8cjSYYIHuofk0Rf4jDZCXTB0e+JDFPpy9T62Wo36jdS+ldI9P4QHSmtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290616;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qpLwxWpXV7jpyie/JzY05PkW7uqT2gzRyZBD+Zmwxw8=;
	b=KDo0dJcWLOhk5fDcE9lkIK7pNfOU1YeGoaQf7H8XSvrJq9AUwJdQssHeHW0+qU8RiqP3
	 VmfBFHNrte2NfN31/7WOlY9UOmzJ7XpM8otqQEG7VVeIO9kAalYAw0Fig2ITlu/IJPe9a
	 U0E5HPnEk+FARZ/dzBFCk0gd4gDm4I3yA62oZEJUVjHU3YbQr7PCr6yQsWefYQ6bnQOZA
	 109oCIKY/3BxJHalPYgreoMiyEScB3lcnfC2yyzJnZhTVjBwVrVrjcScy1n3S6Zt0UjYz
	 4hNrTpMXKmPkUTCbxnaE/dyl70/8P47I9/SZjIGMkFlLLYCCbSs+ENeCoIckjULWHww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79BF61F0089F;
	Tue, 10 Nov 2026 06:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290615;
	bh=qpLwxWpXV7jpyie/JzY05PkW7uqT2gzRyZBD+Zmwxw8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=KVKQkHtNlsDsXQTwyqzv3ULbhrav+ZKr2xZse9o3N7ijFdZOF6TGvXOHTi3ss58PF
	 dZj0oDLx3ogOxmsNDLS/l6dUDzSTc58tWwY4OSB23QKxE2BfVddY09yxsnqA0okFuC
	 4QN3t2taeUAWEWAfKCgFflF7nS/5OkjXb9AGkH9sFEQeUQI1/IJJczpJ6biBUipXhG
	 HQDP92sP4yAhMmpXoZ1PWVFbmFBsQREKGmg8bnI6tdXk2Vh8lC3fm9C/hT8fBtkT8m
	 XEY44kttfmRnoOVzxMasA7pI7mBGVrn0aMMQXQBNR5io8vCbfelp+1PjR8G0bRUQ/P
	 nkpxneMsgJpng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0960D488CC;
	Tue, 10 Nov 2026 06:03:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH net-next 0/2] net: stmmac: dwmac-sun8i: Jumbo frames and an
 RX_TH fix
Date: Tue, 10 Nov 2026 06:03:34 +0000
Message-Id: <20261110-sun8i-emac-jumbo-v1-0-84bf00e9ffa3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ77oJRkaRfKT3EdNUVXEs2EUH8e
 9P2OAwzJyhFJoV7dUKknZU3KWBuFYTZy0TIr8LQ1E1vjKlRs1hGWn3AJa/Dhp1t3ehs53vvoGT
 vSCMfv+UDhBIKHQmef6N5WCik7xGu6wO3KepFfgAAAA==
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290614; l=1822;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=fve8G7g52w2v6vFX62vTvr/RCrFjlLHllgVlfUFu2aI=;
 b=yiASFtAaGQrGGu4XHXlG2h+pF+Hzb/UBBEhAtLY9NC58E0ylgDSaZ1CZuUKHzwRDxRzWB69fK
 xYjfYUjP8yuCPmZ059HUcJ++lca+DRT9JEoJp5/2I9MfGgy3MpRZQmU
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
(2018). Patch 1 corrects two swapped RX threshold values; it has no
effect on current configurations, hence no Fixes: tag.

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
Arun Iyengar (2):
      net: stmmac: dwmac-sun8i: Fix the RX_TH threshold encoding
      net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 29 +++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-sun8i-emac-jumbo-4839f984a6a9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



