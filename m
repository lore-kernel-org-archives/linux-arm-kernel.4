Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03298606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5lNezO1;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=mtZvP3Ly;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=PriZYvaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=; b=k5lNezO1adKQbr
	yCdoaFUFYhr/8/3vEi26Ks3ExpwYrVbWmLc6muQ+Hf7ZkJeGMZBpKmrMik7JRxMvhiLwf/KXGVdGY
	CU/byengO30QizmFQGZu9SraMYvQ2aKhAsgsdvoHgaXWrFcm+OU5TEbDNEIOqEnrxqEiJRPH52Ud3
	STqMssB/QCctVrCED5isPokpIgB8Jz3XzJod2FZ4MDjb+l1SDO/+sbCA1ieoXPKIgVmU2AXrcARJa
	Yj9VsjWknbfMtM9nsMRUFmxxGmDIAjWGYnAAHb72upOt6HKjQ6PirXFoOB/Ihg8XdY9S3rhkGyPQ3
	KeTbASLNOqlmDUNwxeBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12S-0000000Bola-0uPr;
	Thu, 19 Nov 2026 12:14:52 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12N-0000000BojH-05Dz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795090486;
 bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=;
 b=mtZvP3LywoTs7iVbx/6+6JfzbLIjVc6jcmFhG2EGODsdVu39wkfYkjj0RbGsDHb2+DpVq4Gpc
 UWaLiLVT1MB0UERZN1MHwOX7tkCnYr2Chxml5yrvzlXk9aicVoFsbWVWwbUnOdk1Vhfyo9s94lg
 uQnUvlWsJqjg41YFinWbwspCUl78f/PkOEp/s0zSktapO/hdB0TfGhmoKEpKaso/SIaS/zoGm1C
 LKo84dCDvjxRsJWPLZAb7gFfowE/S6wDiMcv3rKfk5sN9tJ1QRP0hW2zlSfKoqBgikuiUnp8E3s
 4vs7tbg0elGNTwGCJEv84VM1A6pDabADgy0bqL+n7/mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795090486;
 bh=wytq4v1yoNl2lNxNKZUWQLMKNWC9LRDCwAsV3MchUXY=;
 b=PriZYvaQo/RG7HI/tbMsYlR2F7jZl+F3hSZKGGvXq2YRrjfHvGyxEiaL8yMYTnmAA6Rh7rUip
 yGPCwvlEj9/CkmtRaS7R6OQoWjWPuZKSjx8YHVIc6BE0cmIdY5kltRIYOlMlUMnpzj04BKQQQrT
 mQ0RSKbfqtRkjPMuLZF20q4=
CFBL-Feedback-ID: 6afee835d37bc4966df160f3:48c077aad09a957449f716d8faf09bff
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee835d37bc4966df160f3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi NEO3 Plus
Date: Thu, 19 Nov 2026 12:14:31 +0000
Message-ID: <20261119121433.550704-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119121433.550704-1-jonas@kwiboo.se>
References: <20261119121433.550704-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041447_106801_C4D73FD7 
X-CRM114-Status: UNSURE (   8.60  )
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

The NanoPi NEO3 Plus is a compact headless SBC based on the Rockchip
RK3528A SoC. It shares its base devicetree with the NanoPi R28S and
Zero2.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 01a13aaf3e8f..a5eec2ecf23c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -361,6 +361,7 @@ properties:
       - description: FriendlyElec NanoPi RK3528 series boards
         items:
           - enum:
+              - friendlyarm,nanopi-neo3-plus
               - friendlyarm,nanopi-r28s
               - friendlyarm,nanopi-zero2
           - const: rockchip,rk3528
-- 
2.56.1


