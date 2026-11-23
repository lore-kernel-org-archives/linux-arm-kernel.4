Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8285606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BhkWJa/v;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNBNIjjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=; b=BhkWJa/vqopRBZ
	tGocYPm7ncNKc7DY24W4xK0mUE7QrEOh9a6c4nEeHs7jKLhjrr163FMcBUpWG/s1MxoxBhWDnEeRa
	kfHItRWXIT37FAeq3brxR0wh6zPqqo4CTnDZZ0FyZm7wmeeKFJjgUxB/JeqpGBelJ/OND/7DqtJ1L
	c7A2fz7MepxdDMqOiiXIw5KsVdj1E/GViNVu1q3kMAnbnWh705C5OkxBiUkN8sbh2jivjPMinFVwS
	+uEGJAT69ZeuQ9moQBxU5gU8N0n/ZOthpTyaLrZwBs2mEbURlbKvqxsYoKrFqD4F4a+IVGc4YxDrx
	Co5y/1fCxiYX0BNmH77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5U-000000037Qb-1O01;
	Mon, 23 Nov 2026 11:19:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4g-000000036fa-0V2M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c511cdd5a82so350022766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432744; x=1796037544; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=hNBNIjjHDf1h9uz7FssokQkBwIb0cYfapK9y7DE9WWqVMyNX/UfHRFp0fG4/hgValf
         o6NL7H3oVCQCnDrshtCfnd+0Pfp6gp8V6ueMXFrea8ygNUDcKxfrLBhz2KlupWEmuAGL
         FyY79TGGGpZZG7Po+4N6yV324hp9M6rv+epdOQkeyKNgtFEtKFKJTOzGLCh5H5qChxN2
         2uU8j9IriPuxIEuqMi3C70mRd3kwYpjWxbY/j8BZkwfE2L+p6+GiWtt5dBPW8TLkxoM8
         UxKFi6F6f0aDzSBog1yW1SRrD6jckc74XmAh6s3RtFDbNGcKobsl5N6d2eesliAwf/y6
         FinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtVDEEY+1Q2B+PJRdO/nFO/tm1fJ8wXwnQSpYA2WKh8=;
        b=2XvMkuSgIcF4tRdXXpfcRDklGsRqYM6skzET5vO+QrZ1YL3DKR3rEFRd0DFBvfGyyP
         vyYcpJcLcnuIg3zXtd2P1YoCem7RRxvfXPkqphf5V03pNaupiwMp1GQftsAf+mCCj6Tb
         EXV8QqWyO56ffEs/V6SwbFEi7fbHE8dOfHW1O04WIZotdlKaBdEP5LZAlj5uGsVRI6ym
         Yfw01UMq3jSJiTib9D/NbZJt+xLQtvO/c3gS6bFAxASEZMPBa/7c1iC9Qd13Kx0B1rKf
         26Dmi/ONdDAl5u8FdB7mGCVKEXA6ORxx5vDIShwgk7TlxbgBWnC96gidYNW/5x9LC90W
         bNEg==
X-Forwarded-Encrypted: i=1; AL+hErHacjerc+lgSgGJyrlJyomK343v2VzvGR4Xtuc/pC5LhmY6/bG5GhP+mTuOZJN5Lap8POOvA7rlUrI+ANvmg1ny@lists.infradead.org
X-Gm-Message-State: APuU4Z/IW4FM4JxXV1YKmASUejy622peilr1xVhOFb4rm7x0hYYCq5Qd
	sU4oj9QE4XKdqWolaYjio8nQZd/VtqJk0EdTAEFERrqLWEoPCvS0payx
X-Gm-Gg: AZFdTZdDcDTu2Mv96skTLY5RiZcRwmlC++gtdyEvKDBpI0MTem893s99XaUwEVVk9Qe
	aNNHfaF1wX/qyf/BGPF2TR8cXuoR0QknokbbU8cAp+dKvG0g8ZeNo1nxHxh0bF8ByynyuMkejmG
	dBUzlk3MuHAJ2iV8ezzxGedP8PfZNddWgEzRDOMPjS5acSaPUZ/ZwQcnAb8/6p2/g2FIBVtYYCQ
	zqO3QRYVUbNt+jPXxIpWsk7tUyeISD1jg5TP+mMmIuoTVJPw41qEP+26ASHlWHZKOqgtS14MdrV
	hkEsi/iI/ZSoBKeWZKyMDuLcPdx8/e1jl1tkXTwu1MRMZghfZ0kunM7AsYuFRkTZnRgucdcwO2L
	0DPx+JKQZAsE59SBgp4nTzqWE6fKo4ydupoFT6dIJ3rv+UhLsOueqCs1qqndb8Vz+kEHTQTiQXj
	x7Ed5LlWeNxGBfPkgfmU/x7jzuoeknp3Qxy+MSstK4kAD4EYI1QiwE0YMP7cqNQeEuoV9xt+KL7
	ZZkSnafKER8/uPZI5vl87JeeZeARVVDmIkAStiN+/lZkfjvUPxgaT3kLSJtErA1IdQSKDG9FJLT
	u/1ywpWtYEuSNynA4lZhwTVUWne/sOAwIeHCe2WCTsr9DAjrs8UCaf+prCDEk5Kcrw==
X-Received: by 2002:a17:907:948e:b0:c51:3b09:f7f8 with SMTP id a640c23a62f3a-c513b09f8eamr826376566b.25.1795432744060;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:35 +0300
Subject: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
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
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031906_188148_04DF5E12 
X-CRM114-Status: GOOD (  10.92  )
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


