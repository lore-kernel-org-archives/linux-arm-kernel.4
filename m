Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPRuBwId;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3gBZgFS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=; b=cPRuBwIdKAntAZ
	/fiKY2/VNz2dB9P97tIHb0TNo70y3e+mgstQ+Qhhj+a9uIPUmWEcECmGHJH8gqBsXNr9sPhguI0i+
	qa6G4tLHrBMDI1FwJNoW7Icd7ibUp7uWAQubG7LK9i/hwCSnJd1NDfTEAW1LgHC8a5UcsM3rPGNqm
	URsT1I7xDNphknPRyM/tgW8ThCLMDmQdywWo9bi9FhNRQIclyvtGipUDb8A/uMCOpB/3pKasOyCs9
	2eWzxSglV4aVb2nPRbAi64UfyiUXqBcM9MGE+kSXx/dMi2HMRbk7+eDdN0bb3bFhEWEod29lBMfz6
	itXVGOz8IT0NRmnVOdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDS-0000000HKyH-0Wq5;
	Mon, 09 Nov 2026 04:42:46 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDO-0000000HKwT-2ZFI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:45 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1185367eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199361; x=1794804161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=y3gBZgFSO8BT2F8jFMkHnSx/cwPaPebQOQrN6dPxbfz9/s2Ujnh4vWqZl0KDdgFcHi
         WJMlaMnivFKP9Eng1MxAx6+UKFfsId9Fqf1sygr+/lruo1T66kFNkyYJizvqexDll6ED
         Ce7hf9sPJAyR0sVZ1rOZCXYLQp77Kf6sKjRopdkrCR4Cy30E2sUC3x1ISfeFjJ3dnzPg
         sxCHm7qAb7XSWEDFbqFyP7AhhPkby419Bwvcr3l0GXDyNHuqx4jeuTQucH9fXVNqNIRO
         po/M7WG6svNnBzh5m3zV7tNI6LL9jerRYo5DKup2/QhpUY2jLWhduBqfAWkGmXpuB5EB
         2eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199361; x=1794804161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcfSxz5aPzlv2aH/G/YIDcSJdDCU+Fm7JWkQ7b1zh2Q=;
        b=dha6eZLfHRFiBEnP/GDpHXEm4JGQeeOtH9ziNT9T6OfJJmcC1z2L/pJmxfY+yl25Br
         7oXT1CX51FjcUXdM1qEHL6NMB/BWkNZtBLvAbjXzPFoqJb9oKfHhykPhGnb6v3GIRsEP
         dL+9jrGWwxB0M1WUBgL+TbOl+QdUN4YfmcXBIUqT5usNj7c0JSh0yVEwnb3zLMUMYlrq
         LBIZWkHrimEkOGJJr2gkX945kCPv4v5PB3eX/HcuThX46KkUmsgMth1X208Sws5srs51
         mjQeP5Q1SE1ULYj8rcWoFdqmi2KXpUDC7THu/Nhj7hLx7ZPG7JT+aRiMyJBUAvM3gd5h
         sh0A==
X-Forwarded-Encrypted: i=1; AL+hErHv4kypRm/nTJRvz6Mqxi8TPs1PCrupzRZUwBxvnOAll4TQF5TKR9gepH4Jlo+HwVT7xZXQFtD5LOW4aP6RwUKE@lists.infradead.org
X-Gm-Message-State: APuU4Z8FwQT8IkBM5TiIOJHJd6ouORbjZTMHNQsM6nWUC6D6McTqyuM1
	nMF1S2Hq6DD5SKAjNbv7tioxvNYO87H2yussU0OIeaGwLjafNj7Xgezm
X-Gm-Gg: AYBFou1kXa7h+34z0aGfaUfNRlgh+enP1zhMqhC9CB1P3uSPAYHY+7dkCH6GKyurC53
	nlkErGk0MwyzuWAPJ1NqUS+QvOX7CECVq7WxUIJVQWNjGS80cFOjAdf614ttpIELU8PuCTppDHX
	CaqUvair0ytb9O5tguzHtiNHDCDLVy0cVMX6GcgvdEypUro6+WdnEtdbkaYEnOBLbn+2qXUPooU
	kuieoY1wjAB30+v3pL9Ti3B5DNSQmg6fUrIjDegslG5ymHFcZKrLq50fpf08YXpBsfYE/cNqqu3
	aMcjEH/qNt0Qq6XgPSKxX0CRFFYGAA9auy7Kiyhku3Z5L5/if+AEwu7YjRLXx5ilo720AFCMEJq
	0ws/tWHMpwY/9+rqy8ZaF5sAhUJl7umAHMD53HPo+RtRHmgj17Sr2NHv0KoOBOmk5FLhCGIqgyM
	nHeQlldHyR+ShgFdNdZw73fx0NrtNa4vm8X62u2W+vs0Fxb3GHgK+/d2vMC9RBVKR8CKwPQ38ce
	VQ8vuG3brW0BQfVzW/+n5kP5jgVRQSboNR2yBtsAKVc3t5tQQWl+ll0LbI623yWVsV+Vfmnykqv
	v1meOgQ+f/FxNK1lPnOO/BDNUnHOaVb07y3VHtKB/shs2eB3
X-Received: by 2002:a05:7300:1c0b:b0:366:2893:7421 with SMTP id 5a478bee46e88-3725d77d5a3mr5516181eec.10.1794199361082;
        Sun, 08 Nov 2026 20:42:41 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:40 -0800 (PST)
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
Subject: [PATCH v2 1/3] power: supply: ltc2941: drain poll work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:10 +0900
Message-ID: <20261109044212.1157357-2-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204242_656635_ABDFA373 
X-CRM114-Status: GOOD (  11.26  )
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

ltc294x_i2c_probe() registers the poll work for devm cancellation before
devm_power_supply_register(). devres unwinds in reverse, so on unbind the
power supply is freed first and the work cancelled last. ltc294x_work()
re-queues itself and calls power_supply_changed(info->supply), so a poll
instance running in that window dereferences the freed supply.

Register the work cancellation after the power supply so devres drains it
first. Nothing queues the work before the schedule_delayed_work() that
follows, so the move is safe.

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/ltc2941-battery-gauge.c b/drivers/power/supply/ltc2941-battery-gauge.c
index 6ebb555..8f8a8f6 100644
--- a/drivers/power/supply/ltc2941-battery-gauge.c
+++ b/drivers/power/supply/ltc2941-battery-gauge.c
@@ -531,11 +531,6 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 
 	psy_cfg.drv_data = info;
 
-	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
-					   ltc294x_work);
-	if (ret)
-		return ret;
-
 	ret = ltc294x_reset(info, prescaler_exp);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
@@ -547,6 +542,11 @@ static int ltc294x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(info->supply),
 			"failed to register ltc2941\n");
 
+	ret = devm_delayed_work_autocancel(&client->dev, &info->work,
+					   ltc294x_work);
+	if (ret)
+		return ret;
+
 	schedule_delayed_work(&info->work, LTC294X_WORK_DELAY * HZ);
 
 	return 0;
-- 
2.43.0

-- 
2.43.0


