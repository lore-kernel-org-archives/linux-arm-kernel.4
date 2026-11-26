Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DmvJRE/Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPOZ+yat
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=; b=DmvJRE/ZFaq4F1GUbBLGxwHmzC
	HELhB9UCGSEcqq/01MDpdr6PyvrVl1APmSUfqsUvUqJ2Ih8KUdHg8AJp/Cmil8d9hkCZ9pInZZtf6
	WuGod0Q0J2LgubLGI2LZMw8cKGKwyob0VAoHBsQIzB0HFaaipZyvkHwBT7ikPVrR5e3/+PD8660A7
	hkeJYnY1DbN1DGXPOZNxO14+KMM2RPtRtD2lSX3xf0EP520+D/5WGXvpMqDAkWCL5L6ISRg8+Aq41
	twJ981qdRI4m2XXV4HZv+sBukE0QQ8r69D77knKdcVZ25OwxAjGQtkphZF2+6ceKl8qtSA50cAEfr
	Y730OHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVCC-0000000CRMp-3762;
	Thu, 26 Nov 2026 08:51:12 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVCA-0000000CRLr-44Iw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:51:11 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so5748841fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683067; cv=none;
        d=google.com; s=arc-20260327;
        b=F3kZwiJDKxxqRXLnr3z5StOwx92q4PCieXGwHUiE8i09VRTZe1MSj5y92dx81u/+pg
         5tdaYxeRnPkZvBr7Ng00kylvcdUJ4IM49CaUQHbNETaPWozYsi7MNfS/7H/6Y7IS7qUG
         VuIdUCmDKlIFO816WsbHNYTvHclmONAt2CNEokcryYwTua8hx3gIVF5lH4NMiZRESQfq
         Gh3HX4YpFVFLAGcNbuAeSJNBvCov7W5on7DHvMf/l+As9ifZ/5wyKWSclaIYEJnfKCl0
         yNeaOvUROF/mIfOFktkb3pIrRdUmpXv2LC3eq+3VsOF0ugTD+z3dE/26WykyzNCO1ihT
         RqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        fh=1bRFKdn0/3i6kTAzb1yG1Ybmx4Ev9880XOezdBsUvl0=;
        b=mTMjx7ntcdGnopeQh6pfhwO3mt3eHFSF3xWdYCJwPdIbCsN2vBH7b6/H9jy9x/wRZh
         Wk9I9NRFhS3a0+H8x5tXHBOYIolLmBUnwqBUL7SUwCowHZ0WVHFnKpnVZdci3K6kVRNr
         qFS21K0KdEMcrYzN1BPB7cTTgu+5UdinV9PHDAPK+UskQ345MDjOSlv9f7uhDE/ZSLnA
         o5WsRzTE7n1ivi4YSMQlZJOHwm5nUXG3Gw7otz5XOzhnazj41RHRD2R2PgYaLxZ7g1oj
         Igc1ru9OwYCAi/PWxDvzzQjQ7IN6uuijKfnxHZdvmPrLGUGiahM8sHTJD5//o5YPnhzh
         pyKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683067; x=1796287867; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=UPOZ+yatMTQSNj5b+5L0FMbv2XKeMhUz5T7iSXnSZvQ5wJXeeYo5mymgL8AgZmprTI
         eq5K5UrvlfVQC4MaisULUFNinmG7kg4XNhM1r7UktyTEi/k3XdGJmY/7FhJvl9btnkrv
         YVOHhvkvRucYD/1KcVySZ+EgnI4MQ/2D0sIth97/Zq+NnmqJ1c+iuqMvRCZ6jZN8ip/g
         rt7FARU5eLCczywYwHs21ifNMUe9AcyOLYspR0dzxNTikdH4lat6kvzfZvAwxzxf99nF
         Wq8cfLAp7jqo3g0VwWlGPUKAXJiMJUxxQQU9w9+lOh8k70bfgGCUz34K3yqzAzcvzXEP
         x9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683067; x=1796287867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=DvHyjF+5RTBvLtssgs/YL9ViFv+aparTL4+ds+40CXM7F173BUuXkk86BYZRmT7AOZ
         u1yt7zIZCeHW0ntaPxebq0pJLZRYIPawqJX7vZjQe5cptb6++2mhugKHFIJc23y54xCO
         HJ3UhcFAYijydlGNoO6lWqVRC1U3/nHvZu6q2Mu/6CncRsU37kyITrdLT7/UmqmZq5ko
         ypGDDC5S0h0Mfyhmi/daWGrmCEBfC1RcNfw1ra65rLQvT0kEADEYNZ034ningbyQ8tLg
         y/KTHyrk1npYCYQdDetg1WM6K9mH/EjOv2k02suRdb40MlcgZdC6szSlTyanN/yDDd30
         9WHg==
X-Forwarded-Encrypted: i=1; AL+hErEsh6WZNEogFphNsw9JZqU91h8Yaa7Zg5e69zcuVBEg+5K52Ht1Cb39ew4UB+x0z9T3oJo6YB5/YZ1EjtYATXVS@lists.infradead.org
X-Gm-Message-State: APuU4Z9EuucPyB6oH9yIPQfFPapPp2QROw8ie8v5DOimQBSUi9VjlUyG
	vt7l9voP1BHpruQHWZ5Qx17VA/npAkge4v8mab2ZsB0bv6H0AZO00di3+TQQGN2+7ZUqN2OL5tz
	CW63G7ZaYCE8DtKySSAM6nBz3gYqefxM=
X-Gm-Gg: AZFdTZcmSN1Z8SLqzVurWl+gZe/+D5tHSgynt3iZpIgsFGAp190TRvpP+Y3mJJpwSIQ
	dupkUcKm/drn4TO8jyZRsrR+GjlFy2ZYzAIBZY2zRshz/TRWIIFEfwMgS7awS1tuCETEkheVAVr
	aPBcfD4Vakm2OipG0dFtswv+nbWQdDDzzOyI8OKsirQhcjAHbxGoj5y8CweLb7qVDa1oANjLze0
	Th4UpCk2NgBv7GDnpo2MPdygMsNIdtM7iR0vKUzeucjMh83jxth4J2brQ90G/DxJNqh2OPwpcBp
	7s5bRln+PodjfahQYnOphImEycRqRu0A7PEFZajk+wVtetLutoO7XxwxN0nFlqQuf2AjbDkKB8i
	0bVeApTBs5CP8emhYhEBevRMAzoXIwQdeQrRgYMPEQvlYl2bytKGqgK3T0vLiFI3LtV1mrxQ=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c1bc85b735mr7624851e87.4.1795683067065; Thu, 26 Nov 2026
 00:51:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
 <179533990370.107225.5765165679182115805@gmail.com> <20261122094050.GB2739410@killaraus.ideasonboard.com>
In-Reply-To: <20261122094050.GB2739410@killaraus.ideasonboard.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:50:56 -0800
X-Gm-Features: Aa3M54qYbt6ioFRQuuBcY-nINhYnmyO69wxHem1cDdgKrz6EAiep7-lR2zDaAac
Message-ID: <CAEy9hNWKmcr9qsvrS3t-UkG3igA_eYdQY_Q0sxWK7fccpWWeow@mail.gmail.com>
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andyshrk@163.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005111_030721_1DEADBD2 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 11:40:50AM +0200, Laurent Pinchart wrote:
> There's something missing here. You may have reviewed (whatever that
> means) and tested it (probably), it doesn't seem you've understood it.
> All of this screams of a big hack.

You're right, I withdraw it. drm_dp_dpcd_access() already retries a
timed-out transfer up to 32 times, and my test only counted
per-transfer timeouts under an artificial RT hog; it never showed a
DPCD read that actually failed. Sorry for the noise.

