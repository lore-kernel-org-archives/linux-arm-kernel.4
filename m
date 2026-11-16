Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDD606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AP6mO3KC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lq3S1zvT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=; b=AP6mO3KCqbHjJ3
	HE9sr+gb+W85GAFzYIv69Q3TSjY8PK2HhFgxtQP7H71M2YI6rXns6gTUW+kfNRnZ74iirM2+HDDZG
	2iT1oaDGxXkJ6LdcK3UiDc3vr7r91QfdWqIb+YTK7ZAlaGYdb+4BLRFG+gkEiVQKF2e+zTMvCgWnJ
	Wot3icDjrSKne6NW4So8CvgLIc4yMlgO0ajSKIsvU6WSLCfMwuinwIKit7kdpasInPCGuAy4BwUkC
	MLNNiVf3LIVqfhzJh4v3Rhi4MyWqpBYLJgi0w2aZa0wMAGwUsQ3BcZMCZmnVz947TUjdMqGoN2ra8
	GMm5MrrUyKpdKAM0Sn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4FI-00000003yWh-2y44;
	Mon, 16 Nov 2026 21:28:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4F9-00000003yLn-3bSk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:28:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3551682f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=Lq3S1zvTBuTw58zoH6x9L9wtIgyu+IWD9g+jg5mYIQsY7QlYVZMeVZ0cCapBtcBqwG
         SWyM1JwU3MZUxyO4VkI67P5y48Q9lZdohwUE/YRCMb+s0ac1vjIYe79lSY0L4B1JfeDS
         rdgOdPjCDO/MV6mkUFvAsoM7C3V3f3G4glYMSMTBdLNeYpV1wQ0XBxaw9WYoHUrSVSWE
         TznHMxH/Rc0EUG0cAFiDGN4zW0eEoKEc17J3nQr9r9x1SSHlfa5lEr9JMtckinA9S/4B
         QAD+PsERso1+MTZr8jEgjJrQe/ub29hBRWpLf2f2W6fGsryrRdh5N8xsAWE57bLnhh1g
         1J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=iZLb0WfX3ib4FpytBp5We4nhRBcDgRowZBz9HvPnpIAcFc51W8SD+iW38N+1/wUYlG
         bMk6+Rj3XWggNU8yl6t+enX2je2yFIsahp7ArcVDTEEU5+g4kS03WeEsJb9q1RLRfJU7
         y5Ski+Ev95D5l8L8pStGMDXDKqKklfYWvG0YOztIpW4q3JC9C+ANI9bbnrb4P3W5zrfB
         tfZaBvXVe8wu9/NRbOdzXztP2nIx4lkX1tfUyOgVJZWeGZpjIGYFcYIXimDNRp3xm0ip
         LdR3a3G5mEkfV2nOnXzMu+5JiywntOIE6NoQo0AJyVvIC2dUvyikjwzWiv6T9a5FyZL9
         pJ7g==
X-Forwarded-Encrypted: i=1; AL+hErH4ivLnuoiAk852N6VdMLj8n6nYgii6LA104ZYqOHYKOmISAYuCQ/9d0vvrbmar+IWYHm/egHFspaDI5scgJNpK@lists.infradead.org
X-Gm-Message-State: APuU4Z+pHKW47jEFc+U4gj9Oy026NL57Wbo+NkEgTrCHNTkQqcG4eZMm
	orW1XK0rVhX/QXiLkcYUv//H2QL/oVLSVfkaZDELw+gdsMEmUrInEkmq
X-Gm-Gg: AZFdTZcOkXdA1iIzEqHYEbnQEEgalsGOe+0TW8CmDDfZcNW2CiyXQt/B6Hs+uJk2r02
	VQ0myhIoqzvKHjd3itOlxIizK2vogvSPxNr7swqmFSH7zfIkMnwlIx3Ey4Mi+o2TBR3eumaDyTr
	dvOWcaRDnHZ4ZgkUN/3vjqqQeNnwwQFcGblHj8tNKZliOfWkcS7oWMuIYhKELdAl94gwuUw8KqI
	inGUMMGq/fbIo66fjJm+4h4XABH5pX/9Jx9Q+BG3s0L73uGLQgq+pS2X6+YvpZkmGaIVKwUOe5G
	FSIoPKoqQamdIZEOfUy9WYc344N21lAocK+OenWShFMccl4Jv7cswHwO+OlWPi7BsbagqYHDw5d
	2iC+LxUOxeL5Z3l17jNbI6zrkQIi1PNwW5ShRVyrMqOChErETvhAeLShgUOPJebbY6DpFTUnNCS
	l3lIqOnNRNElxCADkcmRr2YZpcIGOaB3dbunqKUeianTmRbWqZrBw18HYgyk6iz0NwVIRxIget1
	A71Cg1aDng+GNPdsGrxLLb6zUPBfqc1AhVRNoWnvRUx6Xav31n8El0FNuTorgfTV5vt0HB14Ejl
	QITt1MOhbUmPsBjgmzc+pszafHyGo2eLZ5A8Edb3
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132803_974435_0135296A 
X-CRM114-Status: GOOD (  11.76  )
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

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0


