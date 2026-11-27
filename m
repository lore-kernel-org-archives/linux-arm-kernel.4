Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C10606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJucVKip;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2h6z05l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=; b=uJucVKipX8OjtuMdKPyEZxUY7s
	ol7haDQb3rZFM0NXLhKD10enZeFkUrEBvTY0C9KhBuDx7zDzpzsJRelxhdlx1bNxFQ1T+YXYVb59m
	EdIbbmWBE9g+ZGy91bXKslDdZqIjNaBEhcileI0wuYMwgi+VyPUY9Wsc+tJ48mBpO/8NJ2iOeDAK4
	G+RFT2qyuJp3nSaM9bC6WdSIgmg5Zfh9nzZ5nljy1d4EVpx2G5yPZYFtsGc12jrWug/UqJnx2pIJz
	dLnfdkwxYQVN4G+B/mzj3uxBNy01b1r8uWZIqPJKMwjpP/n9ojRkdV+RcMB1/fjW61TfqTNwH7z9O
	Hy4081kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmUI-0000000EqaN-2XGF;
	Fri, 27 Nov 2026 03:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmU7-0000000EqUC-2lOP;
	Fri, 27 Nov 2026 03:18:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B05F41858;
	Fri, 27 Nov 2026 03:18:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749530;
	b=hMIm+hcEwRl4RWFkBKEbgiXDxPiDRhoGltlhRGfEbZf9EWazo/eXgCN8ErmZZuds6+j0
	 bbAwlzEtcrYYPHyphL/U85aM6kFdBOnB5BUUSljF5g5zOXfYPXX8RpJtijmz6vfeX7uWj
	 zr1X5MdivdS3Yt284McmE9qCxh3H45q82oGinZZMQkONvwRpyPDcN5Q2TIfjxOxt06eGy
	 FqTia/sfPlCvDPpDdHRD0LFUqWbjOnE8gOQhjZwlp369LR6BJjK8aHvhBZhvkiXbfNcf1
	 UiqGlRX0T9yd54WV800TNJ3Ieh4UMfEgMPKR0NsjtDyhBgFB26F0si/U6vEOuyl54IA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749530;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=wXWckrsGdOWUJbuzmocTQPuMgrRAh0DaKn7abUOKQUA+bjM9PIdyDnllnvguv5kgOtLD
	 9k+yaP7WjFfTfkW9tGGkHtBfJOAzplz7PfWXyw62y1f/vWl6xICEbOW7LwsXo3mLZNjzP
	 8rrgwi33L7+k4TSWVfJU/xOhITPoalEibxo7VTfMvhqYnDfxs+ATMXLX8Tx2wrXpR8Qo9
	 N7pjdZDawhcufVNoR8h6cZmK7oVj7iTw+pkkMQ2BLglM/RZyFa715znSqhUTNydqSg7Gm
	 r7W8hdo5zSzfAUYm70MZDAzG/XoVsDD67b+yyE2xE1AiupHNbMp9Kovx2QcZe22ChMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AAE31F00897;
	Fri, 27 Nov 2026 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749530;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W2h6z05ldvbJRB2y7hGWXeNyUsuMpWcZfRnnTfqT0DzLpOHlzvhVptWOA7Ck4Wqc0
	 0LivA2Uq5FmZEyH0/QDJ3mZqMIcn/CAT/o64kQoo/WpSp80xdMR4zDCGtbTNpd3NSV
	 XhYUnNJVspM9IUN1aIveBEKc9i9urVfdUHfk2uHLhXy+PITYJ520JlBsomrY79hNor
	 wzdCPeA3+7yGsn/HNDC6NmfwPwmC6TEujONRrRfFNY7x2G8OHlyE7pbLSLsfHfSOXH
	 FGWepMVKWn9zkhsJ8hQ6jnDEaXisls7KCF7sUIl1Sr2e2aDJh+pFutRTN52X1smpH4
	 iIgqIEQz0JmbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E877F4B52B;
	Fri, 27 Nov 2026 03:18:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:11:12 +0000
Subject: [PATCH v4 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-a9-ir-v4-1-666dbffa76da@amlogic.com>
References: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749517; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=5I1ELSaFehFyHsYdJeHLltTNRDgtVL2Xtw2/mhuC6l+AcAxjRlkP500vLWuobtWQP+GytdZCs
 jeoNvza+/WCBBzZxIjwq+aumAZDajvzWZVkwQcyBum5+7ElbrtmbQMD
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



