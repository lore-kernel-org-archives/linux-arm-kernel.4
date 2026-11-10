Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677F60A261B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8R3k+mR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHa0ry7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=; b=e8R3k+mR+tvFBz
	Cl8wMs+OPNXowByHeczsxoUHV3d7DuMuF6OZQnMF0wLMOikXqO9KaFmqLTC4CX1SBvQN0VjkNNHtJ
	hM++5OKVoTArz/YVMLuU9LL0v6vq9xGtbdjXUAUDk/BqCjHfyavqKLG7Az/J8mVVp3Ms0jpSYKHT8
	/dH+tVMtOGcEEYIA7vTAH03QxG+kBUcaSw0x5mp4wJwAE0uMa9W9/5E2UPvE07FCo0bw7TM0PhqHf
	4fqRtn7mHIez+/qycl2CoOpx5qcLySgEGQP47mad/yXBHodv8IUXGCIGYfu24DKtbSRvQ+XrDCtWp
	MWgKt0np5Sxao7XMulAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMr-00000004Tok-1RwZ;
	Tue, 10 Nov 2026 16:06:41 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMp-00000004Tnc-0wYW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:06:40 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so2703823eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326798; x=1794931598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=;
        b=OHa0ry7fgU78K5rmvmuGv8WcneNPg+MJlb5MZG9hBClNyRcvyAqzlfLKVVkPLVh39Y
         03NFMEIRYha3WwNQ8zdEDn6M0x5W5jCBqFF9vqcUNwmKA8CesKdFfGRafRcsTkU14pkF
         PO4YaQbj/Gn1IYZM+Ug+xCUCXvDTsfRDzofeolACMvUF8MZkfFoRTzhJMu+uvqdrA+Y4
         aZbsIZyTci2A0uaLvWaD6P9foisejw5WI5sTj+OldrPF5CH3YAqqZl3Am5EGNQks9YPG
         ZXnNVLtP742MSywPQblDnwo6mU7REb+eO1yujQbj1TOnHggW7dGzUxeLhnFdgTzwc4/X
         MtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326798; x=1794931598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJO+2+1LAsC2NcBt84N3ty/qYLz68nqiItgXHSjfx20=;
        b=H+1md96WjRdzITnAFsQOU3y3kfWXu31FaOIw0KL6bQgT9CPqAmtoz4nw+DtoYZ4KhS
         h8cqHDw1qCcifqTN1196s8K1igs8lbFOF6f/DzSwv42PZA7bhuBWxR6nM+8J+s5/Y1tt
         ZeebS17JsxhLFpDNwiEG4goNqQy/Z91FpiZbixDr/yutzrPHFi6rWc5cBpWs5XHAQZGV
         CGV0M6bTyK3AvKEJNg9IOKOrBDpnRG1rVOL58fTZNw0g8tuA+zDA7MJ6e8qvcAVWmTyk
         lp8fA6s1zLyw3vTFnzrCRpktzY7oAhRwKYQ5aDDz1GcnMimhCXyMOA1XiIYYTT7NBEB/
         I/mg==
X-Forwarded-Encrypted: i=1; AL+hErHwDfuNtAF67puI8wgWhb8EHVGkzDpNZBBbHR4oLeL5Z4BY89f85qftZqQxu6R+LV/8BwnHMU/aX1i3uHx02K3h@lists.infradead.org
X-Gm-Message-State: APuU4Z/BPKOPFuRg+Xt7H59SnvEH/QluQhxq3J6OX4NCOhJATf9P1j9w
	XE6/Ghle9r5eL44SrvYky622964gUee/c40YcXtke4/MJnP5Eg2Kw20o
X-Gm-Gg: AYBFou2XsMM3+rVN3hld6JcoyotyRHmU+6VJ2CTHlhGrsR9mRt6mdN4VC2fY6E8GlJy
	fUHe0K/5jh5lkx/ErR8ZGTfR9sGl39Gn52f2X8UtJo7hGcdcSAQvUmFbhIL7MBJ//AmdI+pMlqY
	I6ifz93a7+JIXVOAw7lvqj1kDc/9ZWuW07Daa0ZB+4p1/9mCW9bfHFMg25Nz6Rmhe0xzAIXF+eZ
	xzTtLfDNJ6GDZ63UJLvMbW+6/KVyoLVc2AH9cP0aS1u/GjjNpa1SqYehaXD8hPM/27fa1g3cuZg
	qpo6Ejh6oewGr9DFMGMkJNNR5Kspewp+CMnGThhL6l4NW55S7FR1HAq7OoaOX80GMbj4N4b5Q1B
	DU4wQMhJ1p8kzcVKpTq1jiCnIv/23DCdWogAb13cOT6plyfIj8KgkSpgp2E7tBdUeieycTpld+v
	Gp27rI0wb0r8mmpzFAD9cMBnqoT374qD2PwmvSyalUXOc2sDoSJfxd1pjYvWzST+JQnizduQ9J4
	HVEuvvhXBCN1OZjjWCyFUPPHN4vSBDr1GHLlnkjRgZuvelRL3XUcTPSBs7OWnNvmF0f/MrUOEWz
	+Az5bNZzKwnKr01RPv49/ohBMb8=
X-Received: by 2002:a05:7301:d188:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-3751eb8ababmr3534905eec.13.1794326798150;
        Tue, 10 Nov 2026 08:06:38 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:37 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v4 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
Date: Wed, 11 Nov 2026 00:05:53 +0800
Message-ID: <20261110160554.918652-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110160554.918652-1-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_080639_287847_328A8141 
X-CRM114-Status: GOOD (  13.35  )
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

The txgbe driver currently defines DECLARE_PHY_INTERFACE_MASK_ZERO()
locally, but incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS(). This allocates significantly more
space on the stack than necessary.

Move the macro to include/linux/phy.h and build it on top of
DECLARE_PHY_INTERFACE_MASK() to correctly size the bitmap, while still
initializing the stack variable to zero.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 include/linux/phy.h                             | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..43aba23109fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -159,6 +159,9 @@ typedef enum {
 #define DECLARE_PHY_INTERFACE_MASK(name) \
 	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
 
+#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
+	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }
+
 static inline void phy_interface_zero(unsigned long *intf)
 {
 	bitmap_zero(intf, PHY_INTERFACE_MODE_MAX);
-- 
2.47.3


