Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4EE606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AvUPfFjL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQysNWT0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=; b=AvUPfFjLGuXa2A
	Bf/Fyq36wsdBrmTMF4MmKUGoHSl8fYDi87pikUYKnQg/XlWmla1+kUafMahDiXNhal/ZDhKgcMeg/
	8ic+HQIvxgzharbZ/s7q5JMrr08kOv9DKack8xWnU2ZR12zBSOT0nTss2lkwWzZ3Zfmik0unl9a4U
	LjKpqNYXeYuiamnqaBr/tPb/14sbODyYltySd7JGvQmH3AfQy/kj+5vpkrYsoYvoEoH5vnT55Qf3J
	6xidZ9xzwij56JRAzclT94166aNhITxVLZVnR116fDn9XLnPZzKrw7L6BYURDcR4lgQNKw6nnrO1l
	c/TU4lxFu39rOwYRz+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwdP-0000000E6A7-0peq;
	Fri, 13 Nov 2026 19:08:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcy-0000000E5jQ-0tCB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c45551fa84eso342008866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596878; x=1795201678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=YQysNWT0xUbUYoQrgF+w/5j8kPP2dLBOLEJSE7xHIryjLPOLBy7BX23aXXxBj2JEM0
         0upjRUiH1WvxvI1HiB2mxTtsAq9CAoMZ9ToMN7C6FyNxRDzXaCjX873Mw9074jZapCzG
         hQTkZ6rFOiMK4yaqW1scu1ZgiyeZVVFSPVBmBiXalO8BpHK9iK++3BSlJUsJ7WdwcmeC
         O27uc2d+jD6j3V6oNUsbUPhdR/pYSwgnv5s32tT28REvvJvVpjwOO3TnhrkgHTjDC8SJ
         lwg0eY73y+eY2PvB5cvCNsDH4W1AvhbyqKsIc3+2lLbudwBjThDxjOXXOLZFdDTOupwc
         c4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596878; x=1795201678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeIdUEn41huggshJVY5dteXJQUSowVHL3L4Q/+1iZEE=;
        b=p8wYSRwUtwcpZ0bJ/VrNpv56PwxrpwP0ePGTvVnSLc0N983Yn6cmQGVTG8HkOwZsPV
         zdJnrmJ2vIjrx2La1sf+hyXZCFo6wSThZHHkZPS+LsbQuqtsd4zEe2Kh81Dnr+aqLVV+
         rbWge2KLYL4V9n88NzJGM5xXZdAzNpxTJtkalEaK0Ze+0xX0VNSIab7ZNNecLRKcQpdn
         5s2n3jbxv5efwYEnCRBYWxde3XVLdFGBh/1O7GpC4j97vbmi+/5/Wg9emLrYW9UxWJAh
         dXMwpDq+XHWpNBIa5oYnYHS4xCDxiLolyAuubmEv9exIYxjRr/2nbc3gq1syTGwfz9qQ
         KHKQ==
X-Forwarded-Encrypted: i=1; AL+hErGxf9xIffDa5i7V2oaDfizmJZtsEM2Rq1ngzfxUVN6v/cuBUrFkmNtvmStqORMzM59SqXxFFwzh6r9nQzedLkgC@lists.infradead.org
X-Gm-Message-State: APuU4Z8RJrTfvdLj98602CDKyynREQbh/u7OK3IMKTOD0RXFmFnjplNA
	hHaA1f4R91tV39tnPgDeTRl1hAMLHP8O9TT2MT8I0EhTNX4skshl+E3L
X-Gm-Gg: AYBFou0JzrHPDxdqK0MnRK56pDelPPOairxyTYYh2Mgo3epfWy9P9Id1f4F4xwyNoU/
	tm4zwCD7zJV0U+1cbeg+QcNg1PQyC4BduOz08U6N0PM8AA4n1nsZkjgwhgfaZyDn5B2iRGqtoDC
	bptgpqSSPboQd5BOLFVWJySxAmYPVlePXU0Mv2q0kndYLUqo5NF7DChKqlg3rA3xDYlUGvGyvnJ
	OI3dOYJZQAMvK7jCCiwvX4YiYrF4WH05sTbuxkiqdTvg3CCPaa2F1MMHErGw8HwlQKnFGMUmNNR
	0furSwuLwgnXvRktLumxoEiTZlbZzez3L9bZR85vRQZwhHsOkFEVWs38kBrdjLTcAasPjBnu899
	CQgEFSIBLHwMBncKqJgBMGLGJtay383RmEDSDBsghC4EWMgayjpnDEa5DuiT6DORlxVHGb3lyf7
	nNbmWirGxu7QsqU7+UAIoBYGfNSKy4i1S04HK9/l1J+MOAYj8XXUo6dxhJKXDAiAV9Zhqw0824/
	cEwSDVR89sfo5Sb9IAXVPdXFu7m5WKgS/eKNPRBd+3VFQroVej+eYbDQbHKZSwVfxcR+KNnRxfL
	qFfyF0A0/E4wSswszy2h/adgfNBsU/WB0jLyl1M1KIiLhE+8xXvWpI+LLOkmtvV3
X-Received: by 2002:a17:907:2d89:b0:c46:8063:220c with SMTP id a640c23a62f3a-c5096398047mr303416966b.11.1794596878270;
        Fri, 13 Nov 2026 11:07:58 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:02 +0300
Subject: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110801_124660_B63E40C5 
X-CRM114-Status: GOOD (  11.63  )
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


