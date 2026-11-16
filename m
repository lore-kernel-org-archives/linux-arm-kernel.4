Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9JQKBzj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ddJw0hq0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zL6mnPL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=; b=T9JQKBzjcMruBA
	j8rP9onSgi8bgn2iALwLVnVubrNH3LjN8xiy5utSVYWtJPmQNChLUNmh64WTp3XqMNIYsmpw8QFYm
	mxex/iEHL90lXbpVstB267B8gMEH164Oxfq4P2S0+xRCZMqPaWreEZ1PkYKTp74/4LL75+PadDi6a
	XiTa8q1CPuAV+1fUkkUYPVKEl1TKPKbdq6ljt2BEIrK8Y5m1xI0evr4sR0eh4Lv7E9ty+gg881NOU
	Cv/mpuwytstx9p4cARZSHXvR0Hsw9lZezHFah9pGyiNiM59oaBdFXfXGpOKiqLbHOoVbe7y9wCYTv
	5rJWyQQW+i4Ph5yru1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNm-000000022VV-41uR;
	Mon, 16 Nov 2026 10:56:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNl-000000022T0-1pla
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 10:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=; b=ddJw0hq0bRMbe8NNtljj7d91X6
	j51upKf6QgSrmcNx63CIME/+IiLkA0Ai5YAT8FUaQQRvU7h+yTXAbnCkUcE1/xtD/xl24qN6gNpJ8
	pCn6SpKXaA8kZ7uH51lN480sTZwe1zf2IJ6p/nXva1JeI8v+XhXkXfgrglYolpuHBFxSTM8LRvXI7
	YTRhDez6unIlA8oHzFwchbV+1kRf+k6FYB3m820JOYiBECoPmYgIxo8KKMsHJfgR/vfPxUIa3Qshk
	OEV3h/qz/96H6NIz3OCTtrsSIsfPY8efzUeqFtMQ3PXow92Nx1rNH/qQSRa8QokTjOsYFsYl7DUfq
	MfPWb4eA==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNh-0000000Deol-05oD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:56:15 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b4c685c751so10978917b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826570; x=1795431370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=zL6mnPL82KCgpwTw8QzAxAFtdo1npMWif5maLPEtdOd3DlWQS1nTzpwFF5YJO+D9BJ
         83wPFPC1QLycdHJ2Q47ruiejr3KZb0gQX48gHez65ILpMHvywFhX+n4w+8f4d3LOFwUB
         legIK4bShk/he5Qr6H5VgmpLweflLw6TDfsY7varifDUTETCrO/STLSnCyU7qtIKmwgO
         WJNv1oeQ4BlVm+w4qv8pPZrQszZFFTecgCup5ymIFkB1bRWdfJa3tEurmDJA9Ea6Y5wo
         HrpjQ3guPtC2QT3BfVd64vz95MicrQrSUSqvVxMFhW6MxBC0LJxJZqF1taFjMeCWiiqS
         A+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826570; x=1795431370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uuenm5c7uLenhEpnUWoxIYDWfrao2MY0rp9vEXUhv6c=;
        b=exnx5u/gXfzJWiwqdW2ZoVtGqgFRxF8u8fPf1t/WR8RwC8tTvWLFRtLIMrSOZPzqjQ
         PbP+2TYl6PXHSeRMl1Lgw+0ywg4jRpMR42Q5REqf6HSifpWjrupP7OlSbh7Ae54YulWY
         /m3lk/tmM89Ey91VsctoCOIFMhjnNOQnlZqsXwywlzg8kud46QQ+g+wjnQCXdFqTGDtT
         QHGPxdYd9axsNz7RRLyQlUcjCZUirUWJLqluKNTUERZEV7rVG98SdBwLtNGaT5Iu9PuS
         649dDhzuAyW23BjeYqMXknTR1seuT/8kgIg3ksWGJvKa8gFaW/lbg97hWGxOIJ2IKdnB
         FODg==
X-Forwarded-Encrypted: i=1; AL+hErH0Nrn35V8eSmvASro+SeoOere8aPZYUyMgZJ6BLrtvVuxuSdvYEI2IOpXGo7fv+W0SXomaIMAXhpn+tsav+sp5@lists.infradead.org
X-Gm-Message-State: APuU4Z/P9qXuGaOyxow+azF+bIY+ZE6w0HKcbay6pnzUK1Ux2f0jhmCc
	mZbA6DWHCsnvfcmzipcsK5eak3MM7wj4Mnjo4q+2CFrr376uDNgWzcHg
X-Gm-Gg: AZFdTZc5rERfuNnzgvkRNHXGlO/VAWfojUtedp00RdUU2KLJcHvB8C+GaWRt5ixrKpW
	WMxeMlA9/UMuXYNqqf5zs6VB/MVsLWEHvWtg01h/bS5NcazuCcpEsRf5pbIaEL7lrT+ri9DE6ol
	tAXKYMoKgb2gz933N+uTg+VEbM124CbeAVrXPmBUzK2TNnhSGty0KoVXAn9TETkKkN3I2YxB4KV
	/wbHV4qvMicoirzuldmiJvqxPPGxKBWhZ8E7LQ8WT/gaRRy8gglNaF7OcE+BsmIXu/bhN7YF0Iy
	7vG5et08yZz3gtmMtgwOmi4LOkKucVfomrUVjg6Ajtj1v9uuB4oynKoBvO7kpnRC/pjrRBWHUj4
	/jskS8au6JQaqayRak6rKUyFtpgilLFYkmpeGfJQTsOqjnZeF+sRNyKQ2dunoAww3GboqdaBF8S
	A//E8qwDpuWdbWymuJTGnq2ZhuYTyqEZLASCHX+b4Tycd0B/xNaBsm7sKnciPAYFywDmn4lccAT
	gpnVNHL1iKdBhHOTiTzoYTPEgeNWn02e8lBX6ynwk58pfutAvUajZ06lizWfoRviDesPvv4HAOK
	W1Bv7uB8NfvTVK14K9EYTdODqpVsMGYmPIfLLYXN9kYjt8iTd6XaMeFV0ZyVMxbqx27ONjLgJy0
	UVdrj4vZb0VAUGPmnBo2fhKVXT0DdFgekM0Fv
X-Received: by 2002:a05:690c:389:b0:8b3:2445:889b with SMTP id 00721157ae682-8b4aa2eb92bmr50305027b3.91.1794826570279;
        Mon, 16 Nov 2026 02:56:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:09 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Mon, 16 Nov 2026 07:55:43 -0300
Message-ID: <20261116105544.669029-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105613_229165_A1334622 
X-CRM114-Status: GOOD (  10.91  )
X-Spam-Score: -0.2 (/)
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

The Allwinner A733 USB 2.0 PHY uses the same configuration as the D1,
so add its compatible with the D1 fallback. The A733-specific
compatible lets the driver clear SIDDQ before releasing the PHY reset,
without changing the PHY configuration.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0


