Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC6606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ga+93zd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgoFi4+I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=; b=2ga+93zdYS1OsOb54AiQSFyY5j
	VSNpN3Bgn+3rKjfE5b0vXGcHEVBWkJmtj5vW92V4xh3nanq59ana7IrjIJlgxBPibk5b/vW6ZkgKM
	xg8wIRMkMEURY8meyTCFzTOf4CS1SOd7jQvCU5MynD9ueDddiUqslSmaHo1eUEPMfb3Tv73HSXhYi
	ulFxp9v7jB0nzM8tyJizpzyuF0uJJGJkGHj1jIX5RFVoKEjiSLdIL90Ucbs38y2tv8BTSMI6wKEeP
	zfUFhtaUSopfSYlVWM4nkS6IrPS64o0YvQWbO1SK+YE5hne7d20RVnjSh1V304oLIaHwdejaKwbMP
	GKMJ+F+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc5C-0000000529f-1iuR;
	Mon, 23 Nov 2026 22:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc5A-0000000528p-0f5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E47FE43957;
	Mon, 23 Nov 2026 22:00:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795471215;
	b=ihTfVDZ3sEeYoXVDdZ2j75ik70sdR+5iNRFp8zOmBWdbRUde44tLCtGoovC9G+Jw2py7
	 iSXr+7GixrAt8kondCQb2Sa6ZMo+SKHkv6sNRIb1ShRB/pPCmk43loKMMG50qHjWmufQj
	 iTLlwydK4P6Xh689kS+X1OTW0H27JeUyIlxPD8Z9PS3F6nRJfNUQpVT6Whe0NckCicIHA
	 DxP4emaBONNCDj0Onc2SfGoMbu/dlUrpNHxsTduEAC5lzg4WXQGbi4LPilwyJyu+ly47/
	 XOo4p8Lr3Pa6R17xjDQLzWmmEq6yfpfS5Qn6G/aijGVkP9yyAWMGE2oHcamdYtc+WJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	b=XBz32LczNfSSGSGioARdIK/bZFUM34WoO7WOEwWUEBnhHTKuY4FQ0wHubaG4gLDwocIt
	 3ARGXn+OXV5A9U6+8pl8vLVdL3qWyV/bxKnz+BB7fjuq3DhQcvqFsr4PcZAKqPkuZHMHy
	 qjZX5/sslwUjR2uKn++MLx+x3ZVw1HKj3BZ2stOpRFvs4+YhkOhsLX1tB+YTVrLBjrDBn
	 ag9udvmDBV60l3khS5CiBaSrTRJgtB7SrFMkAM5RzDgCTyn8EEW0sNmNqIN98KDUr5OCt
	 zOwGMqdkrchyZKQWU5b0FN7aK898gvbswtjAReT9Yh+lBDKXBqLM+QgyVwU9VTjfzBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FC571F000CF;
	Mon, 23 Nov 2026 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471215;
	bh=YstasX83SpUpR7sJnrgBdW2Exikec0Kt7UwYg9xB36Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kgoFi4+IZv25XzK0f+NV0H6tSkFirkabpFvlpjdXWTTSQrl4bBToioWNfM8g6qtjq
	 zXwfPsC8S4g9qnbpzr32eZ4jpJHE1Wx6cPlLCTdIF5SWLwHRigEynbHcY7rrFOTfh1
	 NeGSOER0ZTUtIWW4W9qy6Fbcrb/hwMX/uRZq24VcYQrdlAVknUl3+unOn/j/9N0b/O
	 nLClDYlN8cpu8c8m27AfD3nrKfcg15bvfmq2J9ugKzPEeLOzFw2mz1KUxM26Oz2SyJ
	 os1+dLcV34R5K6oIeZhv6h3TnrrnwVkdWknhXD2Mm1n4YBncn58bDyHRyeEu1YqPN8
	 qm4tngmh/ZYAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F61C4C79B;
	Mon, 23 Nov 2026 22:00:14 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 01:00:15 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add Cortina Systems CS7542 RTC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-rtc-v3-3-53902bfbe0ae@gmail.com>
References: <20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com>
In-Reply-To: <20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795471212; l=864;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=V966SZMepm42nKofeQHA+zZwJm4nGNGjIsMkGKj6kQA=;
 b=A9V7/mpPv+/bcY+uKssDtaSgc00coIaWRpY0v3mYhojSvOltGnigrmmlCd8lMUXRhVPhtyjN6
 e9XyC1ZUMfEA7n9JxjlYJWWqjC6LEC2EWA725FQ0m4z6nN7cWAEPctG
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



