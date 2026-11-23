Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEC606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Y8jGvUX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OV4JrOj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=; b=2Y8jGvUXb2t7sJCHAjD+toYFAM
	PTLu2DkyhCeY83Kdq2HzuRdHnd84qZkm7bRqwVE9eQc+oTE5yr0/K+yA4xURp2OLsZp4zgq2VtnP9
	gWgIlZKut5fIGzSL0WqmE8Ag/dk7tyUFJvI25TSR9GXHWxntxzoRqfDsrHS7OQTIcF4q4OM2FT6Fg
	Dv2LfzEZIOT1LGEi1sPld7D15pttZofz3GQ91zjkEEsUj/xBz66gZgUxsfiOL4ZZHpoiYbdvuRL4I
	cWKAvB7bs4TbmzOUWzSPwB6Ze0EGgCIWm0/xwSxsjPGYkSiZTpcmBbk7wuDXTmwT9LbcXVVWV/H0o
	DDF0cyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ2U-00000004Z0g-00q0;
	Mon, 23 Nov 2026 18:45:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ1o-00000004YaQ-2RYN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:44:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 578A644D46;
	Mon, 23 Nov 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459476;
	b=KzT7mAT98CCBciMIiudfpRF9OKpaklN1TQ9hHJo2QphWKijMdY50nGkqPACgDAGCaBg+
	 3+DLzqdjTEx/7MKFtRqCYeNsic5GIqvjHTJJwEHW6tq+VBpGDkjTOVaSQnLfOtOk3yuFH
	 MIdPV9u3wZNKzhBgtIBleuA3cpP3olwS3Ot437r+Ukh1OthY8e7SQJOzgs7Jvxnig0Qga
	 8DRQuNYK4t3Pmy+8gnT18hmWcsWGZH4RVwvFCe4+DJK9DnhFBw1DIhHJf5cHN0T2vMqb0
	 I1OyO4rjx2kMIhVbHJUx/vpePvONoMv6WwBrS9w+IGOGN9W/0DYG3iTIu2ocup5AOyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459476;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=;
	b=P+sg0jvPPUNrO6bG8qQN8uIxYmMyFrvZV8iQkm/pXUkAM/XnJ9mYUCZIXPgJfKZ843mG
	 64RzDbI7zXcamns6KDuBif044L6WW4eDw8dvqeU4nB5PSMxtBZ03H7Gij2vXJzbMdoEO9
	 s7ULIfNS1F+6TALdr7pkKV69/1gMPU9oml1FhOvoM4N37Ar334RCkiqtlEXI1aY+tGqJ+
	 IiG9W/6i2NAYBujBUwDjtYmz4UfDjWcGZngCrjiPWCE6wrkFB5VJ7BtEsE5dh2xpUALs3
	 0s9NbbuJTXK4fwxOWoMmLmptkhS/NPBhwRtMlJTTA5zOYXM6rtrGuSQR3oangDkREiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 280751F0093E;
	Mon, 23 Nov 2026 18:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459476;
	bh=hUFvvMrtcN3xKAWIZoqvLk+7RqIxx8dguKgTelmkfsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OV4JrOj50sAqztog0hetQwa+bPERizMvGtBxtvU3GCoAMV4MUFSdVbLurgPp1YzeE
	 +//pchrpUTm8FWFNB3AnTbWvUwL4f2u7/FVVlHdrNWNx3SPdbNs4RX6v1OiNJBEgzX
	 G52hOi8etMZfCPFNjr2i5To1vQetX9YSs78Di3C0W2nk0gLoaOiDJfuxx1dqsrL0W9
	 S6Xi0Ewnf7oFNviVPb0y0OOYZ+S2g+uA7X5YixF7YGL4AoKhZZ2ee8qr/GoaTm1xjF
	 SXuxQKRSFykuxQS8lH/i3pqEZrb3VTPmqyYCa7FtpAXoOIhrcaaCMEFdfkbaWZaadJ
	 Gqcl8OO8U7qfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AB97F4C625;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:44:14 +0300
Subject: [PATCH net-next 5/5] MAINTAINERS: Add CS7542 network engine
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-ethernet-v1-5-fdb5e8c2d508@gmail.com>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=1003;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=G+m7gJTK/NeHqNoGXUe2fybpj2Fx+enthhwoUjEoXRw=;
 b=7ecsMKI92CxEavAgE91R7+aRS33PjSd5cBpv9g0WV8kA+QieWXLcDOLx0NYijgRNp1xIpfZUr
 2EjrS+tfyxXAkzlfCo2vL7KTb7EQCGjP8pVNMjP32958r/NdAhVg+4h
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

Cover the Ethernet binding, network engine and reset provider under a
dedicated CS7542 network engine entry.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..e5d1edd7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2959,6 +2959,15 @@ F:	drivers/clk/clk-cs7542.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
 
+ARM/CORTINA SYSTEMS CS7542 NETWORK ENGINE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/cortina,cs7542-ethernet.yaml
+F:	Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
+F:	drivers/net/ethernet/cortina/cs752x_*
+F:	drivers/reset/reset-cs7542-ne.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



