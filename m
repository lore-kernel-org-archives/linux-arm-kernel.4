Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A135606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Vqfynhl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SawPxL8L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=; b=0VqfynhlQeC4mi
	rQbJXD6GeOqOlFc51wbHy5bfZhZjBxsbBm5wwZFr9CbygbGPPXYcYFpPJIehUzsBcWJfhCp0QILpP
	oVxHGqmAsdrBoxGMfSPE1Ctpg7Rm/X68FiHmwf/9Btt+TX0i7Rv5PYaPyyym4vPMrZPv78hmKfZGs
	SFIoX5PUkgVqtVq+fWumBBUNDengeq9cmnnZSWuq1sZnlf+wkVtQbWFqchS6cAo2FDWva+Sc/cyxs
	da+MA7GsRq7K2onoMROMUQ66qn1v1sDGGnbZnaNsPiHcdbnM7dbrlLhOO2R+staAlhqhF2deydUuA
	WL2RqMI23fo/E45y9PjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEQ0-0000000AGVJ-1zk9;
	Wed, 25 Nov 2026 14:56:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPm-0000000AGLg-30B9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3791432f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618565; x=1796223365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=SawPxL8LGsdcKvQikiDH+lFs63OdfgDdJXL650WVB/tlKzv7Be6R7zMocw3xQ71+Mf
         0wA5uupWtT6/DTjchdNheWD80NsAdeIHAk44MmpoqUYbfLGURP3Do/GRokZbBALqQnTj
         zLmp5QcZoMQbCr/mc1E4DtQZGAfwYdsIRgbM3yhXJVLLFQVMZNSy0h6QTcbWNETogp7v
         WdBS1Mc60FO6SBt7AjpTy9muSVnh+bXFgPe0dXMB/Wkf282P/j0dB++ijeuH5ClIjtmZ
         /PLyQa42V5SnyvUF9YZWwawE4XSi+IqGSTpZ/t9okXdrdma26O/YTLnnbWzV2nduDJ8g
         XScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618565; x=1796223365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=qdh/bOueVsSmV7Z6yL1LaRoJsPN1LNuaDrmC3DfFszjCnYOOPc/8WyAAnHBj35IWD6
         2VAIczLsJzYFozF/kIqcQn6x9HvnAKp4EDP/8so7aVqfCnjY8vxCePeqMzEiNMhwPdbU
         XAbwpkzWmmjZT+EVyPwMqGpmhAhJf9eyR4zrgqhDu1uhCo32LpdPIK+HZI/VYHY0EwAi
         8ALFi3YCOmn8fU7gX/iVR8hGHkID4fXNSF5TeB5m4LqqMNOMfSuxzRXkWFFNJgP8Q6/x
         yF7AwCtlicMA0pFBS+Ulk3+wb1YJlXkg0+eIYaYoBF6t1O8p6YzFwAT9LtPpW2ytxGvt
         8H/g==
X-Forwarded-Encrypted: i=1; AL+hErE+olD9Y4GTkD83JHByKFnh4A4NVi5Y74y/6x15rTupRz8pAyiHuPxQzvHgmd5yQRYkwy8tM1v77F7RvHgqJLrO@lists.infradead.org
X-Gm-Message-State: APuU4Z9tiy3sqcneWIODQehfaZZ/OYsCZGXpoV38N5YTRna42W+ILDNR
	TaWcuq+eKBIOdvIimvkYxm2Q7jZxZwvjLPbrv03TcItHeqCk1zi9bmSh
X-Gm-Gg: AZFdTZcG5QyP9lwBYax8NZLgQ7FOuN9qtfLcB0/PtSe2cdBn6svxNkKh6ShpzU4MIHT
	kuIXsOomcoViQp2FAdzuFdugcWvq+QNagr/cHum6OTvfP76SFHc/FtN6eZSzF3adeC8TIAhud/v
	cFXIhy+RNBbcw45Tg9xehUXxUX+XBbb8xMnjUMBoyfCa3tJk1hAefOWKi9QiGbvY/VGceAaJKor
	7SSvush/Bz+MUkTC+H8iS2vAtM9VXH5ljI/EoZOfdnbA4ZOhhnBfpYJXRmaXOtFt2K2e4v5MZbO
	sefTh6qKmMi9M1BkQdnr8FCqpTdAAwEq1sNK3eTYpr2QsFCU5tA0G2h4YSBPjUcQgm2X4c6gZD3
	8FRsYkJ8EC8yKq+45y4sALptFluB1wYUkbwLhZKnnaS4Xlox6zeGY+STqtTJg9f+vJC27Daa6Es
	SK1tQIpc2cpNkHIHsvxi+eOVEYBKZL3qxPkWs43MrRJPqjqE7Tl0+OCe8zxbdrfhYaFgnHtSUCQ
	B6nAK/8gr67vo3QTVc4af2rwU/XJuYcdzT3Ho8DopQtxPgMacMtkMVFA9ueSE4LpV+8HIN6PPWQ
	eS0v4NONncSUPgf2dvgJOSAQwfVr05J/yrVf5R+SAHhBOx8TPw2fxj4l93+QWVlBke821eVbC36
	5F7k0XSdrnbv+caDlup02zRFWhf+W0ZX3MA==
X-Received: by 2002:a5d:5888:0:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4abb683b6c2mr32518885f8f.26.1795618564618;
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:53 +0100
Message-ID: <20261125145458.2594179-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065606_771129_EB6BDE8E 
X-CRM114-Status: GOOD (  13.36  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

Changes in v3:
 - Use an enum with the exynos990 entry to keep the exynos850-compatible
   entries together and keep code clean.

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..25536859e5dd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -25,7 +25,9 @@ properties:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
       - items:
-          - const: samsung,exynos990-dwusb3
+          - enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
 
   '#address-cells':
-- 
2.56.1


