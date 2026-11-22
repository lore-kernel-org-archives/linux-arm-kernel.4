Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6129606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oIgZzCAW;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=vyuspz8P;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=DAH+8WQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=; b=oIgZzCAWThzbb3tFiJiMwS7DU1
	4TPFuqfi+aaZ/3YvvyQexcPlZqrBYOg3rDV/ZhYaf2Lz3hcC3miXJhtb9vGtoVbDy8beKrIUbCphL
	xu9Qe5PAtVI51K2oQ/F3Oee8gz8pxrDYwgfItlATZqKkJ37Ttl3kddT6YLtlnYKbQVvjm5zh5N2vJ
	B0we/y1ziOcN2nMt/A3sOYW+l8Uf/pYpMQr9PSZG+s1jBRRiErkpWu9on/OQlzQOv6DswCqgms6DC
	CoU5LvqM+bLwrhVpNhiBhDtP9kZ61/Tw/2UBKXlJnZbqelXRN2K/k8W+CxDOTaqHAUnWfAKYkHgVk
	WV6zrOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCct-00000001aV8-0f6Z;
	Sun, 22 Nov 2026 18:49:23 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCcn-00000001aSK-2kN0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1795373356;
 bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=;
 b=vyuspz8Pipb600icLX5GG5anyp9v532DDfU3FC9iWGNAHY/3Cp1CYYAZ9r40sbmawUlkXAscb
 lKzGswxR++5N18NMOw/jx5mFPatzl+BwHDe/UpHFzy9OfCaQBuVKkOTW6fiGEbMFIopKmwEhCRW
 uk9IVDQsQmkul2QWxqUdm1s2uMnXX3FQJ9dNN4AFSMqKJi3izGftY6YHgaVFZ4YmDdl3RdVqdcG
 y7N2K2sQad1MlDqnWdIxbnRGAaN0Kv1pdmWVmzoB8s3kQggKlwMkW8murQIrF11yneSOb6enPEI
 q19TeB4/t5VgJxPYtP3OYPQt9VMYQ8fwYYxaMGbST1tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt;
 s=default; t=1795373356; bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=;
 b=DAH+8WQtv3B1fjXmqC7I9bbj5U3wdGMwMEO+ANdBtuFTV/dgZbosmB13U/cAKQzVOJFXKqxuu
 +DUQHDFiH+PeLOf6LIy/QHUSiMptbxZ8Cwqj3taozchX+Nbl/9Avihvx3FNz+NE1pazeGnmJ0NS
 Ag0xhC1C8q+aMQUKxg4Fh0c=
CFBL-Feedback-ID: 6b0338504432eb7754305b22:d73f4f47d606828bdc09bfd0c059efe0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0338504432eb7754305b22
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Sun, 22 Nov 2026 18:45:28 +0000
Message-ID: <20261122184532.1300004-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_104917_744262_F9264440 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.0 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for ArmSoM Forge1 [1].

ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
triple-core Cortex-A7 application processor​​. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

This series depends on the base SoC dtsi added as part of the series
"ARM: dts: rockchip: Add Luckfox Lyra boards" [2]. Similar to boards in
that series this board use the rockchip,rk3506 compatible.

Mainline U-Boot support can be tested using a branch at [3], it contains
board support using same devicetree files extended with USB support.

[1] https://docs.armsom.org/armsom-forge1
[2] https://patch.msgid.link/20261122060114.773624-1-jonas@kwiboo.se/
[3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add ArmSoM Forge1
  ARM: dts: rockchip: Add ArmSoM Forge1 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 229 ++++++++++++++++++
 3 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
---
Based-on: <20261122060114.773624-1-jonas@kwiboo.se>

-- 
2.56.1


