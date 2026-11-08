Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D550606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vn5KBywK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFuxYl+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5+RN5IW3o3Knz8Xf6/hOtzzhEr+08bXiOm0aoC+2Lvs=; b=vn5KBywK24E0gc
	G5qdlnUMKlb86hftyzqOzNij8wZRET36eyZLu8MpFx1lBcxDRys5gC1dV2r9VhZmTLADyy/OVSxaG
	WmtazRcNKm9PrOvrMOboyEoWwam/wZagz48mu299t2EbdQcLL+iPS6mKjpN0jyoXoeZ9OOz9q4RKF
	JGRbIyVs9HY6EKaQ2OoZ7v8rJylfpaHwfQ65ANGyL74ZhJ7GZXJUAJAt4ia5UoIBDhz1zbzkz+Yf2
	qrO26gIByvlPX9OCzb4KXsjwh1RUUCknFpttUCljKojGTE3JVBLZTw2NYNh8Yn4T+pulP9EMzpqgm
	8BMR0oiUA0ZKKErLBa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNN-0000000GoQS-3UIX;
	Sun, 08 Nov 2026 22:28:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNH-0000000GoMt-3tJb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 22:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62CE961E0E;
	Sun,  8 Nov 2026 22:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ED91F0089F;
	Sun,  8 Nov 2026 22:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176911;
	bh=5+RN5IW3o3Knz8Xf6/hOtzzhEr+08bXiOm0aoC+2Lvs=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=dFuxYl+GBJRkTwNHpb6Szu2JB1l+C0hDT7gGq3rNNRfsgH/Yw6YzH/VRTkZOycGc5
	 of5JVqG+l7AIv+tS91eYTwiP/nrvi07r5uBbMojVss1rROy+G7oIFLr9upuFl7UTKf
	 Zg1EIt+PPWYxtfAUboj+CdLf5I/IaZexMJlqqB0idvkzy1b3Fa1jfAHu9Et+cA6sc/
	 k2AoJ9VpeulfYtMM728LCB6gj+CLKB/BaOPE9WfzqfNVg98rSqWR6ny23GaTv4ydXu
	 VfDkQ72+H8n6RbycGQvmrxV9TswX5SZDZi5C9McZb+2+rLhIsy8gNh/OY5tk5eh/EM
	 B1xoXfXSIJsmQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 23:28:26 +0100
Subject: [PATCH 3/4] ARM: gemini: Enable ext4 filesystem support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-gemini-defconfig-update-v1-3-59a3ca5d8e55@kernel.org>
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

Enable ext4 as a built-in filesystem for the Gemini SATA NAS boards
and USB storage devices, including systems with an ext4 root filesystem.

Let Kconfig enable the required journaling, checksum and metadata cache
support automatically.
---
 arch/arm/configs/gemini_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index 081879a90d78..72c9594b0e74 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -93,6 +93,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_DMADEVICES=y
 CONFIG_AMBA_PL08X=y
+CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y

-- 
2.56.0


