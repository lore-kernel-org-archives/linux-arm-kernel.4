Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90F606D813
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zr52kZVk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EK8o8ut6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=; b=zr52kZVkxVHoeT
	v9hubBcBqKvpMITUP3ISVFiX1F3edB1A09WYAnzK6Ck6gJPuzuJlUqPO6BhlLUb74wzJAbb0vLtgm
	YrWSW5hwDAmdh0gJ3Fj1c+mPg8K/HWpLq9qrc/j/BIo1YlgtxiuiV4mFAaSPbwxK+LOydSiYu2W8F
	vgj2r2Ga9ZULCaprFeRf7HN79Fel/qndaA5Ast2DXPX4plqx+0g4bXXGAAV8qtHB2ihG4Ci8g8BN1
	0qjIXXIO6RZXeM+bYWZ+qGvRjOvz7CK9BDLiITqZuQTqaLFINjYKZfnCgUg3LMHCRYqmLKAHwSuch
	RFk+6CCiomwNkX7tZf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKu-0000000Gyad-1sie;
	Mon, 09 Nov 2026 00:34:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKp-0000000GyU4-2IHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:34:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so2998745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184446; x=1794789246; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=EK8o8ut6kuy+tdFMmpMkJVDrqty/3QTRERYgADDK2YLBGIc+QDi+b8y/Y4vkam3g8c
         eENYZPfpmCTqSc+Yai2WUUuEN2f1VFupHcJ4D2f0PLqwWqr1rA7UKF3RGJ8mY8d3zJLF
         QH4fYECC+ignomfZJAKSt3NpZz/kEk4TmESNVdqX2jylF1eERAtq0NujydcmgrUPSGhN
         aNtHs/Idiepy2v8ZHB6rbqftwUCrQ6A3KUl9gc5wDZNFbn01z9mNyFh6KmUH2EV1xBCE
         zd73YA6xco6ROg1NPLBFo6iL/fzCle1Xuhi7NWVsnRv5fzvIWulzRFnJby4P7vCSi7X3
         dAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184446; x=1794789246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=Tg/IbeRMwhSogFYDbB30EZmdq579P1hxJxeL06P64C89oEa7wSVaAk4+mFbKcL/Y3N
         /53Y+GTeMZQSvEH1aPKCBA6L+Kf4MYNY+tCHdSN/TvsidBeNk316x+zdNSb5/V+84JWG
         gJuzo/TEpD0g7UxSzar7GkmJx2OtS5nsy+ndtj7UujFoAmsQWYFfXOqM+0YzEdDWLiSc
         DXQczEOhz+2er9LNeIqT6w819UR4+ID7LP3XocvGF2JDKb7rxSwDrkg5V2+WSl9YXSBk
         +X0MNU2gibMcSCFG1e9boP6bjP4mrHAVsdEAbEGyd+K8JmoHLRyl+rLuuFsBbFeGE3la
         MrRw==
X-Forwarded-Encrypted: i=1; AL+hErHsK0VoiTKL2G5fxJ5TAi6AUA6TYJOBqGK3SRcPSwYqXP2L4XoOxz0X4xF6u0qxHkGk/h3cduncq899TzJqzrEU@lists.infradead.org
X-Gm-Message-State: APuU4Z8pTRA3400QYgob6z0m3AipvKlxYqgq1m30zGEv/i1IBkbZivd2
	ei1NpqFBSe6dl11S+Q2WKESDgv7UK9vBxJVyQZnCtz9T/yXbhRaEuesH
X-Gm-Gg: AYBFou2O3caBZLVFd3XD6Qgr08HfVjHycLpPN8IblMMrsudPiPLa14hy+3AKJ00N7V9
	UoIDqRQxlwL9d5AcRDPWq99T9YO2bImWqaP3fKreIEZhuXoEpQcWKJ/08L3f4cA8MEkQ7nh9gmy
	qxFzW4WCySR2buJlZBw6KvU2PoyR9405Q6v31jxS7pqNphsL5CN50Z1IITVibc/6ZhNOPV83+1B
	SJoZ2YJv89+I0AwfHmTx/j1BExI5eWsTR3hxpARYdJGApOdMKz0p07WDTp0+ft9dk8jM7k7+1yB
	drnaMfySYRwD8mTkakBnTEBs1s3Vl0p2/Q4A2nu7VsnLycQlMuRqokSaw5LUnrpHigWKMHve0Xf
	kWdqTE7j0fPy98IjQKpusiY80aQW/8IbcQqNxipEASJn/ITopGZFi+EDKiwWKeDwmcKME0R5kkw
	/WNmbdD8Sn7fZQvLdIqmUGVLWk1Bs0epdlZfhTw58KTyoryFxMQNqcm7k3QZJ6k5e9b20wtc71b
	hECvMllYSpf1UmtbacyUu/Ew3yZ82sOcrL8JIDNwl3W8v4qhei5xKSuOM/1rk6r+T+IOm2SCF45
	2CAKJ7b4hcYyRr1kIQwtqQlPp36FHWFjmT6ns2WH
X-Received: by 2002:a05:600c:a010:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4b963ca3a7cmr51069905e9.35.1794184445733;
        Sun, 08 Nov 2026 16:34:05 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:20 +0000
Subject: [PATCH 08/17] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=4DxRuDlo3Sv6o3VM377FCKNLzrNNMHf6FsM5TYa93t66FIlBhCp/mgcC4QeOncc3ZgmuRzx3Y
 hjxDAxOeJv2BA5u50QEvvg0b3XgcZ1hYXm30qFoJ+yx+NwOICn4vuuC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163407_631287_2D7FA434 
X-CRM114-Status: GOOD (  10.29  )
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

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0


