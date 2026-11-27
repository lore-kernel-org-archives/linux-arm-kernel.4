Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF76606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lN4MK7qb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mHO6VATe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c8TA0Xux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=; b=lN4MK7qbwtnJYh
	Wp6PPida6Ws2ZcLKe/ENV1SDkcncn89ZbGd8XSv+8Oo7rO+amkHjS5pnrZbij6SVX4h+UAwqm95ml
	qNTSIGQBGXD+nMC5qsOBnkeCA5Q/AcsadC2ldmw8kQ+KjdB4gjsI7we/p0opXDFyYC/VHC1Se2x44
	pxLqT62NgQZ/q3B/iXYg71RaB9dLGQDl6jHhzOCMPHRzbzl5QRKXSPpj1haQan3HD7ZHPHLdXCN6S
	TzGYAxzSsAF6IuNGSb07avpBYdGpMpwp6rxkGQfGsqCjmZkIBIdXQt4xpmR8RIQjtQ/FUk+WHbse8
	B4dwddxSu2zcdoS2itnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuhF-0000000Fz4v-2VXU;
	Fri, 27 Nov 2026 12:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuef-0000000Fx89-39rN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=; b=mHO6VATeif/IBBNmROHMZHdPFC
	rqqwEXfIcuw7Er8quap8TJA2VkDdkkxn01MYjN7+MZo80VvQI3rGfDc0ZFYltaJj0qjhvDzMzuDWH
	fi/C8FL/5tvsriPP2PxeAkMX2pBuOEz9Ea4J+ZXHWzfMMrPeT+EllYTF2Rtq9iUDn4xv631IADcvY
	8EDec8QzrjD01tW38QSKamzYXLpH+uf8YvAslGNlMYRv3/sSmQQo0X7B4gZluhpKcOufh7pMPt5Ad
	1p7v6wX9q5A8uYRNqlu7NSxxLxCs2C+BvKw2XSPVdEEeQxg52W713Jt9x5xybe7PDwHS8AKpUT7JP
	xEy2vYdQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueb-00000007fkj-2PuZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso42783605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780925; x=1796385725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=c8TA0XuxO9m4opmt9/m9zTa1TmaIp0ru0GugWotGWVdhqxVHUWHkoU2dWl6DPaEuEW
         VANGyG1MryAkpEMcU9U08sJAmOx4K0c6brwHX96nx6bMxg9xRJy/7CI2tW9aqKaKW+A9
         JLeC0vEM8NmiQ460Ti5z71CbAGg1Nuts9l/WQsB6F9MCFdxVbqYL58QoA1HcikUCTfBj
         FtY2++jVUO4EtneY0VayGdHe/jdc0Z55Mk4TSheGSTcyDZDYbUdjfnL8GPwJMm8t6iFO
         BTA+nqMDuzGVTzkn/GfDU2K4i12a3sASaf90Ol2hcnbWU2y12ctvEiqVjaMydaT8VVNW
         7FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780925; x=1796385725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=l08GZw7aexIAk54E//49BhcI/h9x5q2QUmP2OfbSBS5fOEbG8ak8G+fI3bAHK0DH8V
         6OZ38rkobEGO2o3eL9oKLt1lxJ1BoIhLZ9mlcbcaRT98SMOMEg/I5aj1Dr32nIg1Dy02
         1CC+OUGns0J7GuQt2kV79aj8dGktgkzeUSNBIG9i6mf3H9r4Je54qeZFjB/sCRElznGi
         SWxn1T5L2+JWbOxVtW35F5zNTcXzraMhAHLNffSD0iVF3pLLTLiUgwlN7/Ol3QbZW4mc
         LQBbSLuiwhsSDsMP+J5K+jlvPAnQpBYmGr1+mi8JGGvLvWNOPlXb7Tamwj9i7jHI64Zu
         hJFw==
X-Forwarded-Encrypted: i=1; AL+hErEPogjVXc7xAqPNxgKNVUL7i1xx6gDzT4Vmf4TLiEfbV924a8Yk71Z/ignZgZenwbW4aC71nNv+bYrDng4qaMk1@lists.infradead.org
X-Gm-Message-State: APuU4Z+2vXWYZvE4AUZ/R3+uvGghPn3AkHToBXe5TSFbpqizneSpd5RX
	mFCRRS4uYUYIVapJlh/e0jTRgwhpEpGU7rUfmpx03eh01mykZp72FRcy
X-Gm-Gg: AZFdTZeNv3FaB1AbRI/uqruJmksxX74kLov523b8z+kCFUn/xacfqteOATVkFLSPExW
	JZByEhn51pEPTWT+CiTQruwhkPKVfzf2DUe9YWqiMy2efS3CbhSRfNCqWoaUaiGm7CnpJg9ilP+
	LSXHqsexDBorNVkW3IeF0HvJHzph/bONpkXNg21CYCq4hSyCfVrh3Xnf/sQ6UeAdRzxBcdHqUfY
	5H5fYzGTmuIK3OHb0WZ0VGMwSErLY7HbinO55Zzw3RXdFdeqGO1fMS1Hr/omNN2rwdg6CfrcwF0
	XGVJaCXTUODxYSXb93LYzhF58M9JDJFcWdgwZhq6J/5o0eOzit6j8sxp5nK8eaHzVGq9ynjy7DR
	W9YGAi3d+Rum40pYj4B22CYRAfpoZuXKLMxBZr8vh+nhSA4sZ/OuIGEcO2F1YdJJJe0HTAj6sDX
	2geaaTKCVROKAaIy9wQE6/dDwQYne9vp4X4ChbCeXnbn9DiDwaSVX2mU7LpjZc+ETvGUqNxPGM+
	eO4Fj5pdew/mzwiTfsJSZheqnBz068m9WRqlhl7D0nPh2NfB+I74iUL5k2JcFnQ/Bn0HOPChj+Q
	2QoRQANcwKaTVJqIo3vp3vvSwyLuSGpyD/PoSiZ2ZGRNn7qeIxSxxTeJm88sgvZ7gv6f
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr457352155e9.13.1795780924749;
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 25/30] arm64: dts: amlogic: axg: add crypto node
Date: Fri, 27 Nov 2026 13:00:58 +0100
Message-ID: <20261127120103.1532882-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120213_555213_110725F7 
X-CRM114-Status: GOOD (  11.14  )
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..e755a019b384 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -321,6 +321,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.47.3


