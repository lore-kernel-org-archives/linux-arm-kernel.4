Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4295A60A2608
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGbxRK0y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCYXmHp5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=; b=DGbxRK0y1a8dSdC9SbsbtKyCLV
	LYwrxV46UhKdEVBM9CCQQOVwjEPTFAqgNDjv+XBG/DlhcJ4GlIybMk79yAgWP43cK+RKjj9P9gA1i
	Wxr+77DWgJGPv7Gg/z9optzGAAonmGqvCdObOM9jN/1FXXVQOEkrKTNs6S3EUkfbkBxHQ/h1tWlFg
	HdVIU6d75WL8TcJPgpIuhi2iVhIv3/2R0CfuwmsNZJSvj9ozAYH7zL2BUb+jFR2wZrDag++MCYDAN
	bcwWth34nF5eHBXZ+TXxP+mOFmbeuCmTrd8MPTg7pWCf4xEd11B4bPM/t9V4H4uBNlsTuHOFGfhGM
	cJuXbLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMm-00000004Tm4-0a4T;
	Tue, 10 Nov 2026 16:06:36 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMj-00000004Tku-33Uz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:06:34 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1483760eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326793; x=1794931593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=;
        b=GCYXmHp5RQWf+TjBtzYEEm/I8iuDROxtpCdFGG/8T9nhVPmWc3hmTwuEbRz60tBWx/
         vr0Ml5I5ouSDNkTFDIkA8hqzWesp5AcDfLa6xSAKi/o66oUck+juLoxE97Jtg1aYMWYb
         L3/ApaOct7KOu0YLtF7N7EPFL5+kLTqmzpnNoyC/CYXppB4Kpv/5s8Jt3+RPLX6pq517
         08IwwkeHG54w/GrkqJRnggyhrP0Sdq3wU61d+K5y1Gf9es69lbuKGSsfq63lwrb1U72A
         5f60u9U3mBTi5iCi/AF9BHQ8llfDu2tG6UwIz17GdMQS6aEZbroaqqgJzSY0VHV2OuR7
         fBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326793; x=1794931593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vrfc2uaAwCa6vgkw7mtiQRrVI6iR2fXJpjV3Toth268=;
        b=idwuqv140Vqc5Ug1QmVDZsNKQ0zhR0upo5RTMYZDxoAuqatCS75r86Qs1TB42x79Qv
         +LrmkJrVqjmL58rAJ16YGQ3LO8R8O+2J7wkGKoRWQjJ+//X7KQN1yk1TgjbUFlBreNaV
         Wup/aQEjfH9WXC9t7JS9UaJl4uA6w5rGrXpi5AcahFAQ7MinpcvrbjNP3gVRnCXBKU7t
         f6l3xG35Poax2nESKVy22+87x2mBQtM531O3iNbw8LdrwwTgqSfwqcTu+ZGPbjRXf4D4
         BHCMstVn86NZ3jcz9zaHStjLYlaRhND+yP9QwodkkKZR9Sw8wuiAYn3ha2pr0VN6dLBs
         qZRw==
X-Forwarded-Encrypted: i=1; AL+hErH9srD4fhxuRlwwtJnMbJ9lHxARjHepmKsYofMFsz17U7x4WBavrV1eu5UWxHAbPn67KerTp+9r+1j8nmeLR7nV@lists.infradead.org
X-Gm-Message-State: APuU4Z/xPIK0uFA8d/yS2vPnbJV2SRCQSYSo/H/mCYJs08dbwPiS4D4t
	giKlsben5qcqivOFHH6C356Fn+vfl3k/i5TvsTAKCTV/VmB8+b0RiubJ
X-Gm-Gg: AYBFou1XC/ETQQgDsxx/rKnHRNfk8/4jIjhMOnZ7BGVYFxovwmzReJtohtaeae8uek1
	Ub+AE3kI/M+SloKSeazTtd1JMm6lrh+kgHGPSofdj6ARGlWpGZYYCWYdWqesqBDgR6H3iO96D6F
	fOpgBYVtWe1hi9ZFgihmQpMn9wb8r/F5g8ngN6R/8l3An02WXyt5cxBLfFR34rIvt1DYXIVm3PI
	1FrGSr9n22DmI/EU6OtQZvuwCaruqNJjBKESJNuLrfDxDKZXVRrPQSzxB79jnxDTfImom4tjBpy
	49rJEyvj2Pm27fSP800DNIJ6O5pWbxvAxGQvvnqsQskuDpqjkoD8llTUg/NqkhL95cN/50irHgu
	QgfTawI2e0vo8SvkLkyouFoOlGPhUCCCPJHBzFpDkWRo5//pGuTgByZmgBDXvfG+odTV4E0LRW7
	1ZAltWBrRm5VvaUoiEqurr6YZLtV3gfkA6crNkYNNGDrwOYvwSp8oTIY0IEIbtFULqa55NuWyaY
	zNmnxd1v0Xmi/CqWqdefyiQeyqcV6FFeTA9UySGDOBdkCtb9TzBiBR3W2zLyRdKZl/UzEl/m/Qa
	jw1cqBBfl/tjisZbApcOc1+zlR8=
X-Received: by 2002:a05:7301:4d05:b0:369:535f:4d12 with SMTP id 5a478bee46e88-3751c53edf2mr3716461eec.3.1794326792549;
        Tue, 10 Nov 2026 08:06:32 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:31 -0800 (PST)
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
Subject: [PATCH net-next v4 0/2] net: phy: fix PHY interface mask initialization and XPCS usage
Date: Wed, 11 Nov 2026 00:05:52 +0800
Message-ID: <20261110160554.918652-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_080633_767930_EA5BDA7A 
X-CRM114-Status: GOOD (  14.92  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes issues related to the handling of the PHY interface mask
(supported_interfaces) at the core level and in the XPCS driver.

Patch 1 fixes a local macro in the txgbe driver.
DECLARE_PHY_INTERFACE_MASK_ZERO() incorrectly uses PHY_INTERFACE_MODE_MAX
as the array length instead of BITS_TO_LONGS(), which wastes stack space.
Move it to include/linux/phy.h and base it on
DECLARE_PHY_INTERFACE_MASK() so the bitmap is correctly sized while
still being zero-initialized.

Patch 2 makes the XPCS supported_interfaces mask authoritative. The
generic compat table advertises modes that a specific integration may
not support. The Rockchip glue now builds a platform mask (1000BASE-X,
SGMII, QSGMII) and intersects it with the inherited core mask using
phy_interface_and(). In addition, xpcs_find_compat() now checks
supported_interfaces before looking up the compat table, ensuring the
core respects the narrowed mask.

Note: checkpatch.pl reports "Macros with complex values should be
enclosed in parentheses" for the new macro in Patch 1. This is a known
false positive for declarative macros that expand to variable
declarations; wrapping it would break compilation.

Changes since v3:
- Rebased onto net-next as suggested by Paolo.
- Patch 1: drop the Fixes tag, as this is a cleanup/optimization rather
  than a bug fix.
- Patch 2: move DECLARE_PHY_INTERFACE_MASK_ZERO() to the top of the
  function to comply with the reverse Christmas tree order.
- Patch 2: clarify in the commit message that QSGMII is currently a
  no-op because the core does not support it, demonstrating the
  intersection behavior.
---
Coia Prant (2):
  net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
  net: pcs: xpcs: make supported_interfaces authoritative

 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h |  3 ---
 drivers/net/pcs/pcs-xpcs-rk.c                   | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c                      |  3 +++
 include/linux/phy.h                             |  3 +++
 4 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.47.3


