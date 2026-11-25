Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g5m0hM+i;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=W3s5i7dx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gnYPQTYFWBK1uLMVrW6FZpDAtRNAKYO1rW8iK8WK7oU=; b=g5m0hM+iMRiH6h
	othEMdyXsHQRLjb3E/AjM7N/yKyuTqIWj4PACkH1Imglc3vhnLUHVu1Nq+Nj3jnFBuNSSgjPDVrNs
	YrI3I/pbj8e+iwuJXTO/6FfMk43NjL45aldrQqomHgRBgMkoad8NEyvmMMyLd/zkoVB7tveli9MgU
	SMVxldQ5OJomctx3J2snKmjA0Ev4+Rui80MO7fLatHxRMkfXhm1mYQwQgTuBJ8EU9+fXGU96wGAgS
	x+G67jwC7+2Sj7xOFetAvzRPa8ZTJPk9lF2jhguRk0vp4KfeCEeN3wMLHW7Bln0f+kM1qf+h2TKjd
	KqN36/qwjXz+cPSMmOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMb-00000009sPI-0fzF;
	Wed, 25 Nov 2026 12:44:41 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCMQ-00000009sLj-2IgM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:44:31 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 276154C947;
	Wed, 25 Nov 2026 23:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnYPQTYFWBK1uLMVrW6FZpDAtRNAKYO1rW8iK8WK7oU=;
	b=W3s5i7dx1cqoh2yp7SL0bkYZZnsTGfH91vXY/yYDoyoRUO/Xoi6V+s3ef/ur/FWX4IVJd9
	VALDLkBF37skmf1cAS7CSDtVEfrYBKYouYJWqz1paocR1EMu3LEzr1qvRsxOFalOzkxdxY
	JRI7xGpF1VnKWdyMCAKU2Z+RBqvFjaKEMzf9UcO74CjRBIrKYC47mJrJdfie8u5M/g7QxN
	6tH/qPGRoxiOyM1p1glg4ATkR0ZegYBlN9lNUvhkPbGa/SlB1uCCxz8MtNSYAqFosYgZEh
	z6r/2Gn5zFjVBC+ZzZujN/dGhLnbbv5vE0kOAv/eNA977ijfDpvYvzxAXhPL7Q==
X-GPT-Reason: legitimate_personal_communication. The message is
	a technical software patch (Linux kernel style) regarding I2C
	bindings for Marvell/Allwinner hardware. The sender's domain (d-silva.org)
	perfectly matches the recipient's mailbox (alastair@d-silva.org),
	establishing a clear personal/professional relationship. The content
	is highly specific, non-promotional, and contains no phishing indicators,
	urgency, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/3] dt-bindings: i2c: marvell,mv64xxx-i2c: Add Allwinner A733
Date: Wed, 25 Nov 2026 23:44:06 +1100
Message-ID: <20261125124407.4098345-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125124407.4098345-1-alastair@d-silva.org>
References: <20261125124407.4098345-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_044430_739436_7C64EFAD 
X-CRM114-Status: UNSURE (   8.73  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the allwinner,sun60i-a733-i2c compatible (with the V536/A31
fallback chain) used by sun60i-a733.dtsi.

A733 uses the same mv64xxx-compatible I2C block and requires the
SoC-specific compatible for future quirks.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..2a9e723a724f 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
               - allwinner,sun55i-a523-i2c
+              - allwinner,sun60i-a733-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c
-- 
2.53.0


