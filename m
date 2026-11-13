Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE1606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YYTMBGZL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PF3sf3oj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Date:Cc:
	To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=; b=YYTMBGZLuvN+MVlpWjhkrh0Jyt
	tM+pj4tZ7fsmyJ5SdTxt9+nDnl2Ca2g7b0NzZ8m4q72gM+vS06OBVZ8Lx59J9mIiObV87b9QjhflR
	QpGx/C8v00OnMjj0H4/I5PeuQUQIG1RMuuqaApzgw4ipmLgKivLXLotRw//8sn8l+GVbp4hrgk5dV
	nUAeqHKmnjmP+1jBrJx3/xsSQEiGEwBAhsC/oPK+KIb4BlovEbAs3d+AyQJrtqFf3smERmkAUpLBA
	abo+Glfn4AZbVTgIJIL5YYl99vh+m78oRy2Jh3R8TayAdJXPmdCfbLfcPJFaGxHZtiVKfwgB4kxaN
	5JP3+6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpfw-0000000CZ3q-1Qh2;
	Fri, 13 Nov 2026 11:42:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpfs-0000000CZ37-3y3U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:42:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso669749a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570152; x=1795174952; darn=lists.infradead.org;
        h=message-id:subject:date:cc:to:from:content-transfer-encoding
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=;
        b=PF3sf3oj3CEM3JxVoL08puGw5w1x1kNAnpWKMCarcZ2okaE7pfQPGUxdkYiuNaR/lK
         wQbVmbIvS8M7MPb2JN7jkNW1xXJwwEDgi9wAmz1tarenzi6W8+UYSKV+l+7OWl6zImR5
         6vLdbMaTixtH16hXcMZwk5/FukZcSc+12eqQgftaW6J2Px0q1TpfhNRBs29F1E9v+H8h
         cAYGPluWkHWVk9U4gqxaegMQQT07/1Dwf+9UV2NGPTWSZjm70VKJbO3slfqhdfrj4ViL
         g60NX21TbwYzE/YZsypIM/KDfS3iUbf0KJEOlQ6KZphLAwKnbGyPmqiy8jetueMF6Dl0
         rh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570152; x=1795174952;
        h=message-id:subject:date:cc:to:from:content-transfer-encoding
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GkfjZtGpjcjZtys/mwSpi5hx436XAXHBdQQU3vB4joo=;
        b=n2Lp2yOfGzm3IR2HG1J5orXXV+wjA9aHkCeAEKkCKDQFhSCDjleTPZcw3Mc0QnUyUQ
         pXCG2W6Mm9meZnTiASyu0glcGjfRNLldninF+ydnxaHniQ0BpNMZpxgNFFebBGBgb2m2
         qoC7WKySj9yAYY135hX6PCuMGPs45KjRjKrbzwszqT33Ppm879HrLUbBZq1ZD6sSpW8D
         4C5XhpN8m283mJL6NT4/TTN1GVnxP5Qt2gclWHaLxiIh2TVHz3/zICV6tXu41576WQ5k
         rAUVwQM7loxBgJXuYorVPlHfzfbxn5C2wSL5vK14EaQywdvh8lcgFhHt4BhE7WWm6pE7
         191Q==
X-Forwarded-Encrypted: i=1; AL+hErEDO8yrVkgntNiSoUH6GISOV0nDW5/3Z8SHq95swuuSJdQLS2L9MGBVgCCA7It4fztnSsIdZnhrvo6ZG/7DQVD/@lists.infradead.org
X-Gm-Message-State: APuU4Z8v9LZNq3YunorEtMPm7ZEhnYh2qKnzTIuVfVB7XX6sty/zsyk5
	YALjnLJ6n3ZnTgQru+JWXhpTDNb4GTE1wLa7oyn2i9fMbLYW3ktFQ7d2
X-Gm-Gg: AYBFou3FJ+ZfSI3JLnuC7fwVgENScfWSttKCZESyzJGKfU4AyPGYSHhsxvz56+Fi954
	WKyNPZG3cGG9ILsQIAhaf9cu9CLYAumWufpT2CU+h/0GVFwiS9BhNHikVKC5vU5c6HNqo+vofV9
	UC6htt+BXFc4YW+fZeD4ZP2uxTl781jDkVyOLatQXW+rRIO3lvI9bHmv35O+LPUB3G4tee0J87u
	ALVc/RzHKIrToJRT5CYTwMgww5CLD3b8YxHJ1bwMzukUQE/CNwgiZiHvexS7IEdeQSU942Vxu+h
	y+uJFVjJ7ykyrKxHbqU/qcpedaUqOrAlcK61eRvFUQbxcs3qOXpuSMg2qsE+oyJZmpIBSTvSGZ6
	mTAeDrTIPv73bSSSslziwPomlbjI/UCziYJ+i7BfiJT/oxYqOV5iCB+jl9f0LEDMm2Jy1Hh5KIf
	ObRL5600MQEvZZ7vqwmXVo2+mc4GR5MArH9JMLELe68guwMOTIQv0Wl29cG+SARsIYCWWv7UHJS
	nU1pm1iJXQEA0w+FNnMULr/V5QJ6WUand6WyKVSM/X1Y0GbezPTik9EcbQCjBYQoHMkH+ApIA8i
	Sp0ipe1s18xmt8nbrT/ZIQrYGgai2TTiYeSjsg==
X-Received: by 2002:a17:90b:2cc3:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3b1b0a0db9emr1816819a91.28.1794570151823;
        Fri, 13 Nov 2026 03:42:31 -0800 (PST)
Received: from [58.206.202.11] ([104.28.215.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm4347234a91.1.2026.11.13.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:42:30 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Haoran Wang <haoranwangsec@gmail.com>
To: Steen.Hegelund@microchip.com, daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 19:42:25 +0800
Subject: [PATCH net-next] net: sparx5: check DT port reg against array size
Message-ID: <179457014579.23820.10657909253312598784@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_034233_019011_FC5433F4 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Fri, 13 Nov 2026 19:42:25 +0800
Subject: [PATCH net-next] net: sparx5: check DT port reg against array size

mchp_sparx5_probe() reads the 'reg' property of each ethernet-port DT
node into portno and passes it to sparx5_create_port(), which uses it
to index the fixed-size sparx5->ports[SPX5_PORTS] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so a device tree with an out-of-range
'reg' value (runtime overlay, corrupted or attacker-controlled DTB,
kexec-supplied or bootloader-fixed-up DT) turns probe into an
out-of-bounds write, potentially far outside the allocation.

Add a range check while parsing and skip nodes with an invalid port
number.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398adf121..6616e76bd0e3 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= SPX5_PORTS) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;
--
2.43.0

