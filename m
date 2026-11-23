Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CACC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rcp1kKtV;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BwXqQ4Gy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=; b=Rcp1kKtV0S1nAg
	/9iipIi0AelnkNBiK+aPucCjrndBNzf+/izlprbDbvNj6iWIUfMessRJz0U7Y6r2At0AY1xOYVGMZ
	9DYVszJdTwN2IySM9fRlg/vVPozp6Luz6J7eWSodzptIEKp24S99s931GY3yuizDDVq2m5q5H7WSL
	3Csg9PhJNl6Uid0YfDq4RTEelRkN0GkA4qPAHyUJsgPYPwW6djRslNA3nlI+zbZ8JJWIUMHj4PTpQ
	sNdHTs1kbhcGxAIKTstTKnLSaZt6pO0aVW3GdHOxcTGMKNMnjnnkKOAD0KkOt0srAO3b8d5boW0pc
	Wuc5B5c7Y4QiFUL35FUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzh-00000003jop-2YS5;
	Mon, 23 Nov 2026 14:26:09 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzW-00000003jf7-3El0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:26:02 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so560784466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443956; x=1796048756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=BwXqQ4GyslegtZR7ewDMADEfL1xczivT6OW2cCaP/zafFQi5aMeNmyr6T3uDJsrDNH
         qFAKm7eaqEwXkjVo26v7WjoFlE8xfU8roAazbHN8mBhLaekaxcLi4JoDKOU0AF9jX761
         /Y00gU9rPnrPA2BmoZQvAWK27hd82JyxCuJRcyM7OtLHf/8Qrzt4+Ze0dFEuGIQrGZOS
         EgUtVMdu5g1a2UF9FRoJegoXY8oA/eEyiHRdfQtAOzWfFAY0Q1mTQNXuz3P4soTTdE6j
         IqLHw+P4Bar1TojHr4KFgOcaZnhXHnkJS0zMCxra4ujbYcC2lNfeC1CVYxrzyI/QXN1f
         6C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443957; x=1796048757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=11Zv8TssFn0tVLJ78LGtH9xN1P9N1hxg1WXYIrzy4CTr3yCchqSP2ots0MF78C2mC6
         jbox6eizE6ymmoKoe6YiJBEqWM3sS+rPxhglfkj2mk+frVEf/OZMi2JSEloUSuc0PRen
         fbqmchMC2qGrRx3nibJyd0hye3l1s0rDPRuAMdZcM2omD0MFU9dPz/7W7y+aXqcM8mlF
         JJzPfAEawchoIekXNSGxN5sYnTANC7yc6CAY2Zbbd/Jt2/dh3xfNB8J4IfPHZCQ8D5zE
         xl0J+sZeN69iP7nL8ggSZV7ziLXedlwFUzUz/YBTQ2QDDPFu3BPnbT4UDtGVC5GL80Wa
         jyaQ==
X-Forwarded-Encrypted: i=1; AL+hErGICdvFj8ZZQijl8i/pBHRqEzOlcKD42JE3j2pI7446pmVP35rhNXfesszXm+3EKzwA1p64fGzDCnZU7nBZnp8y@lists.infradead.org
X-Gm-Message-State: APuU4Z9KjtEpnl3sPPbgGvELamaXEyeoMgxceDNvXwU70qBCMCJPNEZv
	y1jDVXhEYT2jTB7XPstSKRpYss5cGhmTmslAk70Y4HqGbWu2y6I+zrikt+Dv/dxFTdQ=
X-Gm-Gg: AZFdTZdzjHSfx36QoAbEvHnzj36TgnPLrk5K1i00uWQN1CrLBup1mmVLo4RRLYtZKM1
	G7jTQjDUl3UXWZxl+9x+fcJPyEMwTyPiwDc1d2jlQaYI+hhFncwb2X9FqWSMOIxtGCfgWFBvPR3
	iJDODlJDfLmcLdSoKOF41V94fB9hHXvelSkl+1OLVdAam28y0nEDOWVScqBnlX7nPpdZ90F0bug
	gFIarnOknzBBj4iluquRA68QmDoSHRw45J4B793b0ihRjNrjS6gM04k+R9tnhop4+2DUKz1e3ay
	a/j41iM3qykng7Q3Ya/4UNiaDP/q5DRBHTygrmdXF9VrfYWmy8sPNLeITgZWUYv/jNGs+ZSvn3J
	XVOH9RVE9D4JPOkHhCm/Fx9YreiXFo59e7VyNOJIMK049tssS12/l+zh4GMZsiIiCI1xJHOn3Pi
	JX3W0IBvPH2Qn0y1ze4WW3Bf3ZyPvaKZCf8an7cavq/Amic34h3NljGVeEz4Zyvm9HzpR503Lpf
	m/R+z49VFbev2xWaMaFSlZovtQGBBKUBvpuKf3Rg8d2cX+9xZggwTDWi5KeyAMtNNkEhkFsqWbY
	dzgFZMUYkOmESMb8ezHfeTGHLhy4d/7cevdTODWaKinlHdcCi8J2Zh1F6MpNTzbLq9WQctWu9Dt
	iKWF4SB4SUDjEz+BRtg==
X-Received: by 2002:a17:907:a890:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c513aacd82cmr967497166b.10.1795443956585;
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 14:25:55 +0000
Subject: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_062558_829278_2B86E48A 
X-CRM114-Status: GOOD (  10.02  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Phy tunings to be applied after lock are never applied on gs101.

On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
through a separate low-frequency detector. Disabling the high-speed RX
squelch detector in U3 avoids keeping it powered while the link is
suspended.

Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ccaf0f27c4c8..f647688c3bfb 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
+
 	/*
 	 * Set this while still holding phy_mutex, so that the orientation
 	 * switch callback can't miss an orientation change.

-- 
2.56.1.750.gf70dc682cf-goog


