Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F788606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0qBIzYDP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDfSPxfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=; b=0qBIzYDPe/PTtiWEitcIbvbRCy
	jltC2duGA636D6TXGO0zqX756V5+gFN/zhC1FC/5F1LAfJG6MMbPDw0+ZLFvGBohoNOtcz5fTPRpb
	PznqZiWMicyqNuOc+LNa+ZVtw5AV1qsFx49gpJmEJ+uKkEdrjYPOPJGTUL5AUIz3oDhfe5ThOQ4KR
	xAv0egnEu9U032fzs/w/+exjPU4bom/gLEr0GUmMPC3VZkuT3VuY5PRTm9oN3Brk4yavrpG84MbVr
	vCWC7MYtyYnucOBpJ5LIsuZx3F/HvdlrPeFGk7+Aml+upCfpXFZcmrAcx7APKjcVVOGqxjESisWiX
	M4JonyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbwf-00000005181-3CwZ;
	Mon, 23 Nov 2026 21:51:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbwO-0000000515d-1d8C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 21:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C2746189B;
	Mon, 23 Nov 2026 21:51:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795470670;
	b=CF4MTTXFTZY0kPY+e2Nv907rEhta8Mr3t2vBXP/NcVKLNQEs14AEGT0xoYopwuBJwRLd
	 F347EkUgS/k3YKTmiSUpm7Q9tsgrvtTpLtaM35jwPJVJZbBKgn3TqsIs/ND5B+/Iynjx4
	 lCda8pXaFfPhZ3k+e0r7rtI4oNukkF5LFWx6d+6v7kM/LLq9pR3sSA0IgVohLLLgBwNJz
	 QttLUJv4tmp63RZS5sLtlmqhVVU7YzDwygvCWsDVeBa/i3tl7gYM3c1auQnAJQqcPzUSS
	 krXAx8keRfu57DubG5N5AOexOtFRKuJgSBQ8H4sDcg0bFF2YOFvt0MCCnYcv79O5IIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470670;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=;
	b=cFCBhM3janK0x1WGEV2IWSdbodGUVzC3yDVSsC25bbiPszEPbpsy6PCUaHBH8mTb2TUH
	 5PGy0x6y6RnSlPvmjrKA6y1octd8RAu6EBn/Zpw0Z3X6D7ocrjwjY2ZcACj5Xoq5wvtVg
	 eS0bJ+Bm2oBZuSeVHH9p/37D3rmIpuDrkdNTocuGgnAlZZ8Riu+1f1ds1NGIjAWdHgviv
	 djhiveiMC55WsCXwymVAUBYBIjnnjlmhvrYsJjNYGYs2zBdUXIPseujFck3lsIJ8IZmDL
	 2glV8Bd1wS60UnLk80veI/ti/Af8Y5oZT6XPk8GEzDyvYoXZ6JylLCX1cs+RlZT/F5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71DB11F000E0;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470670;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GDfSPxfFND5RctDCBY7kfrRdOz621E7DefX1PPcmMzwiQtIoDqqItJZoSNM7WX1zD
	 HK9AbUpQu+vxKbcQAMzsg2hDWpPrBTTufI7Jq4MQFMHGcnRi8zpJYfBvk8C2+FV0ys
	 QQrmx3mRwz8VEqM/9FDBElJ4f5BBEVbwoFUbKX7G64wXClOs9paqLJqfF3MX015MOW
	 wRtm5DArCNxJ2nxcvS9l1qPrWBi84WxNL7gzc9BTzdgP7VFEzaCUnRTFqvTHxbUATp
	 rnHI16ZIc3iitV3CYs/bvp2RblVwlf7NTD9cL/NOlPzggmeVcPtVv8aB7KrALy37Do
	 OboqYE8eWTWVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0253E4C788;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:51:00 +0300
Subject: [PATCH 3/3] MAINTAINERS: Track CS7542 global reset specifiers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-global-controls-v1-3-12548785df2c@gmail.com>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795470657; l=805;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=jZiseWlg2CtTRviMIS/xUtTqGqfyqbUonSFVhgEfXD8=;
 b=XgrqNi9Rk0GtZ2qbN18FPMvfN9NFeP8t7VKAcEwv74gpusXsM0eOBZ5QrS9+QsjrqWuGqnCKw
 a+hgjrA4zQZAFgDY7PKhB2YkyrxqW+9h96fDxJPDkk1vhb95Sv39jv1
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

Cover the shared reset identifiers under the existing global control
entry. PCIe host/PHY and network datapath ownership remain separate.

AI assistance: Codex prepared this draft from the posted CS7542 series.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..3c51d13e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2958,6 +2958,7 @@ F:	Documentation/devicetree/bindings/soc/cortina/
 F:	drivers/clk/clk-cs7542.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+F:	include/dt-bindings/reset/cortina,cs7542-reset.h
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>

-- 
2.53.0



