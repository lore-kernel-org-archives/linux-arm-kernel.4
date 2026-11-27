Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55439606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 01:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SgRZakwm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwkidSyh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=; b=SgRZakwmFomZVMEU7L1bdjj8iy
	tlso8rFI8ZHbZSnGkkjO56sTLLCyz8SEK55K4kj+6saRbJt2E5iki5AxZfEovPsi3A8OJABqe9eAG
	Mhka8+uB5Kte8VuVPMcT5vMnhESlDzYjaJn4hhm7lN2IJZca9kJ0e2x86s1CHTW6eYbAderhImFpD
	2Lun0LXGWNN38gercu2vTr58CEV41k7sBYOZP7w5e/OmeoWknxZywFMVlAsBOYOz8jItucc7Hr/UV
	U0MUKOKXSiIl4N2c5II5rP73BG6bYbSw9Lz5H/qG65wi9THsX7g1dwT98GcN18CaLIjVxtp/DkC71
	6InP1eIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWklw-0000000EjX2-0j4n;
	Fri, 27 Nov 2026 01:29:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWklt-0000000EjWF-2wIK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 01:29:07 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso3154514a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742945; x=1796347745; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=qwkidSyheyG6pgtcJ4HVH8nii7XqC9r/9Md0gvAPuAkdoSUjNfO3ZeZwlUMPm401i7
         CI5Lec/+2qqNCAyY68ohCZcN85uFlvtxXxOZCsLCSz9llpZKrf1GcV9GO2QzNEwqrS7o
         ZUqr9Yz2GU5v7iWmfVVtoYRXmqaz4W71wFTRPhU7qB7ePF8LzVyL+dsY6OSpNUfyFpk6
         hWuK/vjqXyBA0J8BtoIlvptjqV3wgokM5nAvpR2qIiGrsy3gjQpFtLHOSakkWMfaAKfX
         1w3JiDJz7gCE0pX9/kxYK/hGvAiJKbqtakoB4UqGpuRzUdhwfX6quIlmd5nOMkI98lAb
         CRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742945; x=1796347745;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUIsqG8/RLQKsMia7zi438qJ97LPDSYrylra1EdJHEY=;
        b=0Hhy5tK9wquV/kZ1lq59xoId2X1u7VwoUMd3oCDZQmmkFGFELBD7iGSvQKrXuiZzfY
         h4MMCYg0e14hh5+zf6hg52i+nbRbFSI3R5jdLf7ZbejgugBhtHMzOYYXEYatHzfFPArS
         aUmcAyM8WQmoja5OyYQtU0rvtodKMs3m/w3UWfmtpxwDPKtvAsLrdcs/qWHANIMcppo6
         ZIke8Wf9sP837l+g2Ev4dWb9RhnoWEXJ0JiEjebOViEavrVWRBKWLsNgLJuD1Xc5ZR66
         VhZO7uVd8s9NJyswTsk63OO9hZD5x7tYe/vSCCJDwWl/j+AFll3ZhqcJym66J6oFE1ju
         baUQ==
X-Forwarded-Encrypted: i=1; AL+hErFHH4Fk4EOgG3xVGSoWUS1D405mQFrxFx6Woe+ZpoHZfBWWlwB2QbA8hc1kOYlzmFlqa5qVidyYkNcUL6lQKGaY@lists.infradead.org
X-Gm-Message-State: APuU4Z/WYTwnWgCIYIO1+lVKqOzXvMpRk04jHDUy7MhgVAVaLCO4cc3g
	2vl8omQyrJHB85kd0M+sfWJg++k9H1wR5gLmxhA1isQKN6f2Jg53wSdy
X-Gm-Gg: AZFdTZe1L+xnZAdQL53tewMuSia8zXIWdffSHtZj7O//Hoz7jsJCr56/Tup3SLTog8H
	8bxElDbAZoIC29u+ttGBgjRnwH8IbHrLVOSlGXahj16TuWGoD2iaSGOemMVgZRKCJTjaJJyJGEg
	KxOBh+Tcd2L608dJnAWrc5ZEqaH2haXxhbcbCkYL5kzu0KrdKHACX7CKc7nGgjfPTCdDAIhNrpA
	0K3mUU6cGZU1XrdZBfmXnOQwhBaz9AOyaTfXCto4vFQARnmLRQ9jO+cz7K+uIC/YIfKhjmaA5EG
	nZOWkSRwsJv+R1giE9HX89itzzVugHOzYpNDnulkZ9waOeypoh0dIpy8f8BZSnFBKm7eg/knml5
	hYZS4R9+/4M7K5OoW0LKP+duacEcrdlj9riJ1lx4mRwCONjXnoxAQg32JLuKxZ/C9T2euqw66Yb
	YluwqnVRqQO2vRTy4lVU98QQYVg31/AqIKK4XMg4tA7ha0X491C+gHneOt0HjsgxQptNalsSYta
	k/syzTT+LXV8gtH0KJYIrIDk0xe/avJ6nKEqBFlXowETOougcY5CkIZTq0AXPJVgHTTcNnWut61
	vwtIbrWRGINYsljCvsKF4rYM4yRGQg/hI4PPkBEBSgRPt9AiulX9mCdIhBhvJwqs3gYdhSvhXBk
	l
X-Received: by 2002:a17:90b:3890:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b41c981a3cmr21244869a91.59.1795742944639;
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm35760912a91.13.2026.11.26.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:29:04 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mt65xx: avoid division by zero when speed_hz is zero
In-Reply-To: <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
References: <20261126003314.49090-1-iasnezhkov@gmail.com> <UsigaM3gd0dy3bL2g5S_b22RuZ_wwX5dQycDFYjkyLdeI1wdx_2divHB0qOXJaSQF54AZXolxH84aoupe8F27HQomLvpAuoMWhehxOFk7aM=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:29:00 +0800
Message-ID: <179574294061.64665.17856396829842029470@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_172905_887534_DA40CFE2 
X-CRM114-Status: UNSURE (   4.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Good catch — I missed the second division by mem->spi->max_speed_hz in
mtk_spi_transfer_wait(). Setting host->max_speed_hz = mdata->spi_clk_hz / 2
in mtk_spi_probe() lets the SPI core populate spi->max_speed_hz,
xfer->speed_hz, and op->max_freq across all paths cleanly.

I will respin v2 with that approach and move the AI note below ---.

Best regards,
Ilia

