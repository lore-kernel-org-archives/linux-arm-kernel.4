Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887BA60A3822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fi9He+0i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DzDfnaSh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0EZEb8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=; b=fi9He+0iO+MLu9
	jOJgsvCPj2jsjg3vDfjTqB8Cyvvi9sDBgfCHYWRT2xfOO0u/qO1sejGcL3Y/gaiQ9LEZc4mmDCw2+
	SXxvplWMU2awbnCL4g8X6MuP6HEQFVaU0gse/UAsVyAy25SB5achMZAbhg5Ezqtjg4A5UCkFN1Mbu
	PpDGd8CFzX9Oy9XK206XUTR80/UnkXAdphA9uGTYGugFest9ybbAIoDsH9gdD2qeK46TefQcDvEKW
	mK+5bnvdzLBL41MT9UvRdRNhYCjngxuXUsDpO+dbViRo3G6pR1jea9D4lUq4jrPVN6WZqLvRkBloN
	l22Zgwr0GZ5TyUfmaIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLS-0000000Gz8q-0TlK;
	Mon, 09 Nov 2026 00:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLR-0000000Gz7N-00Kt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 00:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=; b=DzDfnaShSgdoIN8TfmdW+svcUb
	8RDiqGeLJoqMC5U7OL2vCg+h8FG4h/o6+HOdiT8KG9CU35LwAuf5M50/WtCECgHyisIiZJ1Wqp8Oj
	X9y1903dAjWxEleFj1lVL5GHJWnf7G6RQsaFUyOutluABnkRK5D6yd8B6ucG5ohkrI9/vLJMDa/Vb
	Ymv2KTlmxfKtKdTUBrsaf3ZlkaQoUoJB1hYaIB500Bd93mlXoPX7WWQLuaMYdwLWxRBAbmM1zE07W
	GEs4ohVIC62TT3bZ1bRs4jb6hnJuYpd+jyXnYGDHOuGu1RCWGPRpEqwZCJo0056eF0Z5CqE9EIVH0
	hTx1FnTQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDLO-0000000690K-0DEq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-491846221ffso227766f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184479; x=1794789279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=c0EZEb8/6+L5YeOqQ03P1HKjSOGBnhm6yuwf5VO3F8DRs0TTjpOJ2LnyXL0AulbQDS
         s3w1+mJh4ERwYR5wTndECi3/1SOMYPgG5arfiCpHXNYXwz/QY+lP4OZWt3TbYxuaIKw0
         TabM02VA/5+pFLR3APxbK85ukEf5YC40a3BUhLbvuYcqRYTdMQUsOj807IIJ8QGPU/8G
         D+CT5HRVkr7BUMJNZoexwjHcW4BKfIzvimBKO+pTUGqXqlzDZcbPs04NSlBkwzCJHdUX
         cUWG4XN6Rp0N1J2ZR1ZR5ZwFTdg2Iy6RjwhmV3LjScXkFCwIf/uvp5suWroV3bR819hx
         CLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184479; x=1794789279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=eQbq/elOcuqpu0rlfvWOJDcyCM34g+1rvWtawbFXWPwyDqD+WYvvWgN4qe0lxCUHlh
         KwBKLD8wnLiVgMIZFwNytDyTVXOTmk5kMabobPn3wpHBXciG9OKlu0uPFIXF0N/EywSZ
         L4f4N1N8d/9c/C/Ug30X/UmnOQ65UQVVsQoNrwHV7LkLvnkzewGmIUGBozEI3SjR7xIF
         8OU+lsG76ZOfMhlTw+3RgTNaC/ShPw0CeL7AHdggg7dOVxjs46ZaccEXS9suJWlEPdGl
         lwFnTfnCEVY18d3jem+0lJgCWE/hc8kVrii0nFDgKXW5Tk74mp2+b8TUhSehvcBhgZXQ
         7b8A==
X-Forwarded-Encrypted: i=1; AL+hErFLSwyW2TXIoT+mUjhD8Vsk+WkaVVJVg7DglmgDIftH/Nr9aFaQ6YEBu5O+8sDs658CVUzHjOh0YADonm3psghO@lists.infradead.org
X-Gm-Message-State: APuU4Z9G6jwRhXp5piM5Gz7fpULRvi1vbQ21VyaFR8ET5TBDY4TDg+Dz
	GsyRBFNbpSkNwanSl41pdb6fNdayyDzIGa0GHwqQzAgVCRnk6ukp+Mlv
X-Gm-Gg: AYBFou2GML7bW1CIFbXiyO4k4qu9e7hRhYLek3GhYQ7mFwxjURDNqE3WZdCYB/RN3Vi
	SSDqr9LO25DtXC4hUUaJjaHqKqp9poW0uTsbpYse+AsI3v5ZVUsYDpLMGyBokLX81ICHYbsBWd+
	NvjvenTD2X5D6OvANZi230h20udlz7daGoxuBo2IQofI2OswS2nSsItrBYTb3rO010xFaWTSh+x
	T10BgT9Fo0kIMxLT21fUarf29g3lmqhpRpfN+fKESJTRt7OPpV7XkxrOptMG+gUVbBlJ3D3sjwD
	2mrG4FW2IaVcq2ftPAJnEW5KcXbrN6z9zk0KFSaV3NWFHKpzWr0eHbDOqvf+rhyIKp36sIZ0pnq
	fJjvDHK7z1jcZZ2kvZg7qRq7br1iugA9VYELLoen/XJmq/m1ftat1lPAnWhgFBSUftuDaTO9+SO
	UqFuwQi829s6b0Hcynp8a5DIztkGyn4a7mnLErWReNRJManU9rcL3cZVAa5GFUmB6L8gk6BIK3l
	sNypH0QzGJgHx7udvcbrGa5OhIYzGs/BuHs54OeF/k4EUjfV0fnaMeeX+WqELd9AOi6UH4wqTzx
	i1xIoa/IqTRc3dmzRBB7+/iupLIBFVfvs4ahkm2V
X-Received: by 2002:a5d:6f0f:0:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-49586a3c015mr4911501f8f.3.1794184479389;
        Sun, 08 Nov 2026 16:34:39 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:25 +0000
Subject: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=Nal1T+ROAiQwIycyxEfKMIQ4y4aGW1L0uJ4HewmCRmGIZfSJuQVD6Fg2qPRcOrHnEpA/WiD2I
 u4aa5TB+J3JDBwhP4O82nlPD61zqIxNlRPMGwQQVcuKGnMJPv1tp6Q6
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003442_165514_5C89A51A 
X-CRM114-Status: GOOD (  11.22  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0


