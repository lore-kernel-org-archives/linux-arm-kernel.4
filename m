Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73431606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q7Rfbn7T;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb5D+GeS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=; b=Q7Rfbn7TCjyK2+OSFEKFLLBvDZ
	mGmCtmnXzfCDgzT6FRC37myVqS0sQe5h5PXDxfJ3KygB3m7SWQOx4MTwdolTVYLSNNrF8VtcqEkTX
	oTE9tHj5nHRTCZfE10vZQVmshX31kFESvPlLJzgpjlXMuCn3MmBn/SRKz6xgopp4USrp+eO4Hhyxs
	isyPHbsDEYbBuem1c1369DBrIsnvrkeMUFhljMYB2A3PEu93IVSyUy7oTRReLW9ZC0QxpCazqJSPx
	428A9vRjOgNXC/tiGtRqqU+0z1wFKtwD3r8JcR+jAcaFVLJkf0O3//tLQOTS4cBsoHRENiIGBI87b
	6+Hxv1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPVAk-0000000E0Sm-0s0C;
	Sat, 07 Nov 2026 01:24:46 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPVAf-0000000E0Rn-1Bx1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 01:24:42 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1359803eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 17:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794014680; x=1794619480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=jb5D+GeS7f1N7rHknnQnbe67jhjDgNA0ZXLRRmP3xk/u2L1rizguZNNXDH6ASL52n7
         J0ohRDutd1CmHUVBT7UGBS2BLzOyY4SMoTA9g0oBLhWDRaxbuBEeQO7c6qvzKHhD/J/j
         B7CsaImaGTVjVqUXgOIUT1pwjxVBewH0rugL1jRsZPhhFpEjHk6I3WUVGJZIkjQwUQec
         nqKjHR0PaPK64pGkSbbfOhHKXnbzlKJAGkhcvWN8fy4t+7dkzpgiSTpHALDinviAtgBY
         WWd+W5EDLBHuZ3ggIJ5Xoavg4tJIHs8dbQPyytZ1W1Cd7uZJfbaEVm+3jtbhO+dnigK5
         AxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794014680; x=1794619480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=x5yauIgYJhXTEGP355Pz/oK76dWI09XX1M9+moYCaP6Onl4e8Dt8+cgKlQHLihItdK
         ttUZ9hIERpQ3lN85chBHLhV1YJUSLpkkornMOjmB1F5II/DNGPNWe+/PL1qboX3YvWun
         0gqpQGMbcyVwputrtSEFRblTsfhVJcgb7ZGIBye4OmJVD/HFw9Z8I+v1oBvuvvNldklh
         rIZqUQu2Fvy6IsOHkLewoR5F2WoeXYxbmWAEgiYxFA1yRq0P0AVe6GgF3BijuFUAM27Z
         ZugNXLfqrRrrsmsW1GaE7Jmo7n9LuGP5OQibhS5AX2dUPt9TdtqLlNI/gsclfinE+rB6
         kH7w==
X-Forwarded-Encrypted: i=1; AKwUvBzkfrErh3ADSCbMMXgKNhr1HsF8YhuR5+MYmhwt/nU9D5qhilkwal9OYmNXHcYi23sF/USTmxeYvaxJh04MT/5T@lists.infradead.org
X-Gm-Message-State: APuU4Z9MP7saCPl4QE+9oT3aoOw89YI0+eNXT2qFlHu/Ole2Dx2bDGsw
	Me1QrRdhGpofquWNMQx4Al5ZNn3IYzWNWg1aI4nfGWMd3DQ0CKb3QDOV
X-Gm-Gg: AYBFou1LXoUyt+0V1uzTEI5X3FQD4eKshArtPNL2yiDJ3F7tKeSmwQ4aQMw3Q+9kEjv
	DibrVBetF/gL9heNPgBCXX+W1G0OX5oNTLP9YNMRjO0DmyukPyR/nKwKF+r2RGf1AKCHL5jxgmI
	qQdxTQD0AnrVS83iDDECEVSWHho14gXMI7kc+A0RD8uWCddLxUfAZFJWkxieFgt4eHspCOJdwcj
	11aNGfGRSZu0uazpCjXYz9xH/nxXA64tl5MBXQWiOjZSf2mja2yw9M4IVng+EMgAQsf4JloJUSV
	EXPnSMaBLRuOaMU4GyOQUAzjPMUYcqKrhr7Kul3UBr+JbRcwp4ZIWomEdmWiUAOOgiNnZ7piXGx
	B8bUQMSjjadv3P9FebgPw80kyW2DTZKgjkRvHr5lA/395sRi9zVE/fG9MGcpEDmRfhUIXG5BwVI
	MCHxvqfRQ6ElPnMSTxClz40Jjr37Ed9qL+VveNj/DBvf7vYbmpzGVhGO7pN3IJ5q2sGRUQ7CdBT
	OKTYPztzVOJ2C+61ma9z9Ppyk6XmGo5CLZYs7Xr+8EIZ4Tqg0FwYbofXJythVBnlS65IcVYbIl6
	4ytZGG54XdDcO7lcYfZfXB67V1wJXinfZG1fr98ktExbYg==
X-Received: by 2002:a05:701b:2905:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b25d3190eemr4699302c88.19.1794014680193;
        Fri, 06 Nov 2026 17:24:40 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm8436986c88.8.2026.11.06.17.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:24:39 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
Date: Sat,  7 Nov 2026 06:52:36 +0530
Message-ID: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_172441_465641_A9319319 
X-CRM114-Status: GOOD (  11.02  )
X-Spam-Score: -1.9 (-)
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3


