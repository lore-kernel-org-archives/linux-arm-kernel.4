Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A1606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKa7MxGu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn0Ccn88
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JLHMNIGX8tDW4EPIddI7SD0KvLCdeVVUDiw+ZKX10Wk=; b=HKa7MxGu4jPpaa
	bwCFx/acvSOi+plPygwaiPSpIsP+S8v9USbiThtQ869B7dRz+ta7Cm+002pd5NKB/mdzHnZOs5WNv
	pllsMX5SBIlTIvjdioPzF4/CvMJMgk7s/+nuBAZlNWU604quTcQZ69P/lPRE1XrBJF03G0vaKysmb
	8PkGXPWVq5dANz9o1pNrCavQIL3x/R20gFLf1+2sbd4Ea82129qPsv2aXYj5+C9Dazk+TaSRRE2zW
	5kdskB10Ka8sBkOh7M5BW99EgGALMTsoxPvqEZL2cxNMrgr0MQATuOVBsBVeoGeXzy4BCB+dY9XPr
	H3LXMdxkUxjGWL59l7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBd-00000007XjZ-2am0;
	Wed, 11 Nov 2026 19:40:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBM-00000007XVw-431G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEA2B41209;
	Wed, 11 Nov 2026 19:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3209A1F00A09;
	Wed, 11 Nov 2026 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426032;
	bh=JLHMNIGX8tDW4EPIddI7SD0KvLCdeVVUDiw+ZKX10Wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tn0Ccn88e/tw8YiYx6XcN3fnJM2YLTmRibl4bwr3mJ+4ZJwX+3Vh2+1EBk/06AMvB
	 TU+WFLUwJbywyTwut6ysrR4ALBALhN9DWMIE1kQCAilAIPbiBjwGTrDZkGF8WwP6Z1
	 L+9xEyxc0de1cBcLXKJNDeqpumsYsJPMRIahEuZQsmlBjGI6FeYKT4PJkgbu8olgYJ
	 PB7YR0E9PvHx7BZoTl3+eGzgme03RvS9ngDvZspfGoCiIm3/O75ydAeXvWgw5NBFXi
	 Jn4zLfUjDmPDl/uFflUbk6baUFZnP5zpp5/qZ1qeaoAxf9ObO5soB49TX+ZqCqa1Kj
	 y09RLybBG5wtQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:15 -0600
Subject: [PATCH 05/12] arm64: dts: hisilicon: Drop HiKey DSI endpoint
 unit-address
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-5-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Rename the DSI output child from endpoint@0 to endpoint because the
node has no reg property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 5f31569cf494..25ff7d7dc176 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -300,7 +300,7 @@ ports {
 		port@1 {
 			reg = <1>;
 
-			dsi_out0: endpoint@0 {
+			dsi_out0: endpoint {
 				remote-endpoint = <&adv7533_in>;
 			};
 		};

-- 
2.53.0


