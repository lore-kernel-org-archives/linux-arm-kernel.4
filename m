Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF9606D836
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwPnay7y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyOCLE0j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=; b=EwPnay7yNSJFpO
	Oud2S5ZwrthmZcjlh1uty/h2Jx2kv8OlA0f1rPTJr/bEpd2Np4LZwIU1EbVJDpxE73cSeOOG5vnzW
	yTU/DhjhaoZi3tLfrWJ/sqx1QlZdnpI7/LZrpH7HR2VJ0K1/X5K1VS+2fIc63YLbqFv15aa7lQtmf
	oX92D4+FHVI2NQoh+QQzrsZ/fETFCMoT+cYiHklfce5YQvFf5WuSMXH0JWG5by5vUQwhs6uJFPed0
	8FbMKPCNJ7W84iGa5lkTjHjkodQ1vIYcwxgkJ8UVwX4ZCRtAjYU4nk4dcvTOQobtghm3l0n9LGgEn
	awH16YApX0Bm++29Zg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLN-0000000Gz3y-2WKN;
	Mon, 09 Nov 2026 00:34:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLE-0000000GyvI-1pu1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5215945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184471; x=1794789271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=KyOCLE0jfTBeYv+L8nhaWxaC9rJxpmvqewkqhgkH0gjEagIvX3ro5ZQmLWSpTkZ87k
         jb9/uOWRrFNXkHXEqnXh+E16m9GR1vzPD9FKRMucFvoLleo9+1QeAHOXrxxUtFMb1ngG
         4jmasz0xhD3i8MIvrrzGoMi4VD9sgX1TiJk/D4w3fd3QiaLKjfUPdOd4cXjVihKRUtDc
         6EXA0EjY/W3V1sR+VgNkTcMBBXORMfKJFFwRy8G+uhFgKJn/NNN237rRwOzcuE9gyVE5
         YK4f12jIkN8mAt+etI+mfBJjRjmNXVpKPITJB8z5tcMvQxvadKWpy+G5M1JjsSAC0EI0
         9rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184471; x=1794789271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=hTclNPws5FnpaXdDV7waY7/K1uSMXSMY4YxOOd0l0Ajz/P4LkQkGFoc/VSA0tP9O8v
         3m/4sdxDaCxGeBg4geWArX9eiOMEAH+AFAZtPCbVezHWS29xSLzmlOj8+SB38HQdu03G
         QeZWx1kgK3MFuXCdrqAqdsnR/FsXhvC1vaaPc638JYZErm8G3vB0vtXks3to49sbdtNv
         R5R9bTmwPKM2rBUcR5zRPmBNmCXvgviEDbl5PtZCq+H/KjmbjY6Be/R13hWpN0sBDJZk
         XDYO7tTwulJ/e5wxyqiddRipHRr6ztYVKHqM+vkFDgyNlyv+J5y2gZWRpCZuTm7yXcfx
         1wuw==
X-Forwarded-Encrypted: i=1; AL+hErFDtEJ4pUZCZRZSFhx4pxvp/nhNBuMQtLQzIDq435uSEeKnNW27uEhWDrAuWHXUARTPunWqcwrejrzmRC8qqFue@lists.infradead.org
X-Gm-Message-State: APuU4Z/MZ8TlmVJ9JUCTAuA4X7ihig/ykRVoTm/sNtmby0UgnBwA8YkA
	GtVrv+DFL1ZKFDZtF9PsqIL/Gr6Gz6Q7oIpHTgcBZbsA2u0OsdRNnIhx
X-Gm-Gg: AYBFou34FAUTk/xRdrhOTM4LTaGZQ2ARFwQfB4jI4AGfohEzx8kF7DijzQLgB7rcpQm
	HtJ+qPDrVMnQRxsBt+rG/7ND6H/BCaOrYDUj9DzZJe80rh6L6MljiSqabqXhw/ptXz8ARCc/3Wy
	6LbU5D11G2KlAijoF2/8WtojTAqL+z0rJ5yj3WEjbUaog6Nq/9OfwVHgSqtvv4/aOLVNVQcc/R6
	V9dmvIAl0HpKwA2hpMnsMyOvVwcOXJ3UHUSAx1vDu5eYUxmqdxHMWnSHHoo1XfQ6Qr6fp7xgzZr
	rkDBX/XTI6eaI8InjArJLVT53CZyhczTahmFkFy8xXfg33QeQMiXzjZqepW0YhT8jf5bkWxY3Lz
	b9itg01XceHtuodaSGKtLQAptPsy3C4VENv4ADIk8sAKYsJ+3Eim/+6GDRnqizhfmmPCADXCPmc
	Zfp4aVwj1TAajxlAvJyACbQX0uYaQYP87es2gLNMhnIvkg5keZ/6Yywow5D9S94EaOHRgsnmwOJ
	eYigdy/tmVHeWydldKiqaXlub2Oqc2Ozt5URDEz+dTDzX3aI2tR9tbHQ625iiFWDm/NoRl5NyRv
	/6wKk7b+QTc1ksxTV4MoQr7P0KuW/RaSx5htAh9i
X-Received: by 2002:a05:600c:46d2:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4b963c814b4mr45217895e9.27.1794184470772;
        Sun, 08 Nov 2026 16:34:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:24 +0000
Subject: [PATCH 12/17] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=gh19qIBvqo941uuBuTtSY86YfaNCAEdG9vJI0o/4tLOqHDCaja10/kLnOnTQrwdqkmy4TCdF6
 7e+ZDYLm+CcCb5BN2fAjGQTjhEqtQqzl3jdn43oLAWX5E1v6iUbyst4
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163432_519166_062130F3 
X-CRM114-Status: GOOD (  10.48  )
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

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0


