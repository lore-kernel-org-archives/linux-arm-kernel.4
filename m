Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411E6083603
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dgcEpyjz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xELwVNPE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=; b=dgcEpyjza1Epyd
	QxPQyIr2zbCv/JfELVhpmcrtNWgWlDV1AWEL6OcQzLeFLHUB37SBGk4nkLXRWnQt/PoK4zNnwkvuu
	ZmnOYXASPaym5T7amKZJfbdmvboISFjOsSKlt5HP+5RfH7mfyxfavFSEmpcgwZQVWfiV7Ey2BwFeg
	aOqlTgrshDV2XFA94Wc0HI5pUJRGu2eWCdiomHKDPi1xm8WDanNL4CcGTpsO+/oAUqZKXmhWXGR8j
	8imGk7JgFvMx3GfHqjWi4nOfYJa/FVUAFPY4Q3830RIk8zKawqKFNhFUcAJ+k9n+1NxmIJT3TpaRR
	2QqqogqBrJ9wck7qcu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDL2-0000000Gyjf-3VzU;
	Mon, 09 Nov 2026 00:34:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKw-0000000Gybz-3TXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491971ac844so310109f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184453; x=1794789253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=xELwVNPEpnmrM7MoASE812YJptRp7tRE1pn4cDxDHq+5gV2kbGqzRMWlrwvKYXOt8G
         MhRzgkp+FiWu4zMJGNGdVj/ztrQDTFKWvW/ZB3b52uWWktvtWngSmqhJCHWiNrLf9R6h
         65D+Hs1F5mXihrysGrZSa/hKYGu0yvPyyC2Mb5T1OuxuZBu1SJt9Uyn2YAp4lF4eEXy9
         g/wTVDz9/1mVOrT/eIBy/w35eAIpLPsXYtLoKWNFkVDApWhitXPjjiq54ks93hsXLKu7
         p75P5dImzhyFL06CmlE39dkL7caBH92k/q3JnYFGghVMsE+OABdCO/XQHePG1Bl5iXWZ
         C2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184453; x=1794789253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/ljkdQydKv0eJnuPEQK47y3qmQ4duXo8otCxl59TOE=;
        b=cqi/6IoKIjQZ3eGebu/lfZ8vL8wTTiLTTvLGKvHzE37YHCiBb7BXPT9OnyykEIfehe
         C45r9xnOq8Ahk72PiYx3VtKN4Jx37fmLyB33w1jf9qg7pqEY2ShjzjZMmtL55HwcVpih
         Q7EgtJyEpnjjyk/Vnq1PZ8bTohTUDolEGhcV8SQzNfadIEJBeHF51yOCKMHs6kHq+zcV
         l7uqXiDbPtnxUdUYAnPgq9qsft1BF54nYSCw1QT8jDqHIxBWikt4IOwVMD395i3/1vvO
         nn42ZqywmgpzXwU6XESwd1qKImdhu12pP588JQB4os6GBKwlzLa50jcK8nLNZXGsQN/K
         ISvA==
X-Forwarded-Encrypted: i=1; AL+hErHH5cIQ3C5eb8Rpi1JA1PQQZ8IiCChWxhwQvGAu65sVtZ8/8YmVcOQ0BxuFU9NJOhUTmbNIXg+NvEeOkwuA3Dlz@lists.infradead.org
X-Gm-Message-State: APuU4Z/OJypLDq8OZuuJ6RU7/Y1nC+eEIh44nMAdrX0mPbJghG7fGP5L
	tF/EoqSfBPuGfSnKRdLIjWGSk21Z2Stm40XR55/WU30pEqs4cklxQbvS
X-Gm-Gg: AYBFou3OCDxYGg2Zo9n6OyB91KoYom0ejQb+ffCHNbBV6DKxLBtjYo8w9D7BotBT2lN
	CHFnecsW2V48yOGo5mlIusSpdZtMzNsekzGENaCJkNTImRopiscADZp4XrChnlI9R0G82AbIWwX
	QgV9nL28QSQCzbJyWfj/85bu74ACh4a6vY5skDdSPcCLLuZkSFoJ5UtONkSQip1Y2Y9CMY85f9y
	V135fUzXbRDDOdOeBYbyh7+EH5rFPrEFqdrKd6O4els1y3bTLDG/+uxo0wmoTuxl4DG5dUdC/Sm
	Pcpf7VJTsYtcHXP7c46i4uw1Pocj7gOmIh8gCByXFMYoyvZuTWotSf9I4Tg/B1MLGVuqd8ZtMmV
	Xbvh4OGKry7QaVTRfEvFG1cjU6PdW+qbnnq/Gg4NXa9DSHbaQQc1pB4TRs+KKaORPPJ3E5KXov7
	/MlGZwNFGFIEX4hOSJPYbWfOI5mtDOSi0OnQEJbsb1Owkdc9RdV332stKAA9uf1E/e4adtMi9Nr
	N9W5fZ9bB7I5+wKe2uI40FQBtCu/AdzqoytsDAleQApJng4UvQT1sC3au0A397QEUmrtKtTecIb
	mYytVyu7fC8FHpCfbpioeL/gG6uS79cWXjQZsULP
X-Received: by 2002:a05:6000:40db:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-49585ca3e5dmr5109174f8f.52.1794184452788;
        Sun, 08 Nov 2026 16:34:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:21 +0000
Subject: [PATCH 09/17] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-9-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1028;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=e5+pG0dDXEqC2bp77Ez+oDydvwUzWtL2BPwcLeGQJvE=;
 b=iWkySt37dA02PFmmfguFJEKrCwxdhGzWk24XOJRJESzAH3T4aPp1n4WJJawTbnHxhzVp2Ej2x
 6zP4CwoB/ABAxTrRpUZjqAEi2nTiW6DG09fAo8ednu84TwNnmQyJB1n
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163414_900192_0FED2380 
X-CRM114-Status: GOOD (  10.27  )
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

Document the UFS host controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0


