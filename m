Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCkZqnnk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSv5h/ku
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=; b=PCkZqnnkUIcmoc4b8PUP8XNuuR
	/utcACXL031tyWDaixQ3mAWe8RNWW/kxaJ59fLP5KyRmOAgjnBuymPxTf7tWFIn+8ii66ppPbDLrE
	hGoULYT3A2sHSMwfNV4p1PAChgfkSHPaaTzhRheH3nnwVXwf18ZZYckb9rpD+eq2Dwb5DFRdiDjCn
	lSgxZdHuSGkMVivysVHtUlmfBWQKbSQf1XRV4Pe6Xp3AE31Z3OLB3VG0HZdX25Ceo4Kx44OcW7l9v
	TAzX9cNIhQimC1c0ttGbT/exYBjXujSXQHkr2ecrNo2YVEIgB7FtyKMUO1A5jzy9sg4pjSN660Uve
	ATo0UkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxnZ-0000000EO6a-2zA8;
	Fri, 13 Nov 2026 20:23:01 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxnW-0000000EO4H-1kSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:23:00 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso1658471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601376; cv=none;
        d=google.com; s=arc-20260327;
        b=HGzWrGWW8qXASmtMyueMqaT0LAozpfZms3gOtdgeq66FudO2yWzyJka53Kn+RF3lI7
         1GnaS6f1ncAFvocETis8pq/Y/EHrReZn4mgtBEdTn7LHhbZzXhkZeBMKMfX4oess9tK6
         cnkrT7CQZF3zvMmshGSvJmXeIjOKwSKcgthVGhpug/7dDA4AP03Yrb1PYn5HFb10Bq1q
         V+viXxkbhDt/P67mzuStvw7gb9qg5g2rfpqgOnrCllKgkDtblBTmlCoi8iSgqPoeIMmq
         t0vU5mArTmVn/sKqQ7k6VLfZHWJU/tFR6ixnWuBTpDHBtyKMk3RODw0E7EDELiswKBaf
         jwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        fh=4/MUkiwpOt3NkFYbNlBiESMbM0UFDHSUfcwDNPSxecQ=;
        b=K/LXJe+e+JydjEuVFjEYXam3ZVolQGf06/vfr4OCjPNlUdJga6rnLuLDE7CMO1De8Z
         jki/jYDXf+Mf1gQrcSyKbNSkmCaedOgJm74E7rKhGkW7cIRKEoC9SdQkddI8R49XWIt7
         ALfwauSpxx2toiU60yjRQelvgqC3w2GPi7GHIjU7OXpPXbrpDOXSckkKEhoYdfDgOv84
         8lbI1w6hB3s9TIeMNBkpK9ktV5E7QfVZIzJf5rv4WwD5keCboe5xgUVPdUS1umBIVRz9
         PVTk0Khzj6q4k2MppC97iyAqSs9O0X6lyQK9Z+kmUWOVqhgiec3BZ6sYbD8UFw8BSrui
         imAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601376; x=1795206176; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        b=TSv5h/kuv/Mx8d35FY2hsXGBzA7sXmpv4ww/p6N/hIpaVXH69pyLyYmU4ckzt8RJBo
         BGd2HmKTrWAtV/Otu0ncFK3kHP8poTXBF5x9pD65xXx+d8t2G5kQXa+V6hSeJVRbwth+
         7YPc4yPbyz0IvRkElbpouSaVmRTRlX+YggVPUFVqJCd3c5+r8icQ+0dwAOK2vPMqNB0Q
         zTdoPfW9IaFLxntcxJssyMcgAe35iguP7Ml5HzccXLk7B6u4x0a1UU9RzBvToB3GGhMv
         QjVKy6yka4QIBErN6PYEat4rbJSlydR6MUDOAt9CLMlMpDBudkvqQ9gFoFwUonv0gRbu
         Zjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601376; x=1795206176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        b=bUv4xyMuICiBkXoQNfDGXGqmgmfMsNNzihTvJ2x4G89SzWyyAHLMiuyAec87DcmVJj
         +aMd4szfGfEjsiE2RuKWEXc1c/BNc+4lafLYWkXSUB6/ogLVQh86Hd0b0Y6D3uLSnMTU
         Ug0XJ9pqYMwfys8EoLZ/5R/5frZSjpvBfje+5OtQXUYwmlIuFaC28ZIXuCV6EEIBKIl6
         1cTEkBwyOgn7200FywZocAXJqMavf0sLNeIq7NeN95xGeaEJHDvfmroSy7jkFNXzAkJ3
         N/qyUPoLP9XNRS2K5KCvu+dEAL2M+N40dyRVZmw+Wk9Li6U6y+lXW602ERuSNK38MxcC
         TDWg==
X-Forwarded-Encrypted: i=1; AL+hErEEI2w++JD3qQimMnYeUJrBiqFw+BIPfjGJrOCBUDYnzbvt7t7dxvK9mOnlXc0Mk6uopXw69eFdK9T4pRis6l5J@lists.infradead.org
X-Gm-Message-State: APuU4Z8f4ZqiTaMYsMuWHHd89OHzpG/g326Oe+LpdKzsUUnjw0ZjX52M
	CDvi1a6HLjvU0xvdaZLwKuA9oxTgvKCCl6O4d1cd4ZMMTFfDqKq6n0mBKW05d31mr4jFhERKLrk
	7XEhRbX/9f/ivim3qH3xZN2hW2mhjmjg=
X-Gm-Gg: AYBFou1L9hZSRHHOT58AFTQiBgonOpcsgw6GFbdpdaKvQF5Ek9C/E92Xmu60WZagjG2
	EqXTnPySgud0C0YWfMwo0kzO650LMIcBAkr95vNu0DyTjv2bOzRoOoo0ffVYTCjS5abFWLcEoGh
	JJ6cgmE0YADKrprtFIQHALjR3a5pk/6dW7BNONcbE7HyibEi6Rqhhrbcpor9AIshBiqDMDuowO+
	nh2ypw3kWFRI4ywD/V0J7caav7Hck/+3XUq+6nF8SgMkZedRsKf+LWZhOBABKtue8ZXvn0UnYjM
	ToLmU8DZcH7UU7IjhFuu/gjFW6dvI/akyI9pwIMWyGWw0DRBtKGK+gLDv7ZpFjMJKOdTdUaIe6J
	2BJH4YdI9T3xa4gDhmReKDFBidQPaXTfHeW15ymVHVMnuJRMSIPhDcweMbTVsW6yyvn80MkE=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id
 2adb3069b0e04-5c1705f074amr1901758e87.2.1794601376064; Fri, 13 Nov 2026
 12:22:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-2-8218c1cf8ac8@gmail.com> <72fb3540-e08e-40be-8f3d-63727063be6a@rock-chips.com>
In-Reply-To: <72fb3540-e08e-40be-8f3d-63727063be6a@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:22:43 -0800
X-Gm-Features: AclHuK83avg87MErP1c1PWVXkGZUeHXXf76PgTC3e-PET4yuVzF7UOnIAvMmRRg
Message-ID: <CAEy9hNXox_rE9XUOKe=0zedpTR-sfpz4sum34s_DW12bM52q-w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122258_475028_2BDFB08C 
X-CRM114-Status: UNSURE (   8.77  )
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

Hi Damon,

> I think we can drop the previous divider initialization, and configure
> the correct dividers for specific interfaces.

Thanks, v3 does it this way. One difference: if_pixclk_div isn't set
for DP and DPI today, so v3 sets it to 1 there as well; nothing is
written for it in those cases. HDMI with DSC isn't supported by the
driver, so dclk_out_div is 1 for HDMI.

v3 2/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-2-08ae37e83b5c@gmail.com

Best regards,
Arun

