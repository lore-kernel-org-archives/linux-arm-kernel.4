Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465D606A881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQYZFK5m;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dVY9LbRy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=; b=SQYZFK5m2DRFa0
	RXJCm8Y7s2Tf75LZa5yd65rQFpRuuv3XjD3zuFlcogRjtl45gh+j1kXcYE8i2fuAPrZ5r6AFHGkmZ
	bnwCTgfF/a/hj8/IYSzID8vcVALpP+2cLs1ccJiFlYQf+Ho31ko4A/M0CtK8XmeWr3DjiqRdCJGbi
	SQwlq8JiYWHQJBYIeAGYHkmwys3LoTJMukdcXxrWx09KBE0cpPir9ZI2ardpGV6NJHZy7QGxuN+sf
	dRpiMdeCVIfJZC8KWTqy3CLMkVmYbAUhNWHBWchcWsTHb7dOpw0fm782poAFvzXWsyJp8yyXbSH5v
	1H5FmKr58/TviD9ih3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6g-0000000CSvz-2J5p;
	Fri, 13 Nov 2026 11:06:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6Z-0000000CSqK-3OBM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so4092445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567962; x=1795172762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=dVY9LbRy87YKGq89aCOv3agUwgxnmQylPMGXcopVmW/olaWgGqrkNS/WoEXKTHogw3
         Jer1AcR/fzvqNs1pVyHEE4IZJ0n/So5uWWnuPxOjCNiR4UuESWPPDIZSY6tRdm7woTSu
         y+GAxoGbu00KqFGahyw0AfDWn1iMBhY+/oMa0PcIGM9mP0ytDUKFp70BzUtDD+Nt1Y6Y
         wjIxsFnP7CdcJhTT5WYs17cbklGy25Fgp7hJhRE72/E+d+B/BLzQq7TZ/w3d8S7ro4wj
         PXHIRbzK/d2uynXZfHesMjCVTGRFt22wf6ormzIYiXxYcgQyMuT7t9pntqaLBFmAIiVO
         RjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567962; x=1795172762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=qpAmg9C1OzvWT5x3uySrMa7Bv7UgJWNtu2eZgFdri2IdaSG2ArvV5Crlstam2Gm0K1
         kb6yC7c/zb6nj/dq0CjnzTcA9unViSEUcvwiaKcK/MC7cUP1QxdIYBQLc3NJx/bnGOKr
         XRFozKrERUaykpXU9sahM9+JyD+poAw2qhXzCnAS21h2e3hK9mRkA8vryU4HioMJnag8
         13bG1PbgAyLzoGprpiRf1/W4avxJKtQ7GDr7r5SXXTLaJeYUhgTV71JlRdvA65wL1c9W
         3RhV/V0bGqrhYaytMgKeqHOMOuy+SmJJlVkuE6qCW4EomwoxvT0uWeGvGl9xV+quqXaX
         o4mg==
X-Forwarded-Encrypted: i=1; AL+hErFYd4MLrknxypEvQ0PZ4wR857DLqA08s/8ly+LhHv5m+Ev+R0XeU4wAGUd/lvNii3EnDSQLXyypsq+Z5t+AuN8d@lists.infradead.org
X-Gm-Message-State: APuU4Z8cF+lM0rdbTRXUGtgtvnya+O5v4vLADG60XccQlr6MU+HRghY5
	7Sy9l8KNiEqBP6buBA1A+0pzPf3o4n7szrGQar/yG9d0Z6ok8YHm2tZmSz8oNFs97sjlHZLaSvX
	8bEnH
X-Gm-Gg: AYBFou2WhrF0mmCJ/vLrdlAKR9A2XHYlrsUBxMEbFbCYLtPt6Xec6Z38voDNyVULtnb
	xMAH3ChuIHBgr1GbIc3zUZXyBrSOROwnzOGVP478e0alhgPv/hf9uTei5OscROOt9mzd9UPmzYv
	qsS0VZa5wE5TzFtguW3+cE+hf7w0X1VyqdAaPpRng5fU0IpXv4++McmE4DiUN8O2oJsJhQG80RP
	OHK3Wo3RqqK/h5eWcI9hGUvWReWLMoSg05eSeWaIiuGt2snF2bDf7iSGlIUWmjdde2U/7O70Rq0
	ntxj20Mtj6rFko6/qBICqbfe0Uue51pO0tpBUJ8XjgzwJjyMNJBuQrhkLPR3AuJQS0Jqroe4ut2
	0+KhDGsF4Ct+KQhIz2c4mEApTt8xAs5v06nnSsY5+3JikMUoX3Gyz74Tws1OmjGuPzpAYpl5sjT
	4h43upTihGpFgu6E+EHToShJ7Jc8PPyCNMv0IhNzfrX4fhtwqMn6ko+hPpcfmDGijljT6iWLEUl
	pZD1uAXrHR84dS+kbSkdO5wKEcwUvpmNHHVMBoEHScVCCBQSXnGOH09KugQbaxeTOri5TLQV9G7
	iCvJvc7+ns1yrL6TYOX7eXFGmSJhr1+Et6VP/SMRLNXQr6IUolc=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr28918645e9.8.1794567961834;
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm399461f8f.50.2026.11.13.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:28 +0100
Subject: [PATCH v2 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-2-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030603_863122_E9AFC1A9 
X-CRM114-Status: GOOD (  10.26  )
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

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af33ddd4056b..cbe4f3b6368f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.1


