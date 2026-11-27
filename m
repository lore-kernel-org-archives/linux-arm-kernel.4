Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iWRpSiIv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkdVUHXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=; b=iWRpSiIvRFRH8AB+/ekfsWw4VJ
	IP+0xioaCT5sAFekwLksl1CkIgRHufbnRCZRJ3H3tRRyJYebW52r3M3YkTKwb5yGfQYrwbuSaIulC
	fmYBUBxNlz5Dr3sZ3wYHxvWxb+GyG75k1VxWP4bgxaIozR8E4iLhkR1/ZiI8Ecr1QryepuAkeqfXN
	vz9Zhvc37cRw0+VzOs8oZjDbKHVwFsAC4Su5yDnnNok/Lq78NgopFiiVjYG1Z9V07fTYbNh+q1i+4
	SQqnGKyZWzJNLzOecuZ0KnwTbjUZFc87wJiiR02R+aNcgH7Z/9f04UA5aJovPuXbwxMeO85hOzhq+
	yjUDt4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2uE-000000004vy-01eM;
	Fri, 27 Nov 2026 20:50:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2tw-000000004sz-0lJF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82FC742274;
	Fri, 27 Nov 2026 20:50:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812634;
	b=Aft2oVUgiqc9U8dKEvjsVrtKnH0o65UaLsrvV9beN95khz8+vjnvPMH3hCFFYIRkTG9I
	 9FHHSE9XKTfOHagovU3BGoSV1IjzC4lRsohxpsMbUGzeMUbW46kejjhf8+lPtmLOpz7Gg
	 6owOTcQd0ZVBHdDw0p2xkDXxmw915PkqKZ3etZ3g79LyPQtbPDcb2d+JrXhkdOYb+qIiE
	 sti7wAqgS2qCTf2o37VDuKmyBptBfNeKFhRXmD5JqIjx5faj6tdFU/i6aGZxD4uHhp1Ra
	 NsEeQJAxpxFaHne/RxkqqdrrfhTwXIQQdWSTFJTU0mfNRMkZ0gk0aSEq6odVqD2ivAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812634;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	b=MepwvT7AzWAVXdnU9NuoItW9DGRIPDgj6auixGfIkFNGjWOH9yCF6vW3JQltnTyAMnCi
	 0vC73IZyVmcWV4qlVOF7UqMyc4g3FPVcjeuD95Wjl4xctucvsT2r2vkr1mUQDyaEhJMKL
	 9RGi6/6jnHCwdWrInj4qRja3RhcuX30k/8mHQ2ubQp85/pYRn4s103MCvQafnZ3+olDSZ
	 t9ekhdVcUfoJBR1RcFMohm3QqDuQENOIcCne1/ZWEIuenhfq+Gm9W7FcbjKWls8qGpo6H
	 wpy0leC2GwkkRA38IBjdR9pVRLuDgHXClItcs75hifDdUccY+aNREFkcNcVVosFF0sA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A25131F008A0;
	Fri, 27 Nov 2026 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812634;
	bh=iBBqfo+d2+cFn8zVtVbNnGx1ZajuTlfBHFQX3dJVgqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FkdVUHXx5BdcrzEYDlEa2j5+vf/+0w7D4oQo5r+Hg86a32Dc4sCk+L3LTfVqvXU/I
	 /fc80YGb0Ooz62ST2uhsMdeEo0DEVPEOGYbp5mrViwTv5hWrAJpb/g+M10ZRahjQiU
	 8BtGXXbuEAUtTJt1RRXvrli+cH3Vk2Ml4NRQeIzMW01phc8FIiT6McWUlM6tUbBhx7
	 82Yfw4FFSTiAFpZ0+Dwhh3L0nHiN3D5kDsEUrOkl+AGYe8HSJfo6hCuQoWiuUgmBYD
	 cd0CrYNWY9zU5/GnwaJiwdi2iUHr1f+sCfYnq3nNnyuGsOVu3YIpFaH4YJaxrqePgX
	 CufSDKI22bfwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD3704DDEB;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:31 +0300
Subject: [PATCH v5 6/6] MAINTAINERS: Add CS7542 global control support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-cs7542-syscon-v5-6-d5a373c72b05@gmail.com>
References: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
In-Reply-To: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=1145;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=451qyYBYGcKQBnv4zkYbgyAEFoN+lZtfxN3rOpF09y8=;
 b=aFoPxAyLfWvXBTueEMVrvCJvdmIxhVZ1ESHI+50Bvst4cXOwJ4VOL4NqiSXxwg6PKXDodPTFi
 iyBc1WPTLuOA1Jelt/QBv0MFki1nLpFgJJcpsAPSdZSxChhxHFGkhug
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



