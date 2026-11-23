Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i6g2jB0+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Fr6r/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=; b=i6g2jB0+KlcVvl
	/O4E+Pj1a4F2DAjMhkUWgYZvcYLNS69Ly9wBLVv7hjiKxI6RaOf+BGB2ejR2RfVcPIZnZYuSFn4im
	lmoxYK2yPis5xV47ADVjBNTOxI/HnOZwxrLbL7GYeRaD9LjNSZlbeWBOyOC2yjKh7Skkbj2TmSZqT
	J4tyYMiL8aqbeC6fVxYam3YXYKk43C7wOEhuaA/0dQpSq4UgNkDHrC5WlOnOU9QE9ATepCAUee0xP
	8GwbZVmhQDUEDZY3SjLE9snd/t8u6AhqSL61JBn1v7PVCaz9m/Nv0Z6puwYb3EHk8Yn0PfDp2dbeh
	hCUjg9xdbv40rdOmchMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5V-000000037Qt-0MF9;
	Mon, 23 Nov 2026 11:19:57 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4l-000000036mZ-1bcm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c50e26763a4so577887566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432749; x=1796037549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=L8Fr6r/vLoj/v28P0dvAnwMFkWZkfZzTDvYY0k27j3EAkng0DEUievRXgK85tfHTcu
         yXJiTCY3o6gyUvYTAHi8YxiwnZdvSHBiPNm/JSkuL/ezDfdTOLNidc3yVT5k2VS83Z5w
         T7fOramX1CcVb3Ssraem+3Ud3CzDIHpZUVEvy3yHDVYGBeLdmdvLY/ZHplhNPI8s4Il3
         rlmiJPcmF+3FSy595EjJVX15m79jTmG7FqNsOHHuA8oBRiDGHBj4ZTVdlO6bLy8e/FGx
         18jvhCFYXuQ5Q+JQdrvt+OhhJ/I5Iog3rmxu4vk7fSdCKPo7+fysop43bt1Learh18mU
         YgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=ltE5/hY0HZ/kkBpmFqWcNBHf58faALk2lAbzYIWs+G//hhfwoFOzDaqgCkD/JtomNF
         STXg76/jQfKMZoqAM1flfi5Kj8c+kdOk7wxbvQY0TrJt2Qk+OhLO/aXoZApulFdjM0xc
         tNnHW88OW2Nc/9yFvgvEp2bSVgveePFrV4qnHeP7iL2pP4vTK6B84J3CqICKIoZelcWv
         4Uefaz+2t6iE4/9zIph1Xk0heSCaSveTa/1RbwxXL30Qg7pIKqizxVZI42yMk0y9ng+U
         FW+t/5ELHMg3v83Wfj4RzvyroacDcj/Q55q6XMYnvPZRc4LrAc9HTzcRQJU095VALrcU
         obng==
X-Forwarded-Encrypted: i=1; AL+hErFy5xgU7DYevYhadCMvRKmcLskXyT5kiZlBUNERhUbVXyGWKpEyj/LqsHqk4a5EMtnZlVtQuQDWs0LJRa6eaziS@lists.infradead.org
X-Gm-Message-State: APuU4Z+RF99qPCfo0wvZAMErQCLCD5WqoJouf33X41R7r8BDbupsI1HE
	nhIz+2MGReixcCGM4Z9YdbA/ICxzdfBDM6Ya215vyREJr/H8FUGxZPuE
X-Gm-Gg: AZFdTZeOLl9kRroX1D4X/LSusubJWOTIpqNr4bPQv3RGUUj/nl9rJwChtUKwgPOgKoN
	JLZ+jcZH/5EFYEjlSnUtFspecxRitltW5HsXLKJaXdX29Qiqor0pJdtmn2OK2a3xO61cBsmMsoY
	P+2nyWPdlTC2SMK3R7cxrGxfeL03XczJbIcgjZDQ2EnXGcvS8foi5JpTSpl+xzZAHVfrcbu7pV3
	Zb+X22a4ntRgAuFogjZhIBvX4DCG2iy+nHDbdlB07HLjY/OLyarL8qQjSgOmEbCkw6y53D2Mo9P
	nFFg38HqeTOpLR4G+kkqnh9yb5kwI2JIUwjSRSvcVpNRMpMwppddZANxCveLdK1dEh6pkdzW2Lq
	GLxS/tlt48Q+p+W0IkhZ2M1Z1JnjTDSI1AEjF1qjLL5aH+to0drYC1bGaoQVP30UfoBMliZWmIK
	6XA37HHssVq6u/xHnvVSABfZswIR5YcaAthI4mA8cg0JiaHiaqfxBVDVHf9qUx7MFTpCI9pE5GT
	UzfMv+ug3GghTu2cHqTUt33WQQZajKByoUodX9T60NUNRYLRBlmy5fARwwoYQ2TKqUByAzTmQQ3
	ThgacbeacAf67S5UdBFc81UkSpdDgph6TKJd0EKtu7H0N3O2M16hVhuXOn0syCLjJw==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr952960766b.48.1795432749405;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:37 +0300
Subject: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031911_436352_129201D4 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -1.9 (-)
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

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0


