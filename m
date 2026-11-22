Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA5606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cLu9E0lq;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=MiQ4aTH4;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=oak+hHfn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=; b=cLu9E0lqQR29RS
	2Q8cMVBPz/K8rlgieum4ZT4w0MpfrvS6tlWhEfH/Jss/A6XXqmRfElHj+9wScmmpEcebLyiZoDno0
	SbD+c2KvVL+Kw1Ui2KYbf9HVVys1Z/z+H0qVpeRNklf/QujiUDO06/7C3K9BB147MupcTF7pij+6s
	QvAkgT8RRg427kkDMtYDRY2cwpYGz2GSqOqRQoJlC8evYDrfuPvzgjEQsUveKe4o0imhlWIZw/C2/
	gougTKr1VWFLpUb/jxHlSdbVgMeLuHfRagnqOQO9xKVNlYtF3JThEKRGk8EdI/EnkLK7jcm73abdy
	+7ukD2zMslvwLE70vQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0eU-00000000lrz-1BiQ;
	Sun, 22 Nov 2026 06:02:14 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dr-00000000lKf-2vDR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327294;
 bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=;
 b=MiQ4aTH4K8yedUF5p/c2XT8YgJbnxG+REh5yvZD31bts0Sh12VNkWEUDrxRASzaa0h8pquZ04
 Fm9+yoZ3nqQLTHzGxgnzHQQ/BhinhISKC7xltMMQMrfDDnOQ2lC4lWBuPNgZDhshilBRqAeTQ7j
 qjy5kZrIYxY3rBVwJQGp2C3d95Q+g2MtpvapXicrWVWRxMXs68eGFuFahJXFA/DWzqHVx8b/UZ+
 V1YyhCvN9SWrojQ02nEj10wVWgSis17/inWoqrMTAaw9tYuTAm++5B4wtaJ2GlUV106VRSNLW10
 Kfltl/ESWj4QQXoY1B2foiB7aokQx3qrog8loUZWWcCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327294;
 bh=I4XSnmsKc9vd0wX2hVPb8MU2OP+otyYxWmumfz9b1L0=;
 b=oak+hHfndNP0o3UcQA3pMn4LN3bT6sPUc52aBuMmf/qsRd13IGCeBktMW1OH3yoSqMvbWVMNW
 PA7IbvOnKhxvEdi3KhaIZEJ0A5ufGuXdzOJweZP23qdM73TOD3jTSW0f/hH2HnWPvb5WvRtYYpO
 h6Dj5W06hmwKAwheXb3bgDo=
CFBL-Feedback-ID: 6b02853ecff95ecda8c093dc:65d2438357532dd46d95d8c19b5661cc
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02853ecff95ecda8c093dc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.37
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
Subject: [PATCH v2 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
Date: Sun, 22 Nov 2026 06:01:10 +0000
Message-ID: <20261122060114.773624-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220135_859625_17D4313A 
X-CRM114-Status: UNSURE (   9.16  )
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
Changes in v2:
- No change

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


