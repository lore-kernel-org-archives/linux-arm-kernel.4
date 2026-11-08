Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0063E606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siexj/rX;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=mV0Ciyg8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qpOTgGmx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SxBhdvt3/eeerEg5f6ojJgesCn4pQWjwm05oda2BD8o=; b=siexj/rXvUcgA7
	kH3KHaC1Fn/mu84afxTKuXRJ/CRoV5dmMQIYtbnkcZoFjmBBNJ+wNVRHlLxl+Fpzb1E4U7MG/YRva
	c1AwhQG2Y7Mmh24cgojBLFnOSaBai/SLyvTFeUIg17jdEGRwML6kKLyHwICrriJgnyl/bCKGynnF6
	iFjuvwQo2IfYVhOCZd/oGQ0bNVI2ibprHnGmeI/ofEb2FoEO+yMtTU75GjhU4nVO3AQrILGwWTJmg
	ZwUJWCbB0waX2PJEB2akAJyMLWI/Kmw/ykJdIXQywBKXyw1AtMMPh5WbJbTYdKdhVdB4U4bN3Bz1U
	Vb+V5TwyGDm2a5CJOteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nT-0000000GFIP-353K;
	Sun, 08 Nov 2026 14:23:03 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nL-0000000GFEj-3fab
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:22:58 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 05E75140012D
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 09:22:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 08 Nov 2026 09:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794147774;
	 x=1794234174; bh=SxBhdvt3/eeerEg5f6ojJgesCn4pQWjwm05oda2BD8o=; b=
	mV0Ciyg8eg/KgJroi+v+WBtZYDdX8DiurvCsKyQdvA/d+KxJfxTlgXlvytcLnZe7
	AJXaTHSI1XRyMon2iKP4J25fW3y0w2dpbX1wrLg/IUXwgjwBtdZwnonP0pAU6dxs
	cupLEyEinHW+8DH2DlTHxfitTlFpKFzUt6xGls3KPCPUfbOEobdpLJaPzLN/9zol
	jfTUZ4UbZuusaNRPe0ljCGVkAzpX9RpyXEn71+MRWGkSxzHAuY9VY99aGDVNyR7p
	1rmH95/s4+mRCtn8gVbfhH+FrAV5+ICdfIvD3u8RpAktkscauNDuV7tUeglcO2TO
	YGJSHF5qv6DSARXC0GAcfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794147774; x=
	1794234174; bh=SxBhdvt3/eeerEg5f6ojJgesCn4pQWjwm05oda2BD8o=; b=q
	pOTgGmxSGldvn2y0/sQV+07FYJz8B2qxVbmZJ3wYQZ/bG1WWn4DKqGnjGfxxhPgC
	0ov91W+NRXAvrKZaF0wWJmDp9Bzg+c41ms4bwJR3KuJne/lDb2O2rfUrjV1IjLBT
	VpWNpZXQunucGWGcngpzPbRl4D5aCwKzNwyrS8DmBIQdHSLcUe8qBWYS8l4xqKCj
	IEuxIJvavyk2/cFEWmkgxzwS7YwuOyZ+GP3oeB2JJbpwEW4Ssrgye+AYdkl7oc8G
	oHOXHoV7s2jTFNH3/Hin6OcovaSBfOCmCLpraAUVod2OLbBpqX5MJnDyCzaMoV2C
	+ldKSxt1V+RtsCIlQlgyw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794147774; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:lcrWbNSyHFrf2kJP6nEhsX1H4b9DWoB/0QDFFE8pvjBORmk
	z2rew/g+HoCxxifOAyVu7SnI0sDZavrzjSLb2THTrtTbW8eWc92YqjwZgnoXgfrK
	NVG3VtPiESoLOuSuOX7jGBaJcQARyZx8b1N5kDoi2k8CrOzl2S8EZBbWGeuJwVGH
	kSvPUQIJRvg/WmOVyVgvSGy+14OTH5h+C782HMvIW1F6YgZzuspubhWNhXOETREG
	ctISRq53WLaj9J2A/DzsYoLxRIbwrDm9iReQE4r0FnmHibVlsYxUDv+Kx1ULZVbX
	iOsyNNpRzvLISpmnDiNsgMCZ0js95mS6/rI1lpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LqiGbhzvV/5wHY++2IHN2VcOrs5T3DYfqW2xXfxsbxI=:ysfuKteBBK3BrJYrQIb9r0AKuLdd060EUuL2t+e9shQ=;
X-ME-Sender: <xms:voXwakUbeaEDuGHwcZw7ZhFp1mMMWsZ0J31FfYoQs9p2raIS1U5dAA>
    <xme:voXwap8xx-pJ3SdPIhCHvSqMqVDOJ1oJmEzpsrSk6t5RhAYnnvyk-PmIuRvyd4eGT
    Np3U_6vgtZEi6lb1Cr0YVw5OW7QpkVVWD79vW9rIHfIpO2eYhdVpHc>
X-ME-Received: <xmr:voXwahq6rynjK1-zJ3w-ncuecVxQhCOzUSC6PQNoe0XrgJCXLlsqLzeYRn667KjsF_nqMCicBAAvBM7cBBr2ZYzKN53tN9Wtst4>
X-ME-Proxy-Cause: dmFkZTGo3CfmNkGVcoCqQm+2xF5BgQTQHLEob89QGgMg/fmpPsx9Ba22YEWDsCMCAsJVht
    iPMwYglQfWngG0EQiTCIk1j//mHbmcbWVDR0k5U/uGGvuPWIdI5VF0QmVDi2K9omMvQXse
    1SsImkgs2/+NnGnQwBHgKzDKk3rdaZCpy9lOm/CBgsoPRaB2SL90jN/DpplvLkjqri7DRF
    34GZFZT6mx2KG6dtb3J1oKeeuxv77VarACJ5K9flwFuG4XW+zRuJ4up6S+R6m6RCgUFeXK
    suuZS7ohMrlLQBXad0P686p3sxTyrb8JLChbCEM521ZgNKvK+lIcmDaAFt7tO6sNGMYckN
    rvrJsI9LRFl515cpEds7Ss+uhqdKn2okNVzRDH0E1zSLFLuVyGYZXerw+/5cQOzHgVuY1g
    uVcRHL5a34vXKahVXYAqlh/+JKJil5Me/JVezsQrgh+mGNmqzwUMEcE6ZqBmWNapPw9NOQ
    4xRZu0026ChhypY2dSNV1JN2hYS2u8x1JzwhZtWiu3BxIYkXgDgcldkrmR8zg8YK1Wml0r
    eNdk5cHz7noWTS3dwMfDzAY6MtbKFBpNy2hRXdReTDF96dcfL4SG0qJCKKD38ncXPirnNi
    RFzpusk0VqGZ5mreOhhlbyD7Y8acFGCcpFz5EIepmEb+Gjsss5XEIHgN7nxg
X-ME-Proxy: <xmx:voXwarlP9MAvdmLHF70XscswxpNb-xCh7UWYSVjd3ciUJ1xqumu_NQ>
    <xmx:voXwalYx2KkA8f3n7yACTimpGmkcWMPC7V5Lyp__HUW6j-b8fezhzw>
    <xmx:voXwajWji7EnxAPsDV7GkNM6guXnsOiv6YrHa77pGaTW1yqLg0wp5g>
    <xmx:voXwatBt4SmDtepLr65PG24pp5HsNgka7ztdmwCI1VX-kY8jn7UOLA>
    <xmx:voXwasWAlz73OB2LcAKYJg5li_C5wlzHy_bWMciLaZ2psQViqVST0bYE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:22:53 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 08 Nov 2026 15:22:36 +0100
Subject: [PATCH v2 2/7] dt-bindings: PCI: apple,pcie: Add M3 generation
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-apple-m3-pcie-v2-2-0e5ffec71da4@jannau.net>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
In-Reply-To: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=j@jannau.net;
 h=from:subject:message-id; bh=ysfuKteBBK3BrJYrQIb9r0AKuLdd060EUuL2t+e9shQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPrVvObfxnF7zLc5rK546ZIfYd8cJyGeITcmYETz597
 vTSt33rOiayMIhxMViKKbIkab/sYFhdoxhT+yAMZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKneps3wTzmn/a3TBtHf/zROH320L4u5Y+rCtYbysj8r4rqOZujo/mX4p8PGIHT
 o32MxlZVOVU9Sa+RTlq/SnRxYLDBn2qzbkUcv8wIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_062255_989109_8523C094 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCIe controller on Apple M3, M3 Pro, Max and Ultra SoCs are
compatible with the one on M2 Pro and Max. Add their per SoC compatibles
"apple,t8122-pcie" (M3), "apple,t6030-pcie" (M3 Pro) and
"apple,t6031-pcie" (M3 Max/Ultra) to the bindings.

Signed-off-by: Janne Grunau <j@jannau.net>

---
Changes in v2:
- modified subject line
---
 Documentation/devicetree/bindings/pci/apple,pcie.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index c0852be04f6d..a40b5d5b9a5b 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -41,6 +41,12 @@ properties:
               - apple,t8112-pcie
               - apple,t6000-pcie
           - const: apple,pcie
+      - items:
+          - enum:
+              - apple,t6030-pcie
+              - apple,t6031-pcie
+              - apple,t8122-pcie
+          - const: apple,t6020-pcie
       - const: apple,t6020-pcie
 
   reg:

-- 
2.56.0


