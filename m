Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC658606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EoSnFuKJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=K0zpystB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9wl6URw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=; b=EoSnFuKJd5bVTZ
	MhhKGLSrT+Fav//XZXtuOMjwJeDN4dE9shnqdETRDeJePkxQy7ixn2Lm4jhgR4XcDK6cBatRsXLqX
	9gFAIm7jwu/1B2xRyzInlAcLacSwbqf9rWzqywZ+GU9BCoSUgByhQIxdcB8f4JC2JvF1X5bzSlcvI
	jLhOHv3ASgw1VIVsNTo3Ze8AxCcyhag87CVmFKrA3lhYXovsxQMXnldekyDebobDm3hO2MtaNJiVP
	ONmpj7k+N7xFKjj3oW9ByQAieHBJ5nfm2VBYIu4ixLlEd07L4iawPcB+WVjaJhNICPa8U/CBMAUUs
	d+2y6AW4BYNQ4/IHoCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIVI-00000005gcg-057p;
	Tue, 17 Nov 2026 12:41:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUG-00000005fWK-44Ec
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Nov 2026 12:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=; b=K0zpystBEOepjgHrR6Xdb9a9LY
	t7aP4IjBm46mW5DGxaVFRdmYoz6WnWkuVeWryxnk2Kel6lxFS5ov0Al90F6ekDFRKRlwKbLJ8y6Qa
	2/l9lgVjFCJ5Wg5c3cGYQ/+LqrzKrvvgToETQQo9PFhGyXWEi//sngXzYEwjDjjF1RvTEWv3kAijQ
	IkW2mXRaEfELEzve2zGjl+T3xeqSI7sPxiTM9vPqQgu2V9nYQpbbDKi9nDmqxOZtpZtlXbQKr801G
	V23NNDLTuR9L5qwg9j3QYoXPMVRxzD2S0p1/bOPywDwyTXgDou4P8QDG0xsEXO9fIF74ZWPWwMcNY
	Mi9Ivxvw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUD-0000000FVe1-3wAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so20669145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919233; x=1795524033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=n9wl6URwVnGq6EdXee+4SlYVcgiifymqFXpf8BYjM+Pjfeaj56AW2pbdSxm4tiWL4w
         K1YUROYzURaDSU7pQOd4fy1ilMZFXJUNuhOxAqZddiiUo2tZoBgPcpnO1A5bV7XVZNWU
         0S5M62AVbBMoxEtamINKW8KYiAOoAH7vh597B3KeDp6wZdOVeAMZtDVD5iUjO54/tacI
         SUdJy2G2qg35TYsz2GeZvExlmYz7jhloui10Kq1Ahja0SguwQGYQUqeenYyQFbY1grB2
         ZtBNIf4kbKTEl5GPyRgcVkWJzn/zJv3Fjabkx4+2va0dX9KpoA+GKuJi7m81HGvQJpzT
         Br6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919233; x=1795524033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=eiNbl6e/EIqFlJn+E1RWVodisL4cf2r5qn8FTZiLUGdWqlDI0hVBMQV/69Mvv1jJPh
         se3Sa/yS3H/CC2CJm8tKf4bUe2x2uqZ4MnEb9uLpQ4byzLsGAivfZdGoD0/og0XtAYjC
         i/BXIJop+PWftD1p2XgQgQdD9IPAFvQPYeYtlTpuFJpcVANpwp6GpfGMa2XL3UsB8CCC
         LirOQcqe0mWYlwznha0qTIaPVvvwT2kafXPuN4BASzzyCABolDfUJRJZRWHzBWcTTC5o
         oYVbYs7/bGlsW0303eBav51BjzmQRohKxyOsR4OBLA7+zzasfneilYvwm1srSFrCvP0q
         LeFQ==
X-Forwarded-Encrypted: i=1; AL+hErFi/H0RI07WAulEQojEfQ+AZCVcpSP5WpGIUzzpIef22NiDgHbh4kZE0mdOUFz4X5zbDfYhMTlQNaCtNXZ0YZIv@lists.infradead.org
X-Gm-Message-State: APuU4Z+o7pqsM6a9cW2LqFMszWQqKBmyuL14150BlmIKdSi69sq8Bizb
	yMxK9fppainjBLJaoHkqzYgcDNEp0LGuaYlQIHubbz6QNSpIbq7+Ro3x
X-Gm-Gg: AYBFou14gjTErsfYV5ICAbqqlUu/QdgPWgRp0fVDGvJp8XdqMAtJAwvn5jt7GS2FpST
	JYzBjPIsgW3Z7bXfT7RpgRmiTIPx2XIP01Hyy4JTy/EYWa/5T7+7vTjaclOVynYQzLhJ5dAAKfZ
	KeNNJW26usdOFQGH/PofZ4S6/nx3W56nzLjI2MSYEipUp3QnPQ1TLuINMQ6Rwig+MfqjnnrjP/f
	pZFJZBfd/ylLow0gIB/2w7X2nXcx8IIZdpLmFLSlj8vHAZm006M1wFS3xTFDlGDbIBvWW3l0h9P
	w2McGak0I+04fY4uRc/jB/28MQg+VwWms+2opCck983Nce6UsjrLVKZYh+CZmhUr0/ESBGfW6At
	bwRPacLxjkQalAipqcM6vmiRXkcEM5Ir8IE1NckU1p3twQHPgmvoVCWg3mRHKtR9G822ETVdJ6Z
	kolN2GXXjiqquWfUJGhLOgEgf9BxYh3XJTSeTS4OGrcEjnir4RaerMY9Av1UlegMBA+TK/XsPvR
	c0URjQqKs8zKc2SkNN9wpSQbsVDk9xrsbCVTBULzFlfLn0WeGh+9DFwpuM+BF7wUC+IOqEZaRMG
	zlBpJHyd9KpGIzxTWSzlYY6u0P32Hq3g/+xxC0g6X9MW1BN7sqqcMcATMN/cTt5b5aRto3oK6g3
	HNK/EvtxvctiCdT67G/BfDpRLTdCEt01uyQ==
X-Received: by 2002:a05:600c:3b2a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb735ad6dbmr119130585e9.23.1794919232533;
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
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
Subject: [PATCH net-next v22 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 17 Nov 2026 13:39:52 +0100
Message-ID: <20261117123956.11981-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124034_187968_404C6E75 
X-CRM114-Status: GOOD (  16.74  )
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


