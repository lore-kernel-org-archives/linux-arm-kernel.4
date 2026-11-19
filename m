Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E7606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OlMuF/F5;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=jnavfr2K;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=S/chanQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=; b=OlMuF/F5g04yy8
	B7pWiXLdZmyDrYuLsw1X767iaLf7BXz+j+5w7M7KFTT+ZCCmFRSP64bGPOHcEgTMI1YqiUj8vZkQI
	EAkJsrYaweQyEgZVgOR66tlRRIiqbbIupcQrf+UpA4LFhrhuY4hVDFRA5/OaQucqiHZm7dfe9ZLcM
	xT5tZQwsM3CjSuiS/JCw7vGhErIHr3Furdbla8JPf+K7c+X1a6X4SG4PvEAz6Mq2MetcEbx00MGWi
	N7vmNGC4wSyefVaYkzSCbplrE87Xl1jvb+evTYMvo5kkNtqhhHER/WNLqmlJ0Enrhm6EBGPPBv6Su
	1D4qycRN4HV8Sd4u5UxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3xJ-0000000CQ2H-2uFg;
	Thu, 19 Nov 2026 15:21:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3wx-0000000CPiz-10Bd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101682;
 bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=;
 b=jnavfr2K2hgtcN7qYDtL9FL2t2Yhdq+NfusegLbp/xASq03iKq5hPCJzE8aM9DqC6cfntj03s
 3NHgjBvD1ze3m5LGqbggXcIZwjjLj/6HuQ59mst1SDfoEc9B1olkBKIBbhOwKBelH/824n0qfDI
 EEj/67b5bQohDFCwy1y0EJKK7HeBWbotq9BtiJnoIINOlGYqhvegpAkA1Zz13YqE3GeBBOpkyla
 25ra65T9PAKK2YmWRmINawN49zLSMexZwq2Hd/8hi/e29dOFEvT59+3+6AhGCBx0HeLByO4tO2l
 xK65qib4KftTp7JaBYZ4Ez9G/EdPH8yF7M2/1IE0N7qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101682;
 bh=rc9IovJCfQ61e5vbjuwikSayGXwiC9aSST6CRLHtd+4=;
 b=S/chanQNoM+mviMQrwZ2jlBHd7nQ5GT2In7SMJsGrefPsHJcz14YwVVfz4ooAIg13BowcJtob
 QaRtyOQxseSdh3a4otCy4ua4AnZ7CjmnbOPWpilZWYbrPCOWdqRB9x9f4PjuU3QYpEwBv7jzf89
 boZIlfz22u5b2teDsHvGgNg=
CFBL-Feedback-ID: 6aff13f183f3cb488062baef:3891808134843f152c0d8149263de5be
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13f183f3cb488062baef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
Date: Thu, 19 Nov 2026 15:20:50 +0000
Message-ID: <20261119152055.556266-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072123_327715_C3544A07 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.0 (--)
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

Luckfox Lyra Zero W is a compact wireless development board powered by
the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
peripheral expansion.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 651da02cfa51..49c61ee985e7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -866,6 +866,7 @@ properties:
               - luckfox,lyra
               - luckfox,lyra-plus
               - luckfox,lyra-ultra
+              - luckfox,lyra-zero-w
           - const: rockchip,rk3506
 
       - description: Lunzn FastRhino R66S / R68S
-- 
2.56.1


