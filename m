Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE6606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvvXHyk0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5sRY8eO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vb1B/RoChNEHTYVpodRk7w/fzfvk9MUwHTSniKf0n1o=; b=nvvXHyk0UODAjf
	4WtWTxXUev68mB1Bg6gDbnHaM/Q3IPxQAm1BCSp2uPckYzUbiEf8qfmtAEsmvJbWVJCKEsX7RjHFK
	MOvxFYn1k7ALR2rnwtpzyG5vXFLEn+wovxa1w7/IufQbdsVb+W4O4bdsrzEvNGWKBpESVZ4ndz83/
	9zjJj6JzbUnM9lo4l5S+hJRmtj4QKVEuXAq4QJgm4DWL8J495Nt3WAc3HRAwR0UEazcyC34i2wYKw
	PQd9RiyTmlfXr9Dz0Lb04TvgdKQrY9GfiPDiYSSu7UxEGT638vriRJkSIBLQVzu+F8yK0DL0oOUzy
	sJVDDPgVCNlQ5Ule9D9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNH-0000000GoMu-2MvB;
	Sun, 08 Nov 2026 22:28:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNF-0000000GoLz-3IY8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 22:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E97E61843;
	Sun,  8 Nov 2026 22:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A91F0089F;
	Sun,  8 Nov 2026 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176909;
	bh=vb1B/RoChNEHTYVpodRk7w/fzfvk9MUwHTSniKf0n1o=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=b5sRY8eOfcsO0mP18KuN0Kyoaa8tqm472ra0boixl4/CRpDKRIayBy2YEYm4JjuKN
	 B0qOxKHAbmlqT4GGA1gz2Wz3RgtGkPzxBHSOPeaHQw+/jNliVWNk/h9XZyINrzBRDJ
	 gvsgmhAVnj/6GwK9iUjiak7RiNdaN2Zoxzk6VQooCyajtMH/wR3d6WW2iYtMHd0RXO
	 wKT7CRZ89F7hh04UW7ji4OwgIHbWIZ5LT6ib9Rtdp3UjY5ErJFYXvEUDh/IpLbx/hq
	 yuD7eyZ+uY3hKoxTC+L3MaETAxzitooOHs7XwXAGt8uUGClmxuXfqDAu4HWHFphCuh
	 WakAlsdIi856w==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 23:28:24 +0100
Subject: [PATCH 1/4] ARM: gemini: Refresh defconfig
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-gemini-defconfig-update-v1-1-59a3ca5d8e55@kernel.org>
References: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
In-Reply-To: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Regenerate gemini_defconfig against v7.4-rc1 with gemini_defconfig and
savedefconfig to account for Kconfig changes.

Drop CONFIG_SERIAL_8250_RUNTIME_UARTS=1, which is redundant because
CONFIG_SERIAL_8250_NR_UARTS=1 constrains its default to the same value.
---
 arch/arm/configs/gemini_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index 5860b2fe7d1f..ff69a2b57ce9 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -62,7 +62,6 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=1
-CONFIG_SERIAL_8250_RUNTIME_UARTS=1
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C_GPIO=y
 CONFIG_SPI=y

-- 
2.56.0


