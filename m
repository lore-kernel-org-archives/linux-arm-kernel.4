Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DAA606A8BA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nA89FkUp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtxzRd2x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=; b=nA89FkUpT4OeyR
	EkGZALo19UzvJWJkoBPPnNfNyWBKVKD92F43If85oPaGsqTHORO4uTs5YgikiLg9bGfR7JlQx0Cha
	n+9DplUOpdI7Wt4nh5bKJMeHhjHD/bNeo3p3KLKuzV3jM4uVukv5WOuTfFASVYG+Iyf7vx3Jzy7XC
	X2emXDTU7VTPrPitTT+t02yvzW9xBARL9zjvuA/b2QDyw9I5Dyh03N7V0v1W1yUUOX0IWGW7eTC1R
	9C9Pu4lLPNpQenM2NZOeDgwqs9Xn4Xk5Pq9Yha81T0hTGsVqXhqPbHhYUNQIO81pahSz6Sc5LCtg9
	f86+obq8jv2TS8lHYjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwP-0000000AI42-060L;
	Thu, 12 Nov 2026 14:38:17 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwL-0000000AI2J-1TlU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:38:16 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7d2dc9a7b52so2421004137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494292; x=1795099092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=NtxzRd2x9efeCUZKUMRn1z63tFdUvo4k1Xd7rrRp4XkKJLNTcTftdWYqUDu1Sx5oa0
         56Pyk8ZJV5/xGEow+N7B4dmF8HUu2rMlSwzbyGHYytD7Tuhg4VqBsbQjeMvLZGDVE31Y
         ZQwbAjB3qxMLCgg+QRc2resCiqo2jcDWIuj15ChZcKErSz3fAeWRSBE0ZDnUPvKHUCvD
         5MUPch+YbNEgTfxrS+H+KN2DXfvKYKNYjSnB85rqbJOVO88+nGcOaSbhAfWDYGTMBOZn
         RAu+sH03w/EVBt8nrnn+gxfvjStR3/D2kec2YBZqJnHTIxHSndGACOn1cw23n7rfzbUo
         S2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494292; x=1795099092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=MjEg0/z34/OkRJuLMglSIDkKUJCUBLABTrq0Q3v6RdgiPSRybu12ridUT6QESvBa1Q
         tdp7Nq2haP5oKBLNDA3epxHL5oq2gcepp7vR0KqACUHkI1Pm0ClyCeg8ukJqPGDEmoj0
         427MqcnD3DhBYfSzwuc2xl5Wq3QcoJXtXlX3m4irdmkIS2V5xJ2Dy4fz3XwXgsFlCIT5
         +njnwik2yFnP5Dp2BAjncRINiObiE8r/0GcOeyjq0DpA+Ccq+TSPqUwm3k0+Qi2EzM5x
         iptCI38YyCqeDmN8exEWMUwL/39U1E0Q6cKfnBj87s7eGDi02F94FvHY4EpQfnnXp+9y
         x4oA==
X-Forwarded-Encrypted: i=1; AL+hErEl0Rfx4tbEAXsYGswm/lBvCtetdu03FDe9kn4wicbzgUAWwVatsAHuWjAFnXInr55e/U0TeHACUg7VIjevF72t@lists.infradead.org
X-Gm-Message-State: APuU4Z8I9CVcb6p4Uc5w3Tew6MX5v0CJkyL4ip97Ybd7E6UNFI27DeBv
	g+uOXJbSYIkp8HfLMDI5NgNx3etUp28ptfTJLAhu1H1MpCvyTMRokxDU
X-Gm-Gg: AYBFou2FcLdANdp6d95L4VCzu2NXeSs9bjZzcqnUb74u63/uUl0KFvUHu2fJSD8XNpH
	EpmkWzn8VfvSDGfsX/e0EwAfH1GUYlNLrGY2Ja2aXh9mgAg22+1zfCy4aKKiLcsE8MlayUYFxY1
	519s8Zy4NSvfemOM7JKN/gkcxyKko+yRfbJB7yjyRNxQSmbvscAGArtw29XGfbTcVLU0Q7wsg/+
	fAdb9YMYbGNIuzG8KZMwAXLpLe4pZn3kbWQr0PwJs0SR7gxyPYG+oLHA1PqVDNZV8Jz6kUyF7PV
	5Rhya0gkngdHCjUAfUeo0A/P51VBB1Zz3bKaktWPjgVHYO9zGCsCmKuaDidCJZpXgFmiQ0yB6PB
	cwrOHCJK0yhVkzBaSExAOhDETHvZVeQja+0m2jMMIWLldjO7zQ9QxjHipvFblC0Djne4OZJ0je6
	SVTkn3nczUfvVN4Z9UNdDN06HXRBzFKtsV+MGhxAFt9Q29CmJnCDJSw7CjGFU+lw4pM2deRxr/a
	RN1oxfjSiay1C+AEtcaCEeAzXXHJ1lZdWTKTUq0ZDWct2dtsFyfH8+j4w5tCLQEBxqQ8WLXf4oD
	iKCU5+pqb1dH/iEkXycHgM9A5C5PHxX65gWkkrJ+0MRRmV/cychlwaQ=
X-Received: by 2002:a05:6102:50a0:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d5060e8bdamr2572164137.28.1794494291617;
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:33 -0300
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=979;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=w8xV5uoMa8cD2NlGBmwvt8C0f0XkYqYIH4XfKMrB858=;
 b=fGueRKxvIo0asCUZ/33z0mlbmgMfn6W3MWKV8yD/ZkS8nSzPp6aaqZlzCeST6DLUIrWLorE9q
 OB3V6+2IU4QAr5am7I8Qmrf8KBbMoeyEU8gkWEXU6B/a5GtEeX6VV9z
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063813_473027_4E84DB21 
X-CRM114-Status: UNSURE (   9.14  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonardo Costa <leonardo.costa@toradex.com>

Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b6..392e019e7ffc8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,6 +1607,7 @@ properties:
           - enum:
               - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
               - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+              - toradex,aquila-imx95-lotus  # Aquila iMX95 Module on Lotus Board
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 

-- 
2.43.0


