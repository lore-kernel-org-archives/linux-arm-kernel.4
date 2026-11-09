Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WjNeJy2D;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9364OTQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=; b=WjNeJy2D4jClmG
	qjSG/2EWNKl2vsAh86yMm6dNpoiCuOc1ZL/46Jz3uJLu4QywKSQLoZoxMpDGprXhA6ShlPcTMxOjH
	9IGbHAJuBs7T7lPi7qnVRFsg9rF5h4loq5YoxevKbf3reZNEeqH58YMLMDMg4sDQ5ezJMQg7+rUKQ
	08mm1/EMOqLQPeiVJXmuNE4QdqYcOGpQAKn5hszWfmId9F021EM7rrK4Hc3Lh5rOioTbXSBLW+J4v
	dSD+aj50QXN+gn7JnGVUGfPFgsgl6CkP+PlZfPTlAdiO6OHKOLIAN0EcHlPX2s+Nc37/wAR9H+MEN
	O/5TYtzkOrLM0uATxIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDa-0000000HL6H-3Jbu;
	Mon, 09 Nov 2026 04:42:54 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDX-0000000HL30-2Qqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:52 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1130447eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199370; x=1794804170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=;
        b=j9364OTQTl+8ipaC0kek7uaL39h0a+AAiqcSFWqHOMiGSS6IXCOMpcaM0G1c0LCW7t
         35kdpDkooO8If8dvHT/ik7FJUsMyph1l7IDtq+xHO0YRUYlQZQq8L+6hHChK4F46V4ap
         IIHPtn82gKCY/Z9JEPeo80sxU0+e075wPR1ODEPAZi9Ih0MLdqQDBeXyp/30r+kpnfzp
         iSM+y+b6GNVqiwOrNvtovNjFK2l8/Ss4regIfEdOLV8hEFUJnLEbSTFOrAxklHLC034R
         /L9mCvkO47NpCYjXYj8OhpUmwULRlCe6UULfzJGtBmm0GQuhXebf9gHDX6Y3Q7m0ooRg
         d/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199370; x=1794804170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZy6juQ/C2+U+L3WTVvMgyAkJHBU1cX+JxwPunI95Oc=;
        b=PUylgGEDIso9BdqTJDPq1x3aJZ8bANkFZ8E0LVAJMDQfPEC/zweW80zuhFrVD9YEnr
         SvbvwE2B36NQgnKdkWCMnSo6lnX8+SCtkyeRAQrFuBcAZtc6yn4HHrwezkxle7zrfeGO
         b7cvf8iZzXPDfAvovyr0sqUEk/ktzoRwapzTKt1A+1fMDba4HQl+NdxNeVmIHbcl7CnM
         jOg1gQI8chq6dMomQj1uwArzaZOFv+6kZVwtBLTI9Sql5wYq9+yWtlrx1CvP9//aZLBf
         CabQER40vpYckD+rZR7UwxCVASlyD+OrZA0EzG6Z8xegsHXgm/fN46BrrkCXxFTg2Lep
         /l/w==
X-Forwarded-Encrypted: i=1; AL+hErG/yV0COVO++fJPf2fflcn7+VPHxs0fE1QbL9B3LlJxPdyWuOPWVcb4a5mE0F0axZcc+OY3U3Re475YwRGMXxFB@lists.infradead.org
X-Gm-Message-State: APuU4Z+I6E4dVqG1OP6sQz4Pcjn377lbBvDq/Gwz5T2bW3G0Ce0oE4su
	mGHLKnanQPOVBIlhWlQpHc55fxcXJae1wbwmxB9P5B+flNpKGkLnSJEP
X-Gm-Gg: AYBFou28v7jPB0mOYCR1vs7Pc97x/Bq37BIYBx8EQ3OsHXBHHCGfGAD82iT6faNvRP1
	TFeTuCGwWug0oQX+ytamEZaRfJpAK6ZOPP7XWb3fLEbIRBLvja2yQJv29uyXU1iXZ6ZtaDZ4Hss
	5pcTsExkyCk8Co7KDR+XsaiQboobHIbxnld3jnkO/EHycqnoK6Cq+FAqQu8oi1VhsBaaJmCezzp
	L6Jxau+4RYsHJzCb10GaEqZqADEUn/Uj/T5rwa7aXZdnT2wuoiTb2p2f0o2BwK3qmOkcV2Bbo91
	9zPIAqTZi3BiysHKWQ+67WVxND/MWRSgioAvGBOsgPcZvZkSbkK58ZzpfNujoLzF/hSe0ZKWaMU
	n1e0Mbj7NfUTplTr241/5eGcDqffaXHKJ6fOk4V83nZTuZ21OonDi/ShKR5ubAxe5kyrdclUABy
	xvxDJSsHdDr1AqUnk3iPfmtrA5OoHw3bb7qLawTm+FWLNdu4Mc03DbeBv0kFBrHyBvhKOajCGJB
	fbDOBvap3DwGjzVMu688aQgOB/wsjR/u5A3bPfyM8j3weA+AoyDugmOL9JxTJj9OxGKtt+H2W0r
	cAs4+nQlRK0Bl/8ywCw8jDkK7jlB3PlArLXjttDowAiU9YE0
X-Received: by 2002:a05:7300:da10:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-3725dd59dd2mr5386387eec.19.1794199370484;
        Sun, 08 Nov 2026 20:42:50 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:50 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/3] power: supply: mt6360_charger: drain chrdet_work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:12 +0900
Message-ID: <20261109044212.1157357-4-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204251_658894_45636D16 
X-CRM114-Status: GOOD (  11.63  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

mt6360_charger_probe() registers chrdet_work for devm cancellation before
devm_power_supply_register(). devres unwinds in reverse, so on unbind the
power supply is freed first and the work cancelled last.
mt6360_chrdet_work() calls power_supply_changed(mci->psy), so the work
running in that window dereferences the freed supply.

Register the work cancellation after the power supply so devres drains it
first. chrdet_work is only scheduled later in probe, so the move is safe.

Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index b4d462343151..71c60ba012df 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -790,9 +790,6 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	mci->vinovp = 6500000;
 	mutex_init(&mci->chgdet_lock);
 	platform_set_drvdata(pdev, mci);
-	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
 
 	ret = device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt", &mci->vinovp);
 	if (ret)
@@ -828,6 +825,10 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	if (IS_ERR(mci->otg_rdev))
 		return PTR_ERR(mci->otg_rdev);
 
+	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
+
 	schedule_work(&mci->chrdet_work);
 
 	return 0;
-- 
2.43.0


