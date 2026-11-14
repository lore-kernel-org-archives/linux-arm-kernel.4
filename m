Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F7606C262
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XjgSUCUz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESj01lrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=; b=XjgSUCUzQwlSD9
	KO748gzr9PSaLYb5UuBMgl34beSc6NKvKlWymJMZmA/5f39ZfSvbigBZHNPmMQpUCbOMuryQUEgX6
	k8MZUbBW1dFlg9hhvX0a0/mh3NNpJbNGIxkKtOD4S7otATs//4aZ5ynhFxcza3XB7mIK2SMJzAMLd
	44LAEG1zuyLwqaHwwAC8DrC6BRfFXDlTVm91m67wQQhKWSVbEC4xqFEZZMtQpRTbXufJrWt3Nc/2s
	oROdw/wc1ryMqVop1dIZZDpSXzp3HQMpEsB/HBRqVyEtWnuAwmOptlWJPLVQCmpNmEvoBCMpL8MHp
	5rFENvO7TjNzQ4z7dbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFY-0000000Fmrp-3Xxb;
	Sat, 14 Nov 2026 10:44:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFO-0000000FmiU-23B7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22971675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653077; x=1795257877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=ESj01lrbIC2wnKArqXBY6ScVjZlyf90yylv9XcKxHReKKlG3EtLsyjGzlVRbTQW0jl
         F9XL2CMNgxQvY2P+00ArjZpiqJqaO54Mom43k1VZ1SLMuymf8Wb8f2tfujmvZ3voIsfL
         g+l9HA/SfPW/lDe9h3zCxt/cGf82aDcS/iQc46LnhF6QZ8HkZ8eeTQZAt2pHCF+qW2z0
         RBilxHBJYrHOlgVc2zfGnLszJr/V4Me7OlmBP+D0TxLOWfn9t4+VbKO/HCYQfUw1Uuje
         7jcswRdggNFLUw2JgmpJH/BNIpTnIQ3m7eVFcKWENA2Are+mlnXxFPRlqwrZB22gC6Aq
         oG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653077; x=1795257877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=J3rBUfuLfY4M5qKf1z5vCwd+J9ZgY8BNXRpork/K04DcAdj9eSMl7GPH1A1Z7wPA1y
         1qnk/pzeYuhFMGkbf6quI7e+STG9eMReGKoG9zpviLBu6TX+NDbt3E24akcNJ/N+VL7r
         gE/RD3V/1w/gdoWwPk26A9ufoce4fRlMPTJYUZK5i9f5h9Sb5Ze5bjtqG8AqzkMZtjsD
         AwT4ArrbfeNNiHrx7vTQ4DLwAQl24gKBQLIyp+MBOiy2IwKVE2a1NOI9dguaj76q7ONM
         yi0r69qWZccImojiLw+cMw+pjINQ0fJAyd/un2isxn2guxArTDzxV4qaZoVFt/vGAc+W
         6cvQ==
X-Forwarded-Encrypted: i=1; AL+hErHCOxpUVx6IH7MAqrEyCAV2uEuNoOL6T6YLSRSXW5wUIY2c9KEKOBqBmUDEIvX74HZidMsmQgYEYbV0mQtwdz9z@lists.infradead.org
X-Gm-Message-State: APuU4Z8v9KrhJ6hIu+wJSquE4gh63TGPZuvj2cHVtXGghhs0HxbkXllE
	0h9O4snck2XBX+AmbOtfRhZmdFNyfV60MbOoX3/RqQallcKzFaAT64nM
X-Gm-Gg: AYBFou3cxTVmhXXF4/oTOAa2YN1q5xUUq7ttEJyC3ua86c8pbL6E7J9p/JVo2+IzNal
	PwgBdXs4r1fGTffWnWNRagST3xaZWxVyGR68hdzcpQcyC+dfer2D/jXVDsqGKHuWuUQLogJf6He
	sSA8lnkezb1O71xpbuvxLc8Iq6wsQwQMWNR6Zof1rUhO8oZbbhwPEINUcZwhNk2y9ww0VMS+jFG
	LK09cNGtkoROSUya8Gq3PGnMzTx+5yXMzuPh+nohrkgRwr2m+jr3LHYHgEC67K8iugRBFC/1h5F
	HS/JEJslHtClEUrLunca9hn1KU3emDw7jYs7qwtB9f4qGfx5oL2BKb8tgrsfgNZ8CylrWZ2IZXL
	/xYOcGmL6MW1vgJO3BtvRw6rIKutYUkZyImTAWWnAEisn1t7xpWbc7RNLEqK2M/2Kooj/YV5fvn
	arpATden1aSmlzqhhOEuo8/0ohyYFBthP23gURsmrxvzFqsh1/9HjhPu8uKQnK76vV/dximkx6P
	fQNMhadzXFAZOfbr+ij7RX6mK9tX/nSlnM4E46qKsORcalzOiy8mo9RQwf9yTgeAO8+w0VbKPwL
	tHtoEnG4Loy6ABe+jzq+TAp1hD7d9vy+rf64/7mFkuQPIwASE3UWe3iGHB0Pc6HXfjF0FHcX4fE
	ACDjY1EzPf2g1ZcB+ZWvniUjOrZCAzgvRjw==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr75369625e9.31.1794653076664;
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 14 Nov 2026 11:43:41 +0100
Message-ID: <20261114104426.235620-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024438_557580_0DD424E9 
X-CRM114-Status: GOOD (  16.08  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
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
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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


