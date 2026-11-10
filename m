Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF060A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LyEAXSWy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLMbTk/M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=; b=LyEAXSWyvCHoRw
	QoRyIA20YjUa6GkMwrFvhuA7xRTiExE9A1Uw118Y5InT7yrifupdfDzxjb8wogjxVx1DhI492TR0q
	2z9hk0b9a5kSuz5c3VnVy0mFoORRHCabwZ/AX/unCojKemXVThIF3yDaWyXo1S6bg8wcOTaxdyiwE
	2j2hHRMNxSuqp/GBIlV1oflBIVuBsq1kcMDGw9TgyEfBYoLQXaWfQCoDJf1EYnIga/B+doZgLDWvl
	cnGRlio6V5lr7fDzdIwwj66qgWN3wX7dbRZvxsdGtQbLY/zRHjC78ngrsiSCT/oIdaBZmo9yUqMP2
	g7qflmJmDB2HkLGKLVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMy-00000004Tvy-3Q3V;
	Tue, 10 Nov 2026 16:06:48 +0000
Received: from mail-dy2-x01.google.com ([2607:f8b0:4864:36::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoMw-00000004TtU-1pSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:06:47 +0000
Received: by mail-dy2-x01.google.com with SMTP id 5a478bee46e88-36f758312e0so1128074eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326806; x=1794931606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=;
        b=iLMbTk/M4I9pcIrLP739Xh8lCz7WSiIhyoI8N8XwMZZq0u199tuZhi72tAMK+ubADD
         sb0pSS+EPth1aT/oQ4+fjZ65+R0Lry+m7qnWippgAep1yuEkZaTVyP6DcNYOGOVA6jP5
         bRpyZrVcMZM69irt1jUjDyU3IqAJABF+aJJmf33n7aHKZufc0XagQEJYU8Z16d5vztaq
         jxTQZrdQmgbg1KRSe0EnjYyYUUHOmaR6EPENj/pBPoSmvXrntG8Uj3E+90EcSxe6hZ1a
         HGo+lp/CC7N+nEraAkfGFabOyrEblsTjERZcpQPa/badKCl/mWDuflgd1BSsd5VxwLfA
         l/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326806; x=1794931606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=;
        b=sSyEYCRyFgOSfvQuCQZmwVDukA4TCPkqSvkQzq4GUZA/q/BQpHaAO4CfkM1Flzs7uv
         mSSckFLYg2bOBU/aZvdWAIdfXU40Xk02aiaY2GHnZoPKRAZZfbsB4pOvJIVDdCFKnktL
         q7AT4nHVahWWvXCZX21+wZt5SJEuS0Z7VjMynicAi+phnAIafdzz0Qoqqrm4o/V34oQn
         KrFZS66he+WlxOla04qwlx2eJTIKccnaDYXGvbfBEuv/NLIAHr0+xpSbcOt46pjHLi47
         Y4Wz3/bgjErXc8tDiat16j/fzHIV9p9JhHTsqT+ZLw/xglQY87dtOf85nwqwOK70zviO
         aQdQ==
X-Forwarded-Encrypted: i=1; AL+hErFDsyNlAv3uGbd4etjhuMoqURxnVfXpUFDV/n8kLBjk9F13RTuxUK9SBPGjo7s+rfp2SBbgrxbgzhofK8M35WsG@lists.infradead.org
X-Gm-Message-State: APuU4Z8rNH6h7t6bVVs8XEaJG8eRJ622lQO1Slp5PrkMFZ0MjaTy9KO3
	Uw59l+qOXdkzyAvZHu8Vc6dawDkFIWry6Xxjly9SkKQx7sQT0XHV8cxp
X-Gm-Gg: AYBFou202VMwUDF3FMN9N+5miLOXWWm5V0LD4i8IVQoG7ASn2R9UkrEYuKyahwa7W7I
	ar9NqWBSmInZpAj0n0hGDLJJEPjgRltR0/1mVvn/JO9QvGm+bnyRfC0jOKqORCZ1QTlU7j7+SV9
	aeq0kNnHk6Q1I0s1WL45Iow37H13nhndQeEyI1NQ+Md9blzTOpga90TjbY0qdZHCn2MvHLVv/yI
	2gBVcmVD6o8jPMtK9IRUEn0F7xU3zxjBiW6do0tUqerUWYeHer/5SF2R2/WzL1U2aRFcGSTp4Kz
	Sr9klWLSmcOZLA29bJa2gs1O+OYKq0j6lbWPjaM/LtSSSAJdBiWecZLZWEYLUSMTKLGE3VJrYGb
	QqMQ6awuZV7WhM3hvARALatdZSIxLwgk6CbUh6H4MRFOH72L2YOmYVZGF9KnE7iyRVS8APEI+rl
	67zQS2+5ahsBVCrqYBXYQe9qpnrGCrMUJLhPp8e5QQGXaBzzb8O38eYqyXVAGzQnccmzr/EbW98
	boB6BZZSAlT03jWtxdVSDysFcjyOFM6wAZoZ2CEM43fzcX/kk+xH5dF1U6I00zGt8g2KJkoWwIP
	8Uvog66JuawSMG67tjQD97LJixeowoIaQc4Y/DqL9goiTQoo
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr4271960c88.32.1794326803608;
        Tue, 10 Nov 2026 08:06:43 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:42 -0800 (PST)
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
Subject: [PATCH net-next v4 2/2] net: pcs: xpcs: make supported_interfaces authoritative
Date: Wed, 11 Nov 2026 00:05:54 +0800
Message-ID: <20261110160554.918652-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110160554.918652-1-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_080646_556260_96FA40EE 
X-CRM114-Status: GOOD (  21.31  )
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

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
SGMII and QSGMII in hardware, but does not implement the C73,
10GBASE-R or 2500BASE-X modes that the Synopsys compat table
advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

Note that QSGMII is currently filtered out (a no-op) because the core's
compat table does not support it yet, which demonstrates the intended
filtering behavior of this intersection. If the core adds QSGMII
support in the future, the glue will automatically pick it up.

This is a logical inconsistency rather than a user-visible bug in a
released kernel: the affected Rockchip platform is not present in any
released version, and the MAC side forces the phy mode, so phylink does
not normally pass an interface outside the mask. The patch makes the
mask the single source of truth for both the core and the glue.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index ad187fba4e9d..e29f473776b2 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -480,6 +480,7 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
+	DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3


