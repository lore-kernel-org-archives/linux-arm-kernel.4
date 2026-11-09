Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB931606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QmkRZBO6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ax7sJoiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=; b=QmkRZBO6LP9dT3
	iy5Yb44QzXMl2cqH9uuCabHQVC7NDzvGZiay7N/7WuiR+UDi2B/m+AWB+8RysQORqC4nChv9YANkZ
	75GhlwPnfKCYQj7p4cKzMyl1DpHaIkN9jZgu3lbPeQqY6TBt09q2p9EOBIfDS/V2P5q54ztFjlGBO
	UW79Yicfz2qTTlwAIicNyQ99tT8v1NKN+KTIHxUHk4sx3Ikg4c0xXsZne3rHCUeboYuvCdcD95YQK
	wEJkWg1BuU0j0jrHf6SxQxLxBN+fvWTne+5E50hu/xV2Sg9IC08KYkXE2f2a+nVbrr2Cqb7wVhwMV
	cxJWvDTh3g1k9eOuY34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKL-0000000Gy2o-2jVN;
	Mon, 09 Nov 2026 00:33:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKJ-0000000Gy16-2VJz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2206545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184414; x=1794789214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=Ax7sJoiYO5Nc6fsKupiZbL6ctwC4bTNMF3jKLLP3sQ4dgNhQs+FqGDhtGVdQIIVoSF
         iyxCmhf6gXejiautMsj8eqwkYD8a+neO7Fe8rHwsa2UTa/y3+adhL+XpGTlrV9m+a13z
         gbNpF0FIQLMYdkr4ZqtV3MuF23M65OD9xD1FatJYZOSiouqdoJqJb8raKm5JcfBNQ89m
         XRJmxKLpCXLSQUMK3YPXEw+FdmQe58BmdYJkdDkTzlISpHmdB2RW7+qfy+Ap9LkGRDrx
         NfNl6JLwu5oO0f1DkOXnT0AhuOoCI0PvPqHzVKlOi5kV13AMd8/FY9VpSnXb12mc6Fr/
         LuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184414; x=1794789214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=dXlxM5L53mZX7vaWPtHqJxEqRugBJuvrDt50VD0GVN7f9NM+EkmFCdSapG0WriQVvk
         8MLpEp5oHMk3z5eQFZtMAaP5bzbpgaCD+ov1y+qXqwCvpqcmJTw3xNb8TTTIvNDQlFHa
         RLKJ1f1nYN2ATOdyHtwyGutnhaLeDg2ybWJCNz5NgHq2J9eWDaqCbmtAFfspAoPEC0Ge
         lD/yB2f3tefEQoxXWhzkFEgLGAZ9VGhWRCtjWj+sAVbR6l2zvDoCRmEM1g4qW40Z1csd
         NmFNjQfp0fS25qQd+czu+wlC0utDFBsUPuDx9h9UAkxUzHhpPWC1tIYgULhmmmuYppM7
         RcNQ==
X-Forwarded-Encrypted: i=1; AL+hErFjHKaYwQ64pqClL3gmAefk6AurOOZUcBs7vIYOSQSwWtzdhI54KXqHyTODFHnfIm2SMlFbSgJwwe5qDbd6YPeU@lists.infradead.org
X-Gm-Message-State: APuU4Z+1YAV4d+H4mGzqLFBL7QyLaT/Qhs2wgzvY8nYz/ObMEsINiFif
	TPcvCd9HKhekWfyNfK/Gv5gv/AF3pj+AQRnHZqJKU/4qINnbVbhjVNMD
X-Gm-Gg: AYBFou3vRUM0RyrOQV+8s02xMGqeSFLUrszq5+KWXzY/GI8gfY2Cv/WafdVjwSShK4t
	iHEstlgVI64dgCALTdkIlnl0xtRgjN0TClMxoZk0StPkXCSVp0ZaU21ytH3DKlWoT8vrxPzaX1a
	T/Q9ZkrIvUMrBIojBmlKwe1hGsUR+lYRXc9aNPC5qTDHvhSdQ8lLDw7cnh3tL0UREWQICHt0GKU
	1HH0/2XMzTtI0wGs6wjnn0WRPQooKTF4mY8bsP6i51YDyYBtcAuK+NnhBWtbNXd77wGgCT82vA/
	yJZYH7Y6FlC4i+I/nVSvKbK4PopxJf68RI/xxEoac6mursAKG4dnwDxSWqAUgP5dylZDWnWA17h
	eTzU8Pq0RMqusZR00ack/eIO7bT8xNX2xrQT49XTiYzA8uVqsojBOPzbpw+DBQRyQIF62FoutiF
	IS6NfBremLXPK5Z1c6/fANs2bSLAc8c2jGxiGsAPxLn+Xh2SCHfG1c7FIGoT1K0E//lh4/e8AyW
	tNtnkRrnOEIdNpc00qgoZsF9ldxNjDq30/VaQ+0oxJiKohbcMvD0GhgHZ2jyTR60ieNtCSy9EsY
	OeFbZw8t0tcfdrSO6dNjhSmAe7qfvpijI8rxQWUF
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr50119595e9.7.1794184413846;
        Sun, 08 Nov 2026 16:33:33 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:32 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:14 +0000
Subject: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document Halliday
 SCM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1033;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=mntziyVI6wQ2kSkSteAmiaUttlX3LQ+YCHknAe0v+s4=;
 b=6KLs+gQMEgAdwwaI8XXKZHARhr4EIqJqXke9wpzWMnotth4jMEZlLGfBGwMvNoTpcE0tKCN8v
 aRJBBJI0d5iA+Opb629gN3RAQt1TeYIjZdEvW3ChlNmIbJyjVXak7Mn
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163335_661841_B458F724 
X-CRM114-Status: GOOD (  10.50  )
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

Document the SCM on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0


