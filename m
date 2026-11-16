Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328A5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t1Huathx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQqR/o0F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=; b=t1HuathxKR7uwA
	Mb0fP11VReVZHsThIPwuC2LzQw49s0+oXf7bOOORKjRHqp5f73RmFw1N5fkiqh1LMgYCU0GCRzhIB
	YR5UaMMPDksWJSvPXAOQlo+K3dBeOMiXvQdd/yzou7kdCtqpUC/aqc20yYpFj6FZpg4qLbC44I9iZ
	cNIJXEiFo74a/PDXzCitah114q3IY+brlTlc448/iifetL98LFUG0lbZE8IT1lPUvyJO/E2W1+J3P
	hfLZDwwryniDYsF4v0f8F/DO7WyRrmyIL0+4SiKpbIpxPWoAwXCzLUjrPNPjTkKW7p6LI3EFIo3kH
	2xhUB36N/azbCpB5wclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy4t-00000002wSw-3cfR;
	Mon, 16 Nov 2026 14:53:03 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy4k-00000002wPm-3DBM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:52:55 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15ea896ddc8so5302824c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840774; x=1795445574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=UQqR/o0FdcU7zCMH0SYD6Z5cDngUi++br3S0hZFGpdTuKywqRQeraykTLfHwujCvvl
         TNSb6v5b7KrdpPgq9XkEccedTDb8X8QY/tcJJMnxsc6sntVOOTZdLbvobbhfoDfbkV0r
         98xeEBZmE6V9T6YSsZfC0fg9GuJcw2VE3PAQvhpikdgWKh+IOPHWws/TmnVOaUkBFHAO
         nPBSzVoXyXpIeyV7/2M49bpH4JE7U8lk9lkqUWHiS8/FszXSdouYarQPejUDun/0g18R
         fHFgYS6rlkXSN5rWB1m2gJUb8V0YWPIVXG6HxzO/9+PK+hzCZ3NAphcR0TCxfpfj/mf9
         gZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840774; x=1795445574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=RqMytoHDSVeNQ2apEjnf5BwcVCmhI76W7CiUuYTSjvfVNQVdfPl555y8fWQvHbBQ95
         rXFBQvoZsTEJWNihZOqFlHJNwCez1CI1Wt6HQ+QIRv0thpsRCoQ/thXSVN2/PSJt7AxG
         mhQ7Zr5KH3JkfsS6z78RVmAaCigfpWTMwo6vh6CoFK+fU9/29ngL5Emc3OIp4KveAlX0
         NyVqwRmoAiIFm3KX0DG7Hmbt5Vst7zKAVbrFwijabe/r7TjY+KVZ1OjhDXTeGX2dBW6j
         rkUCzFMwOm+jdJGIeJiKhxNBUYrIYUwHgYetN9nU1lfbjFDN8wo69KfuzO+At2SFZl7I
         47Ug==
X-Gm-Message-State: APuU4Z90oLR7uZgt+wHpjyMhAA1bDbVdu3+Y1NDKT2fzBXk/KYf6r0uF
	mbktWDLiMCPMfDud8HqWozC8DOD9eo6cLXHyUidY/DUs/Zim5jBcC9O2
X-Gm-Gg: AZFdTZcmu+fuCAnESiQswakP458+oiVviZrPJ8NG5GHLKdtJi1/RHsixr6hiL5WpHZk
	8vO6SYNAXRxU/dUIS/3lngivyu2hgXtwnzdLsyFE98i3n9Lz56djBMrPO3RZE3AOTn2w+mccQj5
	QXycGZzYKMP5jsPg9zfqK9hN0m59n52rVetOlDW069+/F4O5RFXolPr0QSA4uYk1mmvU7F7Pve9
	R67xo87TwuhJ1muHZVOD5kE5hseG3K97kEGRMlLbxAgMgmEIQrh/Kp65EdkZDSmwE67HFJrrmnT
	Mzy0FN7xLJ+qmd/XQKJnjBhDvHnYUkjm7C5Ytq9me/DSO2v/8pvDVxZxQ0StGnrVItDajKgtD/Y
	a93UBh5pSqPfHMl9I44qNQARipgy8eoTB/r1CMM50//IL5Me/ZuMl3h31zNisydFoEnNOIr+wvE
	44sQjHiSTJk1wQpW3+xjBjybPMkO/Z7v9DaZNXXiCt0fT2KhkXhREiF+gGnz26SAMiDJMru+tR3
	0SoGpGGWG38hKnTnxIl6Q0aGg6+4hnbD0/3RlYUSB02fW0dhKDr9xvbN+9mR1wIet8ZqhAf29Zv
	9+XIDoL4Ei1tcOvEKY1nM3LJ
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9856188eec.0.1794840773662;
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:33 +0700
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065254_824738_CDE9183D 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0


