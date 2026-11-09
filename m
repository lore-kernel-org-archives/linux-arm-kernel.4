Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nj0JCDUH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8R5rbl5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=; b=nj0JCDUHPbAxg9
	yhdZlbmYesJAV3lC5v/Z4g6ayfdVAKcSdHXHNA17VtK9I1axW8YZMAHxfPFN3E+4hHRtyfcqORw2/
	CsF9qxKKF5CSKvNXqg11F9SjTaPJ7nV/iTvQgVntiv811xCaNS5qiAuKKkeuno7jMmSxVaNPrvpQ0
	ONBuYKtnynWov6M/1ttEJ1JLPUn0co/Uq6pbFbwfJYAauRF1UQkcExtv4NTG1if3rdeFexSqiCbLq
	AoQEdwHLPfJomrJ9HWY8tQ+YZcCrKi4jTaoklylF2xQWAxOG6yum3x7qamk29oZvxvqaIbHAcIf62
	ZawooXnvO3L/wXi5iYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDV-0000000HL0s-1YxN;
	Mon, 09 Nov 2026 04:42:49 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDS-0000000HKyi-24c4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:47 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso701956eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199366; x=1794804166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=;
        b=d8R5rbl5NO3lSWJOsIxei+E9GACCA1RlkF/Jnp0zEAMnyjPB+7rqPSTjWjEic5krM5
         GE4UsmnXb97GxJStR08VI5t1lw4+641A2seeKJi8Z/PEs6Blh3jM1DXKo8hE9bD66QTG
         uBq/apSaD6Ma8higCRF1rppvifdxp9eyT49jDjCOQB1e8PQFqB7muC8R3ZrL7Kso4ngz
         /Wrq3VAyHBvP2TP4GAneZ0DlRsAOtLtUQhr2az+bFv+ZeeXTWgaHFjXUlQQgWAZMnLqk
         FZIJW9LBJvrnKgT3VGT7pDyyTk9bJKQLi5wSOg9M0SnTbeiqH/sbO5WWsGDe36sS5ptP
         d2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199366; x=1794804166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=;
        b=H78W89PiaNFdyc3vXR+49JcdcFrHDpzqNg3OSQjuM2Iik0q9JotmHiNZ88IR8evYT8
         x6wGC9k7RywAvP+A1/jKCGijz8/4f8zgXnBCR5OqIGeok7lp7GBGrbMa1oSURfIFSu+4
         buS2xK8X54Cnp6JYU6FwU+Jdfbx3Dut7riG6U2EkydVNbOS4BIfLCextCkxG5lhmihRg
         F0tzc2fu9t4/TrEDKMRFIW13fXKO4GDsPQu6C261ShQB1z2EKxWD06QjV4ab9sFPx3OS
         7epF0OG52DbrmmS+w2yLJihMG02pkVQSBNFs0W/6v/2dyKqlcLSyAYBvWGVc32f4rYkt
         8kEA==
X-Forwarded-Encrypted: i=1; AL+hErEJhj0xeQvr4cVRlf8MC3nC2Sb4v/+WQK6/rixivYZy9NL/41OCCkGaKt9P/nzNuCOAcj5kjzan/3Hf9kNSBp3p@lists.infradead.org
X-Gm-Message-State: APuU4Z/6G215V6UjKF/qlKmm0jGANk8ZwGjo9Wbt45UWUiGml1IZxPod
	z2qbFzheq1vu6/RVAvG8kyQ3Y0FgtBgZVDWmEve5pn2LI66iKpE/G9Uj
X-Gm-Gg: AYBFou2pQ4xxC3e4fIhmfMIw2FK/HgG+4DQ3VAK1dXv0MAelq1PELjLtstM5iDw+RaR
	jpFLxKPw7eCI1gFh2r2B9L9wFrVtyv9o/KV3T1wz+bU9PffKGOeGqqiIIGGAhycjkn/ZHLHwnvb
	8tVAWkGLiZdMBAyS/pttapOMpb7cWRmJl3pdtTgWvbKjL3zM+CffXfLvoizHq3IaY4bR8xYX34a
	2s5n0kBXD3XRU+uS+Od1wL+RqnnB5QYF1B3/cLIQOVujT2yjre8A5A14P5Riy9ANiPITfAMcTJC
	VvUq5eoN01oOwFyipfN3AAB4miJmSBSLHyQ+Qj54tl36yYjfQjNJNACpuoO99jxYkVzXpGCMj5m
	AARoa8Xa6mhJ+xaqls3QZQfSQsgtpxZ8bhxNiefndj6x2UY1kd75i63cIe7Dxvn08f1pCB9WV6R
	7oxfyBqPH1QUDPa23BmfBolqZz2lhLhrDFqmryNMlFT/cDAZcp+luSnWbD/6IlLgtkWIolVOXaT
	12TqVpkq0cC9wsc+V2sjATmxjltSJ1iGgRzlqjzEtn0HuWWEY1CvQCumTgrRqSqxvOdh/fqWGm8
	+e6pUPAZ21m0EKJs6C9omQlpIpUNa4JZendP3lLGZCApME0babBbUWkOXNT2hB4l5cZ/gg==
X-Received: by 2002:a05:7300:f14a:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-37256aefa73mr5940591eec.41.1794199365785;
        Sun, 08 Nov 2026 20:42:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:45 -0800 (PST)
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
Subject: [PATCH v2 2/3] power: supply: axp20x_usb_power: drain vbus_detect work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:11 +0900
Message-ID: <20261109044212.1157357-3-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204246_543183_0162B1C3 
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

axp20x_usb_power_probe() registers the vbus_detect poll work for devm
cancellation before devm_power_supply_register(). devres unwinds in
reverse, so on unbind the power supply is freed first and the work
cancelled last. The handler calls power_supply_changed(power->supply) and
re-queues itself (and is also queued from the USB power IRQ), so an
instance running in that window dereferences the freed supply.

Register the work cancellation after the power supply, matching the
"request irqs after registering" ordering already used below.

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index 7625366104bc..f6a7dcbd5a01 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -979,11 +979,6 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
-					   axp_data->axp20x_read_vbus);
-	if (ret)
-		return ret;
-
 	if (power->vbus_mon_bit) {
 		/* Enable vbus valid checking */
 		ret = regmap_field_write(power->vbus_mon_bit, 1);
@@ -1018,6 +1013,11 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(power->supply),
 				     "Failed to register power supply\n");
 
+	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
+					   axp_data->axp20x_read_vbus);
+	if (ret)
+		return ret;
+
 	/* Request irqs after registering, as irqs may trigger immediately */
 	for (i = 0; i < axp_data->num_irq_names; i++) {
 		irq = platform_get_irq_byname(pdev, axp_data->irq_names[i]);
-- 
2.43.0


