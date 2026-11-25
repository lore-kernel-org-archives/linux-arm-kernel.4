Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nFst7Ghf;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=CTd08Z+F;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eM19iAYd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=; b=nFst7Ghf97tEbh
	/N3IrjAikPL0Wja0N7sfsrsr80qJ8hPtPnCqbEwsa82iZDdqKVPITF7DEz4RsBrIL6X9YNLzt1wKf
	f+HwPY21MsF4engX1qakFBvhRw5OMMgRqTantI+/JhcwevmSuvoo/yLjL28R74WJh6Ibs8ucXaCH7
	ivTI2lZIqFADjqi/t5/TKsBvdukTsakR3ScqqTrmWmd+Myb4sf7ZPXPQGWZwbUd+SvNWomLTlnfNg
	hSMWOdfzu9E6u6uZes0ZjTusMBeg6qs/nH8emMQrK86LbDJyYI7d7I5pMWTsBhLFEiBSQPWn88nun
	auuF3cPKagdD3NhZeZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKnB-0000000BOIW-2mxa;
	Wed, 25 Nov 2026 21:44:41 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKn5-0000000BOGD-45Ye
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643075;
 bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=;
 b=CTd08Z+Fs7APYhvlpd55Xl4k0d8sYFFmgKLRWt9eHgjKKgpmiUKtRybDUt8BYX6ptCk0qZRG+
 hFe7w5GZaH4AY7Wv6SRNlZ5gLA+3pPZLZOV4EK2fd6biUafc49KnNp17cmEQQVpatMh/S6Ovyuf
 bjS+oEDKuqxorSHfGx4i93xZ2aJC/G4g1DgMoKsjIQJD/9YNL0XxT4i/Vzh+9rRwza4yFD23U+A
 JO911xY/Fvyw+jEAfP/248ZOJUMtJGO8zauvdC2Hg23EYwRRmkYYrEdlcuycekbLGkbQAyKF7Op
 ki1eNIFYe741o23xs+B6kqsjefeoZ0G/F7lrY2eIQhkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643075;
 bh=xDax2k9eB8zfhF2fVPSL/iize1OKzF/z97ykVMEg9/A=;
 b=eM19iAYdU7qNDKsLYgURH89I0FjakWO4l7QOdMhIUSNsDOtx6eqSZiVBpTNZrW6fCghoGsTnX
 0D7ZFEeJUqOFNHth+pDZAQW7MoXxpmDrGKpSoVJ+ZzimYKQE6cYrlH5ZAhLkvIjAs1dKKKbp5hn
 0bgLLwAKXOoXjUWrrURCXXE=
CFBL-Feedback-ID: 6b0756bff930f38bf754f94a:26eca1fa36b2a9f48f4c53d40e9a50c2
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756bff930f38bf754f94a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
Date: Wed, 25 Nov 2026 21:44:13 +0000
Message-ID: <20261125214421.1580359-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_134436_232283_EC7F689F 
X-CRM114-Status: UNSURE (   8.50  )
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

Add the GRF and IOC compatible strings for the Rockchip RK3506 SoC.

Table 1-1 RK3506 Address Mapping in TRM for RK3506 contains following
related entries:

  Module		Address		Size
  GRF			0xFF288000	16KB
  GPIO2/3/4_IOC		0xFF4D8000	32KB
  GPIO1_IOC		0xFF660000	64KB
  GRF_CORE		0xFF840000	16KB
  GRF_PMU/RMIO		0xFF910000	16KB
  GPIO0_IOC		0xFF950000	64KB

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Collect a-b tag
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7c138..3c1c3dc1b84d 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,9 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3506-ioc0
+              - rockchip,rk3506-ioc1
+              - rockchip,rk3506-ioc234
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
@@ -93,6 +96,9 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3506-core-grf
+              - rockchip,rk3506-grf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
-- 
2.56.1


