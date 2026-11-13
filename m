Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147360A3823
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1e0xugK2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIoBe2kv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=; b=1e0xugK2YaXKd/
	VIWWna6wGwT9E0IsivU2Q9o/33KXU+Hs/EOhEcJRlcRefXMUIWwxR7dok3GCDgcl0pbPnSwJuYodI
	/c0L1Y5FGKIAaP70UHpyL6T4qZjlZxhOT9+pAO5UOeIAB4wTAvtTOcwvNWDddEc00Pdhy7THhgGsE
	NFzuW4YpEk0AzPxscTwVRnYh3kAZOvgbAGh3rsmGidajkXXPMaJBj9Y9L8l1ZxDy9+tuw9DgPa09U
	RNJ3ShZQlaeOCxivgfivb7Y7CWvCVzSgIVtcyIFR3qNI7CclwBPez5dTjrrk3qsrxgwpT4VApMHTC
	kqwesDrY9Dp4rNiQj4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd0-0000000E5mr-2vmB;
	Fri, 13 Nov 2026 19:08:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcq-0000000E5aV-0uMi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:53 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2683523a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596870; x=1795201670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=xIoBe2kvC5kUyFUOr/xqBA5aN1HZwwbbTQNZUp975SyRTRm0zulvB7tYJG3Bs2iyiA
         /rru693yGx8t7Gh64H5FSrSvY6MpFxUa6kaRSA4QoSD1tp14ZgJcicp1ft0cq0oObHPV
         yTiXcq2QsTvkyUJX6wA2NFW0rAxUjkB1NkvhrCIgkS0gdvxpi7dxNGKH9TigYXvK7K5k
         4LCD9Nv21PTSku0c6LIfxj14Gb1qT+i/W/QZ4IX0lcez2PLTYtpF8klSSJzu99Ii4vQA
         1HgGmLZx1QpsQxdTkdkKrQWgZAzQghjlVZ+vMEKc9LUKU4fWCBcYCBkjQlwmUfbUad7T
         jh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596870; x=1795201670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=aIhhrtRt5ZphxQ6Opnm49DUsnldAyeaItyBQkCJm/2HmmrqCnvDVckVRlqiGuilzb1
         r51bpPItM3tuChbc+BXD9cikj1aBL5jlFOamyLSEcmGP+8YQodp81hrTIWZYSm6Gcp2z
         KCP3HS6F8luV7i8IqrddmXnWm9cXvBYBz24/OHVr0wiAWYJgDw06XD20Tu0UhrBtvg3y
         SBKBHj/bj6dEFA9UrDrObjFQukzTogy5oGdeXt4b7Y2YqzenFInvgI5KVRH7otB4+ohP
         njJqvXtevKpUu09edFK5R2HQCxqyOyog703CJ1onGBQ+MYXqWICUERH3ewvaD2GdPXMK
         cDpw==
X-Forwarded-Encrypted: i=1; AL+hErGVXyGIr/yw9TidR4PI4qBUwsfMV54Z1bSYsDcDkoNDPDk7Aw8Kpsi6zcUVV19av0Yb8Pj4ypmRPtndzXMCHuac@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZxGk5skh3NSRmQZaJsm8FVv+sibtJQydFheUOFgxGQWA+xuko
	CThoBgHpddcpMj7TrLrBCE/Rlym7C6SI/vaCoU0pQu6CsjiCCvx8DVjt
X-Gm-Gg: AYBFou1pKH7exU9v2ndkAje0vyCk2rtTL1bbKn0HGsHC3s85r/95NZhbPkSIh+ynJgw
	VqyULuKwf4D8nB4ayI8X6ufJ+4Wwdmn3gshf1L5RBQDrGPVm9dNoLWpGTG17+g4G6TMJ96GQ3jv
	BtLtx396u7sV8slh82i5/wW0XbsEW9oNDlfSUXlnhzjs4hBj2fLbyS4AjrX1ehhFgW7mEdIx0pU
	/XwrDKQ2IPKs5ZvSpWGPeazuXhwyAtvDvUiLA6qCr1wIh3KRfbDnRggxyKu4AsXpIoma7Dv9dvI
	ZbHJsBFicwWjoYjwIxgWi+oJAZbkaeTAW8t5UhH9xVT6ZQMKqPEoFZ9J2GgzrNaGHOeb0hS4P+Y
	7wGnOHveZrAzkLBiQy77CATlwdJ0iQKC/HIuwcAAeEbDpr6rSbUKn0P8ipItOAX7ykthxdZQOxa
	GVwYceeHNv23du34cPWwCnjNnZN/uCt3gYDf0XdgWQi8KdIv8ZC4xSY4cXMKZVOc3uxqJDmEKmF
	SvaWFG2xIf23o4HrmTo4b11VmMSILy++PPNR3j0QkAzCRI5F+zH1Nmxe1gWn0CqkXsJFwjuWA78
	T63i3zax/zU3pE5qLFb2+faAJVeLzeReR90lSS7uhUC7fNKQElLxuf2KDZ5IxhC0
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr389984566b.24.1794596870123;
        Fri, 13 Nov 2026 11:07:50 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:49 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:59 +0300
Subject: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_110752_289625_021062EA 
X-CRM114-Status: GOOD (  11.07  )
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
known yet.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8e8991ac95ea..d0a73b9c81d6 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6895-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8163-wdt

-- 
2.56.0


