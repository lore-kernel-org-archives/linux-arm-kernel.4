Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E2F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPU7vDUv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARW5QLrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=; b=RPU7vDUv4jplQpJ9ecR9qwL2Wt
	aQNWdV+KurONHuaVIFUfrALEyw02l5q5cgnz5K5jU84h8aQstPZr7R6Weh9KkuktKBanhriBb+gAm
	+fouM5kNvZ4jglKlcNxIGNkbG5+KyWMSynwC3DT+BJkyhvvss/74tkShugqYVWlIT/lvpzM4Z6iAJ
	rqniFJ1FY7ZDGv4wTvj+ZPdrFZp0H51Q6UzFIP+4rojadSaO11cd/UizjHCRMoubO/dMrPhD2fPpk
	TmdSNy3tH8UUnISXinqiLHrHXcuk1Zl1AKo/+QFNG97EeS4SgjpBpm4sWaKQFb37JTFol/QnPu45h
	ntHYV6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb5P-00000004u1K-03Kd;
	Mon, 23 Nov 2026 20:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb44-00000004tQQ-0F9Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 821AD624D2;
	Mon, 23 Nov 2026 20:55:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467303;
	b=kiCsrc22dlx8WPMBxNXT1ogfvH27TWUo4/g3Cu7g0vILSH5yUq6pyCNzyCkAzFiFFHHf
	 ZkS/MGY49BG8/f3YtIau1GEeGYcmI+SbnTaBB2dxuNCTnJVQUNOTrW9hv5bSqjf+HbxRN
	 C74i1JR08cVDAcRZcAlNHOBBPrX3f7KKW3BfoTmUoUnxtP8Dhd30p5oQF7gVnIzPqIkuz
	 +g4j474pHPDOYo5xU7FRlW2i86Es4k23FkM6gQqsbcOwHXjyRqWNtDnnNlmJFKuAqUXT+
	 u00NCSdaa2NKh9cFYoNw3DShHY/8omJ3FTnIHrpfI9nruiRNLzpa/admGQzo765/fyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467303;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	b=ok5S0GP/3XCUkXT/qxE+YtEJ0+bmDSqkSTyZhvCJhOZPX9neXvUE6zL1LH9xmj7SBB3W
	 7WPEUGN0ywTIxT9p1K0g/m1vKn+Cp3EiMTMlHUtGSCE22TRh9j0oiof4AvGNLKqlE4phX
	 3dm2ixmbO4Wq/QDQYr4JE92VspEGdwUIcJkS4kJLj5wTNZgsHAmsB8kO17wRRTOSW6LeD
	 owIFSAms2MaWWGyEiw/9hknmvwL6/YQVKIDRqWLBygoBb8lVAjVmvVFWKtm3s3JIUtBgg
	 OKZ0kOFd8yWATOJizui7jDOiQ76jT6wdSYvVKl5MqB2S9CzjD/14thLy0BP6R0VrlZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A11881F000D4;
	Mon, 23 Nov 2026 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467303;
	bh=JA1RY4AoQnfSHpB9qDuwptqbpVvMYp1OIFwFo8h5NUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ARW5QLrm8k/tjmHsNLfUzsJPicaCThCsjQSd+M0NjupufEW6Z4WuSCwaoK4ctM4pT
	 m2zsELfit4UjRkbfdfd7ttPQTWh5qCcVygYmHFFGQzu/yNf97/JJ+kf/Llur1zI9y2
	 yvP/XT7+KlQiQVecTcKZp7Bh77wDvhQMl75aXqmVOKrHW9/OXY1juBOqaNeyjYtx3o
	 MmhbLLkZJe8TMcTamj9E8lF3MUx4CwKZL3vjVoYRzaNQC2ex1+XiRKZp/dDzvUBQrJ
	 OlNQlcoNhx1ijyPLn7xvxzfVvhig46WDS9PdhCfy7jsQIrLzN1p9g6VuGAkgwwJADQ
	 w1ODxeNFDVPuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 882FA4C74E;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:54:48 +0300
Subject: [PATCH v3 5/5] MAINTAINERS: Add CS7542 global control support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-cs7542-syscon-v3-5-f1c07a1703f8@gmail.com>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=1174;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=fgWHYLyeGItAI+Z6w73sl393x6RrEmbFL0xFZL+FdhU=;
 b=QPKZD/sPAFypYFaBbEqI+AbulXKFNGiNIX3z/EqET6hHqVnPJjGszgvjxeqxbfd253su5JOFM
 trApjEGIBjoAYodA6TSJRtK8mHN1ERqxbHiRBv1B76HHWuDXTftIaEU
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

Track the global control binding, strap clock provider and pin
multiplexer independently of the pending platform series.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..d8835aeca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,16 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS7542 GLOBAL CONTROL
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
+F:	Documentation/devicetree/bindings/soc/cortina/
+F:	drivers/clk/clk-cs7542.c
+F:	drivers/pinctrl/pinctrl-cs7542.c
+F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



