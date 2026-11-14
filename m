Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE0D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2NQqQh6;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=X4lNHg2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hSKOO6Nyuz06WQcd4udwKSIXDiIXsiKGhV8V9XHa0ko=; b=i2NQqQh6Im5B7N
	estfCtgDFxZIa4GGZKscMg4Uv8EDdK+veW+sG5pvp6c3sPVt9euQsZysRXjwtk5iMDyZ+2ozo90a+
	tuZJsZzAqfVNDBYnS/WcEOcCBgrVztmbczkVWdqogOh/F5zJIxscL2Jg78m2D3yHA9xXb5Eb2NoLX
	0hZ1gmfgbXfPhp3v6OeWXMsum412N+7s+cGQVtghBpgAO/XBqEq3F/jfKYd9cQpLl6KdIF2+mEIWs
	NbyzkteCJMUvFA6csyCI3RSOLnGHzw2Q+meECjOT3mYMEnqQcq5l1bsUgEAYRP7Y2iMn3dgBegx9c
	TcTDuzQG/W+TQeEj0eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDK1-0000000G2Wt-43nt;
	Sat, 14 Nov 2026 12:57:33 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJq-0000000G2Qb-0qeI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:57:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E216F2022D4;
	Sat, 14 Nov 2026 13:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSKOO6Nyuz06WQcd4udwKSIXDiIXsiKGhV8V9XHa0ko=;
	b=X4lNHg2j5MO1EqBESU9stJ6LCvzR7CdKHiRhJ7aAk7k2oVshweONge5HFLYeKreKbw8Psv
	pxPbWVUt4dNqHfJWpajqsEyuImSkVbDXiAE3fVXtUl8KV2IIyhu8s1H2XEPHSvGZCKUG+x
	FIYSnI982lc3tvSh/EQ0BjChnBbNqFSlyU3kv+8gCvJIyx05j9xDCwsAwlQw8x4IfT5yZa
	PcGHpASJzlVOo9zjQ+9kO8Mt2680lMeiz4qWrlHTSZuuYX+ZVyG18lG1ec4tU3pOlHWCow
	oAEzoqcVC3gh/dlkdUDOU40gCShewDyQE5uGZK/Bq1yYbld1IFszKnlL6diCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794661037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSKOO6Nyuz06WQcd4udwKSIXDiIXsiKGhV8V9XHa0ko=;
	b=RozUsurT9mdVeH5gGj7VPz+8z0XE1UNakouVgti2SWGhv3dlAjGVyEihaOcr6RgaIRZLj8
	R+a1NZNA3Wo/hNIeanAuSjbYdiCAXsOLvGQVN2qIjZzJif55+dO4pcdrIx+A3KdONbrGCO
	CQ2DnufSPLs6J3zn3bS9PFR94HUCQ3ssjgYjQJrQFyB53S0jKRLQPmoUzZIBPSrdu9+kGA
	I8y31CaT3kqOGPYrxDDRt9HvmojrFj9vTACPrMfg0N0wDWDsxge1V8RFcZqs626Jf4jYuv
	pKVr9mbgt92yggR/l7spEijo78y+nfKZT5augg+UEt53hF1MXHh9UTx9DeuPLA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794661037; a=rsa-sha256;
	cv=none;
	b=W7I1jleNyZjdnbfGp/s2ZjjPIHGP7NH/TeM3vqkN2S4K4wFkOqeWoPiJPANKkgL+0VVh91
	5JoAeK3Kvhp0OOtZGeoCU67rvCmGP0gu9EU3KbMXb4YYup7UCHqRLCA7UZ4312gWtf9D3l
	mJQTRzr/ce7pTBHPEsk1qgfYOoCGeTjBpAhVj/8pQSE/wXLOO51pa1ubvMZHrHU7fVN4rE
	MxJw6MgTkZV5pllNP2DRK/ZCY/QquJ/ZjHa/U0PsAcCq5OJhs/MFqe7kVj9DhTM6ELtGAH
	BzXCIk+zmqc7PqLoobjoSNDVb3bEGe7G/cPE99Mz6BJEMirpePfzvkHp57LQuQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSDJl-0048pT-2O;
	Sat, 14 Nov 2026 13:57:17 +0100
Received: from hardanger.blackshift.org (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6FBAD5EB9A8;
	Sat, 14 Nov 2026 12:56:23 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sat, 14 Nov 2026 13:56:14 +0100
Subject: [PATCH can 1/4] can: c_can: c_can_plat_probe(): reject devices
 without match data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-fix-device_get_match_data-v1-1-2d82025e9646@pengutronix.de>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
In-Reply-To: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: kernel@pengutronix.de, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.17-dev-d7211
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=EVtfv8H/r2eSuhEBKDPovFiE2ZB1wfoNr5NIM2DtYvM=;
 b=owGbwMvMwCV2xirl17qZay8xnlZLYsj6EVUo47xIk+PUTM6Y+I/qxw+vXls091f6J+WS77s/7
 +zwqvs/qaOUhUGMi0FWTJFl6Y8TigKBDqW9LxMmwcxhZQIZwsDFKQATUdvK8D+79LG1ZKF8q5zw
 /Buh00tVl5y1jPxa6Nmo+DTkThNbwRJGhj9HC5apr7oh06qe7/IgoXr2kqozNXld3Y5BPsx7D1o
 IcQIA
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045722_726661_01533DE1 
X-CRM114-Status: GOOD (  11.04  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A device bound through driver_override need not match an entry in
of_match_table or id_table. In that case device_get_match_data() returns
NULL, but c_can_plat_probe() dereferences the result.

Reject devices without match data before continuing probe.

Fixes: 5e6c3454b405 ("net: can: Use device_get_match_data()")
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/c_can/c_can_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/can/c_can/c_can_platform.c b/drivers/net/can/c_can/c_can_platform.c
index 75607b1afd2e..b6012cd713ce 100644
--- a/drivers/net/can/c_can/c_can_platform.c
+++ b/drivers/net/can/c_can/c_can_platform.c
@@ -266,6 +266,8 @@ static int c_can_plat_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 
 	drvdata = device_get_match_data(&pdev->dev);
+	if (!drvdata)
+		return -ENODEV;
 
 	/* get the appropriate clk */
 	clk = devm_clk_get(&pdev->dev, NULL);

-- 
2.53.0


