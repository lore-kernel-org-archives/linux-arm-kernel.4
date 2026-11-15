Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB933606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bpIsUDy2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pIR6K8DH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=; b=bpIsUDy23jh8ml
	T4iZuoIlvGexylcKn0PyqnooJJd/yQ91ka+1S+Mfyq/8l3dVvSDCiFDaqDaVyyvPPTxpE0oV+PzwJ
	Pw18mxzEsmCbpBkisBXNvm8PKXtrWIVKWDhewHFYIEDdwFkGgT49Cdcj17a6bMDP/goJ3YPrRBAao
	ja9chTZnJI6/bkKKOCQvqMeYvOwOeuwvdGittWsiOJ2+6mf7g6Vo2iS+O6ST3SB/vsSh50tC2jaiM
	xA4U9Ajb3rOTdQEEgo+E5cEATynMXK8j7R/owuTM4D7/oe/Ql619DvD2twqStgoR8Giz7fM8qU27T
	Su/uJxIxvYlX0CvuLwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBm-0000000HYTI-32Lk;
	Sun, 15 Nov 2026 13:22:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaBg-0000000HYQJ-1Tf7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:22:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-490a0e72588so1089398f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748946; x=1795353746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=pIR6K8DHev40FDROn41sTzrTJytG/yVbEVZYIVRu572HqYKmN7DiT0ZUMSKxRlI3a1
         7Z0ku00lePFJ1dcM3v1gJPYEl8+prvg7AIXW1j+HvlYUA+dflCcmXNe8wJnWQZFmdJky
         bMiKsOu6+N3cgSmzy8lfaDWhQj+3Ss0vtOqZ+6ieVyn2VHFQkDkERI7DStR7vcjX+IB8
         T6O1ndZCzijLIuwGBkMGAp/4RkzT3GuhW+EQhpQcVIk85KeYhoQ6QvQPbVdpkjMWXuqj
         z07cJqSsE2TmtyBmJl7GM7ykRYCxcuqeips4EFJOObQTASPJyRGBXZU1ZGsfAHRy3h73
         DfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748946; x=1795353746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=FTJvVKnSgjfW8Mi5hq47ZhTt5ucxPhXOTDcbnveOTdVZLnkgLdZ18LQTB4zHntfpXT
         cRj229SLV0FNFwlK63cqCHolBp9ZiPzoLj/NuIJ6XTbkQAoHQUWb13D+kIIfncuQZKB2
         /kQJ3HuDKDr6hdn8ypUkkG00AEbB7F0NMcHimst2lqF0sLUVnoSKl9FEBfJY2NICsONn
         J2W41oYfkqJBBqTcKTxFUyjD5OdtQMi4YkAf+S82Jya4rICzoNqTWieVPngqtZky1oET
         s+o5J98bkpfIgWBAY6Ww3mifJNgDKOcc636dO9/9eJFb6iJLGvLl9UIN6O6qvAJnYwUn
         qntA==
X-Forwarded-Encrypted: i=1; AL+hErHvGANUEUmMhod8tInpXwwpBGIN9KQcQyyheVNmB49vPMVlY5PFiqJBRCo5Tnz+Se6uFttcoK8YxX2Dcrbd6xC4@lists.infradead.org
X-Gm-Message-State: APuU4Z8VGbBPL/U8R4FgFNKVPMEOfZEZxidHMyrLgUlBuK/tLNwfSN/n
	1fKbqdtJdFcUoVbLod55h4uaxSFLZ+9jYZpXiEznJcwuFoAPdvd7RNT4
X-Gm-Gg: AYBFou1rGcZYS5fihW44go2kYX5NVj1zojyOjzDwsqwFbFy0zFsfZ0CSCyf+IjcBx9M
	YlrRus8p/yiRoHkkRbYKTsuYmnqWuFzangz55KVjVH9RgfzLL4O8DcEvhWru7FTKZvTJY6IlXzd
	Dg6EoPME+GjBHOOkPwlM4n+c2BHUEM4y9hFcPg62NkS64VqDZSSx3PBurfu7dmF/86w3BYwu/GM
	L2vAm8cxhYJ29U8jXoX1JDmB6pNuwySYeJ39g5ncrA63trprRzNu9txu9S6tDkAnkvAQXiUwcol
	loWUli5eTT9WGIRdOo1YxcXDxqSyTy9N+oLlmrcUPF7LeWU2sjsnamzkjOA3Vp4H/DnBozsRQSD
	eSkdIMRVB8slenayHdcDxwZ7Q6xSw9OnbwWP+ELUyOfJAFO1+LH7A5mw6NlU18Wg/o0ofT2keJ5
	p+v/pNrjLWWKWtgpmKGd8mqpRw0k34aZp1eOflshJNMHbj7wZB3Mh4iHDcnvSIM4gI1T8oQcXVz
	5UuZqRQTE6psZH5Fz64zHgQDFmNQLGu7jpHbz/ZFvADZ6MTYPf0bq+r5QO1ZqiMD/bcrVO4CvJK
	g6+iF8hrSoyYwVX7FcnWQW6yPAaiak/e5NIh4kIpOeTVfT92AqSeen12jGoXGpVaj0peGUtsa1E
	Dj0n3VXG8r4zivjdGV0RX06pcnYexGYcAGNVUqUoBNLMX8U0go2pjyKcFvY9Kw/YaOBAwkZZ9tR
	EL8BPvdjr/lg5cl5Y6nrbck7XsIW7pO4h2uIZng/NqeQA0q/0NlqXAnUtpWoPUw2L8AAFJzV6zd
	yiH09H5D3FkIQ==
X-Received: by 2002:a05:6000:4b02:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-49c6dbfff8fmr15902097f8f.8.1794748946344;
        Sun, 15 Nov 2026 05:22:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Sun, 15 Nov 2026 14:22:14 +0100
Message-ID: <20261115132215.289236-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_052228_407240_7B0D99BE 
X-CRM114-Status: GOOD (  10.84  )
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 40c5c42b347e..a2a2e4cb0256 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0


