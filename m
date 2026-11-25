Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bg2TYw3E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbcsDy/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=; b=bg2TYw3EKB423LEz1qLAbgftbh
	YVnehq3CqupzY58uEVKEyJBmMcTMRDU0vREKVx/NQG0CMdz0Y794xmiZmsa23PUdyMLOx+jekXLwJ
	D5f0kwpQOAVs6McNWwv+VU1+m75ge/YRhr3B35F9KsijzGnSfdFg5r4Vdzp5elrzPnonRMgW2a40u
	7caRutmzp1iXP1dZ78/S4OBVD1wuRivos3r6lVTel1hQjjlPBiICdBlP8Izmhe4SVa0izbrTstt14
	paZ5GawirH+B+vn+MgzwXpaiR9NMAiIRJyrordTl0A5eJNK0vb6uz9PzSXezOM0mKJwMQL8ZiHlMl
	xvXLEccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAL8-00000009T2S-1kkX;
	Wed, 25 Nov 2026 10:35:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKb-00000009Sp8-1A16
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:34:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F50344E75;
	Wed, 25 Nov 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602868;
	b=u7if8lDhP8HlHZkpUZ+nGmJeIAQKAtwyHzA+aDnerIaD8X/+RBO8nFiAfiqdTBTydhng
	 Ggev5xpM2ru1TO4SMzgUwfXGCj90jmtN7TkvKyUCsWlEojckwSAiSXJRdMNhFUW0dTqz+
	 SaB9O2yKLfvY3XA5JkARVwgMd83pS7ca7nStPfe0haqIOnV2MIIKRu3tyXJJsJzfppU3S
	 6w3aa6Q0tG1URM4ufSc0pZGROwHbAKrFMAGwbX2PyqKdhuCH3bXhxSlD/wuvwEkPrrrgt
	 LuZBJkIFNTyDRDXrFSjcJdsQjvys7SlNkFvrFe+sCqBA1z/hHsRzk9jxKBj2oHLg5wA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602868;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	b=prxxBypH4Dvai4xDnsHJZXgHm1ICblZi/jFI6B6tcgYx9B7q8xuM1DeEMDCwV64+6vBY
	 7qlHFmaox/lJ1CZXe8dp8nklTm92G/6uR+eAqZQ4hPy2K7vTIqm4fQhrVtlyois3YMf0Y
	 hHNKXiZ6Njj/wsbk7PEKgLKRHthAo89vdDppJ7V+bzq/Yv806PXvIWh7xHO5zWSDZ6USH
	 OM1zO1jvJmcr7twKe6dqQowWAPHwdebo0ywR5E7iHPI47zKZuG3V1PUJ36JAJxtfUIdG8
	 wIzYztksuNeWxq4eYzLUuRgd/S4HrPrX7U9OsejpmPQXeWhF1Nh5BzhdlLXO9qEse3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38BA71F01574;
	Wed, 25 Nov 2026 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602868;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fbcsDy/1RM6JaTjTtzMRIroj51fymYcuYPNzx7U+A3VqSK7T5TNhIdgQvzUCWHe2S
	 /UOWTFNFqd6icqM/300ATbO3VevUUxEgRoqBdCf1vjIqYNdB0rvU+bL8uIsYTuwRd0
	 Y0ZvO+ma2DtVvh9N0y69gZUnnwYfpPh4GKAgPw/uFq2ky9DM5D3xT5xFs+E8BJS0Lc
	 eqzzPdPMuuygJqVc4OTfh36lGVoD9uSVXcV3OMAUVgQy4ECvTm0AgWOGH+htXn9s+I
	 7fU3p6b4VdHlMjfCfCclfUoam1p2+3NCTTOpHkas26yUEsvFixTaevNT0sz15KmoyL
	 dILaWuJbyrE+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4B6644CE60;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:14 +0300
Subject: [PATCH v4 6/6] MAINTAINERS: Add CS7542 global control support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-cs7542-syscon-v4-6-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=1145;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=451qyYBYGcKQBnv4zkYbgyAEFoN+lZtfxN3rOpF09y8=;
 b=7SwLJdRedUZdNTGMoRkhPdZqvW/+eAFF2+lVWXeaAGO7mvMncnIIxXO/jiDMvff4bEPKnKzYv
 mKlRMyg8oTzBhHK2X3iFcZ0QPJQOgrroMCuxvaDvhAefcQBlvJi9ovP
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

Add contacts and paths for the CS7542 clock, reset and pinctrl
drivers and their device tree bindings.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..703e95e83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2949,6 +2949,18 @@ F:	tools/perf/tests/shell/coresight/*
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
+F:	drivers/reset/reset-cs7542.c
+F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+F:	include/dt-bindings/reset/cortina,cs7542-reset.h
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



