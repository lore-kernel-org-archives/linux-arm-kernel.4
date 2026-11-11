Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B5606C14F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pxBUkRPX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po17BGze
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=; b=pxBUkRPXS/gC4T
	diMjK/EiUoiFaoyaZe0gkKci7xC69jSA0i/8NhyAHQEubCcWWgUlc95/+GjF+bcbw11i7JfkuxaP5
	tjXwhQvny8RPVPk92btO9d8jeqOgjRB7Pf+Dt1w6cM9jjjj30pD1GLC+cEiTPxEtluVZNLd7Pg/pG
	idyT5KuKhJvlVcFG6JRwfbgn2feSaDtU+mBDMVM3eLPu1Ba8VKPsm+KXaoq9RgHTZ4D+tjhwO5Qn4
	lrzHWqRGaM1EGVfbJVupo9P8+vaBECiFCPsgE4J5GsdegpQNDJ2KX5TqyxaCTY0mTHYo1hZdRycTN
	bwcFaAMfCLiXmEfvNYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvZ-00000007OBL-2WwL;
	Wed, 11 Nov 2026 18:20:09 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvS-00000007O6Y-1WLd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:03 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-853d57a81easo781609a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421201; x=1795026001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=Po17BGzev8Tugnr3GhBI4yTWhQn/JvsXTLNHAYs7vO6DeUX04YGoarmXfVaw8/Gb0k
         LkXCDqPYCPJ98rHCl2ml58TSm6cTgttD3P24wNyk8Pyp/zB+QqUoelP0hJ6vxmNd+5GF
         E+MMxRL7xBMZo9JMjWCYtjuK24Q0WznxQie4J+wqFpyk9Xx/79bYey7CCDdpQuD8Uyuy
         r2PX7F0S8p8gQuoWlLStGFhlUlQPzls4kynnJBAFvS8va72hu3Lq4ehjeoW+ibjFn6xB
         2/4axroTSG3olviCLTbihvltbYuhgNjreqtYhwcsX5R+ZNC9wexjnApCuc79LgVY8CQf
         PsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421201; x=1795026001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=ulN3FwT6NPHnm7iedEzGBFCoqQGc9nx073mW6wTpxINVq+ZhUGfBNTPX4tuzNu6ORX
         rzaY99JEdtPsidliz3zgZo6KXQtnC2weJY/VThUZWf6yE2w9PUH/xrs9uKC+MLS5Ptq9
         mEJaUoarFr5xFxu7QLZ7GyBLkA6xhfIIXeCcQrMyqvxq8yUzS8FTjL1Xl9gGIbx8r6nx
         2EsXhhgukOrDWsw9gADXQmJSVHtf2y2h2n3XQf1CMUcUUWFRYkAGAONYccdCmtXXEOhe
         RdW3zU+i42IzgujEmvTKRSj2uwgIPS9sZmpwjr5OOwm5uydRqLRPqkuS3NL+tr8qcMls
         q4hg==
X-Forwarded-Encrypted: i=1; AL+hErFghmF7mCrG9030FstPAyoxHJFq2OohJ9lX15eeKpCiLp0Rhx9G0qoi6fIchaIFIo+HRMEdfSDDjTA+7NVBTiIa@lists.infradead.org
X-Gm-Message-State: APuU4Z9mHccvmrfijEcHFK06/ritLPQJhWN8u4BwJN+34iXnH/HUvYeR
	MbkMmEhQY8iHT0I4aj1CiCWtLu1Rl6kTGMPZtuvHMYCN4tLrcxXesFqXpu08+TATV5M=
X-Gm-Gg: AYBFou0NOO796xonwjt0DFLYKlCKnYKKoI/t1WRzRdit7VCW5WZ3xOqSnjhTnOQ0Djr
	WufBs7HTdBglAWBxDcgM7tQecRYH7nytrVQDFGwoEkrMV/6CY5gFL/j/Bgkc4ViKDBCUfMSjGzn
	OihtC6ylrXk1aXCnlkv3gmhRhoX2up1V1DccjJzDFEbxEwNF+JCF15SfHu2YtPv38v6nAkFG6nZ
	g0WxUGyern9z1TTTvyXylcSy5flwVSjiVAxzighhER9jitNInBpucTIl2XRgWqudMB6FeEyVAZr
	NaTHXqLKjsUzawR/wu3RtJ0vS+AzvZagL0D6w6ZboztN/vLmPrNHRtVXMeWXgHfLPonDzlIztUD
	w0PwbHpPEXaun2RfPy4OJ3FbTBWXvh+VB3jDleIlqNG0yrNSIY0zntmzRP/Tn6cMfoij1tn9VyX
	Ka6MQa7yzkYrycn4O034kqeZEjTPMRyY+DPpfLbWnDDXmc6s2i10WNyy42l1bgfGXL/Jyj54Jh2
	FBGiMicvRzRdUT7QY1r28i6zJGwbu50JIdFK9Z/3X9pI6XHz686AhwWnZZJ3z0o8q+Ddoqho4lQ
	du0bYLvXHBkBua2VfJyDarm5L6ti+hr65T6UkHDrry1AqvMJGsUbtwjOlYd9kDqpe3jQ4KEcGkm
	0vXH/WeTiLPOUeTr0mnM=
X-Received: by 2002:a05:6830:82f5:b0:81f:138e:77a0 with SMTP id 46e09a7af769-860f29becb1mr2821997a34.24.1794421201164;
        Wed, 11 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:00 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:50 -0600
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=812;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=q/RYeDFXlfWlE6oZcVVafzIBFTm9F3BkNBjT9jB33RE=;
 b=x1Et7idrLHXZV+S4OxZLI4XDrcm2EokNWm4td8JQSrDbabjEZZh8QQe1wekR71n/tjIyRyHZ5
 J5k1ccNSbhvDk86usV1plzGF6cGevU4Gd2qKFkZP1KKaNdYAsVILbN4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102002_414083_605657A2 
X-CRM114-Status: GOOD (  10.34  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0


