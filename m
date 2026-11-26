Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3DC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3QNFXfHb;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=GW5+0cvg;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=BV1eHqDw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=; b=3QNFXfHbUC3mqj
	19T6ubaR5NF8SM52xb8sIlEihOTSTUCSg/K4UeDiG0UY0L+NEpTkOhBl19TnTXqBzlr/ixsQSZT0i
	t526ZTNsBfSZLI1AYg+Jn5e7N+7zn6jxM6WkSgL11JK3rW3PQcpVkN3A3zE2/NxA0+C287YGWJD4Y
	KGqjk2DIZxmI0IPbw0oPXdqxjS9HWm4NUDngtKS+MPLu9YJt18q0dh01JCzisMUn5pRITZ/C6eUq2
	VDu0hAjE75jJjq1L3TIS4h6fsUh35EkOqLJJx7ON6nYpeJH6nUy6qP97OEETTm4xIGUcIY+f6/+kS
	MlSFhvpcvNEYFSNyQcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8Z-0000000EIfh-2c7N;
	Thu, 26 Nov 2026 19:28:07 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8U-0000000EIbw-2byV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795721282;
 bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=;
 b=GW5+0cvgLIM9RAhgMdKkiFDMtnbyX4Rz1LC0nq0yYzmmrYEF0tJYS8tEZx/Xp0g84OCskvWOh
 Z1gvUWybjTOkOeHvnXyhhh8Q6Sbelr2RvMmlis4L0JsY2zWUidAjZvMQ17QWcmgI042+1NGMssD
 X/+ZcYnOdUYkh7Kfv9d9aKgCe5hp0H20VLvcHg3cxh1KEOTfiBFMU5ZreovLwdNoHPJL1B01AKv
 eThm3hS1Ys6KoXde6VwB3bx4vAhluFEN+1gXZ0EMvvzWRI72f+t5D/MWsf9/1ZeVnh/A7ul3sG6
 LqdhwyqaCzNj3ViGVbm2z6WL3FmNDufgX9kxL7Xm1xZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795721282;
 bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=;
 b=BV1eHqDwwF9Wj77Dd3vklcgJS5y9s0CASjwR24Yg6fO5sRjM5DG6TujwAAUeEk26cT6HPprrf
 jwHoJJWJAK9iAdGbkOAkvw7pU0Ls6mO5NksGrWZl3XPGvFRRQNh6Us7mJSqhFk+/ktcXRn52DLz
 qP8J3rI/qk7SCVNRTuBCAcE=
CFBL-Feedback-ID: 6b088838b69a54ed847adb45:bbeec19570182d8701aa3de9ee115af1
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b088838b69a54ed847adb45
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
Date: Thu, 26 Nov 2026 19:27:44 +0000
Message-ID: <20261126192746.1595707-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126192746.1595707-1-jonas@kwiboo.se>
References: <20261126192746.1595707-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_112802_654824_CF24FEC4 
X-CRM114-Status: UNSURE (   8.56  )
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

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Remove unintended use of zero-width space in commit message
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 49c61ee985e7..38ae73e8a34c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -84,6 +84,11 @@ properties:
           - const: armsom,cm5
           - const: rockchip,rk3576
 
+      - description: ArmSoM Forge1 board
+        items:
+          - const: armsom,forge1
+          - const: rockchip,rk3506
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.56.1


