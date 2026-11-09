Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17398606D82B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3stMYm+x;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJRdPldB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=; b=3stMYm+xetP5rW
	BFPC6M4Xelf4EQlzpgWeVJhErT02syZUJCP28QWTl06/67wwroCzvB2tws0igIrTItjzkBRyeJeid
	AWQ6JjER9H7qnPJHqbY6/pWDxqEIiUZ1eoB+mjLXs2QhngmP9njJpiDtzEOVIRAi0Tu8Twtex5tqL
	d7jZQ8gYuGwgFcygxBf0VcbsOTtbshpEJWL9dQaUlbV77+o7yrUHNo03wqd0zCsn+FzTyLHd2e50V
	/9xb162rYV15FEPygkawFJDE3wbNyU88wsYzLoYzcj7n5luM2jxN9f2H8k/CkNs4iC27LbMcFE7fH
	GUCoOUlp6INPHciqoOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLc-0000000GzGe-3AOJ;
	Mon, 09 Nov 2026 00:34:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLS-0000000Gz8D-2YT6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso138701f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184485; x=1794789285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=BJRdPldBbwskhnPbmbp2jCq5U3vCxc9IzQrRpvFhCeN1iP0LPA8G2hI3eMnjvIkM1/
         GC00xljzuPyv4/fGZH4w3N/P6yqtoTBKxx+zW48JKpS2EHAQiw7OE6kiNxHkGaF1mIcY
         OuFTbPhpqke12EwbRi1SjTfdTt2NrFxR2gaQUonjMHkqrQko5dtAkYuLNP9SYSHf12VW
         B85qlUzaS7TgZlZem8f3d419PvmC8qG9me/XUFiIo0m3HtkC7g6KANZDNT7Gm1kzYpSS
         apuVXLdtSznNU+c/T/iGjWLLB7R6GpMDhc3jX4jo0Vr4lcSItYPSFoaZUCRcOBb3DHYo
         hebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184485; x=1794789285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=alGYGblIZ/EFFXnFlMMEzyK00sMG7276KCSvNryuRCPfuzbQGX8g2i0oGWQoeqi5e1
         lKcsRbsLCUK8WDcd+y/ufDYJBv8Q7TOUfA9/s1ofaYnOle1hsbFaBSXrdJCEjEK1WMgg
         KMbcaRRWqJnaDgqzy5031NyWMX73L+vPn4N235Ktym1d+ktcCrcuO6qAxsFFp2bH8BRo
         qS7m5039KWhQC+MGbWT01ENg/byivp7SEgSKdQV9BUguXHel6nSQCkkn3x9n5DaRScoo
         Yq/1hbuxD2zeLXYK/OYwgPdJjOEYyCqA8UQTdu6HO4R0HnSblWs610JagRYck3U3f7VV
         wWyA==
X-Forwarded-Encrypted: i=1; AL+hErFhsNgFyL2xuQs54JoljN1YdqRyCg5iN39rSyI7aRG4feXNWGHuuIDKbT1pBi8nCQKfE+VJPZjx0O8dmyJLJULP@lists.infradead.org
X-Gm-Message-State: APuU4Z8/dZi7Wy5ScE6TF5MN4qrGi8nqhojymP5YA3F0B4WECkgIgBcV
	/IJwzbv6E/9ikgqjd7fhL7xpLk/ItJmJ8jtCU8lCn5px3qEOyTni65WY
X-Gm-Gg: AYBFou3eZEQBFoikWxUh63mYI6+JRxbPLZXeJ2FRccyQUe/vLIMOULHN81ELnI6b7H/
	UoE/wwqho5IeTjoNLDaUzotlEawRwms9/fZwzzIkF0M7gfXVxOg1QTcIcbjh97Kfld84qAXFLV8
	icN6q9KVa9X3x6yuVZqmVmdtG93Q9K1QNomjfWJN6jWkpNXXAdnTfPCrivW5cSaKwsNxrHnOSMx
	qYKWYu49HMFCt5ABwWJ/IWAZBa+MS3LheKW7CShkiadLrKxKKy2F9n9mfyEQfiTZQ/n8NhZtOC2
	Sog5KpwgzAtdLaB9sq62Wv9Yi2fL5sabg3ocvSiF/sCN4YzobvgS7b9slIotHaLhO9dA5ZAvrkO
	5vHs61N2QEoF4iL3n9ERpQSklvZVtQM54mPeWw63n1wyCI2ZARU6DE1dfAWRMO9Ue8+zRY9KQAJ
	kEW7TLW3S8saHrmxOMZB0ImaRZvEVqlrVWpEmHAkSZLpo/gum2FdmSnaMwlqyzI5bmxcJ6rowk2
	t61UDj7SwOae3k4NA2mnSFIUwz5w6dvyHfdxWVVNRiwIO2HWilfZx7mNFOOKR04PYwjYp6sdB96
	XJ9JhGXaG/+2dbLvN9NUsl/uIiNWN/0JXLNWO+Gz
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr4596063f8f.49.1794184484831;
        Sun, 08 Nov 2026 16:34:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:26 +0000
Subject: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday EPSS
 L3 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=844;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gWRtexQl3K6zrJ8s8OX25X6Fe6c5gXvBp3k5tSGU4UU=;
 b=pnbK9TbDaJw63lMsp+XBx3cpAT1m6LlRO8M5pm7At3undTaYtmQjFmjLHcmBIU0XLq40cIoX8
 jdWhe4OxgWuCqPNlp+TJGp7ld3LSdzNJFNkDbr6brDzv5M8VXRxZg8B
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163446_729105_6F8C55A4 
X-CRM114-Status: GOOD (  10.12  )
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

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0


