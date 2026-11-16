Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF561606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgub/G+t;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ViiEHNyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=; b=cgub/G+t+6PRmj
	Zj+5oZ5IGqAGZIpZmq+uF7XfbcWQNbWNAXvuQOnmcJ8I5YN3iHAukQB1OktM4lfmYJNoJMQ2SqaXL
	sgmDRyWxLT/aCZFbXAUrrbZcd0UvPMF+V0HanTvnOdH6V4boiSalk4JvCEdS6ZlgyEXKL2SCfVKp0
	CQAhThfe9p4STBy6dL3ydCY/Eg1tP9ewJbecf9WHWG8uwsxEzjUILDPBuKL67m4Sflg27Qo0Q/H+1
	b1lBbSgpo+eKUV5O2wvrfyyuu0JNIKmj90XoUlY613AoloTq3fCwOfu70AGOi7ehRlpT1G0e8BdsO
	DLCeFQdPH1ys+S5LZInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Ei-00000003xpv-0vvJ;
	Mon, 16 Nov 2026 21:27:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Ed-00000003xkX-48ww
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so31176435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=ViiEHNyiYaXdcXUxoJy62pQJQdPGphE1TzHraJKb5vXaWXRm9ZDuj/0jiB2IxcFwX5
         65Szp1YPHJl/YiyEuw5O8rpMM4ai8IUd5grc/fm9V+Jc0C8F0rDGUwFRUkm7gCsOnOOp
         ufSlvKCFE1E3BZojw0VLXdDOiLriykxk415YaBfOWLA4L3EvGkl35b7g7GOhUmVHiUpx
         BSyGvqa3KVJHMpPFjx9NQ+QGzw1vYcQhisQ84a0PADIAJEqmJdTEoa80RCJGSoqNxbqu
         nqVqrrcjJITxybMBsVVKmrdpuQcyh5pJxgozDOLxxI3XQ9YYu/+Z0C7FiZfUXG8da8E5
         KL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=wz7UTkTxzNv+EbVh7W6dZEH4M6O2nmbH3YHUz1UkXGC7md0lcUdwO4WjssWE2lwTkg
         +7zBpMPT35PKHig7kGmVuBrkJr62AYs/o7UnWSUn9fE90iDN2zpPVlu3vdzbRvwWGlzx
         Vj2AUREUbnBujmyLa0NYHMKxOzJi/l2K9QV/7GJms3i3So2J30BazLRSkGxnSaOtJbF+
         Feo5t88Yf8FMKMPZD9LUwOOnEL8+Py3DU86m6EGTaGWEqPexJNpJIVZKQnBNvjaM2EpA
         CuJObf948/xduEHYtdBJXjSqdpMFe2bqyCUCpeC124CvhZIbXecatmwSpxftYDyK6fjJ
         AUyw==
X-Forwarded-Encrypted: i=1; AL+hErHmknYm55umYaSO+YBOvz4du0hut8OP6thpsrSnDnxkIdT9+GOsmW2I553wA/iunQruFtIUphJigsxeLkzIV9sN@lists.infradead.org
X-Gm-Message-State: APuU4Z+8GwZyyoOiQg2mmmYt7+/9yniZ30AbANkJyPISgsHl3vj/3n7B
	G4kkk1Kk1a1QAkQ2FOoZGonIrQu5/N7wcXTyKwbf+I1K+9ERHVz7D8ge
X-Gm-Gg: AZFdTZfQeG0nkTaMukms1F1FD+apQz4Qrdewzv8QThLJ2g09g0kB4GdsTtbUXMnc1Lh
	i3dYnlyTuKjLDHm5yNqRUJwGpaiVznVcrEjnGXYUv56yf5g/jfWC8NwdT+rFaCj6dY1nXxHPlRb
	rfplveQ0mc6aP6nZ9jGQS5l+6IvA1UdjR6tb3qmBtfrzbRsFd7LgX2iXTDZNwNnBkI0yrJeRhf7
	6uwGovZuWLqnqGbiVw1XoHmtWSq44bOmFdguh45NpSK7exMHxhIBN510CfkRkH6pCTeCooVuazX
	2FaCoIgUxmq8DaeNsCM/C1eL3PTJ1FrJVPMGIZqAYXCS2Dmej4pukc4HBiSY7clgjv980PGPpmD
	ytc2oRnGLctxEs9cz80TnpwBNALyTFmcnEfxtx4l4+y0uSt4agJwfexpT2Ynuhfe3H0bJdzmVVy
	EY+h0HdBLqE3T+tIHIrNPSgSdjkTP5Ds1178Idh0NdZ7FRxwzaqN7iplLQK15JJeaXGE76EcSzN
	5Y8nnnPVT9MdgkZ+1WTJBSEteB0WVvBbmBOZh5Kau/tf3KJF6mrd1j+RZAV+GIKxjgHxOIf6nRt
	BWEh/r2RQ2mBs5lXB3szDCZJc3+GaWu4EA4A8xv5
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132732_056289_21DB76BC 
X-CRM114-Status: UNSURE (   9.93  )
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

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0


