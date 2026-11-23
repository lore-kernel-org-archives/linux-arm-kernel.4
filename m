Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Krh03SkG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jIOS/82A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=; b=Krh03SkG4nFojL7dM8bgnZjBzJ
	xf3UtUSmd5crq/QL8AlD/5aRh0/SI4/RNUmzoBAniBjiLd9Tblo8lBf2DywHttBysZtUw+lCrYBoV
	Ym/Uj3EuL3AANfoigq916shKJgEwNaHa64KwogoxUv7ejq+64Mya5mQj+9uUr8LXM4iG+T4+TVqap
	U951gffUsnTGD5bxJC5TEl6iRZYHWp2mcLG4YlOmAXkLjYeW5/FtUlWg+t3Wnd22YJl7PwoByOQqA
	DTrptHxH07igEUtLtkd+zBkxDE+RSeGw3iFZE6Tdw6+O9n47MH2cUIjejz0tdjZgWqt8QniEasGWf
	4m7D2ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzv-00000004X1D-3VUC;
	Mon, 23 Nov 2026 18:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzL-00000004WUR-26Mm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C3AB62441;
	Mon, 23 Nov 2026 18:42:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459322;
	b=jPnYBuIxuCR1tn7jeZpvIqWNJGEI/I8ca0Q2DJPULTdS7n1tvMYAXVINDNQnGckXVp9m
	 pDtZCgNYieI16eCHCE5LDYTMN6Pn1AASuLkmcZP/14NfgFWnhHJ64Z2dVmxQVnU5QCWyS
	 oC/ApjfXfNr0SVm0F9bk7wXOZE6FLHHkORYlp2wv6YjUvoyXNkh2C4lt5oPvm+0+l3u00
	 tCYpkJKHEXUi+BgwsIFSB98xT1S1sfKw6B+rzyHIOibaQ69MifAT8t4pd9dySoDkKv/jk
	 BPEc6TY4P3hH8iPXrUEMQv5An1vJsA09crA05/M5RZ6OrK+Xlo9X3lbIoPp0OmPf+cQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459322;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	b=vkPsdxI4c9fNxSL5XN6dxgoYJSJjkpZVoZiGMniMwZpVYPL4IQzOOUDWd4VqIenP1+Be
	 YOTRsAfPd8GJLlyzTBgT2tJFCP/AczNFMyKDaVR6Vuq5NFMd9y8jm7thndJXS+w2hL3I0
	 yQGTTp0odXDWiQ8j4Ns02Ms/VbpKdwfv2Y5hmvKA/KTngacQd4P1ZIGkwMLu4M0zHpKZ1
	 62Oy9BKIF9Q1cqR166vVQIF6XP7KbB26/lO54Qxsgb7OY0Okbz2mhA+3dbWg7oNcZ2lau
	 MhpfaZ0G2SUn0qMaf7dHXS4rnoVJI1ypC8DEIvMnoI8AmR+EqHUzTjrBnMxBUQq4O0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC5671F0156C;
	Mon, 23 Nov 2026 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459322;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jIOS/82AEYLXbwULLokzXs6m/j1dVApvba9DuBV5pHaq/oo65Jm4qjBarTtURGu8I
	 Bq4PIqZP47d6oPQUI0kHLte7rUnGdqMgJ/tNnTH+k3AEN3WjpKWqN5RWjdm3b4cQkB
	 nigwiOzKpYzN//jSefTdNjaG9mzD288/6qU4MMFfHj0NvwcB3LtrD6zRxrPxIl+oUy
	 dLUq+S0UZOnuPzZ0gRfNor7ev+Nv4KLzzMgTUrtEaNXRvAJvS6UHo3Jd3lARdSFOAX
	 Y4MDqiulmZg1u4mvgAroF2A0AROy90CnoprO0CDbI4UNVyFBG++nsqKDDvGtGxU3+G
	 2ygUgs2N/mE5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E9604C5C9;
	Mon, 23 Nov 2026 18:41:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:33 +0300
Subject: [PATCH 3/3] MAINTAINERS: Add Cortina Systems CS7542 RTC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-b4-cs7542-rtc-v1-3-6c53761ffa03@gmail.com>
References: <20261123-b4-cs7542-rtc-v1-0-6c53761ffa03@gmail.com>
In-Reply-To: <20261123-b4-cs7542-rtc-v1-0-6c53761ffa03@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459290; l=864;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=V966SZMepm42nKofeQHA+zZwJm4nGNGjIsMkGKj6kQA=;
 b=1RBK6/FmZlQkIq1D6w5lUoO68Yaj7bPM2/o7liyZw9RVPl+ArlamOzDlUJCdqEPiZ/IGWGiYd
 Fi5dlQL4fl4B9XM5RhnTvQsMJ62q18bFo7d9/xzklipvNQ7l0GAwjyQ
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

Route changes to the CS7542 calendar clock driver and binding
to their subsystem mailing list and the platform maintainer.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..e7f97fb96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,13 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS7542 RTC
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/cortina,cs7542-rtc.yaml
+F:	drivers/rtc/rtc-cs75xx.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



