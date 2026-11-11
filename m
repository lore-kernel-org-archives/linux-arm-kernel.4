Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC2606C14F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYSD1Ana;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQ8aDD7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=; b=jYSD1Anapr1om7
	dLIIDOfaSbRCwO9O5ho0e0QGpnwMz5gG7U5aa09jvPBjirLGpNn1Yi7cYZM8r9AEMSwXzWvtQVtKX
	fA2cT8t7HXBGSHDtKdJSwdFQjiwvN/ho8xf4oeyKA+5Wdt37P4P57X+f6dD5euMYDTULg60ImCCxv
	GSrg2bllYoUoFowAcnfCT1XOviLRku9lKMARHIn190XEt6+y3tP/AySfN6QwYlj/PzGPOvErmhZMO
	Jel+U73LOU88npTN4obE4w/h2ZiLttFPHhduOZn7CnGdB9A33uu5NFVbLWZyUY9y7S2y/DYIgZUee
	GJuyfwkIUwEyR/4Qi05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCve-00000007OKz-2ySn;
	Wed, 11 Nov 2026 18:20:14 +0000
Received: from mail-oo2-x00.google.com ([2607:f8b0:4864:31::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCva-00000007OCL-2e7g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:12 +0000
Received: by mail-oo2-x00.google.com with SMTP id 46e09a7af769-84e8a9fae57so1752031a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421210; x=1795026010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=bQ8aDD7RcQgYJSgmu0x2TR8ytGFEDFMUDdx34Yy7/bpKXmjNCm8aMzaTXztuVY0/YJ
         L9J3fvRQH8jUA9lXPhRaiQYFB2RgHN/dYTdiGz75lHdAZ+zUuT8h/wR67UkPLOFwwMWA
         PMMRwkVa8+4/HlVUQmTGFsa+G0Lw7To1ekJ6xq9zmieFa7v878tXEdybdo/ch9wqcN1T
         S3HB2AWVKbRn1+vG91m9hS0HOu9b8kJWmStjDBnjzWv4m32T+aTKnUOadFV+yvQGbekr
         IL5+sGg/nliWL8TaQLiXzmoFWlV9FEv0GfkcD3PcjzdF96GI5jaTvFOzYq0SQW0iBR2y
         5rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421210; x=1795026010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ATWOnBJ9RFdbmFDw97qO4eCVawI+9yor++pN+g5ZH4=;
        b=ETKwvcmAW4GdOFL8JZVWzsuU/vGppmsRIjn0HQO6eT7Q1zV9gLwaKcaq+XdZ9bQlYW
         5WObJxbMiuJdrIn0zzOCSYLSD9NjBAE9G8VkZWdI992DrOMeueYLaOUvMmTiSMMtlpoX
         Xk0An2zesywtZ7kSJaIpbqjgVCa8aQdCXbREFDCjXCr+7OoG6w9WSDV94ynMnY1IXwjf
         iXOVHwAI11xoH6+SvyvTXtNOnxw+w9WinjKx+CLOPNfEnYYW8mtolobDzDQ4AdpL5YfO
         ywlu2U95KPkECtL/xmkFGCkDl16GD+IqZRrHOtNV/Ias1MJ30xcTSe6/Il2ItuvRM/Xn
         ZGCA==
X-Forwarded-Encrypted: i=1; AL+hErEqWhk/rmkcafaWr712ylBQchNcZP4WaWZaSWt9qa3PsfIXviiEzvF7lZrlhsrXvnCFQt40ho3qHUT/RsMBkGqS@lists.infradead.org
X-Gm-Message-State: APuU4Z/uOLhfU+IlbjlW7ZniKj8k+/sMXqYjhZZQfJsAH3OX7hzoK9pI
	YLRQNUjWiaKuCjMMmke9ngJmNNSRUPfJcvg/4kYZprciHA/KWz96ZUmm
X-Gm-Gg: AYBFou0GkHvW3+OnWlNqcg/6wFTmI9860ooOnxGPoq7qW5S29tLHImslpkxzYRaUrVf
	tSjUs5zqykQXTz70hJHAZWK4J6chp1dZlKdo1JvAGwr0C0eH4uJU5ByrfrWz6OIX5AGUFps29ps
	ItAk1ntvBiq3v8tsAdj3HivfRiHW853+5ZxI479BEkYu6eMF64M+wohj8VLhU92ijqmSrPM7vO7
	GI3XLJY+b2iM84upA7pqc94UXi/8gdh1jBAD+3v34mBFDHHPBJ4FVnjjEiMgxcBYkmXBcp1Xi4L
	w/X1Z+IObCl65EWZFxt0X5l256s0W9XkpSMCgXK1FfLadRH+vWDFwvfl2KcoBqG+xzH/jec1n8q
	4hGFpfkp2gUx5jQrsp1E0TBeYmG7613KGJYobmCpXVOcejHq/yacHj4Qr+2fBEohfLChA2MUpAu
	MnpXJVY3evv+uSrnZwQEw+u6qjSGG+iVwPf/kTOjkUyx0luDLeuV8x8Qujr8IDW9Owsyb0pbyR/
	WcjjVnfyLIlnPLL4Nhn+WId3Mt5zKvN6flhsUGGXD0EJPck19TUu79SBdMF8KKuBl5XwVC4/ePb
	zgGLFoE34aNvH+xqMmDfebQlFq18FBIasHEOAmu5R7vmLh5kYiwtpX6fPpHxO45uOBEOKReS8wZ
	o2duOGXmrP8R7ty2lWrM=
X-Received: by 2002:a05:6830:2b08:b0:85f:2832:6a9e with SMTP id 46e09a7af769-860f28162dfmr3039526a34.7.1794421204976;
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:04 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:53 -0600
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1176;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LLpoR3iw1kaqxYPJDFxiXt3CwLjEI88IEyMOU6ecomg=;
 b=EIrYCD4qDZS8ejbMBRlTKqTEnwo/3Ulc5Kn6KPn4xB1rCIw+hZ9UrVfNDVz0yk0KNiQToEl33
 BPHHMIEBaerC5i8AxGY8qWMSsqKkkjU/ywf2pCEqkga00yBk0Ibf0c9
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102010_811102_E76E66EB 
X-CRM114-Status: GOOD (  11.53  )
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

The volume keys are keys 0 and 1 of the SoC keypad. The controller
reports a pressed key in every row of its column, so describe its whole
8 by 9 layout, which keeps each reported position inside the key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The key map and the debounce time are the vendor kernel's.
---
 arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
index 6fd7777eb491..7dc0d818a44d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts
@@ -250,6 +250,17 @@ light-sensor@23 {
 	};
 };
 
+&keyboard {
+	/* Each key is reported in all eight rows of its column */
+	keypad,num-rows = <8>;
+	keypad,num-columns = <9>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
+	debounce-delay-ms = <32>;
+	wakeup-source;
+	status = "okay";
+};
+
 /* Consumes the VPU, which is disabled below */
 &mdp_rdma0 {
 	status = "disabled";

-- 
2.56.0


