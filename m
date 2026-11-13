Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9460A3823
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wkiIUN6L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLWqasWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=; b=wkiIUN6Lqg9YJ7
	bgQFQ4ySMN9uoN8P5oIv4C3YJEjl56CxrgCUTFCSo/ZrKILeUXR5Dk1AFcYuYUQqaXTzB9aBj+i1f
	9QADwQ/mvgDIn79mI4OGn96W+nGzKnmmYpRyqwgQMODsmUoORSGptya0A2UwhgdhhHeR812O3HXI4
	jy9sgJzIZDCUWUBnpRE1WV34b+GHrwBgAuUxcsM/H0EcbObUZgPrgRhxuXqYLXCvYMttIGhLjjucM
	vRpShrAYDimuBZBD3TyM/lBgXBvzYtHqHcuFOwOS6rQW6VlOZmsLjWdzSqp+PxMr1kCTR4clA4o64
	kwxk5k1EQFbNFFZdNtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd0-0000000E5mL-1UwZ;
	Fri, 13 Nov 2026 19:08:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcn-0000000E5Y5-2Hxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c4d58c50743so237587666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596868; x=1795201668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=DLWqasWoQ43GzpzqjujzLLCBibhO1BPE60kZbFVB/Omw+3AGt1xnU9Lz1TCKHfJl76
         +PpyeFwnPiu64n/O5stW8Hj9HjEYDciUWneE55Lbl5CFGtOLyuJx2wi8rsIt8y3q3deI
         G5KWhIb89mo/ZeH0388+uMnyngePSonCefqkqQPMPAQuwadjfKqpsM5jcW2H5/WkX7AI
         Oti7Mvu79Cm3H3YgcvsZBwE75LBFxiPTFbeHmgyDPUz0blEPfuViIPHrgOOE6l8rGcgZ
         PBJT/tFkW+fWl5p/o6x1WrDrfIjTdkXroVlBSPRvnnoxakv1ruGkhlGKGsZN2c1W8oxW
         VU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596868; x=1795201668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=tCNV5ynCnmbOn/11t8Am7SIif0b10k/ipnY8IreBs/L9u95uPhUcmDkl7pPNFvZ6OH
         a2Clj6ydCE2SliJkwmJSYsRKJEqoLgSaeGRSqziURqHRj6PnUG7zxfDPRdT+UEuqptQ/
         eUdCXTd0MNHfF3sXGtb+KgDmWWCP0/7YZWcUU5G5tiAx4X6Y4UcQguIymxqA+/xOn0xj
         ivH2Py78e+aDBggNBdw2MpwXGVZSEHG5Ch4biCY0OpCYNHyKfoyVciUu/ZGEgTfSx1Bg
         ksxW2GuqW4mmcaNJEvYIdxda0NtGwGvh21vM6f2QMyHmKYfM4BmydUreO1iEll705Zrl
         Zc9Q==
X-Forwarded-Encrypted: i=1; AL+hErHqFJKnnnWv29IYq/2hxPQXzSmYE8I9W7akYxT96XH4WVMwSLjYafVGN8V7sKSE2KkThGh0LryE+NE4HR1O0ji+@lists.infradead.org
X-Gm-Message-State: APuU4Z9qYJ+KI+h72wYLGy1gyj4FXPctSWKVpXxlauKsM6nSfo3GzEMv
	sIn2z51tRV+Dj0H1CUXlIiUDxVK8atyCLIwF1LNQgUHaruB9AQZrNkKz
X-Gm-Gg: AYBFou140afeTmMtJaYqK8v8cMg01EsEamAsioj9da5HI5mzJaR1xrjCb6YxzzFh4QD
	ydMByqZzOTojoKTekd4C9KjEPwY0lHyHJSd8OQKGHzZyC4n9rK1Xpjk3EbWJ2KO4jTDL+EZFDXl
	kh1+fr8eInmL1sI2p3kYOCiNesA0JMdJKxvMbTGFPILl1DMB61aG7z9Ts1OyXACdBdj6qOmlObk
	gdCsRSQSgpWPbmmNgYsE92qFK5h3ry+H4dGDWRwaL9LpgMEsTZY2/T5VSetaMl1OCRoQxj2f95+
	Umk2gMOMw3QYsETLJp4CKpf3GTm+wmzWt75sijY/rauvm+VQgXmJl2Eatk3Gh3Cmb1AxxPplA2f
	CLzAQXw+nI3HDWg2/OhibFZtBe7qQ1SfyOJ373NnRuy4Rgfv3YLQ2v7CIl5kTkKXSVTlYyaHiyR
	HZATCkCDzff4j9Xbp4ayOF/N6Tqv9LaaEtM/mFDB19mGJpDOEuT8sMGnbY9R5sAQMUyKMZNVInn
	JvL6r36fa5HpPJ1GJQCStp0hPQsK8LGUMXYllkqowsQ5H5xEzKg4fM80GrndIVpIbZI3vw4EuYO
	ejzAPzcqJvfw3w36zIf6ainQU0ucaQvo30zkOJPVC4Lr7JVYtBOAQUHLBfslvSO9
X-Received: by 2002:a17:907:2d8a:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c509683f389mr411823466b.44.1794596867571;
        Fri, 13 Nov 2026 11:07:47 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:46 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:58 +0300
Subject: [PATCH v2 2/9] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-2-4ab0aa9fa391@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110749_625069_6907F61D 
X-CRM114-Status: GOOD (  11.17  )
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

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8000/8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart

-- 
2.56.0


