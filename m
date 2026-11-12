Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cl2duO5T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBofIceR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=; b=Cl2duO5T249srz
	wR0AlI0+/CDzwUuee8N+SBfFHxioCP3qkcwmVOU8dJhro6qXXmwvtvmJMLI3fYb+vi7kdeyZMULFx
	y6hMB2bQ26h4jROK/RTCalsw6e3E5QdWpYbTbg9YrxnPZAGZrTJtql0EulHWME93B/QLqotoisX0N
	BWJo+xWiWjKVcPedEcSkmVQ4yDk0A4Grlt/7T8FGsyfOhCImIgvA+VyvQ3zirBs5aAXWho98vRDRC
	toYs8AAxORcscgXDdrzZyzGF40naCrq/yHx5IwAmU3eWJLzVqMDNgJiksKWKpCDC+yI15Ot2y7Fho
	5dmUy0cDlwhYjzyLAfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPGE-00000008vxc-2zAv;
	Thu, 12 Nov 2026 07:30:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPFw-00000008vuI-2vOP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:30:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b467581b98so36047195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468599; x=1795073399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=pBofIceRoo6kVSFsWI/MPLEE9r1nv3lkXi/m83h+LZ92YEXPVyhbnMWL6QfuuvblkH
         MO89NaNn3zXQJwcbiDNJc4E2DCqUlFRP6QPCVH1ctSX/C+RoEcc6wbE6hgLEygBJ7CV7
         YirgTz1DS8QdGXVBK1v/vUliePNgbigrvMeDhSw6ckTexbOpfQx7CKBsgTN67Rn1oiX6
         Fuhq8Yvutpn47n7dcUPHyc7mdhl9Qa8bMjsDafRrVYbmvQYCuuBIXHI80bPmVApC7yZh
         SchWuNWu93J3+lGjBwH4imVU1NrNdY6kwV7gCd3KaMaqNwQjPikX92y3nPDXgcAitgX2
         zhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468599; x=1795073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcZmLUJAwAjqfM/zYxpWQX8wFxBZvk+yTA7YYt7ARWc=;
        b=0TF/YSQDv0lT3ytdpKIz/ZhyF7xcIMpVi3LTZ+Mv2hy3wox2rLYzge8tPSadsQ9Tdd
         A60/0ZP04CmxBsuF0JqdC0OteGrf3XpQW8oSaKVcxhCql3Mqohq+pW4PYQwnEabx1kYp
         9xw7Fj5ddYvhhJ0wT9BaRor1p+w+fR+23qay5tWex295VXpZIW89oZQntqNScAAC+kMZ
         9WzS7gPBAtRWZxJTV04CKSdsYC35DRl8T4DeWxvDCRW2eK4+3yfQbT2785Jdj+XwG8BF
         GLM3W5YRtntoRzjfYVq8oKOxg4mQ9iACpFsujSbNwaU4/f77UVYhdThsW7AMHmqLhyW4
         JQvA==
X-Gm-Message-State: APuU4Z9z/XXTNOACsrb8VwbCw9Kw01DvclUtCCaGTsFurlF6W+bbCd9j
	z0GdfcySZEnTWYG8klBogXvsjBNb4j8o+/ufTuYlJtfjRRWdoqOX9hqm
X-Gm-Gg: AYBFou2jGC9LfFsk8bbaGAWvDTJu7mLgK1mNjjYXe+8M5tvht1buSgiJHmiH8jfzqMI
	IESnVyEaGZwzoaqusxxDDUspo6cv+BGEVKtk0ReZTLFHyyHm79jGAKKbDs+0o+J1zaz5xsq+mU+
	SL7WzwFVY4M0IO3BZie8Ilw3m65ZwpODPi97Vn4MKnlpLRud9sWDkTsgTCTQXVYmytV9f3glhwl
	8oC9IXvgvrfrwMtEEXJ7iNTilnt8YvU2kk1VUutiDaxLzUZC/pyOfuPZ+JvU0ySzZZJp8+9G2/M
	OSI2j7mfuS/D6D/bz1V9yNNQbZ6jMj2NIB/HD31gx6n3g2Z/N/1P9uhKXMZjPg3ZdPEhGEbcNTw
	npAUFW3ieHjLC1HKGKTcsaJhj1Cubh31lk609BXNbe2v+1lysy91hqA8K5/5rygp2DqwKRRaQrW
	8dAlQJwKVzxuhXmSuafyc90hTBtKC3hfwoBXcohfrqkSm9Yr9e1a5RcFQTXWzgNO9zBkoARxEb2
	mlAKOoowHLTr5VluqNasx+5e9DlNiUDjTZ0jQekXeIzAOXMcV7s41VUPlbsGL5xMaAaND3eyQ9O
	H46Kwckf/1smbi+lIbQBrnphNkel6Sum5rw=
X-Received: by 2002:a05:600c:5251:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ba09392980mr80173815e9.17.1794468598725;
        Wed, 11 Nov 2026 23:29:58 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:53 +0100
Message-Id: <20261112072953.989664-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_233001_272116_80F1C971 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c):
leave a disabled node alone.  The firmware is responsible for leaving
the cache disabled in that case; the kernel does not check.  No in-tree
L2 cache node is disabled, so nothing changes for existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.

Assisted-by: LLM
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..5d6a4c040a50 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1772,6 +1772,11 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		pr_info("L2C: disabled by the device tree\n");
+		return -ENODEV;
+	}
+
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
 
-- 
2.30.2


