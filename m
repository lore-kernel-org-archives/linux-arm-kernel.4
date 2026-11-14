Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B782606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eHAq06JD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8uXQTWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=; b=eHAq06JDpOkgkR
	E+WoHy92mobjkwERxVWE86UJRAu27FOEk/Nj58Y2EVyWuGg6gBhoKmm9jj/A6w9io+3OiEW//Biao
	VbNT8JJQb4eumzVagCS0aGgN2/z71Osc/AmaKnQBQxU+Q5Yu9RS4QpmINa/yaAlgl2s6q0nZChyZ7
	9GAUDMvJC1CHvwi9hu4u6hhxsPZmJa0Ujmn4GMbm9NL0YPXu/HiI86sVYayMu5DwwOqrBKRtJ4KYT
	P2aBnzvfazzGcytH9ELUdWKy3cyTbOyd9jcD7q7E4hrM3mCH9xcRML0RrngIkOfNLTgwIlXjTqabK
	8jAnhJZB2DhJZx36Ek1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBG0-0000000FndM-0fkm;
	Sat, 14 Nov 2026 10:45:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFj-0000000Fn1n-303T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:45:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so25789855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=z8uXQTWcA2Rv8lyqraHQFv/ILW2d8UVsQXs13bjzpZOIL7XxJdlFqEtQa8YzqS5WP/
         S/U8zb8E7nuiU0mmydxytq/akeWRGIXOs5uLAKjX/1DRFPAz4Qv9y2KgEKmcmYo4afLM
         8JcU6gJhmZV7zyROI2A8J2rk30FdItFnt1eVhD6eiWmbUqFA/SzO6wqibNtry9uCwBkt
         r1c9hyI5BLb1nEwRgGQZaMvtkDhb/HMiLFT+jVzNGJLUUBCibNuBT0/4A05krUa/10cB
         431e99tDfGEnDAl6dWaALmMSjZvZnX+D2+0b+y+q5uW2OXAcSeEXzp6Nh1MZ1bYr/Alx
         5CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=Ms78HzAnmWIY4m54qD5hJIAAZrwKFZhtfp7bnhL6FAJKxdi7ibdNEKdirJ548w6js6
         4uNSIcRjVhj+CBHtUGR1afCStyDMsaeFlb8ntNdFcU28o6NyKWcTT/I14345emqr4ahy
         WyhbHleqVhVSUF24xF64PZYBBPGO5SyOjHzmLl0Y1tTlznv5uqJ+uI0OZ7hwZhFJw76J
         SMuXhWNr/L47xgryes6NU6vlxZGyCus/6LfmLkWznLIYmoCnvuPQgrfDw5Dt8zTU2IkC
         lAlnGnk/f/zbOb+534JqNlTzXn7TmJDIarQjDwXRuJEmXnjqeTLIUa1w4acXXaDcEc0x
         SejA==
X-Forwarded-Encrypted: i=1; AL+hErHEkdoTSFwxMrcAuZ7mXihOwmkIvqQ1gxEBDm0H8FjKhS9oRK55+CERcZA+B7trENNZBIJNLIF0EKdwG8M4TpGe@lists.infradead.org
X-Gm-Message-State: APuU4Z/XGa8s235neMeDFu8FWRL4xWM6wgLO44kghTezlflWvWEH4yIi
	sf13uYzZC6XmgJGLOeH4tblo0PCN9oyV78MU6svrrMshPZrKIaDY1NZL
X-Gm-Gg: AYBFou2JdIU1QqCHAhKFa5Xrdon+aOyrVxVR/krbCavxkVc70dcJtzN4Ay9RvvJw6zg
	OlB01WVkw+OUqMoP851DTwy2ovE5mVZ8lNGW5rt1fBn6OR6V1ivkv7YYbQJ0K4zQd3JHN4qIg6q
	zUXmM/Gq7BNpYdxV4Td4mxapLNvwhi6oRfmeXqLHqKEOjN0NZxCH5CM2u1Rb8yArgfbiNWxSfBV
	khybHAhnqO+kqrP5egklJvunkRGBY+PhiVYNnpyDRJh6/QvEM3+MwAprdu77m5GKdHjJIKi/wmi
	BYi7ydZVOER3grekrYQoZUK+R+GLJE5c75PSzHkSXqXrjX7UIogYOrnMdYVvkPv9Ljb8RIIJFAf
	cIAk6XrxhVXyCLE5a+AHGx7Zc4sueBJ5X6+EcHoymfPLw6Rqm/qGIuYyAng/m7nc/BEPBZvqfem
	9NDfZdZQSHb+IYgcNT5TUQDg+RtnmxkzYj7DaG9S5t0sFTDJoTAgJ6WWIM0G77DA0QnkAAtyyLM
	LAr+KuiTntEH2SSdYzC9C32J/mX33MhxMyf4dqrjoEqFYA8GqtkuwQBVdvF9qtMvkTG6fX+JoTZ
	JvR9/zcjfrA17A0SG9SswiqBVu2OFq3M4VSn4GDvFDciywCv0p9vaKt4m32tku6iaLv4xZbBX9T
	3bdZne6vqhiZJasutioAGb7zW72TuDHiVFA==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
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
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024459_785708_A2E5B0BF 
X-CRM114-Status: GOOD (  15.06  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0


