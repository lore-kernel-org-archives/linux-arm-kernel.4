Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C639F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fyq3x15Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BAuDG26z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=; b=Fyq3x15Y/rHj1XR3SvVS60kUQD
	2ymjhUBPfZ9XKPAG29klIz0oyk4aKLmUu5JcLoA7BRWQwQJG9vY3T1BMMQIS2QLEvX5S5+In/YZDY
	KVacelbFtqKryP4gxS/LqZoMfNhZqT7tQeDQBt5nFkrZ8ree1Nm6CQp8YOzDUimYE3b8q7OW+m9UR
	ka9SdcAGbTDdfeop7kZbpV7VNIe+BIt/ZJUAIDnmFSoP18WpXVT0XXFM9qQA+STxHCTC7qdjyGT0G
	vqd0+GC+3YPbcBVJtSeuA3htKbasZH5DiZefkX5Z9opYNCkG2j1jlcsC8bmbRhnA2JZCxtT++r/86
	UkrZ/esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAMl-00000009U11-3SuS;
	Wed, 25 Nov 2026 10:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAMg-00000009Ty3-3trJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:36:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31A0062792;
	Wed, 25 Nov 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602997;
	b=bCJQCM7n0C5ehA747q2wsPMi6a2ZiRz4GM5k3pN9gbakBjoTpiFKD3uZUv5XJonPCnZZ
	 wA6e4p+Dv3kKwPWX+LCnrYjXMxZjDFbSJxD+mRqcAQjETHMI3RRRnIioyStAz788NYYbF
	 nXk0fWgTerNkRP8t+s0s0WjzeitjpeIHkzmlGTgQPfAoWKBpcWL41Rm7XP3w1xxnQAevr
	 i5EERuL8EC9l9GC6Oa4nn/sweQgbDH4LkwbCqcTuYvCUIrgD3DF5mOvV9MduIkqExVxx0
	 0fRgfBTKA9Ltz9y8aNcYknij2Rhd8kdBYdg3Ane88bNoQXin0brPKSDQynxP7oIcPuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602997;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=Gp6Pg0WgTroQp970wPciwJFWj3pnZW9iWzXbq4GM7je04YaUuLmBMmLXWWCoRO+P36rI
	 sYrQK9Cu4uCoF2CFyVdyOGV2Rt1WC9X/ZYkid9H00nhiNhLFNOdmV4zYDjhaurhH6fSzB
	 9vWqDFEmFoSJdEK7rCz/qFDE/JvKvblM8nIMFgJ4tqC0WieTUyt/fjGs+eaayvd3pfmAr
	 MCj6S+zo1PIC6t0wSiIs+m4pdmGJ0s89cj5E167+WJW3X0vdQcja32HgUNPdbuydOsHx3
	 NR9luZgkeXU4PC8IkkKfgUl6Mcv6ui+Wnu/QbIjlg1vUnFXwclh5RolnlMfPac7WlSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4545C1F000D2;
	Wed, 25 Nov 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602997;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BAuDG26zVXJuRbJ/AuiWb79JjbzH5D3vC8zPaVl1U+XkieHcYyViuj9GgunLZPcdb
	 Ma5lMlqrHr6WSk4bnup7HsuHVTrBiFJ7gfN7ToiVTfY+L3J09lI4b9C+k/fuc7/YzP
	 8GAyh0Mj1pu2BftGOC2rtNkb5eWFVZ+sm9CJI8hCcKqbKRnKBPkN0pFPAhyHHSq3UY
	 qW0eHU8PFWnduyfNN/jFBgWerSDLBceqwK8GOXkROSVAuZEqmbkhvFAA+PhddW9hdb
	 gsAX2FQsD1cTD0HR1GyjewQY97HPh/tSf9t/arkfp/e66lkohtd1P7fRqf2wy23mK6
	 mS4lCXwa0YPVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD30F4CE6A;
	Wed, 25 Nov 2026 10:36:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:36:33 +0300
Subject: [PATCH net-next v2 3/3] MAINTAINERS: Add CS7542 network engine
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-b4-cs7542-ethernet-v2-3-d0ea3c6eb375@gmail.com>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
In-Reply-To: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602990; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=WytHn8t8+oyEMkF3t9YfnXXkpxg8BOu1XUNxrDoQi8oj3WHXS0vg/ozuXGkWskxW99Jzivcu2
 Lk+QO9nRKKBCsWPOJpEei44OKfZy/DXMcX5Ey8834fMJ+n1HCcsVpNg
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Cover the Ethernet binding and network engine datapath. The shared
global reset provider is maintained separately under global control.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 703e95e83..53d482457 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2961,6 +2961,13 @@ F:	drivers/reset/reset-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
 F:	include/dt-bindings/reset/cortina,cs7542-reset.h
 
+ARM/CORTINA SYSTEMS CS7542 NETWORK ENGINE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
+F:	drivers/net/ethernet/cortina/cs752x_*
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



