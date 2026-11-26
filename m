Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64BB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hfwf0yYG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLmOwNlv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=; b=hfwf0yYGwUoZajzV2Y4DkoIVcF
	ztIBFriiqxOnvXEVq4d8LwZIqMWrLIRhVYJAf3oaw6Po96z5sIhn2l87M0keNPQg0WzXJnCAYf30I
	e4mOnzxjvxB3aJeeQ0chAJOfIPkaYleNJh+nySteff1rrAXu86YVq86fVebz1pDmPbDzZqfhvhF19
	3lNMTI1FFtWxqJj0DB01A7hem6enQFEZIH0hQFM+JLSKlcjLiBRCspH0Ah7NNKHtlyPr0apSZ3cLp
	FNdMos+2wnjHFiXhY3/LZI/PM+kQEJ/OE16mQc8yKyv2dzDnYEBYGxTzvHpXAn1jD9enbP9bhVcZD
	xjubWdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYrN-0000000DDWf-21i4;
	Thu, 26 Nov 2026 12:45:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYrD-0000000DDMv-3NPW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:45:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 452D363361;
	Thu, 26 Nov 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697146;
	b=2+2EDq0HFYCa1kHresX9BmbZxcxwCOM+Pl+uMDG4ktKcpvwemfYzQBl6qyYBuvfYgBUV
	 Y/4dHxvqC4jT+6cjmf+Wh58quR9MsddS4W4DXpfMHWnrifxv2yiEKuQye23Az8dLa86sO
	 1rY3mnWTo7CnrgtHgP17swEaulBjJtinVeecx9MQ0KJY2/n5VoQFa55heMVB9Bu/gd8PS
	 OFTqvexXZx6KSQSUV4umC6Gw43IYuAnxwXE3GV5YGS4u+LQ1Nq1b/xlRevjekyvRqp7q9
	 VnAJjyXL2Raio1IZY/d0CZy+KW0KEAZ3yPVMYt1vgH7+8XAtR6qjx++vIlifCP0qtwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697146;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=NnqTGfElOlJ7UdBB1ng+qZdJXuiZzce/8GgdnTl8mi6wxpVsJ6j91eKTaOdQw+ExFWHq
	 erBaiUsvx25H5Cwk30EAAgwP3FIzP0RaJCyIA/o0pG/j9fBPGGGmbETbOw142wposzonM
	 tMguFmBABlvtLSOYc7+Z5JbNd1Iu6IhYJHdhKLxjON6HP6yiQsl5Knm5xq6CFWvPsJ/A2
	 FywIolOuqOoZENZCPRKySY8Bp4foDllEx4XH+F/l3L3h2JRJ1DyprxXquQqgTpLXvz7J1
	 eHlYfEMlFSFJDpLaTHjOEsgjfpMmM4tzHVklyBnu5E6beq7EWm8dd1FUNGKbZ8ZwfXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDA0E1F000D0;
	Thu, 26 Nov 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697146;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aLmOwNlvCmETCf3C6i9RTBF/9oUy9P0sNFs5ku1TRH+52iwyWvF3Y5EnssmgP4BLe
	 eeITK7g+77crmyPFYZZoPZjcr0KpyFa2XiWxYhy/iSIkPZc1s2AK5JNhqGVD3AIlgE
	 WJgN4usuRMBpkGmNYqnsNhMSCej1XC0Z7JwDSU0zJ9OdEyS7nhPUb0qUeVHWlpT+VM
	 LtEdfPaA4GSbTz/0+jjbRakQQV6Ro//VVbFRvpw3T4DJEIW3v1idQHeB/FFurSkfKc
	 pc0nBlaEOIfJUvAcxhWgi6/Jg+B9ynq7BEntk57d7faDcZsKCGAlqixVbTvXcPBMdc
	 +JL8RxtBglcHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF2D24D512;
	Thu, 26 Nov 2026 12:45:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:33 +0300
Subject: [PATCH net-next v3 3/3] MAINTAINERS: Add CS7542 network engine
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-b4-cs7542-ethernet-v3-3-5db5d372e1bd@gmail.com>
References: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
In-Reply-To: <20261126-b4-cs7542-ethernet-v3-0-5db5d372e1bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697132; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=/KqYH7qQ4ZNcn9AxpVFu6L2VJWCldJp4ud5ZiLrxDaUV6zLawJhfWaerlY0U3ZG+vS2/RuKQn
 EfsuCiyKimmCzdxxLF8VWtspmHUzThUGahNJmkLYVvPuV3cHh+7uTzJ
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



