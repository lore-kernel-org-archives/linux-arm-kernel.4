Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42995606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mBDuSvz7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0tsX5GO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=; b=mBDuSvz7Jy1ZqGWl1uvIz08/f0
	2cJ40aVoobxcS2oYcPs7XdcPjashF+RsNmj7w6P8cmKuQL+U2CjbtlFr+xAjTEHER17Sv9FCyq+AK
	gpoQW0AR8ihWWzPyo2LvdSANGzX+76giQPIc0UVL39m3R6DIUdG1PBPRQlE5NzVWqOYIQmqSSIdl0
	I6pZJmvWIixHyGDkVKjs94YcWuyQohq6h2e/7t82R7py3CBHw+tWwFq5uja2XizLx1qHwI8TI4F/f
	5CdIg7IVyGYQ0h2nvzgte55R9cfgU90aWGtumIzTHb5IdyY5tbwtkD1DQNCnjtSf+WKLb8Uy35Sym
	Gb5sndNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskl-00000000MgZ-4A4a;
	Sat, 21 Nov 2026 21:36:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUskj-00000000Me8-2WcX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9F5F45AF8;
	Sat, 21 Nov 2026 21:36:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296963;
	b=TfWCwLJ4QhZ0Uk4ye6GQXF6xRj/d9cf5L6JbynT4JUdf2LPZVaNQo/Wkw7cWjcbV1cyp
	 4zSZZhtEiEhGlRXZrCbN6nUXyFN/xBST1+ysZqpE5NUBthZTiuQneJbFFuIqxJoKnDsFp
	 AyYkyN+yPDhRJUC45YQO6cMmuVJLyweR9Qa/Bo6KCMZL0vfYudh9zzAvctUHQ38qCLuxg
	 XL+SHSiTZU/yoVc/CX6K7w4gHFIee5/t0bZMvgHdl06611QVcsogV/Ffgf6LiHKASw2RN
	 Ej6WQdqO6liNk7nt1JORuTxt9oroxGMaJkcPCbhJSGyid7pqZMUuyl2CoGUQ1t7OYJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296963;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=;
	b=vQCURcvaUE0MZxSqGZhKvaAMIkPaQ4YK8tvf3AtrpDjduJ312gVrETkXdgcaTTN45ikY
	 dR0F+rdR2CEbsx/J9QgmBZb0J6OMr0RX1pC4e8TbS0QJQ6y+8wtQSeAr47e7NtUOdW5Oy
	 AuqicoqO8Ekmp0u2HwKYBmeUOMiEJMf7rEDLmYEOzI1GrxanKmhVRx2q8FoVxa8FDU7Gc
	 wG8OUosvHtcV/d6IKqY9HX4DxO8aufnRi4+disyiCH8rxj7zyHThiLROZNXq0dOYS8LZw
	 RmvH38c/Sw05VTfIZMImo3jHSt4MeKTmaucLvGsOAx1beVKNMMjjMP7cmYtqz/xeg8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E52F1F0089F;
	Sat, 21 Nov 2026 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296963;
	bh=La2K15nDGTc5QdvSUYADH/M3UC5c5ws+911+TdMxDuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O0tsX5GOXLVQjEhygFrcUpPWnESOzChJQtBOFRWj2snvhDH0KtxnlM+SMutPzASp1
	 IzKIDJg7mEQEz/JkAmV5ikHT3jvHGc1Qi8Ot/SdpQAEdXBChRVGph+oa4dwUFc4noo
	 xccLBmO2V8JlqYXgx4dkkpb+7REiOwklWiSO/iPpck1X7vfRHOf4ppbPoXxZXt26SA
	 fIsEjg21eaYx+5w/UUUFxMyuAqhbtm/UPB+UePPdzSavrmTLvUfft3AyzdlhuaFW2q
	 DRj1ZH0MY+u/9Xbs0Sb9T1ME2U1f7w1GhsUB8t+CAktLSFWChzKnBdbulVQQlSJHYi
	 xRH61WLe7ZpJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7AE5B4BE11;
	Sat, 21 Nov 2026 21:36:00 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:35:55 +0300
Subject: [PATCH v9 10/10] MAINTAINERS: Add entry for Cortina Systems CS75xx
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-cs75xx-v9-10-1fc1b90bd097@gmail.com>
References: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
In-Reply-To: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296958; l=1124;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Kv86vwete327NDTNam7eZzSsG2pJVcHBfV+Z7+P5PJ4=;
 b=xo+yg1jFe9G9n0jGbQtv9lanulwawI8aybgUle0JSSZm/sd58mxrZlV42NEbP87Ukmc5uvFi6
 b9hpZSSH2+HDFG7/36n5ReoyiYuC87/tcCmvvIUUEtR4I+rnrIP42Yu
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

Add an entry covering the Cortina Systems CS75xx platform code, device
trees, bindings and UART driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315..deb2ca570 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2950,6 +2950,17 @@ F:	tools/perf/tests/shell/coresight/*
 F:	tools/perf/util/cs-etm-decoder/*
 F:	tools/perf/util/cs-etm.*
 
+ARM/CORTINA SYSTEMS CS75XX ARM ARCHITECTURE
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cortina.yaml
+F:	Documentation/devicetree/bindings/serial/cortina,cs7542-uart.yaml
+F:	arch/arm/boot/dts/cortina/
+F:	arch/arm/include/debug/cs75xx.S
+F:	arch/arm/mach-goldengate/
+F:	drivers/tty/serial/cortina-uart.c
+
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
 M:	Linus Walleij <linusw@kernel.org>

-- 
2.53.0



