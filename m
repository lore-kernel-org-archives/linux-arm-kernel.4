Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2QDWSog3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VG8CNZP5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=; b=2QDWSog3g6hik7QQAHdZ9NUwKU
	Ofwdbfbgtu08R8L8Bpf8de5tqEV8bvtA571FO98C19Qf8eeJqN8JJBSVFlGh9/vtT1Y1dHkSb66VH
	UdZy6pLu16kKeq7mA1VDE1EZkPdlZ3Scrn+N3B96uzeTDllg8Vn9JhV2xG+gNykoEXqow/RZhmkC5
	mU/P7xaIL8g/OFvQRjPb0+CZ14KEP+28naFWOqX/vod5dfZeOqCB2/KAfmzP899C6vtufxHwfKuEJ
	XICAx+GVYBEeWhlLzTDHVC9PLEeY3eoi01Igy5g/AhenYFxe4TNrG94pW/WXYSuo/YEMJAwnipTOF
	qBhbWTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvSk-0000000GCL9-3Q41;
	Fri, 27 Nov 2026 12:54:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvSd-0000000GCJW-0A6Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:53:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E2B43083;
	Fri, 27 Nov 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795784034;
	b=s6UkVKhqdDwIboI6gPY1PWdyFbPJm1iLtHe2zO+Hu60WRA5qQzyTf1RkHjsBczep7O+3
	 C9JJtbf7c7uDcGORMHtHyY3Rprz1fNG1HZAV9HNfGHfK8YOOTVPAnznKzoKBSxjzpTHBd
	 9lH2rQDRpW2DU02KnwZEpDO3/5uRAhuD/S0UVpdfwjPtIEwCAarjK/HltKOMoI569adF3
	 GV/slDg51+1w98TC8G1PMc43Tgfol5UK3q0ZuQQkSpQ1h7/ivbzTm+wPkHlljwA5eML8w
	 SEErtHEt+khIdNyT4ptXoDDSeDPw4q7+rn+r6rTI6iLif9KSkcoXJlj2isRirZaMzNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795784034;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	b=V0gbUxd00GBcJmfQeVbwKb6iNJ39+z49z6Dc7ei1QmmJM1OHXUa+eUnjptkUaXiCBJ5m
	 0lKagHAJYOW40oS0YZuN1nGQeDyUzyU/gOiWmgBcmyqPGLlcunPjfQ2BDtVSjhRS9gg1b
	 Bce0jdQTnzT6kCZBSuxUihzKypvQPOI4HXdeJ+DR5AnqAuMd2O5dV/nRKhDEEYgz6qvMH
	 mD9xv4PI01b9oi2SgZgq+vMPkxIZLWIoqW1v1aDkWA60yjYxWpud/rV6r/5WtCSnnOiP2
	 gCY6FZR9bsPylyMRX26Ks5hX6zEcj5GjChr8/2HoQQEGKrdR9S9190NdV60ajOVEC6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DFFE1F00899;
	Fri, 27 Nov 2026 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784034;
	bh=hVQZUeaOFBv2OQm20I6mmuwPIV1JZ6C3Xo4OIxrE3BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VG8CNZP5OWKs8aaSGKPucj4YR3RGOCH2GdFJ9cokA01uPjyd7eBpsg2lPyPEJia2J
	 qMwedOrfz2ukRCqS1B7o9wc75I6OxU3oTaNxePYpfCocStN/KVXcoJKZzOlQYmLx0a
	 fTbom2MezfBSmHO0dnFCQhWwTcTJZPZ5LCLkEVb0a9yjGiOoBslZGmf4PU2XEj8huw
	 E4aNh9xEDtfF/yeMq/qiJP+Z9Ln35wFAt27iy2r896u1GoeyRGIFVh7pm11S8Y7DQw
	 dv0B1L2mlspOUgtLCdsE/aIreEEm/q55QvAxOeBh3YJkYYeoG7FAY9j6TpJASb2LN/
	 pkocb2oAOsXqQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D3184B7C1;
	Fri, 27 Nov 2026 12:53:45 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 15:53:46 +0300
Subject: [PATCH net-next v4 3/3] MAINTAINERS: Add CS7542 network engine
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-cs7542-ethernet-v4-3-ea4d8cd6ef18@gmail.com>
References: <20261127-b4-cs7542-ethernet-v4-0-ea4d8cd6ef18@gmail.com>
In-Reply-To: <20261127-b4-cs7542-ethernet-v4-0-ea4d8cd6ef18@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784023; l=937;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=DBRJjVV3hiiIbRTZ8foq3X1SNngfkVeImNSp0P0VJEI=;
 b=6Re59bHObrOCuxL2LAcVczKsLZk5Fkw6w4rUxaF1POtulDz+bIIzOv9zUKg+xhTADpNoGpgON
 RvOPA2pnOG8BCAD/Fv7yyyZ49lK9YKxcb5ctt5myf0RFFb9yPxXOapy
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



