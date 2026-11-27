Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D78606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NyfZ0N2P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/kEqQ+w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=APUBEu1K7e4kF4W+1W0G/ibD6Yp22kroRgoWt9fbmFo=; b=NyfZ0N2PHYXMeW14/wvDO2l5IX
	I5sqG7sgdN5cO+j3Wktc+OyhOKJMKhDXIM9HmZK1OFOnvxIP33DGZaqBRcb5IyAvt1qJLk/FHhxTs
	xsYjWaMJ44G97H8bbX6ELkAhFBI/zOfnB0B44wkO319JkxJoon0qfiUmV3uhrQ0WsmtfGsnlWgT2e
	Fc+dZjUpD0QEeH4CZ6RQR5lbmJiz1Z99J4E3/MjMN0yJtG/oed0wOnqgC4F8p6LkvpvzptUovcJCx
	yhoZTgsMk8EJWnDZkSuhhj/dA6nj3ooZTZ8bXo+SJOVZ1ZgImRKHc4AmPe9DSv3C5YpquyHvZu3Jx
	ctLC4lqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvSb-0000000GCJ7-2EHe;
	Fri, 27 Nov 2026 12:53:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvSa-0000000GCIl-1xzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:53:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8C1440A12;
	Fri, 27 Nov 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795784031;
	b=d0/W8Lif7yFSdqhiZpNwVL8Ij1gfNntdb4yxn4+xRs7sSzudslxpdyN11U/5vO8axXiJ
	 8ZVDzj1VT/K/ACh/4+qFpaej2U3iRiDpgrX1z/AtfWGQ3EDOlX8q4yrIzxzHQrMy0fWz+
	 ZAv5Uza7klVh2RfI+2oxtvkZYdp38OVxkOBznGE8ZKIfNFe1N7mGvEg6V9n2rUMQC8A8u
	 q6+qRqQlKDnlW5lbfFw9geDviToDIxXEPGYktsvcNB8DTPpbfYlsURQqTzIF/59lpvrxg
	 BefQXy3nQcJy0DnvQx9fiyeznAlUehY3KKFElsZjRyyD2bITwWQgzR3cgLEatzmQqpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795784031;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=APUBEu1K7e4kF4W+1W0G/ibD6Yp22kroRgoWt9fbmFo=;
	b=0ryptcQDdoSquJW1jwWR60N2OkuQr9ixxDTYHCA1DbFQf7/zWQw/zbUOsUi082FFh4yq
	 PpAqPpcj/JCkrtCp0xMQXNzs5EoVDkUwZ66vdXkxO2e6Rw3oP7CNKpO/EJ8Zpm66r6zrx
	 en5rWKkQN+5aarOZCLwmSPW8o1HJEnRCnb5Pg2JWkhBCgaMkNXE8hydVMKG52bxs+YuFh
	 YwmWeBSQwRP10CUwDb3GtSZtiRSQvBYoMPhMYpuyuH3dvfzhCi8tuw/6NJolvxikunlkf
	 7ExQmFan4Kwy1IpikcxyBr4KFusbriUTHsWO9+7TCtmxzGsF2PD3VX9h+L54yIszg0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31DDC1F000C1;
	Fri, 27 Nov 2026 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784031;
	bh=APUBEu1K7e4kF4W+1W0G/ibD6Yp22kroRgoWt9fbmFo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=B/kEqQ+w/iQNB9wNX2fSvl7iXsczPr6NirwEY5RWXiuotWOpXiGBFgQ7lEcWQczhv
	 8/ji0KkfXRRirjrVVuLraqxYetK12TCfoj9q+5d5iyfctDlv2fkaO7B4l3YC1HNrcD
	 HTb7noKe4uw/UgtPmB9m40xmJf3jqlk0DmJYKRQTvxcCjmQCX4clRzJi0NThW5hxRw
	 lEL8kzaO+YCw7tJ3XpkMcamIt1wzMT12cn35xB+EXUNm0dnJZ1/5HM/bSzO8/3So7K
	 CsTZQ7q89LX0UkPUeuGI2gTKabduDvv9+dxa3TeU6wM9OElE6CFh9+pwrrgqo5WL0J
	 69dahp2m3cfKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A4B964B7B9;
	Fri, 27 Nov 2026 12:53:44 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH net-next v4 0/3] Add Cortina Systems CS7542 network engine
 support
Date: Fri, 27 Nov 2026 15:53:43 +0300
Message-Id: <20261127-b4-cs7542-ethernet-v4-0-ea4d8cd6ef18@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QwU7DMAwG4FepciaoiZOmmxDiPRCH2HG3INpCk
 1Wbpr07WRlShSaOVuzPf3wWiafISWyrs5h4jimOQynMQyVo74cdyxhKLXStG6U0SDSSkrNGS85
 7ngbO0m5I2YDk2LEog58Td/G4oK/i2jDwMYu3n5d0wHemfDVvvRN/HcrefBtAn1jS2Pcxbyts/
 KbzYIiNah1hswlAtm29Qew6AkVcNrfdleo5Jb8E3lZPt7z2N2w6JRoHORtZSwBwiHUANO3Lrvf
 x47Hse14S7mPK43Ra7jGrJdB/X59V8bqAllvSwdYrb+FmvSbsXUIXItTsgRpGcPYvAWuiuUtAI
 codbACnWWFYE5fL5RvW0r/h5gEAAA==
X-Change-ID: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784023; l=6644;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=RNl0JlHhjuvh1aWNI+g2JDijPtPR+EGlkS41ffVGy8g=;
 b=7x8mLPT3EPrd3HpiRKRT8YKov8AT6zcQYGwMLBZISPi1J8ohDVPkae9QQCVdT/ASPW3g1mMff
 rJWExeKVxssBpftjb5aHW5yf1JTio9eC4i99TM5fsxJbjCPJvGHSxmh
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the CS7542 CPU network datapath with phylink for three GMACs.
Almond+ connects two GMACs to QCA8337 CPU ports handled by DSA.

This series depends on the combined CS7542 global controls v4 series,
posted separately against Linux v7.4-rc4. The consumer acquires the NI,
FE, TM, SCH, QM, DMA and NI-XRAM reset controls exclusively. Board DTS
support is separate. The verified 64 MiB no-map queue-manager reservation
is required. NAND uses PIO; a separate SSP DMA consumer cannot run
concurrently with the shared DMA reset domain.

Use normal NAPI weight 64 and external-DDR QM/TM setup, with no module
parameters. Support scatter-gather TX and multi-buffer RX, bounded
initialization, tracked DMA ownership, shared NI register serialization
and protective reset before freeing active mappings. No checksum/NAT
offload or performance capability is added.

Changes in this revision:
- Bound immediate polling of a DMA-owned RX head to four NAPI polls.
  Thereafter complete NAPI with the interrupt masked and defer the next
  attempt to delayed work. Never recycle the hardware-owned descriptor;
  cancel retry work when closing or removing the port.
- Disable bottom halves when scheduling NAPI from ndo_open and the retry
  worker. Restore the RX lock and IRQ state before enabling bottom halves.

Validation of these changes:
- Actual-source ownership/backoff cases cover transient and persistently
  owned heads, recovery without a new IRQ edge, stop and retry cancellation.
- Nine actual callback cases per GCC and Clang ASan/UBSan exercise process
  and softirq scheduling contexts. The pre-fix source reproduces two
  context defects. Native ARM, basic Ethernet ARM and integrated OpenWrt
  6.18 ARM compilation pass with W=1 and KCFLAGS=-Werror.
- These new retry/context fault cases are host checks; they were not
  injected on the board. The final folded source matches the already
  reviewed and compiled source byte for byte.

Earlier combined-kernel Almond+ checks covered reset/probe/removal, LAN1
protected-data transfers and automatic watchdog return to normal OpenWrt.
Separate earlier fixtures checked 600 UDP echoes, 20 ICMPv6 replies and
448 scatter-gather/jumbo frames. Protected-region hashes and flash layout
matched; unrelated concurrent settings activity was excluded from any
unchanged-settings claim. These observations predate the new retry/context
fixes and are integration/functional checks, not throughput or offload
results. The old hardware matrix was not repeated for this reroll.

---
Changes in v4:
- Bound DMA-owned RX head polling and defer retries with the IRQ masked.
- Schedule NAPI with bottom halves disabled from process context.
- Link to v3: https://lore.kernel.org/all/20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com/

Changes in v3:
- Include FCS in RX buffer recycling and retry transient descriptor ownership.
- Validate the shared MAC prefix and reject sibling-clobbering changes.
- Drop the RESET_CONTROLLER select from the Ethernet consumer.
- Rely on reset provider error propagation instead of redundant status reads.
- Use bulk deassert on bring-up; preserve all protective assertions on teardown.
- Link to v2: https://patch.msgid.link/20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com

Changes in v2:
- Use the common parent provider and all seven exclusive reset lines;
  remove the virtual reset child, duplicate provider and consumer hook.
- Assert and verify every line without protective-assert rollback;
  retain active DMA allocations on any error and deassert in reverse order.
- Use rgmii-id in the binding example for switch-inserted RX/TX delays.
- Remove module parameters and unused internal-buffer mode; retain the
  previous default external-DDR initialization policy.
- Use NAPI weight64, plain static MMIO helpers and goto-based open cleanup;
  retain the lock-protected publication and stopping gates.
- Serialize shared NI RMW and stop on the first scheduler command error.
- Keep MAC preflight before hardware cleanup registration and preserve
  a late NVMEM probe defer instead of replacing it with a random MAC.
- Recycle bounded RX fragments also when the frame is dropped.
- Poll already queued RX after open and retain safe closed-port TX reaping.
- Review Sashiko 231860: existing NI/SCH/NAPI fixes address the older v1;
  temporary BM initialization bypass clearing follows the vendor sequence.
- Link to v1: https://lore.kernel.org/all/20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com/

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
To: Linus Walleij <linusw@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Fil Dunsky (3):
      dt-bindings: net: Add Cortina CS7542 network engine
      net: cortina: Add CS7542 CPU network datapath
      MAINTAINERS: Add CS7542 network engine support

 .../bindings/net/cortina,cs7542-ethernet.yaml      |  162 ++
 MAINTAINERS                                        |    7 +
 drivers/net/ethernet/cortina/Kconfig               |   13 +
 drivers/net/ethernet/cortina/Makefile              |    3 +
 drivers/net/ethernet/cortina/cs752x_fe.c           |  477 +++++
 drivers/net/ethernet/cortina/cs752x_ne.c           | 1965 ++++++++++++++++++++
 drivers/net/ethernet/cortina/cs752x_ne.h           |   13 +
 drivers/net/ethernet/cortina/cs752x_sch_tm.c       |  688 +++++++
 8 files changed, 3328 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
prerequisite-message-id: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
prerequisite-patch-id: a9208276c628f8741a807d0e5c5945d4bf211c8a
prerequisite-patch-id: 65d46bb3caaa8518ee561f65d3f603ade396fff9
prerequisite-patch-id: a0ed5fbcfa308b16eaf265371a6697ad0aea6802
prerequisite-patch-id: bb8ffd99cb30e5a0b47881f6ba19a36329d5f4f2
prerequisite-patch-id: 7fbe9405265ef3d1ec62811415a46c0061afd7c8
prerequisite-patch-id: 01ece2c91e080d5cae6af81944159373776484ca

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



