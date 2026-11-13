Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04881606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AhUK/FWx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8/rMiou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=; b=AhUK/FWxamxR4g
	dJB78Klv6Gv6SpxDZ/ZYPFNNNo3vwOiuCVAtG4tWGJ2NVZLFhKtjodpaM+ZixptdZfreVkpUfy/Gc
	9Pv3nV7gUS6X39K/dBkgV5TpmD266UL000ORnA2T+6earuDUJnZLrqizl0/6zXREiyi7op1xzomuR
	d+XvPiireuQxA90nPWZh/Oc0Fg1k8WGNcavTcuUBKLP/MgExI8ImwrHyxon/vsFAdLrtEYzRyRF1v
	+ETwPcTxVyik3pwooLOlftv6ssebH1NWMKeMumK5oVabDoFMIAMvC8s+7DgMzSBNkGI0+lX7OA37N
	L5vmCcqd+KlnSPcN0xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfE6-0000000BJsl-3psp;
	Fri, 13 Nov 2026 00:33:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDx-0000000BJe7-3iso
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:33:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490f38e9688so251951f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529980; x=1795134780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=k8/rMiou4QZXXp7Se6+mpse5XZltT7qiXu92XTAtgzXU2wS0iQTjV9aMECpdzTIl7q
         EHR2odh9xfl3DSehhVt1VzvwTOscftygRkCH211IkGlGS86wMBzMvHTNoZ2bnTjd9nUF
         GxEmovQTcisZfnLjvQi7LbNZd2OWELLBz2pVR6hjwK3zekgpU27Egz4k7bPUsbvIU+Np
         ZfMYYI6W41lXLw+OzG/ZykMkC8LNCLJ2TBL/KFKv7Q7TE6nhMk1lxVtlu01sHoJkwduc
         DVLNqPPxP4SsdSZ7ds0PCPDz1VJ+F1BcN18jjV7oQYakJyoFB096ar7vjGoPaSBigbmj
         1m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529980; x=1795134780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=sy+byLHctaq+OCw85kYs+umoTDFd6gqJLswORXV1TDHWb26Mt7yqkkhyhcZQAtoTTH
         6nnh251FKMGeCjNA1XvSZuIC79FKsuzouwAF61SUPpHJHXUPgo9WbMWM81JoEFKV4mtD
         gZnJNEhOyphhLMt6WN18s4du1IOA7FzKc6DENopU5prEfmCYVkVnqx0NPxKs2RlKuluZ
         86OypiS+N8M1zUZX+7ous1xZsbwfYoTBy5BEElfe7Ha4z/SLIBHagbsvIHTa/EFIXf9Z
         uCn7cJrrFnOxY6SLIAchmhl3lXOjT4UPtvWqs8//Fyv5ZwBS1GxSMDD87cggAJMpzvFw
         ruTg==
X-Forwarded-Encrypted: i=1; AL+hErHvgR3AkrH4soNuGq/zDbDGtQo4lzL6EMS1XNjGDbysVEdOjcV8yReEIncDEvsONnalLJa580SlIyaMmhMj7CNx@lists.infradead.org
X-Gm-Message-State: APuU4Z+TEUGQj1RD3maegufT3h/22s9f/YQmY8DYZvyF8hKDfCFU+76R
	g6Znb/ucPo4fTuXsOp53fXUaAVCi9/4FtlzV+PhaLCB/ZLCXiMDjkHxj
X-Gm-Gg: AYBFou1OXngZXGHoOt/XoKGj90+S9uIiudvfmd8z3lEXOCXVTDusCyHcJR1oOee6xOs
	C+0K4zBm2RZH5qTDRqbXn1mjUPGP7ikc6+axR0/SyWIuiMO1uvOCc6u29f64sqocBLKSdfkU8dH
	OTIe2CLWSYgUDMcrq5ibDoKLVJ9n9YaZxzW1pnDk7hPGm/c7JgL/BedoG155yZvObmo7rMYdxc6
	HCFwryj4QJXXtmqJ7PsUsoXdQp1oDJ0QoBYgPvGzlBHCZ5jls187v4f9V8ePQZLL3JPZ63jb8SQ
	nbAx/DPoIVXa1akNmv37xAfKCcGwWvS2ytz+coMBtpXuxdyMU+ic0yKnb2W4XC8vZ0KGO6fBXtw
	x0iSTkCOLp04CIhkYFfl1HGTXPINFlLGQf5qQX3s3dqqR37GXUfS03tn3MxB6qLoe/Gl1q1bLb/
	KMqmBIv6x9ZADDCFwZZthxTIMdqzu276e0Y4t9qMFaRHM5qupCRY2D8jrOmVNbtnMbc5NaYKkSa
	ecvKYqgrY1S3J5lL/obul6KYxQI7PcQDa83iVM/+OXw1nWQiRZx/n84KhMw71SCz+69HEVR36rj
	D+hoNJ7yeCGrYy6v9bUMm4tHvGipsDVrtURsuu43KtAlEVfv0GCjhFiSaIiuNNfCY08Q6wE4rPI
	k5bX5P0IVbn7dogSKKTY/pzANXfzOm8f5yC5WRXJg6zF8Zt2WCvyi2A==
X-Received: by 2002:a5d:4531:0:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49c6fc9db4emr1471691f8f.11.1794529980179;
        Thu, 12 Nov 2026 16:33:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:59 -0800 (PST)
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
Subject: [PATCH net-next v19 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 13 Nov 2026 01:32:02 +0100
Message-ID: <20261113003217.197757-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163303_577884_3E974BE7 
X-CRM114-Status: GOOD (  15.46  )
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
index 7f91cf3eb951..4f1e494beb8d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1050,6 +1050,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1762,6 +1768,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


