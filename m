Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psO+pIae;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpM4FCzI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=; b=psO+pIae11pbLN
	hFLdOpWaBzrTwu6osyy3IeymanrS63qvRw3UrkX4s20YGtpIdLUREPDyVmpNPoVdW+UQ2bnaqrsyN
	SlSOZ9XYVmPYiYfTao+UeJRn1TogEQnirXnxt0Re+bQGNGKlfzB6xGytOmCBROFDVR8Gi/XWlrp7H
	/oEodxRT3tzLhilHpcTFQl7fUeBAopNr1HrDEYzTRisabCVvBD9ZoCDJsN3Md7Rk1AZjFYYKKXDlP
	hn0nacm1x7lYLp290yeMjzFX+ZD4V2Aqa6oakyhKiOwyJqZQGbpOx9ExO+9M98dlBlFaRuCgV0Hlp
	QxaqTZ14dKI3ieWl2zYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIU6-00000005fJ8-2WW5;
	Tue, 17 Nov 2026 12:40:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITr-00000005f29-3Uiu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33277805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919210; x=1795524010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=SpM4FCzIghrR47norOn7F+PiGZ3A8UXbasTDQiStwpsUW3mCkI4YcWMgFXqsIXdyjB
         6OYIVLiO/IXS9mrhBPSQlJI+IKOykyZ0f0+Ujz/H/6IYL9wRm0qus7UuIqG2gVUpn5G7
         e0uVcrWZTyncD8QdPN1ehGSiDFGSeq7zVPsgwwrdPM5wP3BE2s07Ir8D1gpLRe2bkFqH
         hVb+7dNnsCCb5mnFoU7oQYOJU3FE9YDd/A96EPlqv983wFxkBbL1LFBgHuvNgLYUE3nD
         JRsfx1U7+UR1VFI4AoHoBLT7K6ChR8JJv7OA3S/aaQaymE7dImp2tV3tsAYDkaKLzWwc
         FIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919210; x=1795524010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=rRF6MYnfefbcPm3w5viItR7xuJFKWgwejuYKjjZFdiV8GMovKcS0CyaNq7cB8pfzXI
         70/AhhV039GQyH09De2H1zQBpoUtoEPVLJdJ1gYVpJ8uBGqBwH2dhDkhM3I1peupgNfD
         PqMSQUB1mzETOP166aVdeFMQ8sxMfLY84s0OUnfEJqy1g9jsixE8QOIN2tbZBx8sCD+0
         TprEMZ46gpz4ZLlEXOkvbA5rCs5YgKwmUIrX83SJhqAh4S7HFlxlzhow3cLzm3jK+NbL
         6hC6Ux4kvMG/dHCVGenFx890aMxtCXMMDquaHbgjKSZAUsBceNDLk7ToE9pjtl7Xgbnj
         78ow==
X-Forwarded-Encrypted: i=1; AL+hErE9fMUeoDP5lrtWgiXqNWrdqR3dC1NmGozjn8gg6p9nko1NMJGnE9FQgMk7wnlfTKDoeBdKtdiMiNDohv0nO+v0@lists.infradead.org
X-Gm-Message-State: APuU4Z/YFYokPWoaFtXQpiTvLeinl6qLJkkzDuJpdVopFPaiY5nKEumC
	GxhMebv5rhVp3uosmhTD1p8klycm8b/YpVzLnC+7XkL3JSyx/TLyTvxm
X-Gm-Gg: AYBFou2GuRSfkxPeUUD/Zcq+kQ1CiECFtYI9Otnqqutcw12k1mfnl26w2k9tU1ljyYq
	HhFfzpPgllXuRpBUctOJZFirCKtBkZ/RYK96TjY7DC+6y1+DZFHHtBPkA8yYlM+ZsIbLpZu3Xbh
	vdv4ke4KMesn4O8TqMpm9qbNRNCkX/Lv0Zrrz6mNKdseBeMUiO9vx91LwJo1TuqUCyYAG8ZbD/b
	NS2WyUAqrsCZyQrNxJMRA5PPS2mhj7ea2tvyxHp+DlCbC82gupr7zThZUDuk7FCGkU4CTkdwQPu
	xuz2VP1oG28CA8VP8Zqt952lcVUrmVnhKGBXLzxqp+KHmNUk7gb6CSB0ehFwf7w+9NnN4rwY0dY
	lfksclCZNRs8wRwlMgDqIMLX3zICMJYHt/Rx0TDtjiZ6aYrhNLBQSVqwfzM9OKlg9KWqIHulN+b
	5VcaiqtSk02E4/uHtawP1xQUUtOPi8Lrk5tmzCB/tCj3wVFJNiYgpG+oLfMPU//HxdyJpoU4/RY
	c+PEeMPG/tC2AJsV442KZp1uS0EMLxpcnDnQxC1m6MmI/KXboZtQi2jcFdLtQivtKmDNg1a5QJF
	UPKM/Bvx+8oYn2K44KgInpe2kpPOpkBqhLO1B0MkcHiuQl7I84SlT9pqkDMwNKsVgyeGfaRke2R
	nEJDVkNzhlbho7mfJQb8U6JbnO47USqRxjA==
X-Received: by 2002:a05:600c:474f:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb76d61fb0mr87328795e9.2.1794919209827;
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-ID: <20261117123956.11981-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044013_232402_EC62970E 
X-CRM114-Status: GOOD (  17.19  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0


