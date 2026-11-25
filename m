Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A38606A68F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gjwbXTJj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOlGNqW/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jtR2BCwBiiOXE/nYUDE0bn3/rGtsWTBfFTX/QPsmJxQ=; b=gjwbXTJjH+S1l9Un1Nwjdfudqp
	d9Vr19d/YxedfU35nboxb3+wlYLtx/Wm1FW+LiUQlAMmw6Qbz7Ic1kzlUYw2GNrrSiuy7XQS3YpmG
	1fXTtipA8eZrHjc2EnQySGm+w0POR+6LA8mAI9EH8qdryf4lFuwXCTyQCV+FkjSWY7qVqLUP+Gbpd
	Zr2cshPfGrM6XsDJUT8l2siyKBoWUd2XVg61zMurusJgOMM3x8c+lIkR3Dm6RJzBnzYXhU40Qtl1K
	dzkTugZKh0qWRxWe2Fmm+9IRAkXYhWCuz99Z1F35ngW8TMtg/n7gtWU4dN0iG9ngRLqg/4LIsGn2R
	sGq8rzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJws-0000000BJAM-1Pcn;
	Wed, 25 Nov 2026 20:50:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJwq-0000000BJ9z-10a8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 660F1618D3;
	Wed, 25 Nov 2026 20:50:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795639835;
	b=DWXa2kU026xFwUE/9vAnx6RGsV98Jr+ehrLO30WViEQuzfEep44gb4qEw8U3e1MOU5ut
	 l7vp0pGSDrsmH3+oJ3EzK4AP6Xp0UlqGkXZngg152x2kXsiBhRoAyHLZ4forzRC5pRA+F
	 Gidvo9nOXJ2cY/JRMf+BRy01cOf2VmKqFyE5ZIR0H0LNaH1Wz97JVCrTOcWTMXeWPm5Sg
	 zkyrhTVluD/iLyepbRLPDbjd3znOWh2wihI9+L+fDDnZzI9IV0O+qrRIghT98Ou6PA4tL
	 8+zODFwQ2vs+hmWNefTBD6lmb3Ogf/3a2u2SW4ercLqq0RASg+zP/2mrj82edEOwqyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795639835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jtR2BCwBiiOXE/nYUDE0bn3/rGtsWTBfFTX/QPsmJxQ=;
	b=igwR/j4o001Yz+WM7W6bp2iuGzIel7U4Nl6TfqK9jXuiH27Z81zcvz1OUr4UhN35gnmg
	 Yfsm1fUOR85Illeveoc0jWGk4MhRxy9fcXuJZRchZxRAdfzPQ6vksc5NOyw/w0XtY6KNz
	 U2DsTW2PtDp3SZM/tTJ8Hjy6usSCjaEwYFiv27P9Vj5wu906gpzdv0FWi8P/HTXEPKghw
	 MnuPYSZLPz7VianWFInwJ+uxE9CLcUL10NEXvyOB5SwsoOZe77uF55DZF3Kof5ufrkiR5
	 9qnfxLgQ7tBG7LJCudXYt8G7yDPWKCZU6gm9lArS0FEIh8aQdd8HIroY4gP52gR6Zvg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D60FB1F000CA;
	Wed, 25 Nov 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795639835;
	bh=jtR2BCwBiiOXE/nYUDE0bn3/rGtsWTBfFTX/QPsmJxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oOlGNqW/wuKrPdxb8Ew1Lkl6eUy1HyTQ2+tc8RDGsN2YOeb/+0/Xle7IRQmsq3bxo
	 C7VylX0dYkyAMWrIqplK1/IYUsIJ1qZm4/yfKrGAbSrSJhmreIuBut0HqEVriJyEzt
	 eKOx0d+pGjWPc04WDXCT1ctLCdBMkx06Y0AQYNlwak6JWwZmQRx5aYqtPu4IY3e2v5
	 VpT8w0L4qCJHZUayMCjopoJAEMBwz2NOdZwUEdHIvKFP2+M7N64FwR1VlhloKeyNVn
	 43HnbfpSkOw8t1MiDletp0PAiGWFTiaxHclvThB0aqZjft7jIkQeWnvRL+hUTpCwvk
	 cbzoon8h0xBjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 594504D03C;
	Wed, 25 Nov 2026 20:50:31 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 23:50:29 +0300
Subject: [PATCH RFC net-next 1/7] dt-bindings: net: dsa: allow the QCA
 four-byte tag protocol
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-almondplus-offload-rfc-v1-1-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
In-Reply-To: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795639829; l=758;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=wkWk664vl65KKLXoTZskWR/R2hKT7/ZFZXG8a8vLUkk=;
 b=/eO4EXD1n36cNyH3ASrEAiKexWlKJjTPGD8kpZhI/7Ia3+/vWyKH6iBhrle27HletfgHHNBVX
 gpEUi5XwYYBDCMK0lIDc8Hybti2nuEAwSXdBZnU7RwLpRbJDx8PeB1N
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

The CS7542 parser needs an EtherType identifier ahead of the QCA
metadata. Allow CPU ports to select that format through the existing DSA
property.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa-port.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
index 480120469..30c6f70c9 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
@@ -53,6 +53,7 @@ properties:
     enum:
       - dsa
       - edsa
+      - qca4
       - ocelot
       - ocelot-8021q
       - rtl8_4

-- 
2.53.0



